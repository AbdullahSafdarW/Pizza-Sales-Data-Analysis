CREATE database Abd;
USE ABD;

-- Date format correction of importing mistake date needs to be in YYMMDD not anything else

SET SQL_SAFE_UPDATES = 0;
UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');


SELECT * FROM pizza_sales;

-- Pizza Sizes
SELECT DISTINCT Pizza_Sizes FROM pizza_sales;

-- Total Orders placed
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales; -- 21350

-- Total Revenue
SELECT ROUND(SUM(total_price),2) AS Revenue FROM pizza_sales; -- 817860.05

-- Average Order value
SELECT  ROUND(SUM(total_price)/ COUNT(DISTINCT order_id),2) AS Average_Order FROM pizza_sales;

-- Pizzas sold
SELECT SUM(quantity) FROM pizza_sales; -- 49574

-- Pizzas Sold of Sizes
-- 14403
-- 15635
-- 18956
-- 552
-- 28

SELECT pizza_size, SUM(quantity) FROM pizza_sales 
GROUP BY pizza_size;

-- Average Pizzas Per Order
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT order_id),1) FROM pizza_sales; -- 2.3

-- -------      More Advance Data Analytics Questions and SQL Queries       -------------

SELECT DISTINCT DAYNAME(order_date) AS Day, COUNT(order_id) AS Total_orders FROM pizza_sales
GROUP BY DAYNAME(order_date);

-- Pizzas sold per flavour

SELECT f.pizza_name, SUM(s.quantity) AS total_sold
FROM pizza_flavours f
LEFT JOIN pizza_sales s 
ON f.pizza_name = s.pizza_name
GROUP BY f.pizza_name;