/*
<<label>>
declare
begin
    statements;
exception
    when condition [or condition...] then
       handle_exception;
   [when condition [or condition...] then
       handle_exception;]
   [when others then
       handle_other_exceptions;
   ]
end;
*/

-- 1) Handling no_data_found exception example
do $$
declare
    rec record;
    v_film_id int = 2000;
begin
    -- select a film 
    select film_id, title
    into strict rec
    from film
    where film_id = v_film_id;
end;
$$
/*
ERROR:  query returned no rows
CONTEXT:  PL/pgSQL function inline_code_block line 6 at SQL statement
SQL state: P0002
*/

-- exception
do $$
declare
    rec record;
    v_film_id int = 2000;
begin
    select film_id, title
    into strict rec
    from film
    where film_id = v_film_id;

    -- catch exception
    exception
        when no_data_found then
        raise exception 'Film % not found', v_film_id;
end;
$$

-- 2) Handling too_many_rows exception example
do $$
declare
    rec record;
begin
    select film_id, title
    into strict rec
    from film
    where title like 'A%';

    exception
        when no_data_found then
        raise exception 'Search query returns too many rows';
end;
$$

-- 3) Handling multiple exceptions
do $$
declare
    rec record;
    v_length int = 90;
begin
    select film_id, title
    into strict rec
    from film
    where length = v_length;

    exception
        when sqlstate 'P0002' then
            raise exception 'Film with length % not found', v_length;
        when sqlstate 'P0003' then 
            raise exception 'The with length % is not unique', v_length;
end;
$$

-- 4) Handling exceptions as SQLSTATE codes
do $$
declare
    rec record;
    v_length int = 30;
begin
    -- select a film 
    select film_id, title
    into strict rec
    from film
    where length = v_length;

    -- catch exception
    exception
        when sqlstate 'P0002' then
            raise exception 'Film with length % not found', v_length;
        when sqlstate 'P0003' then
            raise exception 'The with length % is not unique', v_length;
end;
$$