# Week 2 — SQL Data Cleaning & Quality Diagnostics

## Individual Contribution (Sales Domain)
This week focused on diagnostic data cleaning. I established a safe test environment to audit the `sales` table for duplicated invoices, missing values, and impossible dates before proposing any structural changes to the database.

The diagnostic queries revealed **5,116 extra duplicate rows across 4,013 duplicated invoice IDs**. Additionally, **1,487 rows contained a NULL `customer_id`**, while `sale_date` and `total_price` showed complete integrity with zero missing or boundary-value errors.

**Business Recommendation:** 
Prioritize the validated removal of duplicate rows, as repeated invoice records will mathematically distort sales aggregations. Conversely, NULL customer IDs should be documented rather than automatically overwritten, as they likely represent valid guest purchases according to standard business rules.

## Portfolio Artifacts
- [`individual/week2_sales_cleaning.sql`](individual/week2_sales_cleaning.sql) — SQL diagnostic workflow
- [`individual/week2_sales_report.md`](individual/week2_sales_report.md) — Findings, interpretation, and recommendations

## Team Integration
The team combined the isolated sales, customer, and product audits into a unified Week 2 data-quality summary for stakeholder review.

**Team summary:** [link must be added]

## Core Working Principle
**Test copy -> diagnose -> verify -> document -> only then fix.**
