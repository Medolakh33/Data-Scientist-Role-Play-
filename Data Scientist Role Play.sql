
Hey, did you just copy something?
Heads up, your clipboard was just accessed from this website. Be sure you trust the owner before pasting this someplace you don’t want it. Like a terminal or an email to your boss.
Disable this warning for this site
Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. 
For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer.
 You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where 
indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) 
to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

SELECT 'Attribute' AS table_name, COUNT(*) AS total_records FROM Attribute
UNION
SELECT 'Business' AS table_name, COUNT(*) AS total_records FROM Business
....
	
i. Attribute table =  10000
ii. Business table =10000
iii. Category table =10000
iv. Checkin table =10000
v. elite_years table =10000
vi. friend table = 10000
vii. hours table =10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table =10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 1000 
 select count(distinct b) from Business

ii. Hours = 1562  
select count(distinct Business_id) from hours

iii. Category = 2643 
select count(distinct Business_id) from Category

iv. Attribute = 1115
 select count(distinct Business_id) from Attribute

v. Review =
     primary key : 10000 /
	 select count(distinct id) from Review
     foreign key :8090 
	 select count(distinct Business_id) from Review
	 foreign key :9581 
	 select count(distinct user_id) from Review
	 
vi. Checkin = 493 
select count(distinct Business_id) from Checkin
vii. Photo =
     primary key : 10000 
	 select count(distinct id) from photo
     foreign key: 6493 
	 select count(distinct Business_id) from photo
	 
viii. Tip = 
   foreign key : 537 
   select count(distinct user_id) from Tip
                 3979 
				 select count(distinct Business_id) from Tip

ix. User = 10000  
select count(distinct id) from User

x. Friend = 11 
select count(distinct user_id) from Friend

xi. Elite_years = 2780 
select count(distinct user_id) from Elite_years

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	SQL code used to arrive at answer:
  select *
  from User
     where  id is null or name is null or review_count is null or yelping_since or useful is null or  funny  is null or cool is null
     or fans is null  or average_stars  is null  or compliment_hot is null  or compliment_more  is null or compliment_profile is null 
     or compliment_cute is null  or compliment_note or compliment_plain is null or compliment_cool is  null or compliment_funny is null or 
     compliment_writer  is null  or compliment_photos  is null ;

	
	
	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1	max: 5	avg: 3.7082 
		
	ii. Table: Business, Column: Stars
	
		min: 1.0		max: 5.0		avg: 3.6549 
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2 		avg: 0.0144
		
	
	iv. Table: Checkin, Column: 
	
		min: 1		max: 53		avg: 1.9414 
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer: 
	
   select  city, count(*) as review
   from business
   group by stars
   order by review desc;
	
	Copy and Paste the Result Below:
+--------------+--------+
| city         | review |    
+--------------+--------+
| Ingliston    |   2005 |
| Henderson    |   1778 |
| Stuttgart    |   1565 |
| Charlotte    |   1438 |
| Cleveland    |   1396 |
| Phoenix      |    890 |
| Tempe        |    566 |
| West Mifflin |    206 |
| Montreal     |    156 |
+--------------+--------+     
		 
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

   select  city ,stars , count(*) as count
   from business
   where city = 'Avon'
   group by stars
   order by count desc;

