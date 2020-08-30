/*
You can create an index on more than one column of a table. This index is called a multicolumn index, a composite index, a combined index, or a concatenated index.

A multicolumn index can have maximum 32 columns of a table. The limit can be changed by modifying the pg_config_manual.h when building PostgreSQL.

In addition, only B-tree, GIST, GIN, and BRIN index types support multicolumn indexes.

The following syntax shows how to create a multicolumn index:

CREATE INDEX index_name
ON table_name(a,b,c,...);

When defining a multicolumn index, you should place the columns which are often used in the WHERE clause at the beginning of the column list and the columns that are less frequently used in the condition after.

In the above syntax, the PostgreSQL optimizer will consider using the index in the following cases:
*/
CREATE TABLE IF NOT EXISTS people_index(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL
);

SELECT * FROM people_index WHERE last_name = 'Adams';

EXPLAIN SELECT * FROM people_index WHERE last_name = 'Adams';

--
CREATE INDEX idx_people_names
ON people_index(first_name, last_name);

-- Now, if you search for people whose last name is Adams, the PostgreSQL optimizer will use the index as shown in the output of the following statement:
EXPLAIN SELECT * FROM people_index WHERE last_name = 'Adams';

-- The PostgreSQL Optimizer used the index for this statement because both columns in the WHERE clause are all in the index:
EXPLAIN 
SELECT *
FROM
    people_index
WHERE
    last_name = 'Adams'
AND first_name = 'Lou';

/*
Even though the first_name column is a part of the index, PostgreSQL could not leverage it.

A key point to take away is that when you define a multicolumn index, you should always consider the business context to 
find which columns are often used for lookup and place these columns at the beginning of the column list while defining the index.
*/