/*
    -- Find customers who have at least one payment whose amount is greater than 11.
*/
SELECT first_name, last_name
FROM customer c
WHERE EXISTS (
    SELECT 1
FROM payment p
WHERE p.customer_id = c.customer_id
    AND amount > 11
)
ORDER BY first_name, last_name

-- NOT EXISTS
SELECT first_name, last_name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
FROM payment p
WHERE p.customer_id = c.customer_id
    AND amount > 11
)
ORDER BY first_name, last_name

-- EXISTS and NULL
SELECT first_name, last_name
FROM customer
WHERE EXISTS (SELECT NULL)
ORDER BY first_name, last_name