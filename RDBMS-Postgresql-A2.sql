-- Assignment-2 - The Ranger and the Rare Animal
CREATE DATABASE wildlife_monitoring;

-- Rangers Table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);
-- DROP TABLE rangers;

-- Species Table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);
-- DROP TABLE species;

-- Sightings Table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150),
    notes TEXT
);
-- DROP TABLE sightings;

-- Rangers
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

-- SELECT * from rangers;

-- Species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-02', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-03-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-03-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-03-01', 'Endangered');
-- SELECT * from species;

-- Sightings
INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 1, '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
(2, 2, '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
(3, 3, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
(2, 1, '2024-05-18 18:30:00', 'Snowfall Pass',Null);

-- SELECT * from sightings;



-- *** START ***--
-- Problems 1
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains');
-- select * FROM rangers;



-- Problems 2
SELECT COUNT(*) AS unique_species_count 
FROM (
    SELECT species_id
    FROM sightings
    GROUP BY species_id
) AS grouped_species;



-- Problems 3
-- SELECT * FROM sightings
--     WHERE location ILIKE  '%pass';
SELECT 
  sighting_id, 
  species_id,
  ranger_id,  
  sighting_time, 
  location,
  COALESCE(notes, 'No notes') AS notes
FROM sightings
WHERE location ILIKE '%pass';



-- Problems 4
SELECT 
    rangers.name,
    COUNT(*) AS total_sightings
FROM sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY rangers.name ORDER BY rangers.name;



-- Problems 5
SELECT species.common_name
FROM species
LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE sightings.species_id IS NULL;



-- Problems 6
SELECT common_name, sighting_time, name AS ranger FROM sightings
JOIN rangers on rangers.ranger_id = sightings.ranger_id
JOIN species on species.species_id = sightings.species_id
ORDER BY sightings.sighting_time DESC LIMIT 2



-- Problems 7
UPDATE species 
    set conservation_status = 'Historic'
    WHERE EXTRACT(YEAR FROM discovery_date) < 1800;



-- Problems 8
SELECT 
  sighting_id,
  CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) >= 5 AND EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
    WHEN EXTRACT(HOUR FROM sighting_time) >= 17 AND EXTRACT(HOUR FROM sighting_time) < 21 THEN 'Evening'
    ELSE 'Night'
  END AS time_of_day
FROM sightings;


-- Problems 9
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings WHERE ranger_id IS NOT NULL
);
-- select * FROM rangers;




    