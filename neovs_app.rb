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

    label, key = params.keys.first.split(".")
    value = params.values.first
    
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
    label, key = params.keys.first.split(".")
    value = params.values.first
    related_label, related_key = params[:facet].split(".")
    
    cypher = "MATCH node:#{label} -- related:#{related_label}
              WHERE node.#{key}? = {value} AND HAS(related.#{related_key})
              WITH related.#{related_key} AS label, COUNT(*) AS cnt
              RETURN label
              ORDER BY label
              LIMIT 25"
    
    values = $neo.execute_query(cypher, {:value => value})["data"].flatten.collect{|d| d.to_s}.to_json
  end
  
end