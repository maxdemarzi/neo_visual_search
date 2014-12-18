CREATE INDEX ON :Actor(name);
CREATE INDEX ON :Director(name);
CREATE INDEX ON :Writer(name);
CREATE INDEX ON :Producer(name);
CREATE INDEX ON :Movie(title);
CREATE INDEX ON :User(name);

MATCH node
WHERE has(node.title)
SET node:Movie;

MATCH node
WHERE (node)-[:ACTED_IN]->()
SET node:Actor;

MATCH node
WHERE (node)-[:DIRECTED]->()
SET node:Director;

MATCH node
WHERE (node)-[:WROTE]->()
SET node:Writer;

MATCH node
WHERE (node)-[:PRODUCED]->()
SET node:Producer;

MATCH node
WHERE (node)-[:FOLLOWS]-()
SET node:User;

