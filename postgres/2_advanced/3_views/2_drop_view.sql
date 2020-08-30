/*
DROP VIEW [IF EXISTS] view_name
[CASCADE | RESTRICT]

First, specify the name of the view after the DROP VIEW keywords.

Second, use the IF EXISTS option to drop a view only if it exists. 
If you don’t use the IF EXISTS option and drop a view that does not exist, PostgreSQL will issue an error. 
However, if you use the IF EXISTS option, PostgreSQL issues a notice instead.

Third, use the RESTRICT option to reject the removal of the view if there are any objects depending on it. 
The RESTRICT option is the default. If you use the CASCADE option, the DROP VIEW automatically drops objects that 
depend on view and all objects that depend on those objects.

To remove multiple views using a single statement, you specify a comma-separated list of view names after the 
DROP VIEW keywords like this:

DROP VIEW [IF EXISTS] view_name1, view_name2, ...;
*/
CREATE OR REPLACE VIEW film_master AS
    SELECT film_id, title, release_year, length, name category
    FROM film
    INNER JOIN film_category USING(film_id)
    INNER JOIN category USING(category_id);

CREATE OR REPLACE VIEW horror_film AS
    SELECT film_id,  title, release_year, length
    FROM film_master
    WHERE category = 'Horror';

CREATE OR REPLACE VIEW comedy_film AS
    SELECT film_id, title, release_year, length
    FROM film_master
    WHERE category = 'Comedy';

--
CREATE OR REPLACE VIEW film_category_stat AS
    SELECT name, COUNT(film_id)
    FROM category
    INNER JOIN film_category USING(category_id)
    INNER JOIN film USING(film_id)
    GROUP BY name;

CREATE OR REPLACE VIEW film_length_stat AS
    SELECT name, SUM(length) film_length
    FROM category
    INNER JOIN film_category USING(category_id)
    INNER JOIN film USING(film_id)
    GROUP BY name;

-- 1) Using PostgreSQL DROP VIEW to drop one view
DROP VIEW comedy_film;

-- 2) Using PostgreSQL DROP VIEW statement to drop a view that has dependent objects

-- Error
DROP VIEW film_master;

-- Cascades
DROP VIEW film_master CASCADE;

-- 3) Using PostgreSQL DROP VIEW to drop multiple views
DROP VIEW film_category_stat, film_length_stat;