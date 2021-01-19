CREATE ROLE "rest-server" WITH
    LOGIN
    NOSUPERUSER
    INHERIT
    NOCREATEDB
    NOCREATEROLE
    NOREPLICATION
    PASSWORD 'rest-server';

CREATE DATABASE "rest-server"
    WITH
    OWNER = "rest-server"
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
