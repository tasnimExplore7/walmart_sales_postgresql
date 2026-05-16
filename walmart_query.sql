select * from walmart_table; 
--- 
select count(*) from walmart_table; 
------ 
select distinct payment_method from walmart_table; 
---------------------------------- 
select payment_method, count(*) from walmart_table group by payment_method 
------------ 

---------------------
select count(distinct branch) from walmart_table  
--------------------- 
select max(quantity) from walmart_tabl
---------------------------- 
--business problems 
--1. find different payment method and number of transaction, no of sold 
select payment_method, count(*) from walmart_table group by payment_method
----------- 
select payment_method, count(*) as no_qty_payment, sum(quantity) as no_qty_sold  
from walmart_table group by payment_method
---- 
--2. identify the highest rated category in each branch, displaying the branch, categoty, avg rating 
select branch, category, avg(rating) as avg_rating FROM walmart_table 
group by 1, 2 order by 1, 3 desc 
------------------
select branch, category, avg(rating) as avg_rating, 
RANK() over(partition by branch order by avg(rating) desc) as rank from walmart_table  
group by branch, category 
---------------------------- 
---subquery 
select * from 
( 
select branch, category, avg(rating) as avg_rating, 
RANK() over(partition by branch order by avg(rating) desc) as rank from walmart_table  
group by branch, category 
) where rank = 3 
---------------------- 
--3. identify the busiest day for each branch based on the number of transactions 
select date from walmart_table
select date, to_date(date, 'DD/MM/YY') as formated_date from walmart_table 
----------------------------------------------- 
SELECT date, to_char(to_date(date, 'dd/mm/yy'), 'Day') as day_name from walmart_table 
------------------------------------- 
select * from 
( 
select branch, to_char(to_date(date, 'dd/mm/yy'), 'Day') as day_name, 
count(*) as no_transaction, 
RANK() over( 
partition by branch   
order by count(*) desc) as rank
from walmart_table group by 1, 2 
) 
where rank = 3 
----------------------- 
SELECT *
FROM (
    SELECT 
        branch,
        TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day') AS day_name,
        COUNT(*) AS no_transaction,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS rank
    FROM walmart_table
    GROUP BY 1, 2
) 
WHERE rank = 1;
------------- 
--4. calculate the total quantity of items sold per payment method. 
--list payment_method and total_quantity 
select payment_method, 
--count(*) as no_payment, 
sum(quantity) as no_qty_sold 
from walmart_table 
group by payment_method 

------------- 
--5. determine the average, minimum, and maximum rating of category  
--for each city. list the city, average_rating, min_rating, and max_rating. 
select city, category, min(rating) as min_rating, 
max(rating) as max_rating, 
avg(rating) as avg_rating 
from walmart_table group by 1, 2

--------------------- 
--6. calculate the total profit for each category by considering total profit as 
-- unit_price * quantity * profit margin, list category and total_profit, 
--ordered from highest to lowest_profit 

select category, sum(total) as total_revenue, 
sum(total * profit_margin) as total_profit from walmart_table group by 1 

---------------
--7. determine the most common payment method for each Branch. 
-- Display the Branch and most common payment method. 
select branch, payment_method, 
count(*) as total_trans from walmart_table group by 1, 2 
---- 
select branch, payment_method, 
count(*) as total_trans, 
rank() over(partition by branch order by count(*) desc) as rank
from walmart_table group by 1, 2
--------common table expression 
with cte as 
(
select branch, payment_method, 
count(*) as total_trans, 
rank() over(partition by branch order by count(*) desc) as rank
from walmart_table group by 1, 2 
) 
select * from cte where rank = 1 
----------------- 
----8. categorize the sales into 3 group morning, afternoon, evening 
----find out which of the shift and number of invoices
select time::time from walmart_table 
------ 
select *, time::time from walmart_table
---------- 
select  
*, 
    case 
        when extract(hour from(time::time)) < 12 then 'Morning' 
	    when extract(hour from(time::time)) between 12 and 17 then 'Afternoon' 
	    else 'Evening' 
     end day_time
from walmart_table  
------------------------- 
select  
    case 
        when extract(hour from(time::time)) < 12 then 'Morning' 
	    when extract(hour from(time::time)) between 12 and 17 then 'Afternoon' 
	    else 'Evening' 
     end day_time, 
	 count(*)
from walmart_table group by 1 
-------------- 
select branch,  
    case 
        when extract(hour from(time::time)) < 12 then 'Morning' 
	    when extract(hour from(time::time)) between 12 and 17 then 'Afternoon' 
	    else 'Evening' 
     end day_time, 
	 count(*)
from walmart_table group by 1, 2 order by 1, 3 desc 
-- ------------------------- 
--9. identify 5 branch with highest decrese ratio in revenue compare to last year 
--current year 2023 and last year 2022
select * from walmart_table
------ 
--revenue_decrease_ratio == last_year_revenue - current_year_revenue/last_year_revenue *100 
select branch, sum(total) as revenue from walmart_table group by 1 
-------formated year, month, day 
select *, to_date(date, 'dd/mm/yy') as formated_date from walmart_table 
-----------------year 
select *, extract(year from to_date(date, 'dd/mm/yy')) as formated_date from walmart_table
----------- sales 2022
select branch, sum(total) as revenue from walmart_table 
where extract(year from to_date(date, 'dd/mm/yy')) = 2022 group by 1 
---------- 


--2022 revenue > 2023 revenue  
with revenue_2022 
as (
 select branch, sum(total) as revenue from walmart_table 
where extract(year from to_date(date, 'dd/mm/yy')) = 2022 group by 1
), 

revenue_2023 
as
(
 select branch, sum(total) as revenue from walmart_table 
where extract(year from to_date(date, 'dd/mm/yy')) = 2023 group by 1
)


select last_year_sale.branch, last_year_sale.revenue as last_year_revenue, 
current_year_sale.revenue as current_year_revenue
from revenue_2022 as last_year_sale join revenue_2023 as current_year_sale 
on last_year_sale.branch = current_year_sale.branch 

where last_year_sale.revenue  > current_year_sale.revenue   
------------------  
-------branch, last_year_revenue, current_year_revenue, revenue_dec_ratio(desc) 

with revenue_2022 
as (
 select branch, sum(total) as revenue from walmart_table 
where extract(year from to_date(date, 'dd/mm/yy')) = 2022 group by 1
), 

revenue_2023 
as
(
 select branch, sum(total) as revenue from walmart_table 
where extract(year from to_date(date, 'dd/mm/yy')) = 2023 group by 1
)


select last_year_sale.branch, last_year_sale.revenue as last_year_revenue, 
current_year_sale.revenue as current_year_revenue, 

round((last_year_sale.revenue - current_year_sale.revenue)::numeric 
/last_year_sale.revenue::numeric * 100, 2) as revenue_dec_ratio

from revenue_2022 as last_year_sale join revenue_2023 as current_year_sale 
on last_year_sale.branch = current_year_sale.branch 

where last_year_sale.revenue  > current_year_sale.revenue  
order by 4 desc  
limit 5
