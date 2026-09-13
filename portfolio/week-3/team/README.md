# Week 3 — SQL JOINs

## Individual Contribution (Customers Without Purchases)
This week focused on combining related tables with SQL JOINs. I analysed the `customers` and `sales` tables using a `LEFT JOIN` with `WHERE s.sale_id IS NULL` to identify registered customers who have never made a purchase.

The analysis identified **599 customers without purchases**, representing approximately **19% of the 3,150-customer base**. Tallinn had the largest group with **231 customers**, followed by Tartu with **133** and Pärnu with **70**. A time-based extension also showed that the number of non-purchasing registrations increased noticeably from mid-2023 into late 2024 and early 2025.

**Business Recommendation:**  
Test a targeted first-purchase campaign for non-purchasing customers, starting with Tallinn and separating recent registrations from long-term inactive customers. Total monthly registrations should also be reviewed before concluding that customer-conversion performance has worsened.

## Portfolio Artifacts
- [`individual/week3_role_b_lost_customers.sql`](individual/week3_role_b_lost_customers.sql) — LEFT JOIN analysis of customers without purchases
- [`individual/week3_role_b_lost_customers.png`](individual/week3_role_b_lost_customers.png) — Results screenshot

## Team Integration
The team combined analyses of top customers, customers without purchases, products and inventory, and sales channels into a shared Week 3 JOIN analysis for Anna Mets and Toomas Kask.

**Team summary:** [Executive Reporting Week 3 presentation](team/week3_executive_reporting.pptx)

## Core Working Principle
**Choose the correct base table -> join on the correct key -> validate the result -> translate it into a business recommendation.**
