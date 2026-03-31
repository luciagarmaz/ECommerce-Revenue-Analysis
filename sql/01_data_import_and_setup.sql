
#-- Data Import and Setup
-- =====================================
#-- This script enables local file loading and imports the dataset into MySQL

-- Enable local file import
SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

#-- Set encoding to avoid character issues
SET NAMES latin1;
SET character_set_database = latin1;

#-- Clearing table before re-import (optional)
TRUNCATE TABLE online_retailraw;

#-- Load data from CSV file
LOAD DATA LOCAL INFILE 'C:/OnlineRetail.csv'
INTO TABLE online_retailraw
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);

#-- Validate import
SELECT COUNT(*) AS total_rows
FROM online_retailraw;