SELECT c.customer_id, first_name, amount, payment_date
FROM customer c INNER JOIN payment p ON p.customer_id = c.customer_id
ORDER BY payment_date DESC

-- Way two
SELECT customer_id, first_name, amount, payment_date
FROM customer INNER JOIN payment USING(customer_id) 
ORDER BY payment_date DESC