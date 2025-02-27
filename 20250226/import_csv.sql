COPY museums(name, location, business_hours, admission_fees, website_url, phone_number, area)
FROM '/Users/a81906/TIL/20250226/test/16museum_each_page_千葉.csv' DELIMITER ',' CSV HEADER;
