/*
The parameter modes determine the behaviors of parameters. PL/pgSQL supports three parameter modes: in, out, and inout. 
A parameter takes the in mode by default if you do not explicitly specify it.
*/

-- The IN mode
-- Because we didn’t specify the mode for p_film_id parameter, it takes the in mode by default.
create or replace function find_film_by_id_2(p_film_id int)
    returns varchar
    language plpgsql
as $$
declare
    film_title film.title%type;
begin
    select title
    into film_title
    from film
    where film_id = p_film_id;

    if not found then
        raise 'Film with id = % not found', p_film_id;
    end if;

    return title;
end;
$$

-- The OUT mode
create or replace function get_film_stat(
    out min_len int,
    out max_len int,
    out avg_len numeric
)
language plpgsql
as $$
begin
    select min(length), max(length), avg(length)::numeric(5, 1)
    into min_len, max_len, avg_len
    from film;
end;
$$

select get_film_stat();

-- The INOUT mode
create or replace function swap(
    inout x int,
    inout y int
)
language plpgsql
as $$
begin
    select x, y into y, x;
end;
$$

select * from swap(10, 20);