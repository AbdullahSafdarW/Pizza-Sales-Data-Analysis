CREATE database Abd;
USE ABD;

-- Date format correction of importing mistake date needs to be in YYMMDD not anything else

SET SQL_SAFE_UPDATES = 1;
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
SELECT SUM(quantity) FROM pizza_sales WHERE pizza_size = 'S' -- 14403
UNION
SELECT SUM(quantity) FROM pizza_sales WHERE pizza_size = 'M' -- 15635
UNION
SELECT SUM(quantity) FROM pizza_sales WHERE pizza_size = 'L' -- 18956
UNION
SELECT SUM(quantity) FROM pizza_sales WHERE pizza_size = 'XL' -- 552
UNION
SELECT SUM(quantity) FROM pizza_sales WHERE pizza_size = 'XXL' -- 28
UNION 
SELECT SUM(quantity) FROM pizza_sales; -- 49574

-- Average Pizzas Per Order
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT order_id),1) FROM pizza_sales; -- 2.3

-- ----       More Advance Data Analytics Questions and SQL Queries       -------------

SELECT DISTINCT DAYNAME(order_date) FROM pizza_sales;

SELECT 'Monday' AS day_of_week, COUNT(DISTINCT order_id) AS distinct_orders
FROM pizza_sales
WHERE DAYNAME(order_date) = 'Monday'
UNION
SELECT 'Tuesday', COUNT(DISTINCT order_id)
FROM pizza_sales
WHERE DAYNAME(order_date) = 'Tuesday'
UNION
SELECT 'Wednesday', COUNT(DISTINCT order_id)
FROM pizza_sales
WHERE DAYNAME(order_date) = 'Wednesday'
UNION 
SELECT 'Thursday', COUNT(DISTINCT order_id)
FROM pizza_sales
WHERE DAYNAME(order_date) = 'Thursday'
UNION
SELECT 'Friday', COUNT(DISTINCT order_id)
FROM pizza_sales
WHERE DAYNAME(order_date) = 'Friday'
UNION
SELECT 'Saturday', COUNT(DISTINCT order_id)
FROM pizza_sales
WHERE DAYNAME(order_date) = 'Saturday'
UNION 
SELECT 'Sunday', COUNT(DISTINCT order_id)
FROM pizza_sales
WHERE DAYNAME(order_date) = 'Sunday';