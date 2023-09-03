-- Before Update Triggers

use practice;

-- creating table
create table employees
(emp_id int primary key,
emp_name varchar(30),
age int,
salary float);

-- inserting the records to the table
insert into employees (emp_id, emp_name, age, salary)
values
(101, 'John Doe', 28, 50000.00),
(102, 'Jane Smith', 32, 60000.00),
(103, 'Michael Johnson', 35, 75000.00),
(104, 'Emily Davis', 26, 45000.00),
(105, 'David Wilson', 30, 55000.00),
(106, 'Sarah Thompson', 29, 52000.00),
(107, 'Christopher Lee', 31, 58000.00);


-- creating trigger

delimiter $$
create trigger update_trigger
before update 
on employees
for each row
begin
if new.salary = 10000 then
set new.salary = 850000;
elseif new.salary > 10000 then
set new.salary = 720000;
end if;
end $$

delimiter ; 

update employees
set salary = 100000
where emp_id = 101;

select * from employees










