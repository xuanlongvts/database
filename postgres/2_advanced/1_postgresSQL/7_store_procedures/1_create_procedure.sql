/*
A drawback of user-defined functions is that they cannot execute transactions. In other words, inside a user-defined function, you cannot start a transaction, and commit or rollback it.

PostgreSQL 11 introduced stored procedures that support transactions.

To define a new stored procedure, you use the create procedure statement.

The following illustrates the basic syntax of the create procedure statement:

create [or replace] procedure procedure_name(parameter_list)
language plpgsql
as $$
declare
-- variable declaration
begin
-- stored procedure body
end; $$
*/
create or replace procedure transfer(
    sender int,
    receiver int,
    amount dec   
)
    language plpgsql
as $$
begin
    -- subtracting the amount from the sender's account 
    update accounts
    set balance = balance - amount
    where id = sender;

    -- adding the amount to the receiver's account
    update accounts
    set balance = balance + amount
    where id = receiver;

    commit;
end;
$$

select * from accounts;

-- Calling a stored procedure
call transfer(1, 2, 10);