##1.Create a table called employees with the following structure?
##Write the SQL query to create the above table with all constraints

CREATE DATABASE harshit;
USE harshit;
CREATE TABLE employees (
    emp_id CHAR(10) PRIMARY KEY,                       -- emp_id as Primary Key
    emp_name VARCHAR(30) NOT NULL,                      -- emp_name should not be NULL
    age INT CHECK (age >= 18 AND age <= 100),            -- age should be between 18 and 100
    email VARCHAR(50) UNIQUE,                           -- email should be unique
    salary DECIMAL(15, 2) DEFAULT 30000 CHECK (salary > 0) -- salary with default value and must be greater than 0
);

## 1-PRIMARY KEY: The emp_id is set as the primary key to ensure uniqueness for each employee.

## 2- NOT NULL: The emp_name column is set to NOT NULL to ensure that employee names cannot be left blank.

## 3- CHECK: The age column has a CHECK constraint ensuring that the age is between 18 and 100.
##			 The salary column has a CHECK constraint to ensure that the salary is greater than 0.

## 4- UNIQUE: The email column has a UNIQUE constraint to ensure that no two employees can have the same email address.

## 5- DEFAULT: The salary column is set with a default value of 30,000 if no value is provided.

## 2-  Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
## Ans-  Constraints in a database are rules or restrictions that help ensure the accuracy, consistency, and integrity of data stored in a database. 
##       These constraints enforce certain conditions on data entries, making sure that they meet specific requirements, which in turn prevents errors, inconsistencies, and invalid data. 
##       They play a crucial role in ensuring the quality and reliability of the data in a database.

## emaples of common types of constrainsts.

## 1-PRIMARY KEY:
CREATE TABLE primery (
    emp_id INT PRIMARY KEY,  -- emp_id must be unique and not NULL
    emp_name VARCHAR(50)
);

## 2- FOREIGN KEY:
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

##3- UNIQUE:

CREATE TABLE unw (
    emp_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE  -- email must be unique across all rows
);

## 4- NOT NULL:
CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL  -- emp_name must always have a value
);

##5- CHECK:
CREATE TABLE empl (
    emp_id INT PRIMARY KEY,
    age INT CHECK (age >= 18 AND age <= 100)  -- age must be between 18 and 100
);

## 6- DEFAULT
CREATE TABLE emplo (
    emp_id INT PRIMARY KEY,
    salary DECIMAL(10, 2) DEFAULT 30000  -- salary will default to 30000 if not provided
);

##7- AUTO_INCREMENT
CREATE TABLE employ (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50)
);

## 3- Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

## Ans- The NOT NULL constraint is applied to a column in a database to ensure that every record must have a value for that column. 
## 		This constraint is used to enforce data integrity by preventing NULL values, which are often used to indicate the absence of data or unknown information. 
##      In scenarios where certain data is critical for the correct operation of the system, the NOT NULL constraint ensures that no record can be entered without providing a valid value for that column.
##      No, a primary key cannot contain NULL values.
##      Uniqueness: A primary key is meant to uniquely identify each row, and NULL values cannot be unique because each NULL is considered distinct from other NULL values.
##      Consistency: A PRIMARY KEY must always have a valid, non-NULL value for every record. Allowing NULL values would break the rule of uniqueness and could lead to inconsistencies in the data.
##      Data Integrity: Allowing NULL in a primary key would compromise the integrity of the data, making it difficult or impossible to ensure that each row is correctly identified and referenced.

## 4-  Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.

## Ans- In SQL, you can add or remove constraints on an existing table using the ALTER TABLE statement. Constraints are rules applied to columns that ensure data integrity and consistency. 
##      The ALTER TABLE statement is flexible and allows modifications such as adding, removing, or modifying constraints in an already existing table.

## Example of Adding a Constraint:
ALTER TABLE employees
ADD CONSTRAINT chk_age CHECK (age >= 18 AND age <= 100);

## Example of Removing a Constraint:
ALTER TABLE employees
DROP CONSTRAINT chk_age;

## 5-  Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
##     Provide an example of an error message that might occur when violating a constraint.

## Ans-  When you attempt to insert, update, or delete data in a way that violates a database constraint, it can lead to several consequences, including errors, data integrity issues, or failed operations. 
##       Database constraints are rules that help ensure data integrity, consistency, and accuracy in the database.

##  Example of an Error Message:
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (101, 999, '2025-04-03');

## 6- You created a products table without constraints as follows:
## Now, you realise that?
##: The product_id should be a primary keyQ
##  The price should have a default value of 50.00

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10 , 2 ) DEFAULT 50.00
);

