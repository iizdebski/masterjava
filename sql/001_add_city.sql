CREATE SEQUENCE common_seq START 100000;

CREATE TABLE city (
                      ref  TEXT PRIMARY KEY,
                      name TEXT NOT NULL
);

ALTER TABLE users
    ADD COLUMN city_ref TEXT REFERENCES city (ref) ON UPDATE CASCADE;