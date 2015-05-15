require 'bundler'
Bundler.require(:default, (ENV["RACK_ENV"]|| 'development').to_sym)

require 'sinatra/base'

$neo = Neography::Rest.new(ENV['NEO4J_URL'] || "http://localhost:7474")

class App < Sinatra::Base
  
  configure :development do |config|
    register Sinatra::Reloader
  end
  
  set :haml, :format => :html5 
  set :app_file, __FILE__

  helpers do
    
    def get_properties(category)
      cypher = "MATCH (n:#{category}) RETURN n LIMIT 1"
      $neo.execute_query(cypher)["data"].first.first["data"].keys
    end
    
    def get_value(value)
      value = value.to_i unless value.to_s.match(/[^[:digit:]]+/)
      value
    end

    def get_label_and_key(params)
      params[:facet].split(".")
    end
    
    def get_last_node_id(params)
      params["facets"].size - 1
    end
    
    def prepare_query(params)
      match, where, values = [], [], []
      params["facets"].each_with_index do |x, index| 
        label, key = x[1].keys.first.split(".")
        value = x[1].values.first
        match << "(node#{index}:#{label})" 
        where << "node#{index}.#{key} = {value#{index}}" 
        values << value
      end
      return match, where, values
    end
    
    def prepare_cypher(match,where)
      "MATCH p = " + match.join(" -- ") + " WHERE " + where.join(" AND ") + " "
    end
    
    def prepare_parameters(values)
      parameters = {}
      values.each_with_index do |x, index|
        parameters["value#{index}"] = get_value(x)
      end
      parameters
    end

  end

  get '/' do
    haml :index
  end
   
  get '/facets' do
    content_type :json
    cache_control :public, :max_age => 600
    facets = []
    categories = $neo.list_labels    
    categories.each do |cat| 
      get_properties(cat).each do |label|
        facets << {:category => cat, :label => cat + "." + label} 
      end
    end
    facets.to_json
  end

  get '/values/:facet/' do
    content_type :json

    label, key = get_label_and_key(params)
    
    cypher = "MATCH (node:#{label})
              WHERE HAS(node.#{key})
              RETURN DISTINCT node.#{key} AS value
              ORDER BY value
              LIMIT 25"
    
    $neo.execute_query(cypher)["data"].collect{|x| x.first.to_s}.compact.flatten.to_json
  end


  get '/values/:facet/:term' do
    content_type :json
    
    label, key = get_label_and_key(params)
    
    cypher = "MATCH (node:#{label})
              WHERE HAS(node.#{key}) AND node.#{key} =~ {term}
              RETURN DISTINCT node.#{key} AS value
              ORDER BY value
              LIMIT 25"
    
    $neo.execute_query(cypher, {:term => "(?i).*" + params[:term] + ".*"})["data"].collect{|x| x.first.to_s}.compact.flatten.to_json
  end

  post '/connected_values/:facet/:term' do
    content_type :json

    related_label, related_key = get_label_and_key(params)
    
    match, where, values = prepare_query(params)
    last_node = get_last_node_id(params)

    where.pop
    where << "node#{last_node}.#{related_key} =~ {term}"
    where << "HAS(node#{last_node}.#{related_key})"

    cypher  = prepare_cypher(match,where)
    cypher << "WITH LAST(EXTRACT(n in NODES(p) | n.#{related_key})) AS value, COUNT(*) AS cnt "
    cypher << "RETURN value ORDER BY value LIMIT 25"    

    parameters = prepare_parameters(values)
    parameters[:term] = "(?i).*" + params[:term] + ".*"    

    $neo.execute_query(cypher, parameters)["data"].flatten.collect{|d| d.to_s}.to_json
  end


  post '/connected_values/:facet/' do
    content_type :json
    related_label, related_key = get_label_and_key(params)
    
    match, where, values = prepare_query(params)
    last_node = get_last_node_id(params)
    
    where.pop
    where << "HAS(node#{last_node}.#{related_key})"
    
    cypher  = prepare_cypher(match,where)
    cypher << "WITH LAST(EXTRACT(n in NODES(p) | n.#{related_key})) AS value "
    cypher << "RETURN DISTINCT value ORDER BY value LIMIT 25"    
    
    parameters = prepare_parameters(values)

    $neo.execute_query(cypher, parameters)["data"].flatten.collect{|d| d.to_s}.to_json
  end
  
  
  post '/connected_facets' do
    content_type :json

    match, where, values = prepare_query(params)
    
    match << "related"
    
    cypher  = prepare_cypher(match,where)
    cypher << "WITH LABELS(LAST(NODES(p))) AS related_labels "
    cypher << "RETURN COLLECT (DISTINCT related_labels)"

    parameters = prepare_parameters(values)

    categories = $neo.execute_query(cypher, parameters)["data"].flatten.uniq
    facets = []
    categories.each do |cat| 
      get_properties(cat).each do |label|
        facets << {:category => cat, :label => cat + "." + label} 
      end
    end
    facets.to_json
  end
  

  post '/graph' do
    content_type :json
    match, where, values = prepare_query(params)
    
    cypher = prepare_cypher(match,where)
    cypher << " RETURN EXTRACT(n in nodes(p)| [ID(n), COALESCE(n.name, n.title, ID(n)), LABELS(n)]), 
                       EXTRACT(r in relationships(p)| [ID(startNode(r)), ID(endNode(r))])"

    parameters = prepare_parameters(values)

    graph = $neo.execute_query(cypher, parameters)["data"]   
    nodes = graph.collect{|n| n[0]}
    rels = graph.collect{|r| r[1]}

    results = {
               :nodes => nodes.flatten(1).collect{|x| {:id => x.flatten[0], :data => {:name => x.flatten[1], 
                                                                           :description => x.flatten[1], 
                                                                           :type => x.flatten[2]} }},
               :rels  => rels.collect{|x| x.collect{|x2| {:source => x2[0].to_i, :target => x2[1].to_i }}}.flatten
               } 
    results.to_json
  end

  get '/related/:id' do
    content_type :json

    cypher = "START me=node(#{params[:id]}) 
              MATCH me -- related
              RETURN ID(me), LABELS(me), me, 
                     ID(related), LABELS(related), related"

    connections = $neo.execute_query(cypher)["data"]   
    
    results = connections.collect{|n| {"source" => n[0], "source_data" => {:name => n[2]["data"]["name"] || n[2]["data"]["title"] || n[2]["data"].first, 
                                                                 :description => n[2],
                                                                 :type => n[1].first },
                             "target" => n[3], "target_data" => {:name => n[5]["data"]["name"] || n[5]["data"]["title"] || n[5]["data"].first,
                                                                 :description => n[5],
                                                                 :type => n[4].first}} }
     results.to_json                                               
  end  
  
end

