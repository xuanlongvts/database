DROP TABLE IF EXISTS contactss;
CREATE TABLE contactss
(
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS blacklist;
CREATE TABLE blacklist
(
    phone VARCHAR(15) PRIMARY KEY
);

INSERT INTO contactss
    (first_name, last_name, phone)
VALUES
    ('John', 'Doe', '(408)-523-9874'),
    ('Jane', 'Doe', '(408)-511-9876'),
    ('Lily', 'Bush', '(408)-124-9221');

INSERT INTO blacklist
    (phone)
VALUES
    ('(408)-523-9874'),
    ('(408)-511-9876');

-- DELETE
DELETE FROM contactss
USING blacklist
WHERE contactss.phone = blacklist.phone

-- OR
DELETE FROM contactss
WHERE phone IN (SELECT phone
FROM blacklist)

/*
The USING clause is not a part of the SQL standard. It means that the USING clause may not available in other database systems.

If you plan to make your application compatible with other database products, you should not use the USING clause in the DELETE statement. 
Instead, you can use a subquery.

*/