CREATE OR REPLACE VIEW usa_city AS
    SELECT city_id, city, country_id
    FROM city
    WHERE country_id = 103
    ORDER BY city;

--
INSERT INTO usa_city(city, country_id)
VALUES ('Birmingham', 102);

INSERT INTO usa_city(city, country_id)
VALUES ('Cambridge', 102);

SELECT * FROM usa_city;

/*
The issue is that the new row inserted is not visible in the view. 
It may pose a security issue because we may grant the permission to the users to update the cities in the United States, 
not the United Kingdom.

To prevent users from the insert or update a row that not visible through the view, 
you use the WITH CHECK OPTION clause when creating the view.

Let’s change the usa_city view to include the WITH CHECK OPTION clause
*/
DROP VIEW IF EXISTS usa_city;

CREATE OR REPLACE VIEW usa_city AS
    SELECT city_id, city, country_id
    FROM city
    WHERE country_id = 103
    ORDER BY city
    WITH CHECK OPTION;

-- The following statement updates the country of the city id 135 to the United Kingdom.

-- ERROR:  new row violates check option for view "usa_city"
-- This is because the UPDATE statement causes the row that is being updated not visible through the usa_city view.
UPDATE usa_city
SET country_id = 102
WHERE city_id = 135;

-- The scope of check with LOCAL and CASCADED

-- The city_a view does not have the WITH CHECK OPTION clause.
CREATE OR REPLACE VIEW city_a AS
    SELECT city_id, city, country_id
    FROM city
    WHERE city LIKE 'A%';

CREATE OR REPLACE VIEW city_a_usa AS
    SELECT city_id, city, country_id
    FROM city_a
    WHERE country_id = 103
    WITH CASCADED CHECK OPTION; 

-- ERROR: new row violates check option for view "city_a"
INSERT INTO city_a_usa(city, country_id)
VALUES ('Houston', 103);

/*
This is because when we used the WITH CASCADED CHECK OPTION for the city_a_usa view, 
PostgreSQL checked the view-defining condition of the city_a_usa view and also all the underlying views, 
in this case, it is the city_a view.
*/

CREATE OR REPLACE VIEW city_a_usa AS
    SELECT city_id, city, country_id
    FROM city_a
    WHERE country_id = 103
    WITH LOCAL CHECK OPTION;

INSERT INTO city_a_usa(city, country_id)
VALUES ('Houston', 103);