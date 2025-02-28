INSERT INTO museums_json_expand (name, location, business_hours, admission_fees, website_url, phone_number, area)
SELECT 
    data->>'name' AS name,
    data->>'location' AS location,
    data->>'business_hours' AS business_hours,
    data->>'admission_fees' AS admission_fees,
    data->>'website_url' AS website_url,
    data->>'phone_number' AS phone_number,
    data->>'area' AS area
FROM json_import;
