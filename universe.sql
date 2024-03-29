/* Age in years, galaxy diameters in ly, star masses in solar masses, planet masses in earth masses */

CREATE TABLE galaxy(
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    galaxy_type TEXT NOT NULL,
    center TEXT,
    diameter NUMERIC
);

CREATE TABLE star(
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy (galaxy_id),
    star_type TEXT NOT NULL,
    mass NUMERIC,
    system_size INT
);

CREATE TABLE planet(
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star (star_id),
    is_dwarf BOOLEAN,
    is_terrestrial BOOLEAN,
    mass NUMERIC,
    system_size INT
);

CREATE TABLE moon(
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet (planet_id),
    mass NUMERIC,
    system_size INT
);

CREATE TABLE objects(
    objects_id SERIAL UNIQUE PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    A BOOLEAN NOT NULL,
    B BOOLEAN NOT NULL
);



INSERT INTO objects (name, A, B)
VALUES
    ('galaxy', TRUE, FALSE),
    ('star', TRUE, FALSE),
    ('planet', TRUE, FALSE),
    ('moon', TRUE, FALSE)
;


INSERT INTO 
    galaxy (name, galaxy_type, center, diameter) 
VALUES
    ('Milky Way', 'Spiral', 'Sagittarius A*', 87400),
    ('LMC', 'Spiral', NULL, 32200),
    ('Andromda', 'Spiral', NULL, 152200),
    ('Hercules A', 'Elliptical', NULL, 2100000000),
    ('SMC', 'Irregular', NULL, 18900),
    ('Sgr dSph', 'Elliptical', NULL, 10000)
;


INSERT INTO 
    star (name, galaxy_id, star_type, mass, system_size) 
VALUES
    ('Sun', 1, 'Yellow Dwarf', 1, 1),
    ('Kepler-11', 1, 'Yellow Dwarf', 1.042, 1),
    ('PSR J1719-1438', 1, 'Neutron', NULL, 2),
    ('Tabby', 1, 'Yellow Dwarf', 1.43, 1),
    ('HE 0437-5439', 1, 'B', 8, 1),
    ('UY Scuti', 1, 'Red Supergiant', 25, 1)    
;


INSERT INTO 
    planet (name, star_id, is_dwarf, is_terrestrial, mass, system_size)
VALUES
    ('Mercury', 1, FALSE, TRUE, 0.0553 , 1 ),
    ('Venus', 1, FALSE, TRUE, 0.815, 1 ),
    ('Earth', 1, FALSE, TRUE, 1, 1 ), 
    ('Mars', 1, FALSE, TRUE, 0.107, 1 ),
    ('Jupiter', 1, FALSE, FALSE, 317.8, 1 ),
    ('Saturn', 1, FALSE, FALSE, 95.2, 1 ),
    ('Uranus', 1, FALSE, FALSE, 14.5, 1 ),
    ('Neptune', 1, FALSE, FALSE, 17.1, 1 ),
    ('Pluto', 1, TRUE, TRUE, 0.0022, 1 ),
    ('PSR J1719−1438 b', 3, FALSE, TRUE, 330, 2),
    ('Kepler-11b', 2, FALSE, TRUE, 2.78, 1),
    ('Kepler-11c', 2, FALSE, TRUE, 5, 1),
    ('Kepler-11d', 2, FALSE, TRUE, 8.13, 1),
    ('Kepler-11e', 2, FALSE, TRUE, 9.48, 1),
    ('Kepler-11f', 2, FALSE, TRUE, 2.43, 1),
    ('Kepler-11g', 2, FALSE, TRUE, 25, 1)
;
    
    
INSERT INTO 
    moon (name, planet_id, mass, system_size)
VALUES 
    ('Moon', 3, 1, 1),
    ('Ganymede', 5, 1, 1),
    ('Titan', 6, 1, 1),
    ('Callisto', 5, 1, 1),
    ('Io', 5, 1, 1),
    ('Europa', 5, 1, 1),
    ('Triton', 8, 1, 1),
    ('Titania', 7, 1, 1),
    ('Oberon', 7, 1, 1),
    ('Rhea', 6, 1, 1),
    ('Iapetus', 6, 1, 1),
    ('Charon', 9, 1, 1),
    ('Ariel', 8, 1, 1),
    ('Umbriel', 8, 1, 1),
    ('Dione', 6, 1, 1),
    ('Tethys', 6, 1, 1),
    ('SpoofMoon1', 6, 1, 1),
    ('SpoofMoon2', 6, 1, 1),
    ('SpoofMoon3', 6, 1, 1),
    ('SpoofMoon4', 6, 1, 1),
    ('SpoofMoon5', 6, 1, 1)
;