/*
To remove a user-defined function, you use the drop function statement:

drop function [if exists] function_name(argument_list)
[cascade | restrict]

In this syntax:

First, specify the name of the function that you want to remove after the drop function keywords.
Second, use the if exists option if you want to instruct PostgreSQL to issue a notice instead of an error in case the function does not exist.
Third, specify the argument list of the function. Since functions can be overloaded, 
PostgreSQL needs to know which function you want to remove by checking the argument list. 
If a function is unique within the schema, you do not need to specify the argument list.
When a function has any dependent objects such as operators or triggers, you cannot drop that function.

To drop the function and its dependent objects, you need to specify the cascade option. 
The drop function with cacade option will recursively remove the function, its dependent objects, 
and the objects that depend on those objects, and so on.

By default, the drop function statement uses the restrict option that rejects the removal of a function when it has any dependent objects.

To drop multiple functions using a single drop function statement, 
you specify a comma-separated list of function name after the drop function keyword like this:

drop function [if exists] function1, function2, ...;

*/

-- PostgreSQL Drop Function examples
create or replace function get_film_actors()
    returns setof record
    language plpgsql
as $$
declare
    rec record;
begin
    for rec in 
        select film_id, title, (first_name || ' ' || last_name)::varchar
        from film
        inner join film_actor using(film_id)
        inner join actor using(actor_id)
        order by title
    loop
        return next rec;
    end loop;
    return;
end;
$$

-- create the second get_film_actors
create or replace function get_film_actors(p_fiml_id int)
    returns setof record
    language plpgsql
as $$
declare
    rec record;
begin
    for rec in
        select film_id, title, (first_name || '' || last_name)::varchar
        from film
        inner join film_actor using(film_id)
        inner join actor using(actor_id)
        where film_id = p_fiml_id
        order by title
    loop
        return next rec;
    end loop;
    return;
end;
$$

-- ERROR:  function name "get_film_actors" is not unique
drop function get_film_actors;

/*
Since the get_film_actors stored procedure is not unique, you need to specify which function you want to drop.

The following statement drops the get_film_actors function that has zero parameters:
*/
drop function get_film_actors();

drop function get_film_actors;

-- Or if you want to specify the exact function, you can use the following statement:
drop function get_film_actors(int);