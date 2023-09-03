-- Before Insert Trigger

--creating table
create table cusomters
(
cust_id int,
age int,
name varchar(30)
)

-- Creating the trigger
delimiter $$   -- Here changing the delimiter from ";" to "$$"
create trigger age_verify
before insert 
on customers for each row
begin
	if new.age < 0 then set new.age = 0;
    end if;
end;
$$
delimiter ;   -- Again changing to original


-- Inserting the values into customers table
insert into customers values
(1, 10, "gaurav"),
(2, -3, "pooja"),
(3, 4, "rahul");

select * from customers;