## 7- 
create database student;
use student;
create table children
(student_Id char(3),
student_name varchar(3),
 
SELECT s.student_name, c.class_name
FROM students s
INNER JOIN classes c ON s.class_id = c.class_id;















### SQL Commands

## 1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences.
## ans- In the context of a Maven Movies Database, which is typically used for storing and managing movie-related data,
##      the primary keys and foreign keys would be identified based on the schema of the database. 
##      The primary key is a unique identifier within its table, whereas a foreign key is a reference in one table to a primary key in another.

## 2.  List all details of actors
## ans- 
use mavenmovies;
select * from actor;

##3. List all customer information from DB.
##
use mavenmovies;
SELECT * from customer;
   
##4. List different countries.
use mavenmovies;
select * from country;

##5. Display all active customers.
use mavenmovies;
SELECT * from customer
where active = 1;

##6. List of all rental IDs for customer with ID 1
use mavenmovies;
SELECT * from rental
where staff_id = '1';

##7. - Display all the films whose rental duration is greater than 5.
use mavenmovies;
SELECT * from film
where rental_duration > 5;

##8. List the total number of films whose replacement cost is greater than $15 and less than $20.
use mavenmovies;
SELECT * from film
where replacement_cost > 15 And replacement_cost < 20;

##9.  Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actor;

##10. Display the first 10 records from the customer table .
SELECT * FROM customer
LIMIT 10;

##11.  Display the first 3 records from the customer table whose first name starts with ‘b'
SELECT * FROM customer
WHERE first_name LIKE 'B%'
LIMIT 3;

##12. Display the names of the first 5 movies which are rated as ‘G’
use mavenmovies;
SELECT * FROM film_list
WHERE rating = 'G'
LIMIT 5;

##13. Find all customers whose first name starts with "a".
use mavenmovies;
SELECT * FROM customer
WHERE first_name like 'A%';

##14.  Find all customers whose first name ends with "a".
SELECT * FROM customer
WHERE first_name like '%A';

##15. Display the list of first 4 cities which start and end with ‘a’ .
SELECT * FROM city
WHERE city LIKE 'A%A'
LIMIT 4;

##16. Find all customers whose first name have "NI" in any position.
SELECT * FROM customer
WHERE first_name LIKE '%NI%';

##17. Find all customers whose first name have "r" in the second position.
SELECT * FROM customer
WHERE first_name LIKE '_r%';

##18. Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT * FROM customer
WHERE first_name LIKE 'A%' 
  AND LENGTH(first_name) >= 5;
  
##19. Find all customers whose first name starts with "a" and ends with "o".
SELECT * FROM customer
WHERE first_name LIKE 'A%o';

##20.  Get the films with pg and pg-13 rating using IN operator.
SELECT * FROM film
WHERE rating IN ('PG', 'PG-13');

##21.  Get the films with length between 50 to 100 using between operator.
SELECT * FROM film
WHERE length BETWEEN 50 AND 100;

##22.  Get the top 50 actors using limit operator.
SELECT * FROM actor
LIMIT 50; 

##23. Get the distinct film ids from inventory table.
SELECT DISTINCT film_id
FROM inventory;

## FUNCTIONS 

##1. Retrieve the total number of rentals made in the Sakila database.
SELECT COUNT(*) AS total_rental
FROM rental;

##2. Find the average rental duration (in days) of movies rented from the Sakila database.
SELECT AVG(rental_duration) AS average_rental_duration
FROM film;

##3. Display the first name and last name of customers in uppercase.
SELECT UPPER(first_name) AS first_name, UPPER(last_name) AS last_name
FROM customer;

##4. Extract the month from the rental date and display it alongside the rental ID.
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;

##5. Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

##6. Find the total revenue generated by each store.
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store s
JOIN customer c ON s.store_id = c.store_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY s.store_id;

##7. Determine the total number of rentals for each category of movies.
SELECT * from rental;
 = r.film_id
GROUP BY c.name;


##8. Find the average rental rate of movies in each language.
SELECT l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
FROM language l
JOIN film f ON l.language_id = f.language_id
GROUP BY l.name;

###Joins

##9. Display the title of the movie, customer s first name, and last name who rented it.
SELECT f.title AS movie_title, c.first_name, c.last_name
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id;

##10. Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

##11. Retrieve the customer names along with the total amount they've spent on rentals.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY c.customer_id;

##12. List the titles of movies rented by each customer in a particular city (e.g., 'London').
SELECT c.first_name, c.last_name, f.title AS movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.last_name, c.first_name, f.title;

### Advanced Joins and GROUP BY:

## 13. Display the top 5 rented movies along with the number of times they've been rented.
SELECT f.title AS movie_title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;

##14. Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
SELECT c.first_name, c.last_name, c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;

###Windows Function:

##1. Rank the customers based on the total amount they've spent on rentals.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent,
RANK() OVER (ORDER BY SUM(p.amount) DESC) AS ran
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY ran;

##2. Calculate the cumulative revenue generated by each film over time.
SELECT f.title AS movie_title,
r.rental_date,
SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.film_id, r.rental_date;

##3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT length AS film_length,
AVG(rental_duration) AS avg_rental_duration
FROM film f
JOIN rental r ON f.film_id = film_id
GROUP BY length
ORDER BY length;

##4.  Identify the top 3 films in each category based on their rental counts.
WITH ranked_films AS (
    SELECT f.title AS movie_title,
           fc.category_id,
           f.film_id,
           COUNT(r.rental_id) AS rental_count,
           RANK() OVER (PARTITION BY fc.category_id ORDER BY COUNT(r.rental_id) DESC) AS ran
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, fc.category_id
)
SELECT movie_title, rental_count, category_id
FROM ranked_films
WHERE ran <= 3
ORDER BY category_id, ran;

##5  Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
WITH customer_rentals AS (
    SELECT c.customer_id,
           COUNT(r.rental_id) AS total_rentals
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id
),
average_rentals AS (
    SELECT AVG(total_rentals) AS avg_rentals
    FROM customer_rentals
)
SELECT cr.customer_id,
       cr.total_rentals,
       ar.avg_rentals,
       (cr.total_rentals - ar.avg_rentals) AS rental_difference
FROM customer_rentals cr, average_rentals ar
ORDER BY cr.customer_id;

##6. Find the monthly revenue trend for the entire rental store over time.
SELECT
    YEAR(r.rental_date) AS rental_year,
    MONTH(r.rental_date) AS rental_month,
    SUM(p.amount) AS total_revenue
FROM
    rental r
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY
    rental_year, rental_month
ORDER BY
    rental_year, rental_month;
    
##7.  Identify the customers whose total spending on rentals falls within the top 20% of all customers.
WITH total_spending AS (
    SELECT c.customer_id,
           SUM(p.amount) AS total_spent
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
),
percentile_threshold AS (
SELECT PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER by total_spent DESC) AS top_20_percent_threshold
FROM total_spending
)
SELECT ts.customer_id,
       ts.total_spent
