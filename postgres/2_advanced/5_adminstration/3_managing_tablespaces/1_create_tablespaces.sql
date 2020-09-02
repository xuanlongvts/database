/*
A tablespace is a location on the disk where PostgreSQL stores data files containing database objects e.g., indexes, and tables.

PostgreSQL uses a tablespace to map a logical name to a physical location on disk.

PostgreSQL comes with two default tablespaces:

pg_defaulttablespace stores user data.
pg_globaltablespace stores global data.

Tablespaces allow you to control the disk layout of PostgreSQL. There are two main advantages of using tablespaces:

First, if a partition on which the cluster was initialized is out of space, you can create a new tablespace on a different partition 
and use it until you reconfigure the system.

Second, you can use statistics to optimize database performance. 
For example, you can place the frequent access indexes or tables on devices that perform very fast e.g., solid-state devices, 
and put the tables containing archive data which is rarely used on slower devices.
*/

-- PostgreSQL CREATE TABLESPACE statement
/*
CREATE TABLESPACE tablespace_name
OWNER user_name
LOCATION directory_path;

The name of the tablespace should not begin with pg_, because these names are reserved for the system tablespaces.

By default, the user who executes the CREATE TABLESPACE is the owner of the tablespace. 
To assign another user as the owner of the tablespace, you specify it after the OWNER keyword.

The directory_path is the absolute path to an empty directory used for the tablespace. 
PostgreSQL system users must own this directory in order to read and write data into it.

Once a tablespace is created, you can specify it in the CREATE DATABASE, 
CREATE TABLE and CREATE INDEX statements to store data files of the objects in the tablespace.
*/

-- 1 cd to /Users/lelong/Downloads/ and create a folder data_tablespace
-- 2 pwd to get path   /Users/lelong/Downloads/data_tablespace

-- PostgreSQL CREATE TABLE examples
CREATE TABLESPACE ts_primary
LOCATION '/Users/lelong/Downloads/data_tablespace';

-- in comman line
-- \db or \db+

-- The following statement creates the logistics database that uses the ts_primary tablespace:
CREATE DATABASE logistics
TABLESPACE ts_primary;

-- The TABLESPACE clause indicates the tablespace that the logistics database will use to store data.
CREATE TABLE deliveries(
    delivery_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INT
);

INSERT INTO deliveries(order_date, customer_id)
VALUES ('2020-08-01',1);

SELECT * FROM deliveries;

-- IN command line \db+ ts_primary