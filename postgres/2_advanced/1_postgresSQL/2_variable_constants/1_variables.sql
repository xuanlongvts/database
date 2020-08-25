do $$
declare
    counter integer := 1;
    first_name varchar(50) := 'John';
    last_name varchar(50) := 'Doe';
    payment numeric(11, 2) := 20.5;
begin
    raise notice '% % % has been paid % USD',
    counter,
    first_name,
    last_name,
    payment;
end
$$;

-- Variable initialization timing
do $$
declare
    created_at time := now();
begin
    raise notice '%', created_at;
    perform pg_sleep(5);
    raise notice '%', created_at;
end
$$
-- Second, print out the value of the variable and pass the execution in 5 seconds using the pg_sleep() function.

-- Copying data types
/*
The %type provides the data type of a table column or another variable. Typically, you use the %type to declare a variable that holds 
a value from the database or another variable.

variable_name table_name.column_name%type;
*/
do $$
declare
    film_title film.title%type;
    featured_title film_title%type;
begin
    select title
    from film
    into film_title
    where film_id = 100;

    raise notice 'Film title id 100. %s', film_title;
end
$$

-- Variables in block and subblock
do $$
<<outer_block>>
declare
    counter integer := 0;
begin
    counter := counter + 1;
    raise notice 'The current value of the counter is %', counter;

    declare
        counter integer := 0;
    begin
        counter := counter + 10;
        raise notice 'Counter in the subblock is %', counter;
        raise notice 'Counter in the outer block (in) is %', outer_block.counter;
    end;

    raise notice 'Counter in the couter block (out) is %', counter;
end$$