use mavenmovies;
-- ques 1
select count(rental_id) from rental;

-- ques 2
select avg(rental_duration) from film;

-- ques 3
select upper(first_name), upper(last_name) from customer;

-- ques 4
select rental_id , month(rental_date) from rental;

-- ques 5
select * from rental;
select customer_id, count(rental_id)  from rental group by customer_id ;

-- ques 6
select s.store_id, sum(p.amount) as total_revenue from store s join staff st ON s.manager_staff_id = st.staff_id
JOIN payment p ON p.staff_id = st.staff_id GROUP BY s.store_id;

-- ques 7 
SELECT film.title, customer.first_name, customer.last_name FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN customer ON rental.customer_id = customer.customer_id;

-- ques 8 
select first_name, last_name from actor join film_actor on actor.actor_id = film_actor.actor_id 
join film on film.film_id = film_actor.film_id
 where film.title = "Gone with the Wind";

-- ques 1 (group by)
SELECT category.name AS category_name, COUNT(rental.rental_id) AS total_rentals FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name; 

-- ques 2 
SELECT language.name AS language_name, AVG(film.rental_rate) AS avg_rental_rate
FROM film JOIN language ON film.language_id = language.language_id GROUP BY language.name;

-- ques 3 
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, SUM(payment.amount) AS total_amount_spent
FROM customer JOIN rental ON customer.customer_id = rental.customer_id
JOIN payment ON rental.rental_id = payment.rental_id GROUP BY customer.customer_id;

-- ques 4
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, film.title AS movie_title
FROM customer JOIN rental ON customer.customer_id = rental.customer_id JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id WHERE city.city = 'London';

-- ques 5
SELECT film.title AS movie_title, COUNT(rental.rental_id) AS rental_count FROM film
JOIN inventory ON film.film_id = inventory.film_id JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title ORDER BY rental_count DESC LIMIT 5;

-- ques 6
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name FROM customer
JOIN rental ON customer.customer_id = rental.customer_id JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN store ON inventory.store_id = store.store_id WHERE store.store_id IN (1, 2)
GROUP BY customer.customer_id HAVING COUNT(DISTINCT store.store_id) = 2;




