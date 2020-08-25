/*
The loop defines an unconditional loop that executes a block of code repeatedly until terminated by an exit or return statement.

<<label>>
loop
   statements;
   if condition then
      exit;
   end if;
end loop;
*/
do $$
declare
    n integer := 10;
    fib integer := 0;
    counter integer := 0;
    i integer := 0;
    j integer := 1;
begin
    if (n < 1) then
        fib := 0;
    end if;
    loop
        exit when counter = n;
        counter := counter + 1;
        select j, i + j into i, j;
        raise notice 'i = %, j = %', i, j;
    end loop;
    fib := i;
    raise notice '%', fib;
end;
$$