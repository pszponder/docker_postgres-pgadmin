CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    continent TEXT NOT NULL,
    capital_city TEXT NOT NULL,
    population INTEGER NOT NULL,
    gdp FLOAT NOT NULL
);
INSERT INTO countries (name, continent, capital_city, population, gdp) VALUES
    ('United States', 'North America', 'Washington D.C.', 328000000, 21427700),
    ('Japan', 'Asia', 'Tokyo', 126500000, 5082462),
    ('Germany', 'Europe', 'Berlin', 83149300, 3866340);


CREATE TABLE cities (
    city_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER REFERENCES countries(country_id),
    population INTEGER NOT NULL,
    mayor TEXT NOT NULL
);
INSERT INTO cities (name, country_id, population, mayor) VALUES
    ('New York', 1, 8538000, 'Bill de Blasio'),
    ('Tokyo', 2, 13929286, 'Yuriko Koike'),
    ('Berlin', 3, 3669491, 'Michael Müller');


CREATE TABLE languages (
    language_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);
INSERT INTO languages (name) VALUES
    ('English'),
    ('Japanese'),
    ('German');


CREATE TABLE country_languages (
    country_id INTEGER REFERENCES countries(country_id),
    language_id INTEGER REFERENCES languages(language_id),
    PRIMARY KEY (country_id, language_id)
);
INSERT INTO country_languages (country_id, language_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3);


CREATE TABLE currencies (
    currency_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    symbol TEXT NOT NULL
);
INSERT INTO currencies (name, symbol) VALUES
    ('US Dollar', '$'),
    ('Japanese Yen', '¥'),
    ('Euro', '€');


CREATE TABLE country_currencies (
    country_id INTEGER REFERENCES countries(country_id),
    currency_id INTEGER REFERENCES currencies(currency_id),
    PRIMARY KEY (country_id, currency_id)
);
INSERT INTO country_currencies (country_id, currency_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3);