FROM total_spending ts
JOIN percentile_threshold pt
  ON ts.total_spent >= pt.top_20_percent_threshold
ORDER BY ts.total_spent DESC;

##8.  Calculate the running total of rentals per category, ordered by rental count.
WITH category_rentals AS (
    SELECT fc.category_id,
           c.name AS category_name,
           COUNT(r.rental_id) AS rental_count
    FROM film_category fc
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY fc.category_id, c.name
)
SELECT category_id,
       category_name,
       rental_count,
       SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total_rentals
FROM category_rentals
ORDER BY rental_count DESC;

##9. Find the films that have been rented less than the average rental count for their respective categories.
WITH film_rental AS (
    SELECT f.film_id,
           f.title,
           fc.category_id,
           COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, fc.category_id, f.title
),
rental AS (
    SELECT fc.category_id,
           AVG(COUNT(r.rental_id)) AS rental_count
    FROM film_category fc
    JOIN inventory i ON fc.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY fc.category_id
)
SELECT fr.film_id,
       fr.title,
       fr.rental_count,
       car.avg_rental_count
FROM film_rental fr
JOIN rental car ON fr.category_id = car.category_id
WHERE fr.rental_count < car.rental_count
ORDER BY fr.category_id, fr.rental_count;

## 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

SELECT
    YEAR(r.rental_date) AS rental_year,
    MONTH(r.rental_date) AS rental_month,
    SUM(p.amount) AS total_revenue
FROM
    rental r
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY
    rental_year, rental_month
ORDER BY
    total_revenue DESC
LIMIT 5;

###Normalisation & CTE:

##1. First Normal Form (1NF):
##a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF
 
 ## A table is in First Normal Form (1NF) if:

## 1- All columns contain atomic values (i.e., indivisible values).

## 2- Each record (row) must have a unique identifier (i.e., a primary key).

## 3- Each column must contain values of a single type.

## 4- There are no repeating groups or multi-valued attributes within a column.

## 2. 2. Second Normal Form (2NF):
##  a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
## If it violates 2NF, explain the steps to normalize it

## Second Normal Form (2NF) Overview:
## A table is in Second Normal Form (2NF) if:
## 1- It is already in 1NF (i.e., it contains atomic values and each column contains only indivisible values).

