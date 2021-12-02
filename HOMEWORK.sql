-- 1. List all customers who live in Texas (use
-- JOINs)

select customer_id,first_name, last_name, district
from customer
left join address
on customer.address_id = address.address_id
where district like 'Texas'

--2. Get all payments above $6.99 with the Customer's Full
--   Name

select amount, first_name, last_name
from customer
left join payment 
on customer.customer_id = payment.customer_id
group by first_name, last_name, amount
having amount > 6.99
order by amount asc

--3. Show all customers names who have made payments over $175(use
--   subqueries)

select first_name, last_name
from customer
where  customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);

--4. List all customers that live in Nepal (use the city
--   table)

select first_name, last_name, city
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
group by first_name, last_name, city
having city like 'Nepal';

-- 5. Which staff member had the most
--    transactions?

select first_name, last_name, COUNT(rental_id)
from staff
full join rental
on staff.staff_id = rental.staff_id
group by first_name, last_name
order by COUNT(rental_id) desc
limit 1;

--6. How many movies of each rating are
--   there?

select rating, count(film_id)
from film
group by rating

--7.Show all customers who have made a single payment
--  above $6.99 (Use Subqueries)

select distinct first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id, amount
	having amount > 6.99
	order by amount desc
);



-- 8. How many free rentals did our stores give away?

select COUNT(amount)
from payment
where amount = 0








