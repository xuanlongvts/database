/*
CREATE MATERIALIZED VIEW view_name
AS
query
WITH [NO] DATA;

To load data into a materialized view, you use the  REFRESH MATERIALIZED VIEWstatement as shown below:

REFRESH MATERIALIZED VIEW view_name;

When you refresh data for a materialized view, PosgreSQL locks the entire table therefore you cannot query data against it. 
To avoid this, you can use the CONCURRENTLY option.

REFRESH MATERIALIZED VIEW CONCURRENTLY view_name;

With CONCURRENTLY option, PostgreSQL creates a temporary updated version of the materialized view, compares two versions, 
and performs INSERT and UPDATE only the differences. You can query against the materialized view while it is being updated. 
One requirement for using CONCURRENTLY option is that the materialized view must have a UNIQUE index. 
Notice that CONCURRENTLY option is only available from PosgreSQL 9.4.

Removing materialized views
DROP MATERIALIZED VIEW view_name;
*/

CREATE MATERIALIZED VIEW rental_by_category AS
    SELECT c.name AS category, sum(p.amount) AS total_sales
    FROM (
        payment p 
        INNER JOIN rental r ON (p.rental_id = r.rental_id)
        INNER JOIN inventory i ON (r.inventory_id = i.inventory_id)
        INNER JOIN film f ON (i.film_id = f.film_id)
        INNER JOIN film_category fc ON (f.film_id = fc.film_id)
        INNER JOIN category c ON (fc.category_id = c.category_id)
    )
    GROUP BY c.name
    ORDER BY sum(p.amount) DESC
    WITH NO DATA;

-- [Err] ERROR: materialized view "rental_by_category" has not been populated
-- HINT: Use the REFRESH MATERIALIZED VIEW command.
SELECT * FROM rental_by_category;

-- PostgreSQL is very nice to give us a hint to ask for loading data into the view. Let’s do it by executing the following statement:
REFRESH MATERIALIZED VIEW rental_by_category;

-- From now on, we can refresh the data in the rental_by_category view using the REFRESH MATERIALIZED VIEW statement. 
-- However, to refresh it with CONCURRENTLY option, we need to create a UNIQUE index for the view first.
CREATE UNIQUE INDEX rental_category ON rental_by_category(category);

REFRESH MATERIALIZED VIEW CONCURRENTLY rental_by_category;