-- To store the whole row of a result set returned by the select into statement, you use the row-type variable or row variable.
/*
row_variable table_name%ROWTYPE;
row_variable view_name%ROWTYPE;
*/
do $$
declare
    selected_actor actor%rowtype;
begin
    select * from actor
    into selected_actor
    where actor_id = 10;

    raise notice 'The actor name is: ==> % %', selected_actor.first_name, selected_actor.last_name;
end;
$$
