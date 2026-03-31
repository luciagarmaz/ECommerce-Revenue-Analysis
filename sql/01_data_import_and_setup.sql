sql/02_data_exploration.sql
-- =====================================
-- Data Exploration
-- =====================================
-- Initial checks to understand data quality and potential issues

-- 1. Missing Customer IDs (NULL values)
SELECT COUNT(*) AS null_customer_ids
FROM online_retailraw
WHERE CustomerID IS NULL;

-- 2. Missing Customer IDs (empty values)
SELECT COUNT(*) AS empty_customer_ids
FROM online_retailraw
WHERE CustomerID = '';

-- 3. Invalid or zero prices
SELECT COUNT(*) AS invalid_prices
FROM online_retailraw
WHERE UnitPrice <= 0;

-- 4. Cancelled orders
SELECT COUNT(*) AS cancelled_orders
FROM online_retailraw
WHERE InvoiceNo LIKE 'C%';

-- 5. Negative quantities (returns)
SELECT COUNT(*) AS negative_quantities
FROM online_retailraw
WHERE Quantity < 0;
