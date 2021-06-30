SELECT 'CREATE DATABASE taberu'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'taberu')\gexec

\c taberu;

create user test with encrypted password 'test';
grant all privileges on database taberu to test;