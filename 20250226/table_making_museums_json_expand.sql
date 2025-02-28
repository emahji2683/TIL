CREATE TABLE museums_json_expand (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    business_hours VARCHAR(255),
    admission_fees VARCHAR(255),
    website_url VARCHAR(255),
    phone_number VARCHAR(20),
    area VARCHAR(100)
);
