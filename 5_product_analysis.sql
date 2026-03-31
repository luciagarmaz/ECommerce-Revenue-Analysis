-- =====================================
-- Product Analysis
-- =====================================

-- 1. Top products by revenue (raw view)
-- Initial product ranking before excluding non-product stock codes

SELECT
    StockCode,
    Description,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_retailraw
WHERE UnitPrice > 0
AND Quantity > 0
AND InvoiceNo NOT LIKE 'C%'
GROUP BY StockCode, Description
ORDER BY revenue DESC
LIMIT 10;


-- 2. Top real products by revenue
-- Excludes non-product stock codes such as POST, DOT, and M

SELECT
    StockCode,
    Description,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_retailraw
WHERE UnitPrice > 0
AND Quantity > 0
AND InvoiceNo NOT LIKE 'C%'
AND StockCode NOT IN ('POST', 'DOT', 'M')
GROUP BY StockCode, Description
ORDER BY revenue DESC
LIMIT 10;