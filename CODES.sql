-- DATA ANALYSIS PROJECT FOR RENTAL MOVIES BUSINESS
-- THE STEPS INVOLVED ARE EDA, UNDERSTANDING THR SCHEMA AND ANSWERING THE AD-HOC QUESTIONS
-- BUSINESS QUESTIONS LIKE EXPANDING MOVIES COLLECTION AND FETCHING EMAIL IDS FOR MARKETING ARE INCLUDED
-- HELPING COMPANY KEEP A TRACK OF INVENTORY AND HELP MANAGE IT.

USE MAVENMOVIES;

-- EXPLORATORY DATA ANALYSIS --

-- UNDERSTANDING THE SCHEMA --

SELECT * FROM RENTAL;

SELECT CUSTOMER_ID, RENTAL_DATE
FROM RENTAL;

SELECT * FROM INVENTORY;

SELECT * FROM FILM;

SELECT * FROM CUSTOMER;

-- You need to provide customer firstname, lastname and email id to the marketing team --

SELECT first_name,last_name,email
FROM CUSTOMER;

-- How many movies are with rental rate of $0.99? --

SELECT count(*) as CHEAPEST_RENTALS
FROM film
WHERE rental_rate = 0.99;

-- We want to see rental rate and how many movies are in each rental category --

select rental_rate,count(*) as total_numb_of_movies
from film
group by rental_rate;

-- Which rating categories has the most films? --

SELECT RATING,COUNT(*) AS RATING_CATEGORY_COUNT
FROM FILM
GROUP BY RATING
ORDER BY RATING_CATEGORY_COUNT DESC;

-- Which rating is most prevalant in each store? --

SELECT I.store_id,F.rating,COUNT(F.rating) AS TOTAL_FILMS
FROM inventory AS I LEFT JOIN
	film AS F
ON I.film_id = F.film_id
GROUP BY I.store_id,F.rating
ORDER BY TOTAL_FILMS DESC;

-- List of films by Film Name, Category, Language --
SELECT F.TITLE, LANG.NAME AS LANGUAGE_NAME,C.NAME AS CATEGORY_NAME
FROM FILM AS F LEFT JOIN LANGUAGE AS LANG
ON F.LANGUAGE_ID = LANG.LANGUAGE_ID
LEFT JOIN film_category AS FC
ON F.FILM_ID = FC.FILM_ID
LEFT JOIN CATEGORY AS C
ON FC.CATEGORY_ID = C.CATEGORY_ID;


-- How many times each movie has been rented out?--
SELECT film.title,count(rental.rental_id) as POPULARITY
FROM rental LEFT JOIN inventory
			ON RENTAL.inventory_id = inventory.inventory_id
			LEFT JOIN  film
            on inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY POPULARITY DESC;

-- Revenue per film(TOP 10 FILMS) --
SELECT RENTAL_ID_TRANSACTIONS.TITLE,sum(P.AMOUNT) AS GROSS_REVENUE
FROM(SELECT R.RENTAL_ID,F.FILM_ID,F.TITLE
FROM RENTAL AS R LEFT JOIN INVENTORY AS INV
			ON R.INVENTORY_ID = INV.INVENTORY_ID
            LEFT JOIN FILM AS F
            ON INV.FILM_ID = F.FILM_ID) AS RENTAL_ID_TRANSACTIONS
            LEFT JOIN PAYMENT AS P
            ON RENTAL_ID_TRANSACTIONS.RENTAL_ID = P.RENTAL_ID
GROUP BY RENTAL_ID_TRANSACTIONS.TITLE
ORDER BY GROSS_REVENUE DESC
LIMIT 10;

-- MOST SPENDING CUSTOMER --
SELECT payment.customer_id,customer.first_name,customer.last_name,SUM(payment.amount) AS TOTAL_SPENDS
FROM PAYMENT LEFT JOIN customer
             ON PAYMENT.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY TOTAL_SPENDS DESC
LIMIT 1;

-- Which store has brought the most revenue --
SELECT S.STORE_ID,SUM(P.AMOUNT) AS STORE_REVENUE
FROM PAYMENT AS P LEFT JOIN STAFF AS S
             ON P.STAFF_ID = S.STAFF_ID
GROUP BY S.STORE_ID
ORDER BY STORE_REVENUE DESC;

-- How many rentals do we have for each month --
SELECT monthname(RENTAL_DATE) AS MONTH_NAME,extract(YEAR FROM RENTAL_DATE) AS YEAR_NUMBER,COUNT(rental_id) AS NUMBER_RENTALS
FROM rental
GROUP BY EXTRACT(YEAR FROM RENTAL_DATE),MONTHNAME(RENTAL_DATE)
ORDER BY NUMBER_RENTALS DESC;

-- Reward users who have rented out at least 30 times (With details of customer phone & email_id) --

SELECT CUSTOMER_ID,COUNT(RENTAL_ID) AS NUMBER_OF_RENTALS
FROM RENTAL
GROUP BY CUSTOMER_ID
HAVING NUMBER_OF_RENTALS >= 30
ORDER BY CUSTOMER_ID;

