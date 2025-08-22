SELECT * FROM pizza_sales;

-- Removing useless column
ALTER TABLE pizza_sales
DROP COLUMN pizza_id;

-- -------      Creating Tables to Normalize Relational Database up to 3NF       -------------

-- New table Order Totals

CREATE TABLE order_totals AS
SELECT order_id, SUM(total_price) AS total_order_price FROM pizza_sales
GROUP BY order_id;

ALTER TABLE order_totals
MODIFY order_id INT PRIMARY KEY NOT NULL; -- order_id now a PK

SELECT * FROM order_totals;
SELECT SUM(total_order_price) AS Total_Revenue FROM order_totals; -- 817860 (testing if revenue matches previous table's query)

-- New table Pizza Flavour

CREATE TABLE pizza_flavours AS SELECT DISTINCT pizza_name FROM pizza_sales;

-- Giving an PK flavour_id to the table and Rearranging Columns

ALTER TABLE pizza_flavours
ADD COLUMN flavour_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL 
AFTER pizza_name;

SELECT * FROM pizza_flavours;
