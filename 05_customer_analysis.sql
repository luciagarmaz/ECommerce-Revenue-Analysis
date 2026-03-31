-- =====================================
-- Customer Analysis
-- =====================================

-- 1. Total unique customers with valid transactions
SELECT
    COUNT(DISTINCT CustomerID) AS total_customers
FROM online_retailraw
WHERE CustomerID != ''
AND UnitPrice > 0
AND Quantity > 0
AND InvoiceNo NOT LIKE 'C%';


-- 2. Number of unique customers by country
-- This helps identify whether high revenue comes from many customers
-- or from a small number of high-spending customers.
SELECT
    Country,
    COUNT(DISTINCT CustomerID) AS total_customers
FROM online_retailraw
WHERE CustomerID != ''
AND UnitPrice > 0
AND Quantity > 0
AND InvoiceNo NOT LIKE 'C%'
GROUP BY Country
ORDER BY total_customers DESC;


-- 3. Average Order Value (AOV)
-- Measures the average revenue generated per order.
SELECT
    ROUND(
        SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS average_order_value
FROM online_retailraw
WHERE Quantity > 0
AND InvoiceNo NOT LIKE 'C%'
AND UnitPrice > 0;


-- 4. Number of orders per customer (Top 10)
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retailraw
WHERE InvoiceNo NOT LIKE 'C%'
AND CustomerID != ''
AND Quantity > 0
AND UnitPrice > 0
GROUP BY CustomerID
ORDER BY total_orders DESC
LIMIT 10;


-- 5. Average number of orders per customer
SELECT
    ROUND(
        COUNT(DISTINCT InvoiceNo) / COUNT(DISTINCT CustomerID),
        2
    ) AS average_orders_per_customer
FROM online_retailraw
WHERE InvoiceNo NOT LIKE 'C%'
AND Quantity > 0
AND UnitPrice > 0
AND CustomerID != '';


-- 6. Customer segmentation by total spending
SELECT
    CustomerID,
    SUM(Quantity * UnitPrice) AS total_spent,
    CASE
        WHEN SUM(Quantity * UnitPrice) >= 10000 THEN 'High Value'
        WHEN SUM(Quantity * UnitPrice) >= 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM online_retailraw
WHERE Quantity > 0
AND UnitPrice > 0
AND CustomerID != ''
AND InvoiceNo NOT LIKE 'C%'
GROUP BY CustomerID
ORDER BY total_spent DESC;


-- 7. Number of customers per segment
SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM (
        SELECT
            CustomerID,
            CASE
                WHEN SUM(Quantity * UnitPrice) >= 10000 THEN 'High Value'
                WHEN SUM(Quantity * UnitPrice) >= 2000 THEN 'Medium Value'
                ELSE 'Low Value'
            END AS customer_segment
        FROM online_retailraw
        WHERE CustomerID != ''
        AND UnitPrice > 0
        AND Quantity > 0
        AND InvoiceNo NOT LIKE 'C%'
        GROUP BY CustomerID
) AS customer_groups
GROUP BY customer_segment
ORDER BY total_customers DESC;


-- 8. Revenue contribution by customer segment
SELECT
    customer_segment,
    ROUND(SUM(total_spent), 2) AS segment_revenue,
    ROUND(
        SUM(total_spent) / (
            SELECT SUM(Quantity * UnitPrice)
            FROM online_retailraw
            WHERE CustomerID != ''
            AND UnitPrice > 0
            AND Quantity > 0
            AND InvoiceNo NOT LIKE 'C%'
        ) * 100,
        2
    ) AS revenue_percentage
FROM (
        SELECT
            CustomerID,
            SUM(Quantity * UnitPrice) AS total_spent,
            CASE
                WHEN SUM(Quantity * UnitPrice) >= 10000 THEN 'High Value'
                WHEN SUM(Quantity * UnitPrice) >= 2000 THEN 'Medium Value'
                ELSE 'Low Value'
            END AS customer_segment
        FROM online_retailraw
        WHERE CustomerID != ''
        AND UnitPrice > 0
        AND Quantity > 0
        AND InvoiceNo NOT LIKE 'C%'
        GROUP BY CustomerID
) AS customer_segments
GROUP BY customer_segment
ORDER BY segment_revenue DESC;

