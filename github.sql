DROP TABLE IF EXISTS coder;
CREATE TABLE coder (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  email_address varchar
);

DROP TABLE IF EXISTS project;
CREATE TABLE project (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  description varchar,
  master_owner integer REFERENCES coder (id),
  stars integer
);

DROP TABLE IF EXISTS tech;
CREATE TABLE tech (
  id serial PRIMARY KEY,
  name varchar NOT NULL UNIQUE
);

DROP TABLE IF EXISTS coder_project;
CREATE TABLE project_membership (
  id serial PRIMARY KEY,
  project_id integer NOT NULL REFERENCES project (id),
  coder_id integer NOT NULL REFERENCES coder (id)
);

DROP TABLE IF EXISTS project_uses_tech;
CREATE TABLE project_uses_tech (
  id serial PRIMARY KEY,
  project_id integer REFERENCES project (id),
  tech_id integer REFERENCES tech (id)
);

DROP TABLE IF EXISTS commits;
CREATE TABLE commits (
  id serial PRIMARY KEY,
  project_id integer REFERENCES project (id),
  coder_id integer REFERENCES coder (id),
  commit_message varchar,
  commit_date date
);

DROP TABLE IF EXISTS pull_request;
CREATE TABLE pull_request (
  id serial PRIMARY KEY,
  project_id integer REFERENCES project (id),
  coder_id integer REFERENCES coder (id),
  commit_id integer REFERENCES commits (id),
  pull_request_message varchar,
  accepted boolean
);
