DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;

CREATE TABLE categories
(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

INSERT INTO categories
    (category_name)
VALUES
    ('Smart Phone'
),
    ('Laptop'),
    ('Tablet');

INSERT INTO products
    (product_name, category_id)
VALUES
    ('iPhone', 1),
    ('Samsung Galaxy', 1),
    ('HP Elite', 2),
    ('Lenovo Thinkpad', 2),
    ('iPad', 3),
    ('Kindle Fire', 3);

SELECT *
FROM categories NATURAL JOIN products 

SELECT *
FROM categories INNER JOIN products USING(category_id)        

-- However, you should avoid using the NATURAL JOIN whenever possible because sometimes it may cause an unexpected result.