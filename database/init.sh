#!/bin/sh

# You could probably do this fancier and have an array of extensions
# to create, but this is mostly an illustration of what can be done


psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOF
CREATE DATABASE web_dev;
CREATE DATABASE web_test;

\c web_dev
CREATE SCHEMA tiger AUTHORIZATION postgres;
CREATE SCHEMA tiger_data AUTHORIZATION postgres;
CREATE SCHEMA topology AUTHORIZATION postgres;
COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
ALTER DATABASE web_dev SET search_path=public, tiger, topology;
CREATE EXTENSION pgcrypto SCHEMA public VERSION "1.3";
CREATE EXTENSION fuzzystrmatch SCHEMA public VERSION "1.1";
CREATE EXTENSION postgis SCHEMA public VERSION "3.1.4";
CREATE EXTENSION postgis_tiger_geocoder SCHEMA tiger VERSION "3.1.4";
CREATE EXTENSION postgis_topology SCHEMA topology VERSION "3.1.4";

\c web_test
CREATE SCHEMA tiger AUTHORIZATION postgres;
CREATE SCHEMA tiger_data AUTHORIZATION postgres;
CREATE SCHEMA topology AUTHORIZATION postgres;
COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
ALTER DATABASE web_test SET search_path=public, tiger, topology;
CREATE EXTENSION pgcrypto SCHEMA public VERSION "1.3";
CREATE EXTENSION fuzzystrmatch SCHEMA public VERSION "1.1";
CREATE EXTENSION postgis SCHEMA public VERSION "3.1.4";
CREATE EXTENSION postgis_tiger_geocoder SCHEMA tiger VERSION "3.1.4";
CREATE EXTENSION postgis_topology SCHEMA topology VERSION "3.1.4";

EOF

#CREATE EXTENSION postgis_tiger_geocoder SCHEMA tiger VERSION "3.1.4";
#CREATE EXTENSION postgis_topology SCHEMA topology VERSION "3.1.4";
