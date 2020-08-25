/*
[ <<label>> ]
[ declare
    declarations ]
begin
    statements;
	...
end [ label ];
*/
do $$
<<first_block>>
declare
    film_count integer := 0;
begin
    -- get the number of films
    select count(*) into film_count
    from film;
    -- display a message
    raise notice 'The number of film is %', film_count;
end first_block $$;

/*
Notice that the DO statement does not belong to the block. It is used to execute an anonymous block. 
PostgreSQL introduced the DO statement since version 9.0.

The anonymous block has to be surrounded in single quotes like this:
*/
do '<<first_block>>
declare
    film_count integer := 0;
begin
    select count(*) into film_count
    from film;
    raise notice ''The number of film is %'', film_count;
end first_block';