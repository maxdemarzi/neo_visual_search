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

  get '/' do
    haml :index
  end
   
  get '/facets' do
    content_type :json
    cache_control :public, :must_revalidate, :max_age => 600
    $neo.list_labels.to_json    
  end

  get '/values/:facet/' do
    content_type :json
    
    search_key = $neo.get_schema_index(params[:facet]).first["property-keys"].first
    
    cypher = "MATCH node:#{params[:facet]} 
              RETURN node.#{search_key} AS label
              ORDER BY label
              LIMIT 25"
    
    values = $neo.execute_query(cypher)["data"].flatten.to_json
  end


  get '/values/:facet/:term' do
    content_type :json
    
    search_key = $neo.get_schema_index(params[:facet]).first["property-keys"].first
    
    cypher = "MATCH node:#{params[:facet]} 
              WHERE node.#{search_key} =~ {term}
              RETURN node.#{search_key} AS label
              ORDER BY label
              LIMIT 25"
    
    values = $neo.execute_query(cypher, {:term => "(?i)" + params[:term] + ".*"})["data"].flatten.to_json
  end

  
end