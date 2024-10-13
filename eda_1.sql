-- Checking the data
select *
from superstore_clean;

-- Number of rows
select count(*)
from superstore_clean;

## EDA

-- 1. What is the total order and sales amount for each ship mode?
select 
	ship_mode,
    count(ship_mode) as total_order,
    round(sum(sales), 2) as total_sales
from superstore_clean
group by ship_mode
order by total_sales DESC;

-- 2. Which segment generates the most profit?

select 
	segment,
    round(avg(profit), 2) as avg_profit,
    round(sum(profit), 2) as total_profit
from superstore_clean
group by segment
order by total_profit DESC;

-- 3. Find the top 5 cities with the highest sales.

select 
	city,
    count(city) as total_order,
    round(sum(sales), 2) as total_sales
from superstore_clean
group by city
order by total_sales desc
limit 5;

-- 4. What is the average discount provided for each product category?

select
	category,
    concat(round(avg(discount) *100, 2), '%') as average_discount
from superstore_clean
group by category
order by average_discount DESC;

-- 5. How many orders were shipped using 'Same Day' shipping?

select 
	ship_mode,
    count(ship_mode) as total_order
from superstore_clean
where ship_mode = 'Same Day';

-- 6. What is the total quantity of products sold in each region?

select 
	region,
    sub_category,
    sum(quantity) as total_qty
from superstore_clean
group by region, sub_category
order by region, total_qty DESC;

-- 7. List the top 3 sub-categories with the highest profit.

select
	sub_category,
    round(sum(profit), 2) total_profit
from superstore_clean
group by sub_category
order by total_profit DESC
limit 3;

-- 8. What is the average sales per order in each state?

select
	state,
    round(avg(sales), 2) as average_sales
from superstore_clean
group by state
order by state;

-- 9. What percentage of total sales comes from the 'Technology' category?

select 
    round((sum(case when category = 'Technology' then sales else 0 end) / sum(sales)) * 100, 2) as tech_sales_percent
from superstore_clean;

select
	category,
    round((sum(sales) / (select sum(sales) from superstore_clean)) * 100, 2) as sales_percent
from superstore_clean
group by category
order by sales_percent DESC;

-- 10. Which state has the highest average discount?

select 
	state,
    round(avg(discount)*100, 2) as average_discount
from superstore_clean
group by state
order by average_discount DESC;

-- 11. What is the total profit for each sub-category within the 'Office Supplies' category?

select 
	sub_category,
    round(sum(profit), 2) as total_profit
from superstore_clean
where category = 'Office Supplies'
group by sub_category
order by total_profit DESC;

-- 12. Find the total sales and profit for each region.

select
	region,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore_clean
group by region
order by total_profit DESC;

-- 13. What is the average profit per product for the 'Furniture' category?

select
	sub_category,
    round(avg(profit), 2) as average_profit
from superstore_clean
where category = 'Furniture'
group by sub_category
order by average_profit DESC;

-- 14. a. Which product sub-category has the highest sales-to-profit ratio?

select
	sub_category,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit,
    round(sum(sales) / nullif(sum(profit), 0), 2) as sales_profit_ratio
from superstore_clean
group by sub_category
order by sales_profit_ratio DESC
limit 3;

-- 	   b. Which product sub-category has the lowest sales-to-profit ratio?

select
	sub_category,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit,
    round(sum(sales) / nullif(sum(profit), 0), 2) as sales_profit_ratio
from superstore_clean
group by sub_category
order by sales_profit_ratio 
limit 5;

-- 15. What is the most common ship mode used for orders in the 'West' region?

select
	ship_mode,
    count(ship_mode) total_shipment
from superstore_clean
where region = 'West'
group by ship_mode
order by total_shipment DESC;

-- 16. Find the top 5 states with the highest number of orders.

select
	state,
    count(*) total_order
from superstore_clean
group by state
order by total_order DESC
limit 5;

-- 17. Which sub-category has the highest average sales per order?

select
	sub_category,
    round(avg(sales), 2) as average_sales
from superstore_clean
group by sub_category
order by average_sales DESC;

-- 18. What is the total sales amount for each postal code?

select
	postal_code,
    round(sum(sales), 2) as total_sales
from superstore_clean
group by postal_code
order by postal_code DESC
limit 5;

-- 19. Which city has the highest profit for 'Corporate' segment orders?

select 
	city,
    round(sum(profit), 2) as total_profit
from superstore_clean
where segment = 'Corporate'
group by city
order by total_profit DESC;

-- 20. What is the average quantity of products sold per order in each category?

select
	category,
    avg(quantity) as average_qty
from superstore_clean
group by category
order by average_qty DESC;
