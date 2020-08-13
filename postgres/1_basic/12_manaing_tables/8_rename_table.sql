DROP TABLE IF EXISTS vendors;
CREATE TABLE
IF NOT EXISTS vendors
(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

ALTER TABLE vendors RENAME TO suppliers;

DROP TABLE IF EXISTS supplier_groups;
CREATE TABLE
IF NOT EXISTS supplier_groups
(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

ALTER TABLE suppliers
ADD COLUMN group_id INT NOT NULl;

ALTER TABLE suppliers
ADD FOREIGN KEY (group_id) REFERENCES supplier_groups(id);

/*
To save time querying the complete supplier data, you can create a view against the suppliers and supplier_groups tables like this:
*/

CREATE VIEW supplier_data
AS
    SELECT s.id, s.name, g.name supply_group
    FROM suppliers s
        INNER JOIN supplier_groups g ON g.id = s.id;


ALTER TABLE supplier_groups
RENAME TO groups;