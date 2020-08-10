COPY persons
TO '/Users/lelong/work/bitbucket/database/postgres/1_basic/11_import_export_data/persons_db.csv' DELIMITER ',' CSV HEADER;

-- Export some columns
COPY persons
(first_name, last_name, email)
TO '/Users/lelong/work/bitbucket/database/postgres/1_basic/11_import_export_data/persons_some_columns.csv' DELIMITER ',' CSV HEADER;