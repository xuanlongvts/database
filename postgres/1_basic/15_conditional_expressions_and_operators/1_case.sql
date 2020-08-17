-- 1) General PostgreSQL CASE expression
-- A) A general CASE example
SELECT title, length,
    CASE 
        WHEN length > 0 AND length <= 50 THEN 'Short'
        WHEN length > 50 AND length <= 120 THEN 'Medium'
        WHEN length > 120 THEN 'Long'
    END duration
FROM film
ORDER BY length DESC;

-- B) Using CASE with an aggregate function example
/*
Suppose that you want to assign price segments to films with the following logic:

If the rental rate is 0.99, the film is economic.
If the rental rate is 1.99, the film is mass.
If the rental rate is 4.99, the film is premium.
And you want to know the number of films that belong to economy, mass, and premium.
*/
SELECT
    SUM(
        CASE
            WHEN rental_rate = 0.99 THEN 1
            ELSE 0 
        END
    ) AS "Economy",
    SUM(
        CASE
            WHEN rental_rate = 2.99 THEN 1
            ELSE 0
        END
    ) AS "Mass",
    SUM(
        CASE
            WHEN rental_rate = 4.99 THEN 1
            ELSE 0
        END
    ) AS "Premium"
FROM film;

-- 2) Simple PostgreSQL CASE expression
-- A) Simple PostgreSQL CASE expression example
SELECT title, rating,
    CASE rating
        WHEN 'G' THEN 'General Audiences'
        WHEN 'PG' THEN 'Parental Guidance Suggested'
        WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
        WHEN 'R' THEN 'Restricted'
        WHEN 'NC-17' THEN 'Adults Only'
    END rating_description
FROM film
ORDER BY title;

-- B) Using simple PostgreSQL CASE expression with aggregate function example
SELECT
    SUM(
        CASE rating
            WHEN 'G' THEN 1
        ELSE 
            0
        END
    ) "General Audiences",
    SUM(
        CASE rating
            WHEN 'PG' THEN 1
        ELSE
            0
        END
    ) "Parental Guidance Suggested",
    SUM(
        CASE rating
            WHEN 'PG-13' THEN 1
        ELSE
            0
        END
    ) "Parents Strongly Cautioned",
    SUM(
        CASE rating
            WHEN 'R' THEN 1
        ELSE
            0
        END
    ) "Restricted",
    SUM(
        CASE rating
            WHEN 'NC-17' THEN 1
        ELSE
            0
        END
    ) "Adults Only"
FROM film;