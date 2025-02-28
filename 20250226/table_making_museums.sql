CREATE TABLE :table_name (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    business_hours VARCHAR(255),
    admission_fees VARCHAR(255),
    website_url VARCHAR(255),
    phone_number VARCHAR(20),
    area VARCHAR(100)
);

COPY :table_name (name, location, business_hours, admission_fees, website_url, phone_number, area)
FROM :file_name
WITH CSV HEADER;
