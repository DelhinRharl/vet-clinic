/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name LIKE 'Agumon' OR name LIKE 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;

SELECT speces FROM animals;

BEGIN;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'Pokemon' WHERE species IS NULL;

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
SAVEPOINT first_delete;
UPDATE animals SET weight_kg = -1 * weight_kg;
ROLLBACK TO first_delete;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT COUNT(*) FROM animals WHERE neutered = FALSE;

SELECT COUNT(*) FROM animals WHERE neutered = TRUE;

SELECT neutered, MAX(escape_attempts) FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '01-01-1990' AND date_of_birth < '12-31-2000' GROUP BY species;


SELECT animals.name FROM animals 
JOIN owners ON animals.owners_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

SELECT animals.*, species.name AS species_name FROM animals 
JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name AS animal_name, owners.fulL_name AS owner_name FROM owners 
LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT species.name, COUNT(*) FROM animals 
JOIN species ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name AS animal_name, owners.full_name AS owner_name, species.name AS species_name FROM animals
JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owners_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT * FROM animals
JOIN owners ON animals.owners_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) AS num_animals FROM owners
LEFT JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name ORDER BY num_animals DESC;

--visits

--William Thatcher last visit

SELECT vet.name AS vet_name, an.name AS animal_name
  FROM visits v JOIN animals an ON an.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id
  WHERE vet.name = 'William Tatcher'
  ORDER BY v.date_of_visit DESC LIMIT 1;

-- Stephanie Mendez  animal visits
SELECT vet.name as vet_name, COUNT(date_of_visit) 
  FROM visits v JOIN vets vet ON v.vet_id = vet.id
  WHERE name = 'Stephanie Mendez' GROUP BY vet.name;

  --all vets and specialties

  SELECT 
	vets.name,
	species.name AS specialized_in
FROM vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;

--Stephanie Mendez 2020-04-01-2020-08-30
SELECT animals.name AS animal_name, visits.date_of_visit FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

--most visits 
SELECT an.name, COUNT(an.name) AS most_visits
  FROM visits v JOIN animals an ON an.id = v.animal_id
  GROUP BY an.name ORDER BY most_visits DESC LIMIT 1;

  --first visit Maisy Smith
  SELECT an.name AS animal, vet.name AS vet, v.date_of_visit
  FROM visits v JOIN animals an ON an.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id
  WHERE vet.name = 'Maisy Smith' ORDER BY v.date_of_visit ASC LIMIT 1;

  --most recent visit
  SELECT an.id AS animal_id, an.name AS animal, an.date_of_birth, vet.id AS vet_id, vet.name AS vet, vet.age AS vet_age, date_of_visit
  FROM visits v JOIN animals an ON an.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id ORDER BY v.date_of_visit DESC
  LIMIT 1;

    --vet visit -no specialization
    SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animals.species_id != specializations.species_id;

--Maisy smith specialty to consider
SELECT vet.name AS vet, sp.name AS species, COUNT(sp.name)
  FROM visits v JOIN animals a ON a.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id
  JOIN species sp ON sp.id = a.species_id
  WHERE vet.name = 'Maisy Smith' GROUP BY vet.name, sp.name
  ORDER BY COUNT DESC LIMIT 1;