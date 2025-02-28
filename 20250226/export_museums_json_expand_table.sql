COPY (
  SELECT name, location, business_hours, admission_fees, website_url, phone_number, area
  FROM museums_json_expand
) TO '/Users/a81906/TIL/20250226/form_putting_chatGPT.csv' WITH CSV HEADER;
