USE indian_retail;


-- Query 1: Total Sales & Profit by Region


WITH region_performance AS (
    SELECT
        region,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY region
)
SELECT
    region,
    total_sales,
    total_profit
FROM region_performance
ORDER BY total_sales DESC;



-- Query 2: Loss-Making Products


WITH product_profit AS (
    SELECT
        o.product_id,
        p.product_name,
        p.sub_category,
        SUM(o.profit) AS total_profit
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.product_id, p.product_name, p.sub_category
)
SELECT
    product_id,
    product_name,
    sub_category,
    total_profit
FROM product_profit
WHERE total_profit < 0
ORDER BY total_profit desc;

-- Note:
-- The raw dataset did not show losses at product level, 

-- so I applied GST and operational costs to surface margin pressure areas.


-- GST and OPERATIONAL COSTS 

WITH product_profit AS (
    SELECT 
        o.product_id,
        p.product_name,
        p.sub_category,
        SUM(o.profit - (o.sales * 0.18) - (o.sales * 0.10)) AS adjusted_profit
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.product_id, p.product_name, p.sub_category
)
SELECT *
FROM product_profit
WHERE adjusted_profit < 0;


-- Note:
-- After validating the dataset, no products were found
-- with negative total profit. The minimum profit value
-- in the dataset is 0.00, indicating no loss records.


-- Query 3: Monthly Revenue Trend


WITH monthly_trend AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS yearmonth,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    yearmonth,
    total_sales,
    total_profit
FROM monthly_trend
ORDER BY yearmonth;

-- Query 4: Top 5 Products per Region

-- Note: Uses window function RANK() to find top 5 products by sales in each region.

WITH product_sales AS (
    SELECT
        o.region,
        p.product_name,
        SUM(o.sales) AS total_sales
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.region, p.product_name
),
ranked_products AS (
    SELECT
        region,
        product_name,
        total_sales,
        RANK() OVER (
            PARTITION BY region
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM product_sales
)
SELECT
    region,
    product_name,
    total_sales,
    sales_rank
FROM ranked_products
WHERE sales_rank <= 5
ORDER BY region, sales_rank;
