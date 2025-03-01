DROP TABLE IF EXISTS json_import;

CREATE TABLE json_import (
    id SERIAL PRIMARY KEY,
    data JSONB
);

COPY json_import(data) 
FROM '/Users/a81906/TIL/20250226/merged_output.jsonl' 
WITH (FORMAT text);

