# SQL In Action 

Project problems and setup directions for the Week 6 Introduction to SQL project.

Make sure you have covered enough content to meet the prerequisites before starting on this project!


## PREREQUISITES

1. MySQL Server and MySQL Workbench, installed on your computer
2. Basic understanding of SQL queries
   1. SELECT, SELECT DISTINCT
   2. WHERE, operators with WHERE, complex expressions using AND, OR, NOT, and NULL
   3. Filtering and sorting (LIMIT, ORDER BY)
   4. Aggregate functions: COUNT, MIN, MAX, AVG, SUM, GROUP BY
   5. Aliasing (creating a new temporary column with the AS clause)
   6. SQL comments


## SETUP

1. Download the `.zip` file for this GitHub repository
2. Unzip the file on your computer
3. Open MySQL Workbench and choose your local connection
4. Run the `CREATE DATABASE intro_sql` query to create the database
5. Refresh your Schemas tab and right click on `intro_sql`
6. Select **Table Data Import Wizard**
7. When prompted to choose the file to import, click the **Browse** button and select `final_airbnb.csv` from the folder you unzipped out of our starter repository
8. Click Next five times - you will not need to change any settings when setting this project up for the first time.
9. You should see an **Import Results** screen that shows that the table was created with 146 records.
10. Now, go to **File > Open SQL Script** in the top menu of MySQL Workbench.
11. In the window that pops up, choose the `sql_in_action-starter.sql` file from the starter files, then click **Open**
12. You should see the script open in MySQL Workbench with all of the problems written out in SQL comments.
13. Write your queries underneath the problem they relate to, and execute those queries to check that they give you the expected output!


> ‼️ Make sure to check out the walk-through video on your course portal to see this setup process happening live!


##Wrap up notes:
Looking at the listings that have the most reivews, the trend seems
to be that thses listings have a low minimum nights required in the stay
and the price is relatively low. If either the minimum nights or cost is
incredibly low for the type of listing, the listing can have a higher than expected value for the other column.