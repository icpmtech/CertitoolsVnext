--Connect to the certitools schema, DB with the postgres user
--su -postgres
--psql
--\c certitools

UPDATE TABLE users ADD COLUMN emailContact VARCHAR(255);