show databases;
use chipotle;
select database ();

Show tables;

select *
from orders;

-- find all the items that are bowls
select * 
from orders
where item_name = 'bowl';

-- or you can use wild card becuase there are more bowls than just 2

select * 
from orders
where item_name LIKE '%bowl%';


-- use  a distinct it gets rid of dupliccates 
select distinct item_name 
from orders
where item_name LIKE '%bowl%';

-- distinct with multiple columns
select distinct item_name, quantity 
from orders
where item_name LIKE '%bowl%';

-- find everything that is not a bowl
select distinct item_name
from orders
where item_name not like '%bowl%';


-- BETWEEN Clause (this is inclusive, returns the values you write out)
select * 
from orders
where order_id between 1 and 5;

-- IN
-- find all rows that have chieck bowl or veggie bowl.
select *
from orders 
where item_name in ('chicken bowl','veggie bowl');


-- nul and not null
show databases;
use join_example_db;
select database();

show tables;

-- find all the users in the users table that dont have role_ids
select *
from users;

-- filter out nulls

select *
from users
where role_id is null;

-- find all users in the user table that DO have role_ids
select *
from users
where role_id is not null;


-- Chaining
-- find all users who have a role_id of 3  and are named sally
select *
from users 
Where role_id = 3
and name = 'sally';

-- find all users with a role id of 3 and are named jane
select *
from users 
Where role_id = 3
and name = 'jane';

-- using OR

select *
from users 
Where role_id = 3
or name = 'jane';


-- find all users who have a role id of 1 or 3

select *
from users 
Where role_id = 3
or 1 -- not a complete conditional statement (you are not specifying a column)






