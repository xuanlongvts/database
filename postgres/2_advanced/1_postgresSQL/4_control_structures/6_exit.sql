/*
<<block_label>>
BEGIN
    -- some code
    EXIT [block_label] [WHEN condition];
    -- some more code
END block_label;
*/

-- 1) Using PL/pgSQL Exit statement to terminate an unconditional loop
do $$
declare
    i int := 0;
    j int := 0;
begin
    <<outer_loop>>
    loop
        i = i + 1;
        exit when i > 3;
            -- inner loop
            j = 0;
            <<inner_loop>>
            loop
                j = j + 1;
                exit when j > 3;
                raise notice '(i, j): (%, %)', i, j;
            end loop inner_loop;
    end loop outer_loop;
end;
$$

--
do $$
declare
    i int := 0;
    j int := 0;
begin
    <<outer_loop_1>>
    loop
        i = i + 1;
        exit when i > 3;
            j = 0;
            <<inner_loop_1>>
            loop
                j = j + 1;
                exit outer_loop_1 when j > 3;
                raise notice '(i, j): (%, %)', i, j;
            end loop inner_loop_1;
    end loop outer_loop_1;
end;
$$