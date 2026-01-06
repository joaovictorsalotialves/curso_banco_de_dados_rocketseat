CREATE ROLE reader NOLOGIN; 

CREATE ROLE writer NOLOGIN; 

CREATE ROLE app_user LOGIN PASSWORD 'senha123!';

GRANT reader TO app_user;

GRANT writer TO app_user;

CREATE ROLE reporting LOGIN PASSWORD 'relat0r10!';

CREATE ROLE ingestion LOGIN PASSWORD 'ingest2024!';

CREATE ROLE data_reader NOLOGIN;

CREATE ROLE data_writer NOLOGIN;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO data_reader;

GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO data_writer;

GRANT data_reader TO reporting;

GRANT data_writer TO ingestion;
