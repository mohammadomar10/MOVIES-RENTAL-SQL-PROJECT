# MOVIE_RENTAL_SHOP_DATA_ANALYSIS_SQL_PROJECT

## Overview

This repository contains SQL scripts designed to analyze data from a rental movie business database. The project focuses on answering key business questions, providing insights into customer behavior, inventory management, revenue generation, and operational efficiency. It utilizes various SQL techniques to extract and analyze data from a relational database.

## Project Objectives

* Explore the database schema and understand the relationships between tables.

* Analyze rental patterns, customer activity, and revenue streams.

* Provide actionable insights for marketing, inventory management, and business operations.

* Answer specific business questions using SQL queries.

## Database Schema

The database contains the following tables:

* ACTOR: Actor details such as first name, last name, actor id.

  <img src="CODE OUTPUTS/ACTOR TABLE.png" width="550" height="150"/>&nbsp; 

* CUSTOMER: Customer details such as name, email, and activity status.

  <img src="CODE OUTPUTS/CUSTOMER_TABLE.png" width="550" height="150"/>&nbsp;

* RENTAL: Records of movie rentals.

  <img src="CODE OUTPUTS/RENTAL TABLE.png" width="550" height="150"/>&nbsp;

* INVENTORY: Inventory information for each store.

  <img src="CODE OUTPUTS/INVENTORY TABLE.png" width="400" height="150"/>&nbsp;

* FILM: Movie details including title, rating, rental rate, and special features.

  <img src="CODE OUTPUTS/FILM TABLE .png" width="550" height="150"/>&nbsp;

* FILM_CATEGORY: Categories associated with films.

  <img src="CODE OUTPUTS/film_category.png" height="150"/>&nbsp;

