-- The create function statement allows you to define a new user-defined function.
/*
create [or replace] function function_name(param_list)
   returns return_type 
   language plpgsql
  as
$$
declare 
-- variable declaration
begin
 -- logic
end;
$$
*/
create function get_film_count(len_from int, len_to int)
    returns int
    language plpgsql
as
$$
declare
    film_count integer;
begin
    select count(*)
    into film_count
    from film
    where length between len_from and len_to;

    return film_count;
end;
$$

-- 1) Using positional notation
select get_film_count(40, 90);

-- 2) Using positional notation
select get_film_count(
    len_from => 40,
    len_to => 90
);

select get_film_count(
    len_from := 40,
    len_to := 90
);

-- 3) Using mixed notation
select get_film_count(
    40,
    len_to => 90
);

-- Error
select get_film_count(
    len_from => 40,
    90
);