-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

select * from final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"
-- EXPECTED OUTPUT: 146

select count(*) as total_rows
from final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613
-- HINT: "Where" could it be?
-- EXPECTED OUTPUT: Patricia

select host_name
from final_airbnb
where host_id = 63613;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighbourhoods listed
-- HINT: This is a "distinct" operation...
-- EXPECTED OUTPUT: 40 neighbourhoods listed

select distinct neighbourhood
from final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>

-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
-- HINT: This can be two different queries.
-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?
-- EXPECTED OUTPUT: Highest = 785, Lowest = 55

-- Show one listing with the highest / lowest price
(select *, 'Highest Price' as price_type
from final_airbnb
order by price desc
limit 1)
union
(select *, 'Lowest Price' as price_type
from final_airbnb
order by price
limit 1);

-- Show all listings with the highest / lowest price
select *, 'Highest Price' as price_type
from final_airbnb
where price = (select max(price) from final_airbnb)
union
select *, 'Lowest Price' as price_type
from final_airbnb
where price = (select min(price) from final_airbnb);


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...
-- EXPECTED OUTPUT: 165.3904

select avg(availability_365) as average_availability
from final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL
-- EXPECTED OUTPUT: 6 rows

select *
from final_airbnb
where number_of_reviews = 0;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!
-- EXPECTED OUTPUT: 58059

select id
from final_airbnb
where room_type = 'Private room'
order by number_of_reviews desc
limit 1;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood
-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood?

-- Note that Harlem also has the same number of listings as Williamsburg, but the below only returns Williamsburg to match the expected output
select neighbourhood, count(id) as number_of_listings
from final_airbnb
group by neighbourhood
order by count(id) desc
limit 1;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.
-- EXPECTED OUTPUT: 58059

select id
from final_airbnb
where minimum_nights < 7
order by reviews_per_month desc
limit 1;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.
-- EXPECTED OUTPUT: The Box House Hotel with 6 listings

select host_name, count(id) as number_of_listings
from final_airbnb
group by host_name
order by count(id) desc
limit 1;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentences and include them with your project submission in the README file 

-- Also included in associated ReadMe:
-- Looking at the listings that have the most reivews, the trend seems
-- to be that thses listings have a low minimum nights required in the stay
-- and the price is relatively low. If either the minimum nights or cost is
-- incredibly low for the type of listing, the listing can have a higher 
-- than expected value for the other column.

-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the the percent above or below each listing is compared to the average price for all listings.
-- HINT: No hints! It's a bonus for a reason :)

select @average_price := avg(price)
from final_airbnb;

select id, host_name, neighbourhood, price, round(((price - @average_price) / @average_price) * 100) as percent_difference_from_average_price
from final_airbnb
order by price;