# ECommerce Revenue Analysis

## Objective

The objective of this project is to analyze an e-commerce dataset to understand the main drivers of revenue.  
The analysis focuses on customer behavior, product performance, geographic distribution, and seasonality.

---

##  Dataset

- Source: Kaggle - Online Retail Dataset  
- Period: December 2010 – December 2011  
- Contains transactional data including invoices, products, quantities, prices, and customer information  

---

## Tools Used

- SQL (MySQL)
- Data cleaning and transformation using SQL queries

---

## Business Questions

- What is the total revenue of the business?
- Which countries generate the most revenue?
- Who are the most valuable customers?
- How is revenue distributed across customers?
- Which products contribute the most to revenue?
- Are there seasonal trends in sales?

---

## Data Cleaning

The dataset required cleaning before analysis. The following rules were applied:

- Removed cancelled transactions (`InvoiceNo LIKE 'C%'`)
- Excluded negative quantities (returns)
- Excluded zero or negative prices
- Excluded transactions with missing Customer IDs for customer analysis

---

## Key Insights

### Revenue by Country
- The **United Kingdom generates approximately 84% of total revenue**
- Revenue is highly concentrated in the domestic market
- The strongest non-UK markets include the Netherlands, EIRE, Germany, and France

---

### Customer Analysis
- Total unique customers: **4,338**
- Average orders per customer: **4.27**
- Average order value (AOV): **£534**

---

### Customer Segmentation
Customers were segmented based on total spending:

- High Value: ≥ £10,000  
- Medium Value: £2,000 – £10,000  
- Low Value: < £2,000  

#### Distribution:
- Low Value → 79% of customers  
- Medium Value → 18%  
- High Value → 2.4%  

#### Revenue Contribution:
- High Value → **41% of total revenue**
- Medium Value → 34%
- Low Value → 24%

 A small group of high-value customers generates a disproportionate share of revenue.

---

### Product Analysis
- Top revenue-generating products are mainly decorative and gift-related items
- Non-product codes such as postage and manual adjustments were excluded for accurate analysis

---

### Seasonality
- Revenue increases significantly in the final quarter of the year
- Peak sales occur in **November 2011 (~£1.5M)**
- This trend suggests strong holiday-driven demand

---

## Final Conclusion

Revenue in this business is driven by:

- A small number of high-value customers
- Strong geographic concentration in the UK
- High-performing product categories (decorative and gift items)
- Seasonal demand during the holiday period


