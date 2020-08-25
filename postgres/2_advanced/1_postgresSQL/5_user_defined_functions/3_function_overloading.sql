/*
PostgreSQL allows multiple functions to share the same name as long as they have different arguments.

If two or more functions share the same name, the function names are overloaded.

When you can call an overloading function, PostgreSQL select the best candidate function to execute based on the the function argument list.
*/

-- The following get_rental_duration() function returns the total rental days of a specified customer:
create or replace function get_rental_duration(
    p_customer_id integer
)
    returns integer
    language plpgsql
as $$
declare
    rental_duration integer;
begin
    select 
        sum(extract(day from return_date - rental_date))
    into rental_duration
    from rental
    where customer_id = p_customer_id;

    return rental_duration;
end;
$$

select get_rental_duration(232);

/*
Suppose that you want to know the rental duration of a customer from a specific date up to now.

To do it, you can add one more parameter p_from_date to the get_retal_duration() function. 
Or you can develop a new function with the same name but have two parameters like this:
*/
create or replace function get_rental_duration(
    p_customer_id integer,
    p_from_date date
)
    returns integer
    language plpgsql
as $$
declare
    rental_duration integer;
begin
    select 
        sum(extract(day from return_date + '12:00:00' - rental_date))
    into rental_duration
    from rental
    where customer_id = p_customer_id and rental_date >= p_from_date;

    return rental_duration;
end;
$$

select get_rental_duration(232, '2005-07-01');

-- PL/pgSQL function overloading and default values
create or replace function get_rental_duration(
    p_customer_id integer,
    p_from_date date default '2005-01-01'
)
    returns integer
    language plpgsql
as $$
declare
    rental_duration integer;
begin
    select
        sum(extract(day from return_date + '12:00:00' - rental_date))
    into rental_duration
    from rental
    where customer_id = p_customer_id and rental_date >= p_from_date;

    return rental_duration;
end;
$$

/*
ERROR:  function get_rental_duration(integer) is not unique
LINE 1: SELECT get_rental_duration(232);
               ^
HINT:  Could not choose the best candidate function. You might need to add explicit type casts.
SQL state: 42725
Character: 8

In this case, PostgreSQL could not choose the best candidate function to execute.

In this scenario, you have three functions:

get_rental_duration(p_customer_id integer);
get_rental_duration(p_customer_id integer, p_from_date date)
get_rental_duration(p_customer_id integer, p_from_date date default '2005-01-01')


PostgreSQL did not know whether it should execute the first or the third function.

As a rule of thumb, when you overload a function, you should always make their parameter list unique.
*/
SELECT get_rental_duration(232);

-- Success
SELECT get_rental_duration(232, '2005-01-11');

