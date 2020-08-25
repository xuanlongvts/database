-- assert condition [, message];
/*
1) condition
The condition is a Boolean expression that is expected to always return true.

If the condition evaluates to true, the assert statement does nothing.

In case the condition evaluates to false or null, PostgreSQL raises an assert_failure exception.

2) message
The message is optional.

If you don’t pass the message, PostgreSQL uses the “assertion failed” message by default. 
In case you pass the message to the assert statement, it will use it to replace the default message.
*/

-- PostgreSQL assert statement example
do $$
declare
    film_count integer;
begin
    select count(*)
    from film
    into film_count;

    raise notice 'count films: %', film_count;
    assert film_count > 0, 'Film not found, check the film table';
end;
$$

-- Error
do $$
declare
    film_count integer;
begin
    select count(*)
    into film_count
    from film;

    raise notice 'count films: %', film_count;
    assert film_count > 1000, '1000 films found, check the film table';
end;
$$