/*
raise level format;
Following the raise statement is the level option that specifies the error severity.

debug
log
notice
info
warning
exception

-- If you don’t specify the level, by default, the raise statement will use exception level that raises an error and stops 
the current transaction.
*/
do $$
begin
    raise info 'information message %', now();
    raise log 'log message %', now();
    raise debug 'debug message %', now();
    raise warning 'warning message %', now();
    raise notice 'notice message %', now();
end;
$$

-- Raising errors
/*
The option can be:

message: set error message
hint: provide the hint message so that the root cause of the error is easier to be discovered.
detail:  give detailed information about the error.
errcode: identify the error code, which can be either by condition name or directly five-character SQLSTATE code. Please refer to the table of error codes and condition names.
*/
do $$
declare
    email varchar(255) := 'info@postgresqltutorial.com';
begin
    -- check email for duplicate
    raise exception 'duplicate email: % ', email using hint = 'check the email again';
end;
$$

-- The following examples illustrate how to raise an SQLSTATE and its corresponding condition:
do $$
begin
    raise sqlstate '2210b';
end;
$$

-- 
do $$
begin
    raise invalid_regular_expression;
end;
$$