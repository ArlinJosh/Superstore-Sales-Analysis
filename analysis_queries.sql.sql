-- =========================================
-- Superstore Sales Data Analysis (SQL)
-- Author: Arlin Joshua
-- Description: SQL queries for analyzing sales, profit, and trends
-- =========================================
-- Superstore Sales Data Analysis (SQL)

-- 1. Total Sales, Profit and Orders
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders
FROM superstore;


-- 2. Sales by Region
SELECT 
    region,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


-- 3. Sales by Category
SELECT 
    category,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- 4. Profit by Category
SELECT 
    category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;


-- 5. Top 10 Products by Sales
SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


-- 6. Monthly Sales Trend
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;


-- 7. Sales by Market
SELECT 
    market,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY market
ORDER BY total_sales DESC;


-- 8. Top 10 Customers by Sales
SELECT 
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- 9. Average Shipping Time
SELECT 
    AVG(ship_date - order_date) AS avg_shipping_time
FROM superstore;


-- 10. Discount vs Profit Analysis
SELECT 
    discount,
    AVG(profit) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;


-- 11. Shipping Cost by Ship Mode
SELECT 
    ship_mode,
    AVG(shipping_cost) AS avg_shipping_cost
FROM superstore
GROUP BY ship_mode;


-- 12. Loss Making Products
SELECT 
    product_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;