Copy and Paste the Resulting Table Below (2 columns Ã¢â‚¬â€œ star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   3.5 |     3 |
|   2.5 |     2 |
|   4.0 |     2 |
|   1.5 |     1 |
|   4.5 |     1 |
|   5.0 |     1 |
+-------+-------+

ii. Beachwood

SQL code used to arrive at answer:
   select   stars , count(*) as count
   from business
   where city = 'Beachwood'
   group by stars
   order by count desc;


Copy and Paste the Resulting Table Below (2 columns Ã¢â‚¬â€œ star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   5.0 |     5 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.5 |     2 |
|   2.0 |     1 |
|   2.5 |     1 |
|   4.0 |     1 |
+-------+-------+


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
	select name , count (review_count) as top_users 
    from user 
    group by name 
    order by top_users desc
    limit 3 
		
	Copy and Paste the Result Below:
	
+-------+-----------+
| name  | top_users |
+-------+-----------+
| John  |       102 |
| David |        90 |
| Chris |        74 |
+-------+-----------+

8. Does posing more reviews correlate with more fans?
   No
Please explain your findings and interpretation of the results:
  There is no clear relationship between the number of admirers and the number of top users.
  For example, John has the most fans (5) with 102 reviews, but some individuals with no reviews have more
  than 50 (David, Mark, Lisa, and so on).

9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: yes
	
	SQL code used to arrive at answer:
	
  select a.name ,a.review_count,b.text 
  from user as a 
  inner join review as b 
  on a.id = b.id 
  where text like '% love %' or text like '% hate %'
  group by name 
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
  select name , count(fans) as top_10_users
   from user 
   group by name 
   order by top_10_users desc
   limit 10 
	
	Copy and Paste the Result Below:
+----------+--------------+
| name     | top_10_users |
+----------+--------------+
| John     |          102 |
| David    |           90 |
| Chris    |           74 |
| Mike     |           74 |
| Michael  |           72 |
| Jennifer |           63 |
| Mark     |           59 |
| Lisa     |           58 |
| Melissa  |           58 |
| Sarah    |           55 |
+----------+--------------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. 
Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
Yes 

ii. Do the two groups you chose to analyze have a different number of reviews?
Yes   
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
Yes

Phoenix has two clusters of "Food" businesses with distinct ratings and locations. The first bunch,
 found at 4605 E Chandler Blvd, Ste A, has 7 eateries with an average rating of 3.0 stars.
 On the other hand, the second group, situated at 3375 E Shea Blvd, also has 7 businesses, 
 but they shine brighter with an average rating of 4.0 stars.



SQL code used for analysis:

  city and category selected 
	
SELECT
    a.stars,
    'Food' AS category,
    COUNT(*) AS business_count_fast_food
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
WHERE
    a.city = 'Phoenix'
    AND b.category = 'Food'
    AND (stars BETWEEN 2 AND 3)
GROUP BY
    stars

UNION ALL

SELECT
    a.stars,
    'Food' AS category,
    COUNT(*) AS business_count_food
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
WHERE
    a.city = 'Phoenix'
    AND b.category = 'Food'
    AND (stars BETWEEN 4.0 AND 5.0)
GROUP BY
    stars
ORDER BY
    stars, category;

	
  analyze 1 : different distribution of hours
  
SELECT
    a.city, a.stars, b.category, c.hours,
    COUNT(*) AS business_count
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
JOIN
    hours AS c ON a.id = c.business_id
WHERE
    a.city = 'Phoenix'
    AND b.category = 'Food'
    AND ((stars BETWEEN 2.0 AND 3.0) OR (stars BETWEEN 4.0 AND 5.0))
GROUP BY
    a.stars, c.hours
ORDER BY
    a.stars;

	
  analyze 2 : different number of reviews
	
		SELECT
   SELECT
    a.city, a.stars, a.review_count, b.category, c.hours,
    COUNT(*) AS business_count
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
JOIN
    hours AS c ON a.id = c.business_id
WHERE
    a.city = 'Phoenix'
    AND b.category = 'Food'
    AND stars BETWEEN 2.0 AND 3.0 -- Businesses with 2-3 stars
GROUP BY
    a.stars, a.review_count, c.hours

UNION ALL

SELECT
    a.city, a.stars, a.review_count, b.category, c.hours,
    COUNT(*) AS business_count
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
JOIN
    hours AS c ON a.id = c.business_id
WHERE
    a.city = 'Phoenix'
    AND b.category = 'Food'
    AND stars BETWEEN 4.0 AND 5.0 -- Businesses with 4-5 stars
GROUP BY
    a.stars, a.review_count, c.hours
ORDER BY
    a.stars;


  analyze 3 : the location data provided between these two groups
  
  SELECT
    a.city, a.stars,b.category,a.address,
    COUNT(*) AS business_count
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
JOIN
    hours AS c ON a.id = c.business_id
WHERE
    a.city = 'Phoenix'
    AND b.category = 'Food'
    AND stars BETWEEN 2.0 AND 3.0 -- Businesses with 2-3 stars
GROUP BY
    a.stars, a.address

UNION ALL

SELECT
    a.city, a.stars,  b.category,a.address ,
    COUNT(*) AS business_count
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
JOIN
    hours AS c ON a.id = c.business_id
WHERE
    a.city = 'Phoenix'
    AND b.category = 'Food'
    AND stars BETWEEN 4.0 AND 5.0 -- Businesses with 4-5 stars
GROUP BY
    a.stars,a.address
ORDER BY
    a.stars;


		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed?
 List at least two differences and the SQL code you used to arrive at your answer.
 
		
i. Difference 1:
    There are 2501 businesses all of them are currently open.
   There are 564 businesses and all of them are currently closed. 

ii. Difference 2:
    Businesses with a star rating of 1.5, and all of them are currently closed. 
    Businesses with a star rating of 1.5, and all of them are currently closed. 

      
SQL code used for analysis:
SELECT
    a.city, a.stars, b.category, a.is_open,
    COUNT(a.is_open) 
FROM
    business AS a
JOIN
    category AS b ON a.id = b.business_id
JOIN
    hours AS c ON a.id = c.business_id  
WHERE
    (a.is_open = 1 OR a.is_open = 0)
GROUP BY
a.is_open;


   
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting 
the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and 
come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
    Predicting the number of fans a user will have    
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

To understand why some users rack up fans while others stay under the radar, we need to dive into their . We're talking numbersand quality of reviews,
 captivating photos, and even personal tidbits like age and location.
 
 Here's where science steps in. We're building a **regression model**, like a detective analyzing clues, to sniff out patterns in this engagement data.
 Based on these patterns, the model will predict just how many fans a user could charm their way to. 
 But remember, the model is only as good as the data it feeds on. So, choosing the right features, the key ingredients in our engagement recipe, is critical. Only then can we unlock the secrets of fan
 popularity with confidence.
          
iii. Output of your finished dataset:
    +-----------+-------+--------------+------+
| name      | stars | review_count | fans |
+-----------+-------+--------------+------+
| Sue       |     4 |            1 |    0 |
| Virginia  |     1 |            5 |    1 |
| Amy       |     5 |          134 |    2 |
| April     |     5 |           58 |    3 |
| Tasha     |     3 |          250 |    8 |
| Donna     |     5 |           23 |   10 |
| Neil Ryan |     4 |          100 |   13 |
| Raymond   |     3 |          447 |   29 |
| Cynthia   |     3 |           54 |   45 |
+-----------+-------+--------------+------+     
         
iv. Provide the SQL code you used to create your final dataset:

SELECT b.name, a.stars, b.review_count, b.fans
FROM review AS a
JOIN User AS b ON a.id = b.id
group by b.fans
order by b.fans