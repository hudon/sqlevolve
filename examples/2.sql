
-- whitespace and comments are ignored (except for UP and DOWN)


-- UP

-- the 2 sections are read by psql as sql scripts, so everything is supported
-- (eg transactions)

BEGIN;
create table name (name varchar(32) primary key);
alter table foo add name varchar(32) references name;
COMMIT;

-- DOWN

alter table foo drop column name;
drop table name;


