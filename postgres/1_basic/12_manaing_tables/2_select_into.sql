DROP TABLE film_r;

-- copy to the real table
SELECT film_id, title, rating, rental_rate
INTO TABLE film_r
FROM film
WHERE rating = 'R' AND rental_duration = 5
ORDER BY title;

SELECT *
FROM film_r

-- Copy to temporary table
SELECT film_id, title, length
INTO TEMPORARY
TABLE short_film
FROM film
WHERE length < 60
ORDER BY title;

SELECT *
FROM short_film