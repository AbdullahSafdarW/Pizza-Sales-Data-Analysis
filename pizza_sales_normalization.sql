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
ADD COLUMN flavour_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE pizza_flavours
ADD COLUMN total_sold INT DEFAULT 0;

UPDATE pizza_flavours f
LEFT JOIN (
    SELECT pizza_name, SUM(quantity) AS total_sold
    FROM pizza_sales
    GROUP BY pizza_name
) s ON f.pizza_name = s.pizza_name
SET f.total_sold = COALESCE(s.total_sold, 0);

SELECT * FROM pizza_flavours;
