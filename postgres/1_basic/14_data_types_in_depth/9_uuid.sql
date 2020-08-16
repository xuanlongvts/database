/*
Generating UUID values
PostgreSQL allows you store and compare UUID values but it does not include functions for generating the UUID values in its core.

Instead, it relies on the third-party modules that provide specific algorithms to generate UUIDs. 
For example the uuid-ossp module provides some handy functions that implement standard algorithms for generating UUIDs.

To install the uuid-ossp module, you use the CREATE EXTENSION statement as follows:

To generate the UUID values based on the combination of computer’s MAC address, current timestamp, and a random value, 
you use the uuid_generate_v1() function:
*/

CREATE EXTENSION
IF NOT EXISTS "uuid-ossp";

SELECT uuid_generate_v1();

SELECT uuid_generate_v4();

----
DROP TABLE IF EXISTS contacts_uuid;
CREATE TABLE
IF NOT EXISTS contacts_uuid
(
    contacts uuid DEFAULT uuid_generate_v4
() PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    phone VARCHAR
);

INSERT INTO contacts_uuid
    (first_name, last_name, email, phone)
VALUES
    (
        'John',
        'Smith',
        'john.smith@example.com',
        '408-237-2345'
    ),
    (
        'Jane',
        'Smith',
        'jane.smith@example.com',
        '408-237-2344'
    ),
    (
        'Alex',
        'Smith',
        'alex.smith@example.com',
        '408-237-2343'
    );

SELECT *
FROM contacts_uuid;