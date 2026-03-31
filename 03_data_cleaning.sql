-- =====================================
-- Data Cleaning Rules
-- =====================================
-- This script identifies and defines rules to clean the dataset.
-- No data is deleted; filters are applied during analysis.

-- 1. Identify problematic records
-- These include:
-- - Negative or zero quantities (returns or errors)
-- - Zero or negative prices
-- - Cancelled orders (InvoiceNo starting with 'C')

SELECT *
FROM online_retailraw
WHERE Quantity <= 0
OR UnitPrice <= 0
OR InvoiceNo LIKE 'C%';


-- 2. Define cleaning logic for analysis
-- Valid transactions must satisfy:
-- - Positive quantity
-- - Positive price
-- - Not cancelled

-- Example of clean dataset filter
SELECT *
FROM online_retailraw
WHERE Quantity > 0
AND UnitPrice > 0
AND InvoiceNo NOT LIKE 'C%';