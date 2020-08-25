/*
A record variable is similar to a row-type variable. It can hold only one row of a result set.

Unlike a row-type variable, a record variable does not have a predefined structure. 
The structure of a record variable is determined when the select or for statement assigns an actual row to it.
*/

-- 1) Using record with the select into statement
do $$
declare
    rec record;
begin
    select film_id, title, length
    from film
    into rec
    where film_id = 200;

    raise notice '% % % ', rec.film_id, rec.title, rec.length;
end;
$$

-- 2) Using record variables in the for loop statement
do $$
declare
    rec record;
begin
    for rec in
        select title, length
        from film
        where length > 50
        order by length
    loop
        raise notice '% (%)', rec.title, rec.length;
    end loop;
end;
$$