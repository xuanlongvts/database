SELECT MAX(length)
FROM film
    INNER JOIN film_category USING(film_id) 
GROUP BY category_id

-- Note that SOME is a synonym for ANY, meaning that you can substitute SOME for ANY in any SQL statement.
SELECT title, length
FROM film
WHERE length >= ANY (
    SELECT MAX(length)
FROM film
    INNER JOIN film_category USING(film_id) 
GROUP BY category_id
)

-- ANY vs IN. The = ANY is equivalent to IN operator.
-- Note that the <> ANY operator is different from NOT IN. The following expression:
SELECT title, category_id
FROM film
    INNER JOIN film_category USING(film_id) 
WHERE category_id = ANY(
    SELECT category_id
FROM category
WHERE name = 'Action' OR name = 'Drama'
)

SELECT title, category_id
FROM film
    INNER JOIN film_category USING(film_id) 
WHERE category_id IN(
    SELECT category_id
FROM category
WHERE name='Action' OR name='Drama'
)
