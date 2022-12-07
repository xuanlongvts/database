SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;

SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;

SELECT customerName, country, salesrepemployeenumber
    FROM customers
    WHERE salesrepemployeenumber IS NULL
    ORDER BY customerName;

SELECT customerName, country, salesrepemployeenumber
    FROM customers
    WHERE salesrepemployeenumber IS NOT NULL
    ORDER BY customerName;

CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT,
    title VARCHAR(255),
    begin_date DATE NOT NULL,
    complete_date DATE NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO projects(title,begin_date, complete_date)
    VALUES 
        ('New CRM','2020-01-01','0000-00-00'),
        ('ERP Future','2020-01-01','0000-00-00'),
        ('VR','2020-01-01','2030-01-01');

SELECT * 
    FROM projects;

SELECT * 
    FROM projects
    WHERE complete_date IS NULL;

SET @@sql_auto_is_null = 1;

INSERT INTO projects(title,begin_date, complete_date)
VALUES('MRP III','2010-01-01','2020-12-31');

SELECT id
    FROM projects
    WHERE id IS NULL;