SELECT LOYAL_CUSTOMERS.CUSTOMER_ID,C.FIRST_NAME,C.LAST_NAME,C.EMAIL
FROM(SELECT CUSTOMER_ID,COUNT(RENTAL_ID) AS NUMBER_OF_RENTALS
FROM RENTAL
GROUP BY CUSTOMER_ID
HAVING NUMBER_OF_RENTALS >= 30
ORDER BY CUSTOMER_ID) as LOYAL_CUSTOMERS LEFT JOIN CUSTOMER AS C
      ON LOYAL_CUSTOMERS.CUSTOMER_ID = C.CUSTOMER_ID
      LEFT JOIN ADDRESS AS AD
      ON C.ADDRESS_ID = AD.ADDRESS_ID;





SELECT DISTINCT RENTAL_DURATION
FROM FILM;

-- Could you pull all payments from our first 100 customers (based on customer ID)

SELECT 
    CUSTOMER_ID, RENTAL_ID, AMOUNT, PAYMENT_DATE
FROM
    PAYMENT
WHERE
    CUSTOMER_ID < 101;

-- Now I’d love to see just payments over $5 for those same customers, since January 1, 2006

SELECT 
    CUSTOMER_ID, RENTAL_ID, AMOUNT, PAYMENT_DATE
FROM
    PAYMENT
WHERE
    CUSTOMER_ID < 101 AND AMOUNT > 5
        AND PAYMENT_DATE > '2006-01-01';

-- Now, could you please write a query to pull all payments from those specific customers, along
-- with payments over $5, from any customer?

SELECT 
    CUSTOMER_ID, RENTAL_ID, AMOUNT, PAYMENT_DATE
FROM
    PAYMENT
WHERE
    AMOUNT > 5 OR CUSTOMER_ID = 42
        OR CUSTOMER_ID = 53
        OR CUSTOMER_ID = 60
        OR CUSTOMER_ID = 75;

SELECT 
    CUSTOMER_ID, RENTAL_ID, AMOUNT, PAYMENT_DATE
FROM
    PAYMENT
WHERE
    AMOUNT > 5
        AND CUSTOMER_ID IN (42 , 53, 60, 75);


-- We need to understand the special features in our films. Could you pull a list of films which
-- include a Behind the Scenes special feature?

SELECT 
    TITLE, SPECIAL_FEATURES
FROM
    FILM
WHERE
    SPECIAL_FEATURES LIKE '%Behind the Scenes%';


-- unique movie ratings and number of movies

SELECT 
    RATING, COUNT(FILM_ID) AS NUMBER_OF_FILMS
FROM
    FILM
GROUP BY RATING;

-- Could you please pull a count of titles sliced by rental duration?

SELECT 
    RENTAL_DURATION, COUNT(FILM_ID) AS NUMBER_OF_FILMS
FROM
    FILM
GROUP BY RENTAL_DURATION;


SELECT 
    RATING, RENTAL_DURATION, COUNT(FILM_ID) AS NUMBER_OF_FILMS
FROM
    FILM
GROUP BY RATING , RENTAL_DURATION;

-- RATING, COUNT_MOVIES,LENGTH OF MOVIES AND COMPARE WITH RENTAL DURATION

SELECT RATING,
	COUNT(FILM_ID)  AS COUNT_OF_FILMS,
    MIN(LENGTH) AS SHORTEST_FILM,
    MAX(LENGTH) AS LONGEST_FILM,
    AVG(LENGTH) AS AVERAGE_FILM_LENGTH,
    AVG(RENTAL_DURATION) AS AVERAGE_RENTAL_DURATION
FROM FILM
GROUP BY RATING
ORDER BY AVERAGE_FILM_LENGTH;


-- I’m wondering if we charge more for a rental when the replacement cost is higher.
-- Can you help me pull a count of films, along with the average, min, and max rental rate,
-- grouped by replacement cost?


SELECT REPLACEMENT_COST,
	COUNT(FILM_ID) AS NUMBER_OF_FILMS,
    MIN(RENTAL_RATE) AS CHEAPEST_RENTAL,
    MAX(RENTAL_RATE) AS EXPENSIVE_RENTAL,
    AVG(RENTAL_RATE) AS AVERAGE_RENTAL
FROM FILM
GROUP BY REPLACEMENT_COST
ORDER BY REPLACEMENT_COST;

-- “I’d like to talk to customers that have not rented much from us to understand if there is something
-- we could be doing better. Could you pull a list of customer_ids with less than 15 rentals all-time?”

SELECT 
    CUSTOMER_ID, COUNT(*) AS TOTAL_RENTALS
FROM
    RENTAL
GROUP BY CUSTOMER_ID
HAVING TOTAL_RENTALS < 15;

-- “I’d like to see if our longest films also tend to be our most expensive rentals.
-- Could you pull me a list of all film titles along with their lengths and rental rates, and sort them
-- from longest to shortest?”

