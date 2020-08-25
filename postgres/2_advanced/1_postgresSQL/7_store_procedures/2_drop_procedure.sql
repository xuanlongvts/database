/*
The drop procedure statement removes a stored procedure. The following illustrates the syntax of the drop procedure statement:

drop procedure [if exists] procedure_name (argument_list)
[cascade | restrict]
*/
create or replace procedure insert_actor(
    fname varchar,
    lname varchar
)
    language plpgsql
as $$
begin
    insert into actor(first_name, last_name)
    values ('John','Doe');
end;
$$

-- 
create or replace procedure insert_actor(
    full_name varchar
)
    language plpgsql
as $$
declare
    fname varchar;
    lname varchar;
begin
    select
        split_part(full_name, ' ', 1),
        split_part(full_name, ' ', 2)
    into fname, lname;

    -- insert first & last name into the actor table
    insert into actor(first_name, last_name)
    values('John','Doe');
end;
$$

-- delete
create or replace procedure delete_actor(
    p_actor_id int
)
    language plpgsql
as $$
begin
    delete from actor
    where actor_id = p_actor_id;
end;
$$

-- update
create or replace procedure update_actor(
    p_actor_id int,
    fname varchar,
    lname varchar
)
    language plpgsql
as $$
begin
    update actor
    set first_name = fname, last_name = lname
    where actor_id = p_actor_id;
end;
$$

-- PostgreSQL Drop Procedure examples

/*
ERROR:  procedure name "insert_actor" is not unique
HINT:  Specify the argument list to select the procedure unambiguously.
SQL state: 42725
*/
drop procedure insert_actor;

/*
Because there are two insert_actor stored procedures, you need to specify the argument list so that PostgreSQL can select the right stored procedure to drop.

Second, drop the insert_actor(varchar) stored procedure that accepts one argument:
*/
drop procedure insert_actor(varchar);

drop procedure insert_actor; -- drop procedure insert_actor(varchar, varchar);

-- Third, drop two stored procedures using a single drop procedure statement:
drop procedure delete_actor, update_actor;