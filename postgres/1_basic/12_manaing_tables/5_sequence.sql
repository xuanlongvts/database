-- 1) Creating an ascending sequence example
CREATE SEQUENCE mySequence
INCREMENT 5
START 100

SELECT nextval('mySequence');
SELECT nextval('mySequence');

-- 2) Creating a descending sequence example
CREATE SEQUENCE sequenceThree
INCREMENT -1
MINVALUE 1
MAXVALUE 3
START 3
CYCLE;

SELECT nextval('sequenceThree');
SELECT nextval('sequenceThree');
SELECT nextval('sequenceThree');

/*
When you execute the following statement multiple times, you will see the number starting from 3, 2, 1 
and back to 3, 2, 1 and so on:
*/

-- 3) Creating a sequence associated with a table column
CREATE TABLE
IF NOT EXISTS order_details
(
    order_id SERIAL,
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC
(10, 2) NOT NULL,
PRIMARY KEY
(order_id, item_id)
);

DROP SEQUENCE IF EXISTS order_item_id;

CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;


INSERT INTO order_details
VALUES
    (100, nextval
('order_item_id'), 'DVD Player', 100),
    (100, nextval
('order_item_id'), 'Android TV', 550),
    (100, nextval
('order_item_id'), 'Speaker', 250);

SELECT *
FROM order_details;

-- List all sequence
SELECT relname sequence_name
FROM pg_class
WHERE relkind = 'S';