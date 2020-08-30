CREATE OR REPLACE VIEW usa_cities AS
    SELECT
        city,
        country_id
    FROM city
    WHERE country_id = 103;

SELECT * FROM usa_cities;

--
INSERT INTO usa_cities(city, country_id)
VALUES
    ('San Jose', 103);

SELECT
    city,
    country_id
FROM city
WHERE country_id = 103
ORDER BY last_update DESC;

-- Finally, delete the entry that has been added through the usa_cities view.
DELETE FROM usa_cities
WHERE city = 'San Jose';