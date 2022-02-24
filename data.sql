INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '3-2-2020', '0', 'true', '10.23');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_Kg)
VALUES ('Gabumon', '11-15-2018', '2', "true", '8')

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_Kg)
VALUES ('Pikachu', '7-1-2021', '1', 'false', '15.04')

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_Kg)
VALUES ('Devimon', '12-5-2017', '5', 'true', '11')

--second batch of data

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020=02-08', '0', 'false', '-11');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2022-11-15', '2', 'true', '-5.7');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', '3', 'false', '-12.13');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', '1', 'true', '-45');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', '7', 'TRUE', '20.4');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', '3', 'TRUE', '17');

--third batch

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Sam Smith', 34);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Bob', 45);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Melody Pond', 77);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Dean Winchester', 14);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (
    name
  )
VALUES ('Pokemon');

INSERT INTO species (
    name
  )
VALUES ('Digimon');

UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;
UPDATE animals SET owners_id=1 WHERE name='Agumon';
UPDATE animals SET owners_id=2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owners_id=3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owners_id=4 WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owners_id=5 WHERE name='Angemon' OR name='Boarmon';