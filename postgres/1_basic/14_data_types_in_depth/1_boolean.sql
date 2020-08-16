DROP TABLE IF EXISTS stock_availability;
CREATE TABLE
IF NOT EXISTS stock_availability
(
    product_id INT PRIMARY KEY,
    available BOOLEAN NOT NULL
);

INSERT INTO stock_availability
    (product_id, available)
VALUES
    (1, TRUE),
    (2, FALSE),
    (3, 't'),
    (4, 'f'),
    (5, 'y'),
    (6, 'n'),
    (7, 'true'),
    (8, 'false'),
    (9, 'yes'),
    (10, 'no'),
    (11, '1'),
    (12, '0');

SELECT *
FROM stock_availability;

SELECT *
FROM stock_availability
WHERE available = '0'

-- Set a default value of the Boolean column
ALTER TABLE stock_availability
ALTER COLUMN available
SET
DEFAULT FALSE

INSERT INTO stock_availability
    (product_id)
VALUES
    (20);
