require 'neography'
require 'neography/tasks'

namespace :neo4j do
  task :create do
    neo = Neography::Rest.new(ENV['NEO4J_URL'] || "http://localhost:7474")
    cypher = File.read('data/movies.cyp').split(';').map(&:strip).reject(&:empty?)
    neo.commit_transaction(cypher)
    File.read('data/upgrade.cyp').split(';').map(&:strip).reject(&:empty?).each do |query|
      neo.execute_query(query)
    end
  end
end

