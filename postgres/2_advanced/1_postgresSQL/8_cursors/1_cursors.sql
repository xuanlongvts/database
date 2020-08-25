/*
A PL/pgSQL cursor allows you to encapsulate a query and process each individual row at a time.

Typically, you use cursors when you want to divide a large result set into parts and process each part individually. 
If you process it at once, you may have a memory overflow error.

On top of that, you can develop a function that returns a reference to a cursor. 
This is an effective way to return a large result set from a function. 
The caller of the function can process the result set based on the cursor reference.
*/

create or replace function get_film_titles(p_year integer)
    returns text
    language plpgsql
as $$
declare
    titles text default '';
    rec_film record;
    cur_films cursor(p_year integer) for
        select title, release_year
        from film
        where release_year = p_year;
begin
    -- open the cursor
    open cur_films(p_year);

    loop
        -- fetch row into the film
        fetch cur_films into rec_film;
        -- exit when no more row to fetch
        exit when not found;

        -- build the output
        if rec_film.title like '%ful%' then
            titles := titles || ', ' || rec_film.title || ': ' || rec_film.release_year;
        end if;
    end loop;
   -- close the cursor
    close cur_films;

    return titles;
end;
$$

select get_film_titles(2006);