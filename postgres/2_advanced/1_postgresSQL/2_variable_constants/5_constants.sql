-- Unlike a variable, the value of a constant cannot be changed once it initialized.
do $$
declare
    vat constant numeric := 0.1;
    net_price numeric := 20.5;
begin
    raise notice 'The selling price is %', net_price * (1 + vat);
end;
$$;

-- Error, vat is declared CONSTANT
do $$
declare
    vat constant numeric := 0.1;
    net_price numeric := 20.5;
begin
    raise notice 'The selling price is %', net_price * (1 + vat);
    vat := 0.05;
end;
$$

/*
Similar to the default value of a variable, PostgreSQL evaluates the value for the constant when the block is entered at run-time, 
not compile-time. For example:
*/
do $$
declare
    start_at constant time := now();
begin
    raise notice 'Start executing block at %', start_at;
end;
$$;