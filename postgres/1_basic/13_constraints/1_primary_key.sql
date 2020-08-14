CREATE TABLE
IF NOT EXISTS po_headers
(
    po_no INTEGER PRIMARY KEY,
    vender_no INTEGER,
    description TEXT,
    shipping_address TEXT
);

-- Remove primary key
ALTER TABLE po_headers
DROP CONSTRAINT po_headers_pkey;

-- Add primary key
ALTER TABLE po_headers
ADD PRIMARY KEY(po_no);

CREATE TABLE
IF NOT EXISTS po_items
(
    po_no INTEGER,
    item_no INTEGER,
    product_no INTEGER,
    qty INTEGER,
    net_price INTEGER,
    PRIMARY KEY
(po_no, item_no)
);

CREATE TABLE
IF NOT EXISTS productss
(   
    product_no INTEGER,
    description TEXT,
    product_cost NUMERIC
);

ALTER TABLE productss
ADD PRIMARY KEY(product_no);

-- add an auto-incremented primary key to an existing table
CREATE TABLE
IF NOT EXISTS vendors
(
    name VARCHAR
(255)
);

INSERT INTO vendors
    (name)
VALUES
    ('Microsoft'),
    ('IBM'),
    ('Apple'),
    ('Samsung');

SELECT *
FROM vendors;

ALTER TABLE vendors
ADD COLUMN id SERIAL PRIMARY KEY;

CREATE TABLE
IF NOT EXISTS vendorss
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
(255)
);

INSERT INTO vendorss
    (name)
VALUES
    ('Microsoft'),
    ('IBM'),
    ('Apple'),
    ('Samsung');

SELECT *
FROM vendorss;

-- Remove primary key
ALTER TABLE vendorss
DROP CONSTRAINT vendorss_pkey;

-- Add Primary key
ALTER TABLE vendorss
ADD PRIMARY KEY(id);