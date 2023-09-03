-- Before Delete Trigger

use practice;

-- create salary table
create table salary
(eid int primary key,
valid_from date not null,
amount float not null);

-- insert values into salary table
insert into salary (eid, valid_from, amount)
values
(101, '2005-05-01', 55000),
(102, '2007-08-01', 68000),
(103, '2006-09-01', 75000);

select * from salary;

-- create salary_archive table
create table salary_archive
(id int primary key auto_increment,
eid int ,
valid_from date not null,
amount float not null,
delete_time timestamp default now() );

-- creating trigger

delimiter $$
create trigger delete_archive
before delete
on salary for each row
begin
insert into salary_archive (eid, valid_from, amount)
values (old.eid, old.valid_from, old.amount);
end $$

delimiter ;

-- deleting from salary table

delete  
from salary
where eid = 101;



