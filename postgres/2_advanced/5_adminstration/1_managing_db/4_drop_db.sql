-- DROP DATABASE [IF EXISTS] database_name;
SELECT * FROM pg_stat_activity;

-- Second, terminate the active connections by issuing the following query:
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'db_hr';

DROP DATABASE IF EXISTS db_hr;