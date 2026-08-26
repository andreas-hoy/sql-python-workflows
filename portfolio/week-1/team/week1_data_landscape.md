# Week 1 — SQL Basics

## Context

In Week 1, I used basic SQL to explore UrbanStyle's sales data and identify initial data-quality questions.

## My Contribution

My individual focus was the `sales` table.

I created SQL queries to:
- count the rows in the sales table;
- preview sales records;
- identify distinct store locations;
- inspect the largest transactions;
- inspect the smallest transactions.

My main findings were:
- the sales table contains 15,234 rows;
- some `sale_id` values are repeated;
- 1,487 sales rows are missing `customer_id`;
- some transactions have non-positive or negative `total_price` values, which need further investigation.

## Portfolio Artefact

- [`individual/week1_sales_exploration.sql`](individual/week1_sales_exploration.sql)
- [`individual/week1_results_screenshot.png`](individual/week1_results_screenshot.png)

## Team Work

My findings contributed to the team's wider Week 1 data landscape covering sales, customers, products, and sales channels/locations.

- [`team/week1_data_landscape.md`](team/week1_data_landscape.md)
