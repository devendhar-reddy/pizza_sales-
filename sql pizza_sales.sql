create database pizza_sales;
use pizza_sales;
select * from pizza_sales;
select sum(total_price) from pizza_sales;
select sum(total_price) as Total_Revenue from pizza_sales;


select sum(total_price) / count(distinct order_id) from pizza_sales;
select sum(total_price) / count(distinct order_id) as Avg_order_value from pizza_sales;

select sum(quantity) from  pizza_sales;
select sum(quantity) as Total_pizza_sold from  pizza_sales;

select sum(distinct order_id) from  pizza_sales;
select sum(distinct order_id)  as Total_orders from  pizza_sales;

select sum(quantity) / count(distinct order_id) from pizza_sales;
select cast(cast(sum(quantity) as decimal (10,2)) /
 cast(count(distinct order_id) as decimal (10,2)) as decimal(10,2)) as Avg_pizza_per_order from pizza_sales;
 
---- Daily trend for Total ordes

SELECT
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY
    DAYOFWEEK(STR_TO_DATE(order_date, '%d-%m-%Y')),
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY
    DAYOFWEEK(STR_TO_DATE(order_date, '%d-%m-%Y'));
    
  --- Daily trend for Monthly orders  
  
  select monthname(str_to_date (order_date,'%d-%m-%Y')) as Month_name , count(Distinct order_id) as total_orders
  from pizza_sales group by monthname(str_to_date (order_date,'%d-%m-%Y'))
  order by total_orders desc ;
  
  --- percentage of sales by pizza category
  
  select pizza_category,sum(total_price) as Total_sales,round(sum(total_price) * 100/
  (select sum(total_price) from pizza_sales where Month(STR_TO_DATE(order_date, '%d-%m-%Y')) = 1),2) AS PCT
  from pizza_sales
  where Month(STR_TO_DATE(order_date, '%d-%m-%Y')) = 1
  group by pizza_category;
  
  --- percentage of sales by pizza size
  
  
  select pizza_size,sum(total_price) as Total_sales,round(sum(total_price) * 100 /
  (select sum(total_price) from pizza_sales where Month(STR_TO_DATE(order_date,'%d-%m-%y')) = 1), 2)  AS PCT
  from pizza_sales
  where Month(STR_TO_DATE(order_date, '%d-%m-%Y')) = 1
  group by pizza_size
  order by PCT desc;
  
  --- Top 5 pizza by Revenue
  
  select pizza_name ,sum(total_price) as Total_Revenue from pizza_sales
  group by pizza_name
  order by Total_Revenue;
  
   select  pizza_name ,sum(total_price) as Total_Revenue from pizza_sales
  group by pizza_name
  order by Total_Revenue desc
  limit 5;
  
  --- Bottom 5 pizza by revenue
   select  pizza_name ,sum(total_price) as Total_Revenue from pizza_sales
  group by pizza_name
  order by Total_Revenue
  limit 5;

--- Top 5 pizza by quantity

 select  pizza_name ,sum(quantity) as Total_quantity from pizza_sales
  group by pizza_name
  order by Total_quantity desc
  limit 5;
  
  select * from pizza_sales;
  
