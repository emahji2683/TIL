DROP TABLE IF EXISTS json_import_mod;

CREATE TABLE json_import_mod (
    id SERIAL PRIMARY KEY,
    data JSONB
);

COPY json_import_mod(data) 
FROM '/Users/a81906/TIL/20250226/add_mod_prefs/modified_json_josonl/merged_output_json_modified_nag,tko,nigata.jsonl' 
WITH (FORMAT text);

