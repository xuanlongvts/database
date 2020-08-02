CREATE TABLE contacts(
    id INT GENERATED BY DEFAULT AS IDENTITY,
    first_name VARCHAR
(50) NOT NULL,
    last_name VARCHAR
(50) NOT NULL,
    email VARCHAR
(255) NOT NULL,
    phone VARCHAR
(15),
PRIMARY KEY
(id)
)

INSERT INTO contacts
    (first_name, last_name, email, phone)
VALUES('John', 'Doe', 'john.doe@example.com', NULL),
    ('Lily', 'Bush', 'lily.bush@example.com', '(408-234-2764)'
)

SELECT *
FROM contacts
WHERE phone IS NULL

SELECT *
FROM contacts
WHERE phone IS NOT NULL