USE sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated? 

SELECT first_name, last_name, COUNT(last_name) as "Number_appearances"
FROM sakila.actor
GROUP BY last_name
HAVING Number_appearances<2;

-- 2. Which last names appear more than once?

SELECT first_name, last_name, COUNT(last_name) as "Number_appearances"
FROM sakila.actor
GROUP BY last_name
HAVING Number_appearances>1;

-- 3. Using the rental table, find out how many rentals were processed by each employee

SELECT staff_id, COUNT(rental_id) AS 'Rentals_processed'
FROM sakila.rental
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year

SELECT release_year, COUNT(film_id) AS 'Number_of_Releases'
FROM sakila.film
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there.

SELECT rating, COUNT(film_id) AS 'Number_of_Films'
FROM sakila.film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating, ROUND(AVG(length),2) AS 'Mean_length'
FROM sakila.film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, ROUND(AVG(length),2) AS 'Mean_length'
FROM sakila.film
GROUP BY rating
HAVING Mean_length>120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length, DENSE_RANK() OVER(ORDER BY length DESC) AS 'Rank'
FROM sakila.film
WHERE ((length !=0) AND (length IS NOT NULL));
