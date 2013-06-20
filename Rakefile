require 'neography'
require 'neography/tasks'

namespace :neo4j do
  task :create do
    neo = Neography::Rest.new(ENV['NEO4J_URL'] || "http://localhost:7474")
    cypher = File.read('data/movies.cyp').split(';')
    neo.commit_transaction(cypher)
    cypher = contents = File.read('data/upgrade.cyp').split(';')
    neo.commit_transaction(cypher)
  end
end