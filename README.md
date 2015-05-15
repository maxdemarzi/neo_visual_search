neo_visual_search
=================

Neo4j POC to Integrate VisualSearch.js and Cypher


Instructions
------------

    bundle
    rake neo4j:install
    rake neo4j:start

Log in to the Neo4j database and remember the password.
Then set the system environment variable "NEO4J_URL" to the connection string, for example:

    export NEO4J_URL=http://neo4j:swordfish@localhost:7474

or:

    export NEO4J_URL=http://visual_search:mypassword@visualsearch.sb05.stations.graphenedb.com:24789

Then:

    rake neo4j:create
    rackup
    open http://localhost:9292

![ScreenShot](https://raw.github.com/maxdemarzi/neo_visual_search/master/screenshot.png)