SELECT TITLE,LENGTH,RENTAL_RATE
FROM FILM
ORDER BY LENGTH DESC
LIMIT 20;

-- Categorize movies as per length --

SELECT title,length,
	CASE
		WHEN LENGTH < 60 THEN 'UNDER 1 HR'
        WHEN LENGTH BETWEEN 60 AND 90 THEN '1 TO 1.5 HRS'
        WHEN LENGTH > 90 THEN 'OVER 1.5 HRS'
        ELSE 'ERROR'
	END AS LENGTH_BUCKET
FROM FILM;

-- CATEGORIZING MOVIES TO RECOMMEND VARIOUS AGE GROUPS AND DEMOGRAPHIC

SELECT DISTINCT TITLE,
	CASE
		WHEN RENTAL_DURATION <= 4 THEN 'RENTAL TOO SHORT'
        WHEN RENTAL_RATE >= 3.99 THEN 'TOO EXPENSIVE'
        WHEN RATING IN ('NC-17','R') THEN 'TOO ADULT'
        WHEN LENGTH NOT BETWEEN 60 AND 90 THEN 'TOO SHORT OR TOO LONG'
        WHEN DESCRIPTION LIKE '%Shark%' THEN 'NO_NO_HAS_SHARKS'
        ELSE 'GREAT_RECOMMENDATION_FOR_CHILDREN'
	END AS FIT_FOR_RECOMMENDATTION
FROM FILM;

-- “I’d like to know which store each customer goes to, and whether or
-- not they are active. Could you pull a list of first and last names of all customers, and
-- label them as either ‘store 1 active’, ‘store 1 inactive’, ‘store 2 active’, or ‘store 2 inactive’?”

SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,
	CASE
		WHEN STORE_ID = 1 AND ACTIVE = 1 THEN 'store 1 active'
        WHEN STORE_ID = 1 AND ACTIVE = 0 THEN 'store 1 inactive'
        WHEN STORE_ID = 2 AND ACTIVE = 1 THEN 'store 2 active'
        WHEN STORE_ID = 2 AND ACTIVE = 0 THEN 'store 2 inactive'
        ELSE 'ERROR'
	END AS STORE_AND_STATUS
FROM CUSTOMER;


-- “Can you pull for me a list of each film we have in inventory?
-- I would like to see the film’s title, description, and the store_id value
-- associated with each item, and its inventory_id. Thanks!”

SELECT DISTINCT INVENTORY.INVENTORY_ID,
				INVENTORY.STORE_ID,
                FILM.TITLE,
                FILM.DESCRIPTION 
FROM FILM INNER JOIN INVENTORY ON FILM.FILM_ID = INVENTORY.FILM_ID;

-- Actor first_name, last_name and number of movies

SELECT * FROM FILM_ACTOR;
SELECT * FROM ACTOR;

SELECT 
    ACTOR.ACTOR_ID,
    ACTOR.FIRST_NAME,
    ACTOR.LAST_NAME,
    COUNT(FILM_ACTOR.FILM_ID) AS NUMBER_OF_FILMS
FROM
    ACTOR
        LEFT JOIN
    FILM_ACTOR ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
GROUP BY ACTOR.ACTOR_ID;

-- “One of our investors is interested in the films we carry and how many actors are listed for each
-- film title. Can you pull a list of all titles, and figure out how many actors are
-- associated with each title?”

SELECT 
    FILM.TITLE, COUNT(FILM_ACTOR.ACTOR_ID) AS NUMBER_OF_ACTORS
FROM
    FILM
        LEFT JOIN
    FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
GROUP BY FILM.TITLE;
    
-- “Customers often ask which films their favorite actors appear in. It would be great to have a list of
-- all actors, with each title that they appear in. Could you please pull that for me?”
    
SELECT 
    ACTOR.FIRST_NAME, ACTOR.LAST_NAME, FILM.TITLE
FROM
    ACTOR
        INNER JOIN
    FILM_ACTOR ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
        INNER JOIN
    FILM ON FILM_ACTOR.FILM_ID = FILM.FILM_ID
ORDER BY ACTOR.LAST_NAME , ACTOR.FIRST_NAME;

-- “The Manager from Store 2 is working on expanding our film collection there.
-- Could you pull a list of distinct titles and their descriptions, currently available in inventory at store 2?”

SELECT DISTINCT
    FILM.TITLE, FILM.DESCRIPTION
FROM
    FILM
        INNER JOIN
    INVENTORY ON FILM.FILM_ID = INVENTORY.FILM_ID
        AND INVENTORY.STORE_ID = 2;

-- “We will be hosting a meeting with all of our staff and advisors soon. Could you pull one list of all staff
-- and advisor names, and include a column noting whether they are a staff member or advisor? Thanks!”

SELECT * FROM STAFF;
SELECT * FROM ADVISOR;

(SELECT FIRST_NAME,
		LAST_NAME,
        'ADVISORS' AS DESIGNATION
FROM ADVISOR
UNION
SELECT FIRST_NAME,
		LAST_NAME,
        'STAFF MEMBER' AS DESIGNATION
FROM STAFF);