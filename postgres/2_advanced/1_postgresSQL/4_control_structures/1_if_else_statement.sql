-- if then
do $$
declare
    selected_film film%rowtype;
    input_film_id film.film_id%type := 0;
begin
    select * from film into selected_film
    where film_id = input_film_id;

    if not found then
        raise notice 'The film % could not be found.', input_film_id;
    end if;
end;
$$


-- if then else
do $$
declare
    selected_film film%rowtype;
    input_film_id film.film_id%type := 100;
begin
    select *
    into selected_film
    from film
    where film_id = input_film_id;

    if not found then
        raise notice 'The film % could not be found. ', input_film_id;
    else
        raise notice 'The film title is %.', selected_film.title;
    end if;
end;
$$

-- if-then-elsif
do $$
declare
    v_film film%rowtype;
    len_description varchar(10);
begin
    select *
    into v_film
    from film
    where film_id = 100;

    if not found then
        raise notice 'Film not found';
    else
        if v_film.length > 0 and v_film.length <= 50 then
            len_description := 'Short';
        elsif v_film.length > 50 and v_film.length < 120 then
            len_description := 'Medium';
        elsif v_film.length > 120 then
            len_description := 'Long';
        else
            len_description := 'N/A';
        end if;

        raise notice 'The % film is %.', v_film.title, len_description; 

    end if;
end;
$$;