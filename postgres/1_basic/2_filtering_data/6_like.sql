SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'Jen%'

SELECT
    'foo'
LIKE 'foo',
'foo' LIKE 'f%',
'foo' LIKE '_o_',
'bar' LIKE 'b_'

SELECT
    'foo'
LIKE 'foo',
'foo' LIKE 'f%',
'foo' LIKE '_o_',
'bar' LIKE 'b__'

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '%er%'
ORDER BY first_name

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '_her%'
ORDER BY first_name

SELECT first_name, last_name
FROM customer
WHERE first_name NOT LIKE 'Jen%'
ORDER BY first_name

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'Bar%'

-- ILIKE for case-insensitively
SELECT first_name, last_name
FROM customer
WHERE first_name
ILIKE 'BAR%'