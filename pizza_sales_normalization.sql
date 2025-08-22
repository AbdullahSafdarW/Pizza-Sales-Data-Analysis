SELECT * FROM pizza_sales;

-- Removing useless column
ALTER TABLE pizza_sales
DROP COLUMN pizza_id;

-- -------      Creating Tables to Normalize Database up to 3NF       -------------

CREATE TABLE order_totals AS
SELECT 
    order_id, 
    SUM(total_price) AS total_price
FROM pizza_sales
GROUP BY order_id;

SELECT * FROM order_totals;
SELECT SUM(total_price) AS Total_Revenue FROM order_totals; -- 817860