## 2- No partial dependency exists; meaning, all non-key attributes must be fully dependent on the primary key.

##3- 3. Third Normal Form (3NF):
##a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
## present and outline the steps to normalize the table to 3NF.

## Third Normal Form (3NF) Overview:
W##A table is in Third Normal Form (3NF) if:

##1- It is in Second Normal Form (2NF).

##2- No transitive dependencies exist, meaning that non-key attributes should not depend on other non-key attributes.

##  A transitive dependency exists when a non-key attribute depends on another non-key attribute, which then depends on the primary key. 
## This creates an indirect relationship between the non-key attributes, violating 3NF.

##4.  Normalization Process:
## a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.

## Normalization Process from Unnormalized Form to 2NF:
##In this process, we'll normalize a table from unnormalized form (UNF) to Second Normal Form (2NF) in the Sakila database. We’ll walk through the following steps:

##Unnormalized Form (UNF) — The data might have redundant information, repeating groups, and might not adhere to basic data integrity.

##irst Normal Form (1NF) — The table must have atomic values and no repeating groups.

##Second Normal Form (2NF) — The table must be in 1NF and must eliminate partial dependencies (non-key attributes must be fully dependent on the entire primary key).

##5.. CTE Basics:
##a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they  have acted in from the actor and film_actor tables.
WITH actor_film_count AS (
    SELECT 
        a.first_name, 
        a.last_name, 
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
)

SELECT first_name, last_name, film_count
FROM actor_film_count
ORDER BY film_count DESC;

##6.CTE with Joins:
## a. Create a CTE that combines information from the film and language tables to display the film title,  language name, and rental rate.
WITH film_language_info AS (
    SELECT 
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)

SELECT film_title, language_name, rental_rate
FROM film_language_info
ORDER BY film_title;

##7. for Aggregation:
##a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
WITH customer_revenue AS (
    SELECT 
        p.customer_id,
        SUM(p.amount) AS total_revenue
    FROM payment p
    GROUP BY p.customer_id
)

SELECT c.customer_id, c.first_name, c.last_name, cr.total_revenue
FROM customer_revenue cr
JOIN customer c ON cr.customer_id = c.customer_id
ORDER BY cr.total_revenue DESC;

##8. CTE with Window Functions:
## a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
WITH film_ranking AS (
    SELECT 
        f.title AS film_title,
        f.rental_duration,
        RANK() OVER (ORDER BY f.rental_duration DESC) AS rental_rank
    FROM film f
)

SELECT film_title, rental_duration, rental_rank
FROM film_ranking
ORDER BY rental_rank;

## 9. CTE and Filtering:
##a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
WITH customer_rentals AS (
    SELECT 
        r.customer_id, 
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    GROUP BY r.customer_id
    HAVING COUNT(r.rental_id) > 2
)

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    cr.rental_count
FROM customer_rentals cr
JOIN customer c ON cr.customer_id = c.customer_id
ORDER BY cr.rental_count DESC;

##10.CTE for Date Calculations:
## a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table
WITH monthly_rentals AS (
    SELECT 
        YEAR(r.rental_date) AS rental_year,
        MONTH(r.rental_date) AS rental_month,
        COUNT(r.rental_id) AS total_rentals
    FROM rental r
    GROUP BY YEAR(r.rental_date), MONTH(r.rental_date)
)

SELECT rental_year, rental_month, total_rentals
FROM monthly_rentals
ORDER BY rental_year DESC, rental_month DESC;	

##11.  CTE and Self-Join:
## a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
WITH actor_pairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 
        ON fa1.film_id = fa2.film_id
        AND fa1.actor_id < fa2.actor_id  -- To avoid duplicate pairs (A, B) and (B, A)
)

SELECT 
    a1.first_name AS actor1_first_name,
    a1.last_name AS actor1_last_name,
    a2.first_name AS actor2_first_name,
    a2.last_name AS actor2_last_name,
    ap.film_id
FROM actor_pairs ap
JOIN actor a1 ON ap.actor1_id = a1.actor_id
JOIN actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY ap.film_id;

##12. CTE for Recursive Search:
## a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column
WITH RECURSIVE employee_hierarchy AS (
    -- Base case: Select the employees who directly report to the manager (e.g., staff_id = 1)
    SELECT 
        staff_id,
        first_name,
        last_name
    FROM staff s
    UNION ALL

    SELECT 
        staff_id,
        first_name,
        last_name
        FROM staff s
    JOIN employee_hierarchy eh ON  eh.staff_id
)

SELECT staff_id, first_name, last_name
FROM employee_hierarchy
ORDER BY staff_id;







































