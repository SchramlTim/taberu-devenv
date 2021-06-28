SELECT 'CREATE DATABASE taberu'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'taberu')\gexec

\c taberu;

create user test with encrypted password 'test';
grant all privileges on database taberu to test;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  salt VARCHAR(50),
  first_name VARCHAR(50),
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

GRANT ALL PRIVILEGES ON TABLE users to test;
GRANT ALL PRIVILEGES ON TABLE users_id_seq to test;