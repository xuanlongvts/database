-- The while loop statement executes a block of code until a condition evaluates to false.
/*
[ <<label>> ]
while condition loop
   statements;
end loop;
*/
do $$
declare
    counter integer := 0;
begin
    while counter < 5 loop
        raise notice 'Counter %', counter;
        counter := counter + 1;
    end loop;
end;
$$