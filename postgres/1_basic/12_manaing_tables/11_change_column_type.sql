DROP TABLE IF EXISTS assets;
CREATE TABLE
IF NOT EXISTS assets
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    asset_no VARCHAR NOT NULL,
    description TEXT,
    localtion TEXT,
    acquired_date DATE NOT NULL
);

INSERT INTO assets
    (name, asset_no, localtion, acquired_date)
VALUES
    ('Server', '10001', 'Server room', '2017-01-01'),
    ('UPS', '10002', 'Server room', '2017-01-01');

ALTER TABLE assets
ALTER COLUMN name TYPE
VARCHAR;

ALTER TABLE assets
ALTER COLUMN description TYPE
VARCHAR,
ALTER COLUMN localtion TYPE VARCHAR;

-- Error apear
ALTER TABLE assets
ALTER COLUMN asset_no TYPE
INT;

/*
The USING clause specifies an expression that allows you to convert the old values to the new ones.

If you omit the USING clause, PostgreSQL will cast the values to the new ones implicitly. In case the cast fails, 
PostgreSQL will issue an error and recommends you provide the USING clause with an expression for the data conversion.

The expression after the USING keyword can be as simple as column_name::new_data_type such as price::numeric or as complex as a custom function.
*/

ALTER TABLE assets
ALTER COLUMN asset_no TYPE
INT
USING asset_no::integer