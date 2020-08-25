/*
create or replace function function_name (
   parameter_list
) 
returns table ( column_list ) 
language plpgsql
as $$
declare 
-- variable declaration
begin
-- body
end; $$ 
*/
create or replace function get_film_a_table(
    p_pattern varchar
)
    returns table(
        film_title varchar,
        film_release_year int
    )
    language plpgsql
as $$
begin
    return query 
        select title, release_year::integer
        from film
        where title ilike p_pattern;
end;
$$

select * from get_film_a_table('AL%');

select get_film_a_table('AL%');

-- In practice, you often process each individual row before appending it in the function’s result set:
create or replace function get_film_a_table_twwo(
    p_pattern varchar,
    p_year int
)
    returns table(
        film_title varchar,
        film_release_year int
    )
    language plpgsql
as $$
declare
    var_r record;
begin
    for var_r in(
        select title, release_year
        from film
        where title ilike p_pattern and release_year = p_year
    )
    loop
        film_title := upper(var_r.title);
        film_release_year := var_r.release_year;
        return next;
    end loop;
end;
$$

--
select * from get_film_a_table_twwo('%er', 2006);