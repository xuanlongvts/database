/*
Backing up databases is one of the most critical tasks in database administration. 
Before backing up the databases, you should consider the following type of backups:

Full / partial databases
Both data and structures, or only structures
Point-in-time recovery
Restore performance
PostgreSQL comes with pg_dump and pg_dumpalltools that help you backup databases easily and effectively.

For ones who want to see the command to backup databases quickly, here it is:

pg_dump -U username -W -F t database_name > c:\backup_file.tar
*/

-- How to backup one database
-- To backup one database, you can use the  pg_dump tool. The  pg_dump dumps out the content of all database objects into a single file.

-- First, navigate to PostgreSQL bin folder: /Library/PostgreSQL/12/bin
-- pg_dump -U postgres -W -F t dvdrental > /Users/lelong/Downloads/postgres_data_store/dvdrental_bk.tar
-- Enter password of postgres account
/*
Let’s examine the options in more detail.

-U postgres:  specifies the user to connect to the PostgreSQL database server. We used the postgres in this example.

-W:  forces pg_dump to prompt for the password before connecting to the PostgreSQL database server. After you hit enter, pg_dump will prompt for the password of postgres user.

-F : specifies the output file format that can be one of the following:

c: custom-format archive file format
d: directory-format archive
t: tar
p: plain-text SQL script file).
In this example, we use  -F t to specify the output file as a tar file.

dvdrental: is the name of the database that you want to back up.

> c:\pgbackup\dvdrental.tar is the output backup file path.
*/

-- How to backup all databases
/*
To back up all databases, you can run the individual  pg_dump command above sequentially, or parallel if you want to speed up the backup process.

First, from the psql, use the command  \list to list all available databases in your cluster
Second, back up each individual database using the  pg_dump program as described in the above section.
Besides the  pg_dump program, PostgreSQL also provides you with the pg_dumpall tool that allows you to backup all databases at once. 
However, it is not recommended to use this tool because of the following reasons:

The  pg_dumpall program exports all databases, one after another, into a single script file, which prevents you from performing the parallel restore. 
If you back up all databases this way, the restore process will take more time.

The processing of dumping all databases takes longer than each individual one so you do not know which dump of each database relates to a specific point in time.
If you have a good reason to use the pg_dumpallto backup all databases, the following is the command:

pg_dumpall -U postgres > c:\pgbackup\all.sql

The options of the  pg_dumpall program are similar to the options of the pg_dump program. 
This command omits the -W option to avoid typing the password for each individual database.
*/
-- pg_dumpall -U postgres > /Users/lelong/Downloads/postgres_data_store/pg_all_db.sql



-- How to backup database object definitions
/*
Sometimes, you want to backup only database object definitions, not the data This is helpful in the testing phase, 
which you do not want to move test data to the live system.

To back up objects in all databases, including roles, tablespaces, databases, schemas, tables, indexes, triggers, 
functions, constraints, views, ownerships, and privileges, you use the following command:
-- pg_dumpall --schema-only > c:\pgdump\definitiononly.sql

If you want to back up role definition only, use the following command:
-- pg_dumpall --roles-only > c:\pgdump\allroles.sql

If you want to backup tablespaces definition, use the following command:
-- pg_dumpall --tablespaces-only > c:\pgdump\allroles.sql
*/