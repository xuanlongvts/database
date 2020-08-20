DROP TABLE IF EXISTS basket;
CREATE TABLE
IF NOT EXISTS basket
(
    id SERIAL PRIMARY KEY,
    fruit VARCHAR
(50) NOT NULL
);

TRUNCATE TABLE basket
RESTART IDENTITY

INSERT INTO basket
    (fruit)
VALUES
    ('apple'),
    ('apple'),
    ('orange'),
    ('orange'),
    ('orange'),
    ('banana');

SELECT *
FROM basket;

-- Finding duplicate rows
SELECT COUNT(fruit)
FROM basket
GROUP BY fruit
HAVING COUNT(fruit) > 1
ORDER BY COUNT
(fruit) DESC

-- Deleting duplicate rows using DELETE USING statement
DELETE FROM basket a USING basket
b WHERE a.id < b.id AND a.fruit = b.fruit

-- Deleting duplicate rows using subquery
DELETE FROM basket
WHERE id IN (
    SELECT id
FROM (
        SELECT id, ROW_NUMBER() OVER (PARTITION BY fruit ORDER BY id) AS row_num
    FROM basket 
    ) t
WHERE t.row_num > 1
);



