/*
CREATE INDEX index_name ON table_name [USING method]
(
    column_name [ASC | DESC] [NULLS {FIRST | LAST }],
    ...
);

First, specify the index name after the CREATE INDEX clause. The index name should be meaningful and easy to remember.
Second, specify the name of the table to which the index belongs.
Third, specify the index method such as btree, hash, gist, spgist, gin, and brin. PostgreSQL uses btree by default.

Fourth, list one or more columns that to be stored in the index. The ASC and DESC specify the sort order. ASC is the default. 
NULLS FIRST or NULLS LAST specifies nulls sort before or after non-nulls. 
The NULLS FIRST is the default when DESC is specified and NULLS LAST is the default when DESC is not specified.

*/
SELECT * FROM address
WHERE phone = '223664661973';

/*
It is obvious that the database engine had to scan the whole address table to look for the address because there is no index available for the phone column.

To show the query plan, you use the EXPLAIN statement as follows:
*/
EXPLAIN SELECT * FROM address
WHERE phone = '223664661973';

-- To create an index for the values in the phone column of the address table, you use the following statement:
CREATE INDEX idx_address_phone ON address(phone);

EXPLAIN SELECT * FROM address
WHERE phone = '223664661973';