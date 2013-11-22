sqlevolve
=========

minimal sql change scripter in bash.

This tool helps you write database change scripts (aka "sql evolutions" or "db
migrations"). It works with postgresql but can be easily adapted.

All you need is a `version` table with a `version` field and then your sql scripts in `<version>.sql` files.

### Usage

1. have a `version` table with a `version` integer column (will be a scalar)
`create table version (version integer primary key);insert into version values (0);`
2. write your sql evolutions in named files `<version>.sql` starting from version `1`.
3. format of the sql scripts: An `-- UP` line followed by the sql statements,
   then a `-- DOWN` line followed by the "opposite" sql statements.
4. run sqlevolve where your scripts are; it assumes the `<version>.sql` files are in your cwd:

```
sqlevolve [version]
# version: the target script version to run up or down to
#   If no version is given, the target is the highest <version>.sql found
```

```
-- 34.sql
-- UP
create table foo ( name varchar(32) primary key );
create table bar ( id serial primary key );

-- DOWN
drop table foo;
drop table bar;
```

If you want to configure the arguments read by `psql`, drop a `sqlevolveconf` file along with your migrations.
It supports two variables, `dbname` and `psqlargs`.

```
# sqlevolveconf
dbname='mydb'
psqlargs='-U my-favourite-user -h 127.0.0.1'
```

### Examples

```
cd my-proj/migrations
# use psqlargs to specify the user and pass the password in a variable
PGPASSWORD='my-favourite-password' ../sqlevolve
# or use PEER authentication
sudo -u username ../sqlevolve
```

