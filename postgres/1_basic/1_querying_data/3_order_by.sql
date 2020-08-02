SELECT first_name, last_name
from customer
ORDER BY first_name ASC

-- ASC (Tang dan) Default
SELECT first_name, last_name
from customer
ORDER BY first_name

SELECT first_name, last_name
from customer
ORDER by last_name DESC

-- Sort row multiple columms
SELECT first_name, last_name
from customer
ORDER BY first_name ASC, last_name DESC

SELECT first_name, LENGTH(first_name) len
from customer
ORDER by len DESC


-- Create new a table for demo
CREATE TABLE sort_demo
(
    num INT
);

-- insert some data
INSERT INTO sort_demo
    (num)
VALUES(1),
    (2),
    (3),
    (null);

SELECT num
from sort_demo
ORDER by num

SELECT num
from sort_demo
ORDER by num NULLS FIRST

SELECT num
from sort_demo
ORDER BY num DESC

SELECT num
from sort_demo
ORDER BY num DESC
NULLS LAST
