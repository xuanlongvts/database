/*
The EXPLAIN shows how tables involved in a statement will be scanned by index scan or sequential scan, etc., 
and if multiple tables are used, what kind of join algorithm will be used.

EXPLAIN [ ( option [, ...] ) ] sql_statement;

where option can be one of the following:

ANALYZE [ boolean ]
VERBOSE [ boolean ]
COSTS [ boolean ]
BUFFERS [ boolean ]
TIMING [ boolean ]  
SUMMARY [ boolean ]
FORMAT { TEXT | XML | JSON | YAML }

*/


EXPLAIN
SELECT *
FROM film;

EXPLAIN
SELECT *
FROM film
WHERE film_id = 100;

/*
Because the film_id is indexed, the statement returned a different plan. In the output, the planner used an index scan instead of 
a sequential scan on the film table.
*/
EXPLAIN
(COSTS FALSE)
SELECT *
FROM film
WHERE film_id = 100;

--
EXPLAIN
SELECT COUNT(*)
FROM film;

--
EXPLAIN
SELECT
    f.film_id,
    title,
    name category_name
FROM film f
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
ORDER BY title;

EXPLAIN ANALYZE
SELECT
    f.film_id,
    title,
    name category_name
FROM film f
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
ORDER BY title;
