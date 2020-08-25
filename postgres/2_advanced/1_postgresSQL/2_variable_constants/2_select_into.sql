-- The select into statement allows you to select data from the database and assign the data to a variable.
/*
select select_list
into variable_name
from table_expression;
*/
do $$
declare
    actor_count integer;
begin
    select count(*) into actor_count
    from actor;
    raise notice 'The number of actors: %', actor_count;
end;
$$