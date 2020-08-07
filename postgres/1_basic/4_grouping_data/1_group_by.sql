SELECT customer_id
FROM customer
GROUP BY customer_id

SELECT customer_id, amount
FROM payment
WHERE customer_id = 184

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id

SELECT first_name || ' ' || last_name full_name, SUM(amount) amount
FROM payment INNER JOIN customer USING(customer_id) 
GROUP BY full_name
ORDER BY amount

SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id

SELECT customer_id, staff_id, SUM(amount)
FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id

SELECT DATE(payment_date) paid_date, SUM(amount) sum
FROM payment
GROUP BY DATE(payment_date)