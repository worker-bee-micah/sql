--practice import file for PostgreSQL database
CREATE ROLE mt_botanica_app LOGIN;
CREATE DATABASE mt_botanica ENCODINT 'UTF-6' LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8' TEMPLATE template0
OWNER mt_botanica_app;
--connect
\c mt_botanica
--schema name is the same as the owner name
CREATE SCHEMA mt_botanica_app AUTHORIZATION mt_botanica_app;

SET search path to mt_botanica_app;
SET ROLE mt_botanica_app;

--build the core table first
--species_id is not taxonomic related, assigned by Postres
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    family_name TEXT NOT NULL,
    sub_familay_name TEXT NOT NULL,	
    genus_name TEXT NOT NULL,
    specific_epithet TEXT NULL,
    variety TEXT NULL,
    year_species SMALLINT NULL,

--CHECK (family_name in --wip
);

--distributional range, needs contraints
CREATE TABLE range (
    native TEXT NOT NULL,
    cultivated TEXT NULL,
    naturalized TEXT NULL

/* CREATE TABLE common_names (
    species_id

 