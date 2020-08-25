-- To disable a trigger, you use the ALTER TABLE DISABLE TRIGGER statement:
/*
ALTER TABLE table_name
DISABLE TRIGGER trigger_name | ALL

When you disable a trigger, the trigger still exists in the database. 
However, the disabled trigger will not fire when an event associated with the trigger occurs.
*/
alter table employees_alter_trigger
disable trigger all;