create table juso (
    no int(3),
    name varchar(10),
    address varchar(20),
    email varchar(5)
);

alter table juso add phone varchar(10);
alter table juso modify email varchar(20);
alter table juso drop address;