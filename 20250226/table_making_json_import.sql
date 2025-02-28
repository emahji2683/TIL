CREATE TABLE json_import (
    id SERIAL PRIMARY KEY,
    data JSONB
);

COPY json_import(data) 
FROM '/Users/a81906/TIL/20250226/sample.json' 
WITH (FORMAT text);

