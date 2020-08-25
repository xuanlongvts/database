SELECT 'String constant';

SELECT 'I''m also a string constant';

-- Between the $tag$, you can place any string with single quotes (') and backslashes (\). For example:
SELECT $$I'm a string constant that contains a backslash \ $$;

-- In this example, we did not specify the tag between the two dollar signs($).
SELECT $message$ I'm a string constant that contains a backslash \ $message$;


-- Using dollar-quoted string constant in anonymous blocks
do
'declare 
    film_count integer;
begin
    SELECT COUNT(*) into film_count
    FROM film;
    raise notice ''The number of films: %'', film_count;
end;';
-- The code in the block must be surrounded by single quotes. If it has any single quote, you need to escape it by doubling it like this:


-- To avoid escaping every single quotes and backslashes, you can use the dollar-quoted string as follows:
do
$$
declare
    film_count integer;
begin
  SELECT COUNT(*) into film_count
  FROM film;
  raise notice 'The number of films: %', film_count;
end;
$$

-- To avoid escaping every single quotes and backslashes, you can use the dollar-quoted string as follows:
create function find_film_by_id(
    id int 
) returns film
language sql
as '
    select * from film where film_id = id
';

-- As you can see, the body of the find_film_by_id() function is surrounded by single quotes.
-- If the function has many statements, it becomes more difficult to read. In this case, you can use dollar-quoted string constant syntax:
create function find_film_by_id_1(
    id int
) returns film
language sql
as
$$
    select * from film where film_id = id
$$;

-- Using dollar-quoted string constants in stored procedures
create procedure proc_name(param_list)
language lang_name
$$
    -- stored procedure body
$$;