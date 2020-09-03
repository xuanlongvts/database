-- psql -U postgres

-- sudo nano /Library/PostgreSQL/12/data/pg_hba.conf

-- We change the md5 authentication in "local" connection to trust

-- local   all             all                                     trust

-- restart our server
-- sudo systemctl restart postgresql

-- Now PostgreSQL doesn't ask a password and we are allowed to connent with user postgres
