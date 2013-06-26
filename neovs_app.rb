require 'bundler'
Bundler.require(:default, (ENV["RACK_ENV"]|| 'development').to_sym)

require 'sinatra/base'

$neo = Neography::Rest.new    

class App < Sinatra::Base
  
  configure :development do |config|
    register Sinatra::Reloader
  end
  
  set :haml, :format => :html5 
  set :app_file, __FILE__

  helpers do
    def get_properties(category)
      cypher = "MATCH n:#{category} RETURN n LIMIT 1"
      $neo.execute_query(cypher)["data"].first.first["data"].keys
    end
    
    def get_value(value)
      value = value.to_i unless value.to_s.match(/[^[:digit:]]+/)
      value
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

    label, key = params[:facet].split(".")
    
    cypher = "MATCH node:#{label} 
              RETURN node.#{key}? AS label, COUNT(*)
              ORDER BY label
              LIMIT 25"
    
    values = $neo.execute_query(cypher)["data"].collect{|x| x.first.to_s}.compact.flatten.to_json
  end


  get '/values/:facet/:term' do
    content_type :json
    
    label, key = params[:facet].split(".")
    
    cypher = "MATCH node:#{label} 
              WHERE node.#{key} =~ {term}
              RETURN node.#{key}? AS label, COUNT(*)
              ORDER BY label
              LIMIT 25"
    
    values = $neo.execute_query(cypher, {:term => "(?i)" + params[:term] + ".*"})["data"].collect{|x| x.first.to_s}.compact.flatten.to_json
  end

  post '/connected_facets' do
    content_type :json
    
    label, key = params["facets"].keys.first.split(".")
    value = get_value(params["facets"].values.first)
    
    cypher = "MATCH node:#{label} -- related
              WHERE node.#{key}? = {value} 
              WITH LABELS(related) AS related_labels, COUNT(*) AS cnt
              RETURN COLLECT(related_labels)"
              
    categories = $neo.execute_query(cypher, {:value => value})["data"].flatten.uniq              
    facets = []
    categories.each do |cat| 
      get_properties(cat).each do |label|
        facets << {:category => cat, :label => cat + "." + label} 
      end
    end
    facets.to_json
  end
  
  
  post '/connected_values/:facet/' do
    content_type :json
    
    label, key = params["facets"].to_a[-2].last.keys.first.split(".")
    value = params["facets"].to_a[-2].last.values.first
    value = value.to_i unless value.to_s.match(/[^[:digit:]]+/)
    related_label, related_key = params[:facet].split(".")
    
    cypher = "MATCH node:#{label} -- related:#{related_label}
              WHERE node.#{key}? = {value} AND HAS(related.#{related_key})
              WITH related.#{related_key} AS label, COUNT(*) AS cnt
              RETURN label
              ORDER BY label
              LIMIT 25"              
    values = $neo.execute_query(cypher, {:value => value})["data"].flatten.collect{|d| d.to_s}.to_json
  end

  post '/graph' do
    content_type :json
    match, where, values = [], [], []
    params["facets"].each_with_index do |x, index| 
      label, key = x[1].keys.first.split(".")
      value = x[1].values.first
      match << "node#{index}:#{label}" 
      where << "node#{index}.#{key}? = {value#{index}}" 
      values << value
    end
    
    cypher = "MATCH p = "  
    cypher << match.join(" -- ")
    cypher << " WHERE "
    cypher << where.join(" AND ")
    cypher << " RETURN EXTRACT(n in nodes(p): [ID(n), COALESCE(n.name?, n.title?,''), LABELS(n)]), 
                       EXTRACT(r in relationships(p): [ID(startNode(r)), ID(endNode(r))])"

    parameters = {}
    values.each_with_index do |x, index|
      parameters["value#{index}"] = get_value(x)
    end

    graph = $neo.execute_query(cypher, parameters)["data"]     
    results = {
               :nodes => graph.collect{|x| {:id => x[0][0][0], :data => {:name => x[0][0][1], 
                                                                         :description => x[0][0][1], 
                                                                         :type => x[0][0][2].first} }},
               :rels  => graph[0][1].collect{|x| {:source => x[0], :target => x[1] }}
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