* PAYMENT: Payment transactions.

  <img src="CODE OUTPUTS/payment_table.png" height="150"/>&nbsp;

 ## Tools & Library Used

  [<img src="CODE OUTPUTS/Mysql_logo.png" width="100"/>](https://www.mysql.com/) &nbsp;
  
## Project Result

[Click here to get full code](https://github.com/F7-bit/MOVIE_RENTAL_SHOP_DATA_ANALYSIS_SQL_PROJECT/blob/main/CODE_MOVIE_RENTAL.sql)

## Query Task

1. Extract the first name, last name, and email address of all customers to prepare a comprehensive contact list for the marketing team.

 <img src="CODE OUTPUTS/email ids.png"  height="150"  />&nbsp;

2. Analyze the rental rates and determine the number of movies in each rental category.

 <img src="CODE OUTPUTS/rental rate category .png" />&nbsp;

3. Find the rating category with the most films.

 <img src="CODE OUTPUTS/RATING CATEGORY COUNT.png" />&nbsp;

4. Find the most prevalent rating in each store.

 <img src="CODE OUTPUTS/RATING CATEGORY PER STORE .png" />&nbsp;

5. List of films with their Name, Category, and Language.

<img src="CODE OUTPUTS/TITLE_LANG_CATEGORY.png" />&nbsp;

6. Count how many times each movie has been rented.

<img src="CODE OUTPUTS/POPULARITY_MOST_RENTAL.png" />&nbsp;

7. Top 10 films by revenue

<img src="CODE OUTPUTS/TOP 10 REVENUE .png" />&nbsp;

8. Customer with the highest spending

<img src="CODE OUTPUTS/TOP 1 SPENDING CUST.png" />&nbsp;

9. Which store has brought the most revenue

<img src="CODE OUTPUTS/PER STORE REVENUE.png" />&nbsp;

10. How many rentals do we have for each month

<img src="CODE OUTPUTS/RENTAL_PER_MONTH.png" />&nbsp;

11. Identify and reward customers who have rented a minimum of 30 times, including their phone number and email ID

<img src="CODE OUTPUTS/LOYAL_30_CUST_ALL_DESC.png" />&nbsp;

12. Retrieve all payment records for the first 100 customers, ordered by customer ID

<img src="CODE OUTPUTS/FIRST_100_CUST.png" />&nbsp;

13. Retrieve payment records over $5 for the first 100 customers (ordered by customer ID), since January 1, 2006

<img src="CODE OUTPUTS/OVER_$5_.png" />&nbsp;

14. Retrieve all payment records from the first 100 customers, along with payments over $5 from any customer

<img src="CODE OUTPUTS/SPECIFIC_CUST.png" />&nbsp;

15. Retrieve a list of films that include a 'Behind the Scenes' special feature

<img src="CODE OUTPUTS/SPECIAL FEATURES.png" />&nbsp;

16. Retrieve unique movie ratings along with the count of movies for each rating

<img src="CODE OUTPUTS/RATING_NOOF_MOVIES.png" />&nbsp;

17. Retrieve a count of titles, grouped by rental duration

<img src="CODE OUTPUTS/RATING_RENTAL_SLICED_@.png" />&nbsp;

18. Retrieve movie ratings, the count of movies for each rating, average movie length, and compare with rental duration

<img src="CODE OUTPUTS/RATING_COUNT_LENGTH.png" />&nbsp;

19. Retrieve the count of films, along with the average, minimum, and maximum rental rates, grouped by replacement cost 

<img src="CODE OUTPUTS/REPLACEMENT_COST_IF.png" />&nbsp;

20. Retrieve a list of customer IDs who have rented fewer than 15 times in total

<img src="CODE OUTPUTS/LESS_THAN_15_RENT.png" />&nbsp;

21. Retrieve a list of all film titles, along with their lengths and rental rates, sorted from longest to shortest

<img src="CODE OUTPUTS/length&rentalprice.png" />&nbsp;

22. Categorize movies as per length

<img src="CODE OUTPUTS/movies_length_bucket.png" />&nbsp;

23. Categorize movies to recommend based on various age groups and demographics

<img src="CODE OUTPUTS/recomm. sys.png" />&nbsp;

24. Retrieve a list of the first and last names of all customers, along with their store and activity status (e.g., 'store 1 active', 'store 1 inactive', 'store 2 active', or 'store 2 inactive')

<img src="CODE OUTPUTS/CUST_STORE_ACTIVITY.png" />&nbsp;

25. Retrieve a list of all films in inventory, including the film title, description, associated store_id, and inventory_id

<img src="CODE OUTPUTS/FILM_INVENTORY.png" />&nbsp;

26. Retrieve the first name, last name, and the count of movies for each actor

<img src="CODE OUTPUTS/ACTOR_NO_OF_FILMS.png" />&nbsp;

27. Retrieve a list of all film titles, along with the count of actors associated with each title

<img src="CODE OUTPUTS/INVESTOR_REQUEST.png" />&nbsp;

28. Retrieve a list of all actors, along with the titles of the films they appear in

<img src="CODE OUTPUTS/ACTOR_N_APPEARANCE.png" />&nbsp;

29. Retrieve a list of distinct film titles and their descriptions currently available in the inventory at Store 2

<img src="CODE OUTPUTS/EXPANSION .png" />&nbsp;

30. Retrieve a unified list of all staff and advisor names, including a column indicating their role as either 'Staff' or 'Advisor'

<img src="CODE OUTPUTS/CONFERENCE_LIST.png" />&nbsp;

## Insights and Conclusions

1.**Customer Behavior**

**Top Customers**: A small percentage of customers contribute significantly to revenue, highlighting the importance of customer retention strategies for this segment.

**Inactive Customers**: Identified a noticeable portion of inactive customers, suggesting the need for re-engagement campaigns to increase activity levels.

2.**Movie Performance**

**Popular Genres**: Action and Comedy emerged as the most rented genres, indicating their high demand among customers.

**Revenue Drivers**: High-rated movies with special features contributed significantly to revenue, emphasizing the importance of maintaining a quality selection.

3.**Revenue Insights**

**Peak Revenue Periods**: Rental activity peaked during weekends, offering opportunities for targeted promotions and events.

**Late Fees**: A substantial portion of revenue came from late fees, signaling a need to balance fee structures to avoid customer dissatisfaction while maintaining profitability.

4.**Inventory Management**

**Low Turnover Titles**: Some movies had consistently low rental rates, suggesting they may need price adjustments or removal from inventory.

**Optimized Stocking**: Branches with optimized inventory turnover performed better, highlighting the value of data-driven stocking strategies.

5.**Operational Efficiency**

**Branch Comparison**: Identified high-performing branches with better customer engagement and inventory utilization. Underperforming branches may benefit from targeted management interventions.

**Peak Times**: The busiest rental periods aligned with evenings and weekends, suggesting staffing adjustments during these times to improve customer experience.


## Key Recommendations

1.**Customer Engagement**: Launch loyalty programs for top customers and reactivation campaigns for inactive ones.

2.**Inventory Strategy**: Focus on stocking high-demand genres and phasing out underperforming titles.

3.**Revenue Optimization**: Review rental and late fee pricing to balance customer satisfaction with profitability.

4.**Branch Efficiency**: Provide underperforming branches with targeted support, such as tailored inventory and staff training.

