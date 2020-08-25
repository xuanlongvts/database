/*
DROP TRIGGER [IF EXISTS] trigger_name 
ON table_name [ CASCADE | RESTRICT ];

*/
create or replace function check_staff_user()
    returns trigger
    language plpgsql
as $$
begin
    if length(new.username) < 8 or new.username is null then
        raise exception 'The username cannot be less then 8 characters';
    end if;

    if new.name is null then
        raise exception 'Name cannot be NULL';
    end if;

    return new;
end;
$$

-- 
create trigger username_check
    before insert or update
    on staff
    for each row
    execute procedure check_staff_user();

-- drop
drop trigger username_check
on staff;