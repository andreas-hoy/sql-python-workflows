# Week 4 — SQL Aggregation

## Individual Contribution (Customer Segmentation)
This week focused on turning detailed transaction data into business summaries using SQL aggregation. I analysed the `customers` and `sales` tables to segment purchasing customers by total spend, identify the highest-value customers, and show where VIP customers are concentrated.

Using spend thresholds of **over €2,000 for VIP**, **over €800 for Regular**, and **€800 or below for New**, the analysis identified **206 VIP customers**, **1,022 Regular customers**, and **1,323 New customers** among **2,551 purchasing customers**. VIP customers generated average revenue of **€3,978.87**, compared with **€1,243.80** for Regular customers and **€402.06** for New customers. VIP customers were concentrated mainly in **Tallinn (71)**, followed by **Tartu (42)** and **Pärnu (31)**.

**Business Recommendation:**  
Prioritise retention and targeted campaigns for VIP customers, while using the Regular segment as the main pool for developing future high-value customers. The `New` label in this analysis is spend-based rather than registration-based, so customer recency would need to be analysed separately before using the segment for lifecycle marketing.

## Portfolio Artifacts
- [`individual/week4_customer_segmentation_aggregation.sql`](individual/week4_customer_segmentation_aggregation.sql) — CTE, GROUP BY, HAVING, customer segmentation, TOP 10 customers, segment summary, city analysis, and customer ranking

## Team Integration
The team combined sales, customer segmentation, inventory/category analysis, and marketing-channel analysis into a shared Week 4 aggregation summary for Anna Mets and Kristi Tamm.

**Team summary:** [add the actual Week 4 team file/link here]

## AI use
I used ChatGPT to help structure and validate the SQL queries, test whether the chosen segmentation thresholds were reasonable, and check that the aggregation logic matched the intended business metrics.

## Core Working Principle
**Aggregate at the correct level -> validate the numbers -> interpret the pattern -> connect it to a business decision.**
