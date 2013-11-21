
-- whitespace and comments are ignored (except for UP and DOWN)
-- the script is wrapped in a transaction: if one statement fails, the change
-- fails


-- UP


create table name (name varchar(32) primary key);
alter table foo add name varchar(32) references name;

-- DOWN

alter table foo drop column name;
drop table name;


