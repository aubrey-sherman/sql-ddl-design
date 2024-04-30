CREATE table moons (
    moon_name VARCHAR(50) PRIMARY KEY,
    planet_of_orbit VARCHAR(50) REFERENCES planets
);

CREATE table planets (
   planet_name VARCHAR(50) PRIMARY KEY,
    orbital_period FLOAT NOT NULL,
        CHECK(orbital_period in ('years')),
    star_of_orbit VARCHAR(50) REFERENCES stars
);


CREATE table stars (
    star_name VARCHAR(50) PRIMARY KEY,
    temp INT NOT NULL,
        CHECK(temp in ('Kelvin'))
);

SELECT planet_name, star_name, COUNT(moon_name) AS moon_count
FROM planets
JOIN moons
  ON planet_name = planet_of_orbit
JOIN stars
  ON star_of_orbit = star_name
GROUP BY planet_name, star_name
ORDER BY planet_name