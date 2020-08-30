/*
DROP INDEX  [ CONCURRENTLY]
[ IF EXISTS ]  index_name 
[ CASCADE | RESTRICT ];

CONCURRENTLY
When you execute the DROP INDEX statement, PostgreSQL acquires an exclusive lock on the table and block other accesses until the index removal completes.

To force the command waits until the conflicting transaction completes before removing the index, you can use the CONCURRENTLY option.

The DROP INDEX CONCURRENTLY has some limitations:

First, the CASCADE option is not supported
Second, executing in a transaction block is also not supported
*/

--
SELECT * FROM actor;

EXPLAIN SELECT * FROM actor WHERE first_name = 'John';

CREATE INDEX idx_actor_first_name ON actor(first_name);

EXPLAIN SELECT * FROM actor WHERE first_name = 'John';


-- The query did not use the idx_actor_first_name index defined earlier as explained in the following EXPLAIN statement:
-- This is because the query optimizer thinks that it is more optimal to just scan the whole table to locate the row. 
-- Hence, the idx_actor_first_name is not useful in this case and we need to remove it:
DROP INDEX idx_actor_first_name;