DROP TABLE IF EXISTS action_film;

CREATE TABLE
IF NOT EXISTS action_film
AS
SELECT film_id, title, release_year, length, rating
FROM film
    INNER JOIN film_category USING(film_id) 
WHERE category_id = 1

SELECT *
FROM action_film

-- overide colunn film_id to film_count
CREATE TABLE
IF NOT EXISTS film_rating
(rating, film_count)
AS
SELECT rating, COUNT(film_id)
FROM film
GROUP BY (rating)

SELECT *
FROM film_rating
