DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS user_group;
DROP SEQUENCE IF EXISTS user_seq;
DROP TYPE IF EXISTS user_flag;
DROP SEQUENCE IF EXISTS common_seq;
DROP TYPE IF EXISTS GROUP_TYPE;

CREATE TYPE user_flag AS ENUM ('active', 'deleted', 'superuser');

CREATE SEQUENCE user_seq START 100000;

CREATE TABLE users (
                       id        INTEGER PRIMARY KEY DEFAULT nextval('user_seq'),
                       full_name TEXT NOT NULL,
                       email     TEXT NOT NULL,
                       flag      user_flag NOT NULL
);
CREATE UNIQUE INDEX email_idx ON users (email);

CREATE SEQUENCE common_seq START 100000;

CREATE TABLE city (
                      ref  TEXT PRIMARY KEY,
                      name TEXT NOT NULL
);

ALTER TABLE users
    ADD COLUMN city_ref TEXT REFERENCES city (ref) ON UPDATE CASCADE;

CREATE TABLE project (
                         id          INTEGER PRIMARY KEY DEFAULT nextval('common_seq'),
                         name        TEXT UNIQUE NOT NULL,
                         description TEXT
);

CREATE TYPE GROUP_TYPE AS ENUM ('REGISTERING', 'CURRENT', 'FINISHED');

CREATE TABLE groups (
                        id         INTEGER PRIMARY KEY DEFAULT nextval('common_seq'),
                        name       TEXT UNIQUE NOT NULL,
                        type       GROUP_TYPE  NOT NULL,
                        project_id INTEGER     NOT NULL REFERENCES project (id)
);

CREATE TABLE user_group (
                            user_id  INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
                            group_id INTEGER NOT NULL REFERENCES groups (id),
                            CONSTRAINT users_group_idx UNIQUE (user_id, group_id)
);

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "user";
GRANT SELECT, UPDATE, USAGE ON ALL SEQUENCES IN SCHEMA public to "user";