DROP TABLE IF EXISTS product_groups;
CREATE TABLE
IF NOT EXISTS product_groups
(
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR
(255) NOT NULL
);

DROP TABLE IF EXISTS products_func;
CREATE TABLE
IF NOT EXISTS products_func
(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR
(255) NOT NULL,
    price DECIMAL
(11, 2),
    group_id INT NOT NULL,
    FOREIGN KEY
(group_id) REFERENCES product_groups
(group_id)
);

INSERT INTO product_groups
    (group_name)
VALUES
    ('Smartphone'),
    ('Laptop'),
    ('Tablet');

INSERT INTO products_func
    (product_name, group_id, price)
VALUES
    ('Microsoft Lumia', 1, 200),
    ('HTC One', 1, 400),
    ('Nexus', 1, 500),
    ('iPhone', 1, 900),
    ('HP Elite', 2, 1200),
    ('Lenovo Thinkpad', 2, 700),
    ('Sony VAIO', 2, 700),
    ('Dell Vostro', 2, 800),
    ('iPad', 3, 700),
    ('Kindle Fire', 3, 150),
    ('Samsung Galaxy Tab', 3, 200);

SELECT *
FROM product_groups;

SELECT *
FROM products_func;

-- AVG
SELECT AVG(price)
FROM products_func;

-- AVG flow GROUP BY group_name
SELECT group_name, AVG(price)
FROM products_func
    INNER JOIN product_groups USING(group_id) 
GROUP BY group_name;

--
SELECT product_name, price, group_name, AVG(price) OVER (PARTITION BY group_name)
FROM products_func
    INNER JOIN product_groups USING(group_id) ;