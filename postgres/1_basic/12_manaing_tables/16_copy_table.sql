CREATE TABLE contacts_backup
AS TABLE contacts;

-- Only copy structure table
CREATE TABLE contacts_structer
AS TABLE contacts
WITH NO DATA;

-- Update column struture
ALTER TABLE contacts_structer
ADD UNIQUE(email);

ALTER TABLE contacts_structer
ADD PRIMARY KEY(id);