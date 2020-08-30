-- CREATE VIEW view_name AS query;
SELECT 
    cus.customer_id as id, cus.store_id as sid, cus.first_name || ' ' || cus.last_name as name,
    add.address, add.postal_code as Zipcode, add.phone,
    city.city,
    country.country,
    CASE 
        WHEN cus.activebool THEN 'active'
        ELSE ''
    END as notes
FROM customer cus
INNER JOIN address add USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id);

-- This query is quite complex. However, you can create a view named customer_master as follows:
CREATE OR REPLACE VIEW customer_master AS SELECT 
    cus.customer_id as id, cus.store_id as sid, cus.first_name || ' ' || cus.last_name as name,
    add.address, add.postal_code as "Zip code", add.phone,
    city.city,
    country.country,
    CASE 
        WHEN cus.activebool THEN 'active'
        ELSE ''
    END as notes
FROM customer cus
INNER JOIN address add USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id);

SELECT * FROM customer_master;

-- Changing PostgreSQL Views
ALTER VIEW customer_master RENAME TO customer_info;

SELECT * FROM customer_info;


-- Drop PostgreSQL Views
DROP VIEW IF EXISTS customer_master;
DROP VIEW IF EXISTS customer_info;

