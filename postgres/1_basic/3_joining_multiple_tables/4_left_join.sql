SELECT film.film_id, title, inventory_id
FROM film
    LEFT JOIN inventory
    ON film.film_id = inventory.film_id
ORDER BY title

SELECT film.film_id, title, inventory_id
FROM film
    LEFT JOIN inventory
    ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL
ORDER BY title