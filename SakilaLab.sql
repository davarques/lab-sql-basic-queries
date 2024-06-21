USE sakila;

-- Task 1: Display Sakila table = ignore step (not needed) 

-- Task 2: Retrieve all the data from the tables actor, film and customer.

SELECT *
FROM actor, film, customer;

-- Task 3: Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table

SELECT title 
FROM film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table

SELECT name AS language
FROM language;

-- 3.3 List of first names of all employees from the staff table

SELECT first_name FROM staff;

-- Task 4: Retrieve unique release years.
-- (Unable to find years column or time related)

-- Task 5: Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.

SELECT COUNT(store_id) FROM store;

-- 5.2 Determine the number of employees that the company has.

SELECT COUNT(DISTINCT staff_id) FROM staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
-- First counting film quantity

SELECT COUNT(inventory.inventory_id) AS available_for_rent
FROM inventory
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.return_date IS NOT NULL OR rental.rental_id IS NULL;

-- Total rented films
SELECT COUNT(DISTINCT rental.inventory_id) AS total_rented_films
FROM rental;

-- 5.4 Determine the number of distinct last names of the actors in the database.

SELECT COUNT(DISTINCT last_name) FROM actor;

-- Task 6: Retrieve the 10 longest films

SELECT title, length 
FROM film
ORDER BY length DESC
LIMIT 10;

-- Task 7: Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".

SELECT actor_id, first_name
FROM actor
WHERE first_name = "SCARLETT";

-- BONUS: 
-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

SELECT title, length 
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content

SELECT COUNT(special_features)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';