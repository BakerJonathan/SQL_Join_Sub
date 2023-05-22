--Week 5 - Wednesday
--Questions
--1. List all customers who live in Texas (use JOINs)
--select* from customer
--select * from address where district ='Texas'

select first_name,last_name, address,district
from customer inner join address
on customer.address_id = address.address_id 
where district='Texas'

--Jennifer Davis, Kim Cruz, Richard Mccrary, Ian still

--2. Get all payments above $6.99 with the Customer's Full Name
--select* from customer
--select* from payment

select first_name,last_name, payment_id,amount
from customer inner join payment
on customer.customer_id  = payment.customer_id  
where amount>6.99

--27 payments, primarily Peter Menard

--3. Show all customers names who have made payments over $175(use subqueries)
select first_name,last_name 
from customer
where customer_id  in(
	select customer_id
	from payment 
	where amount>175
)

--Mary Smith and Douglas Graf

--4. List all customers that live in Nepal (use the city table)
select*from city


select first_name,last_name, country
from customer full join address
on customer.address_id = address.address_id 
full join city 
on address.city_id =city.city_id 
full join country
on city.country_id =country.country_id 
where country='Nepal'
--Just Kevin Schuler

--5. Which staff member had the most transactions?

--This from HW1 of the unit got 'most rentals sold'

select staff_id , count(staff_id)
from payment  
group by staff_id
order by count(staff_id) desc

-- This time, though, we're looking at transactions, not rentals sold
-- I think it's the same sort of set up, but with rental instead of payment

select staff_id , count(staff_id)
from rental 
group by staff_id
order by count(staff_id) desc

--This time though, it's Mike Hillyer that has more transactions, presumably meaning he's given a bit more away

--6. How many movies of each rating are there?
--we've done this before, dunno what I should add here. Order by's no longer required
select rating  , count(rating)
from film  
group by rating 
order by count(rating) desc
--pg-13, 223,  NC-17, 209,  R,196   PG,194    G,178

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
--question 2 rehash as a subq

select first_name,last_name
from customer
where customer_id  in(
	select customer_id 
	from payment  
	where amount>6.99	
)

--Mary Smith, Peter Menard, Douglas Graf, Alvin Deloach, Alfredo Mcadams

--8. How many free rentals did our stores give away
--select * from rental

--select * from payment 

--Let's see, so we're looking for values of rental id that don't show up
--A left join will suffice, then counting that?

select count (rental.rental_id)
from rental left join payment
on rental.rental_id =payment.rental_id 
where payment.rental_id is null

--1452 entrees fit the clause, 

select rental.rental_id
from rental left join payment
on rental.rental_id =payment.rental_id 
where payment.rental_id is null

--And a glance at the data, for good measure
