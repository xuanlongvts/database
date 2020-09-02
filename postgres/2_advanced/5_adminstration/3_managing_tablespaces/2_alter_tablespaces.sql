-- ALTER TABLESPACE tablespace_name action;
/*
The action can be:

    - Rename the tablespace
    - Change the owner
    - Sett the parameters for the tablespace.

    ALTER TABLESPACE tablespace_name 
    RENAME TO new_name;

    ALTER TABLESPACE tablespace_name 
    OWNER TO new_owner;

    ALTER TABLESPACE tablespace_name 
    SET parameter_name = value;
*/

-- PostgreSQL ALTER TABLESPACE examples
ALTER TABLESPACE ts_primary
RENAME TO ts_primary_1;

ALTER TABLESPACE ts_primary_1
OWNER TO hr;