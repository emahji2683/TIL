
COPY (
  SELECT to_json(museums)
  FROM museums
) TO '/Users/a81906/TIL/20250226/form_putting_chatGPT.json';

