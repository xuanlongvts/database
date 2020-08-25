/*
[ <<label>> ]
for loop_counter in [ reverse ] from.. to [ by step ] loop
    statements
end loop [ label ];
*/
do $$
begin
    for counter in 1..5 loop
        raise notice 'counter: %', counter;
    end loop;
end;
$$

--
do $$
begin
    for counter in reverse 5..1 loop
        raise notice 'Counter: %', counter;
    end loop;
end;
$$

--
do $$
begin
    for counter in 1..6 by 2 loop
        raise notice 'Counter: %', counter;
    end loop;
end;
$$

-- Using PL/pgSQL for loop to iterate over a result set
do $$
declare
    f record;
begin
    for f in select title, length
        from film
        order by length desc, title
        limit 10
    loop
        raise notice '% (% mins)', f.title, f.length;
    end loop;
end;
$$

-- Using PL/pgSQL for loop to iterate over the result set of a dynamic query
/*
[ <<label>> ]
for row in execute query_expression [ using query_param [, ... ] ] 
loop
    statements
end loop [ label ];
*/
do $$
declare
    -- sort by 1: title, 2: release year
    sort_type smallint := 1;

    -- return the number of films
    rec_count int := 10;

    -- use to iterate over the film
    rec record;

    -- dynamic query
    query text;
begin
    query := 'select title, release_year from film ';
    if sort_type = 1 then
        query := query || 'order by title';
    elsif sort_type = 2 then
        query := query || 'order by release_year';
    else
        raise 'invalid sort_type %s', sort_type;
    end if;

    query := query || ' limit $1';

    for rec in execute query using rec_count
    loop
        raise notice '% - %', rec.release_year, rec.title;
    end loop;
end;
$$

-- 2) Using the PL/pgSQL Exit statement to exit a block
do $$
begin
    <<simple_block>>
    begin
        raise notice '%', '111!';
        exit simple_block;
        raise notice '%', 'unreachable!';
    end;
    raise notice '%', 'End of block';
end;
$$

-- This statement will never be reached:
-- raise notice '%', 'unreachable!';