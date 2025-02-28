COPY (
  SELECT to_json(":table_name")
  FROM ":table_name"
) TO ':output_file_name';
