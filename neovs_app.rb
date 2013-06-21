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
    cache_control :public, :must_revalidate, :max_age => 600
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
              RETURN node.#{key}? AS label
              ORDER BY label
              LIMIT 25"
    
    values = $neo.execute_query(cypher)["data"].flatten.collect{|d| d.to_s}.to_json
  end


  get '/values/:facet/:term' do
    content_type :json
    
    label, key = params[:facet].split(".")
    
    cypher = "MATCH node:#{label} 
              WHERE node.#{key} =~ {term}
              RETURN node.#{key}? AS label
              ORDER BY label
              LIMIT 25"
    
    values = $neo.execute_query(cypher, {:term => "(?i)" + params[:term] + ".*"})["data"].flatten.to_json
  end

  
end