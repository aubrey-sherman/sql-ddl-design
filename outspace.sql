CREATE table moons (
    moon_name VARCHAR(50) PRIMARY KEY,
    planet_of_orbit VARCHAR(50) REFERENCES planets);

INSERT into moons (moon_name, planet_of_orbit) VALUES ('The Moon', 'Earth'), ('Phobos', 'Mars'), ('Deimos', 'Mars');

CREATE table planets (
   planet_name VARCHAR(50) PRIMARY KEY,
    orbital_period FLOAT NOT NULL, -- in what??? Earth years
    star_of_orbit VARCHAR(50) REFERENCES stars);

INSERT into planets (planet_name, orbital_period, star_of_orbit) VALUES ('Earth', 1.00, 'The Sun'), (
    'Mars', 1.882, 'The Sun'), ('Venus', 0.62, 'The Sun'), ('Proxima Centauri b', 0.03, 'Proxima Centauri'), (
        'Gliese 876 b', 0.236, 'Gliese 876'); -- format this like below

CREATE table stars (
    star_name VARCHAR(50) PRIMARY KEY,
    temp VARCHAR(50) NOT NULL
        CHECK(temp LIKE ('%°K'))); -- Generally best to represent it as it's pure source - you can add K later

INSERT into stars (star_name, temp)
VALUES
('The Sun', '5800°K'),
('Proxima Centauri', '3042°K'),  -- THIS IS HOW TO FORMAT THIS
('Gliese 876', '3192°K');


SELECT planet_name, star_name, COUNT(moon_name) AS moon_count
FROM planets
LEFT OUTER JOIN moons
  ON planet_name = planet_of_orbit
JOIN stars
  ON star_of_orbit = star_name
GROUP BY planet_name, star_name
ORDER BY planet_name;