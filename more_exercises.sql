show databases;	
use sakila;
show tables;

-- In the sakila database,
-- use the actor, film_actor, and film table
-- to find the first and last name of all actors
-- in the movie titled 'town ark'

SELECT *
FROM actor;

select * 		-- joiner table or associative table to link actor to movie
from film_actor;

select * 
from film;


select first_name, last_name
from film
join film_actor
using (film_id)
join actor
using (actor_id)
where title = "town ark";



SELECT first_name, last_name, actor_id
FROM actor
join film_actor
using (actor_id)
join film
using (film_id)
WHERE film_id = '900';







-- 1) SELECT statements
-- a) Select all columns from the actor table.



-- b) Select only the last_name column from the actor table.
SELECT last_name
FROM actor;
-- c) Select only the film_id, title, and release_year columns from the film table.
SELECT film_id, title, release_year
FROM film;












-- 1) SELECT statements
-- a) Select all columns from the actor table.
SELECT *
FROM actor;
-- b) Select only the last_name column from the actor table.
SELECT last_name
FROM actor;
-- c) Select only the film_id, title, and release_year columns from the film table.
SELECT film_id, title, release_year
FROM film;

-- 2) DISTINCT operator
-- a) Select all distinct (different) last names from the actor table.
SELECT DISTINCT last_name
FROM actor;
-- b) Select all distinct (different) postal codes from the address table.
SELECT DISTINCT postal_code
FROM address;
-- c) Select all distinct (different) ratings from the film table.
SELECT DISTINCT rating
FROM film;

-- 3) WHERE clause
-- a) Select the title, description, rating, and movie length columns from the films table that last 3 hours or longer.
SELECT title, description, rating, length
FROM film
WHERE length >= 180;
-- b) Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
Select  payment_id, amount,  payment_date
from payment
WHERE payment_date >= '2005-05-27';
-- c) Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
Select  payment_id, amount,  payment_date
from payment
WHERE payment_date like '2005-05-27%';
-- d) Select all columns from the customer table for rows that have last names beginning with "S" and first names ending with "N".
SELECT *
FROM customer
WHERE last_name like 's%' and first_name like '%n';
-- e) Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
SELECT *
FROM customer
WHERE active = 0 or last_name like 'm%';
-- f) Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either "C", "S" or "T".
SELECT *
FROM category
WHERE category_id > 4 and name like 'c%' or name like 's%' or name like 't%';
-- g) Select all columns minus the password column from the staff table for rows that contain a password.
SELECT *
FROM staff
WHERE password is NULL;
-- h) Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT *
FROM staff
WHERE password is not NULL;









