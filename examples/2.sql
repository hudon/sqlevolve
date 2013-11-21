
-- whitespace and comments are ignored (except for UP and DOWN)


-- UP


alter table foo add name varchar(32);

-- DOWN
alter table foo drop column name;


