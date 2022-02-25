/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED  ALWAYS AS IDENTITY,
    name CHAR NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT NOT NULL

);

ALTER TABLE animals ADD species CHAR(20);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(20),
  age INT
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);