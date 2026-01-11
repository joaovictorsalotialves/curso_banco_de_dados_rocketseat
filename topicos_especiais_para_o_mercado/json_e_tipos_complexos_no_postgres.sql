CREATE TABLE eventos (
  id serial PRIMARY KEY,
  data  jsonb
);

INSERT INTO eventos(data)
VALUES ('{"user":"alice","action":"login","meta":{"ip":"10.0.0.1"}}');

EXPLAIN ANALYZE
SELECT data->>'user' FROM eventos;

SELECT data->>'action' AS acao FROM eventos;

UPDATE eventos
SET data = jsonb_set(data, '{meta,device}', '"mobile"');

WITH docs AS (
  SELECT '{"tags":["banco","nosql","pgsql"]}'::jsonb AS d
)
SELECT tag
FROM docs, jsonb_array_elements(d->'tags') AS arr(tag);

CREATE INDEX idx_eventos_data_gin ON eventos USING GIN (data);

CREATE INDEX idx_eventos_data_path ON eventos USING GIN (data jsonb_path_ops);

EXPLAIN ANALYZE
SELECT * FROM eventos WHERE data @> '{"action":"login"}';

CREATE TABLE pesquisa (
  id serial PRIMARY KEY,
  respostas text[]
);

INSERT INTO pesquisa(respostas) VALUES (ARRAY['sim','não','talvez']);

SELECT id, unnest(respostas) AS resposta FROM pesquisa;

CREATE EXTENSION IF NOT EXISTS hstore;

CREATE TABLE configs (
  id serial PRIMARY KEY,
  props hstore
);

INSERT INTO configs(props)
VALUES ('theme => "dark", notifications => "on"');
