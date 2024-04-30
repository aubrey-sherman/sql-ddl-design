CREATE table moons (
    moon_id VARCHAR(50) PRIMARY KEY,
    planet_of_orbit VARCHAR(50) REFERENCES planets
);

CREATE table planets (
    planet_id VARCHAR(50) PRIMARY KEY,
    orbital_period FLOAT NOT NULL,
        CHECK(orbital_period in ('years')),
    star_of_orbit VARCHAR(50) REFERENCES stars
);


CREATE table stars (
    star_id VARCHAR(50) PRIMARY KEY,
    temp INT NOT NULL,
        CHECK(temp in ('Kelvin'))
);