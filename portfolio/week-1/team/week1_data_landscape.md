# Week 1 Team Work: Macro Data Landscape

**Team:** Executive Reporting  
**Stakeholder Focus:** Toomas Kask (Management)  

## Data Landscape & Initial Findings

Our team used basic SQL queries across four core tables to understand the dataset and identify initial data quality questions:

- **Sales (Transactions):** 15,234 rows across 12 columns. 
  *Findings:* We identified some transactions with negative `total_price` values (despite positive unit prices) and found 1,487 rows missing a `customer_id`.
- **Customers:** 3,150 rows across 9 columns. 
  *Findings:* City names are logged inconsistently, 380 customers are missing email addresses, and at least 130 records share an email address with another record (suggesting possible duplicates).
- **Products:** 362 rows across 10 columns. 
  *Findings:* Products span multiple categories, with prices ranging from €14.53 up to €434.08. 
- **Sales (Channels/Locations):** Sales are split between 2 channels (`online` and `pood`). 
  *Findings:* A confirmed, complete list of physical store locations is currently missing from the dataset.

## Biggest Surprise
The sheer number of data-quality questions that immediately surfaced in a seemingly standard dataset—ranging from negative sales values to missing IDs and inconsistent city names.

## Recommendation to Toomas (Management)
Clarify the business rules behind these data anomalies (e.g., are negative sales valid refunds or errors?) before relying on this dataset for detailed financial or marketing reporting. 

## Missing Data
We currently lack the business context for the negative sales values, the customer links for 1,487 "guest" transactions, email information for 380 customers, and a definitive registry of physical store locations.
