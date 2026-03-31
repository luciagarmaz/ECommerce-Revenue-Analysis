-- =====================================
-- Time Analysis
-- =====================================

-- Revenue by month
-- Identifies trends and seasonality in sales

SELECT
    YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS year,
    MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS month,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_retailraw
WHERE Quantity > 0
AND UnitPrice > 0
AND InvoiceNo NOT LIKE 'C%'
GROUP BY year, month
ORDER BY year, month;