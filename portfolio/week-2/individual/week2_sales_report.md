# Week 2 — Sales Data Quality Report

## Scope

Role A focused on the `sales` domain. The objective was to diagnose duplicate invoice rows, missing values and impossible dates on a safe test copy before any changes are applied to production data.

## Findings

| Check | Result | Interpretation |
|---|---:|---|
| Duplicated `invoice_id` values | 4,013 | Invoice IDs appearing more than once |
| Extra duplicate rows | 5,116 | Rows beyond the single copy retained per invoice |
| NULL `customer_id` | 1,487 | Missing customer reference; may represent valid guest purchases |
| NULL `sale_date` | 0 | No missing sale dates found |
| NULL `total_price` | 0 | No missing sales amounts found |
| Impossible dates | 0 | No sales before 2020 or after the current date |

## Business interpretation

The most material issue is duplicate invoice rows: 5,116 extra rows can distort sales reporting if each repeated invoice is counted as a separate transaction. By contrast, the date and total-price checks returned no issues.

The 1,487 rows with a NULL `customer_id` should not be automatically treated as errors. They may represent valid guest purchases, so the missing customer reference should be documented and interpreted according to business rules rather than replaced with an invented customer.

## Recommendation

Prioritise validated removal of the 5,116 duplicate invoice rows, keeping one record per `invoice_id`, and verify the row count afterwards. Keep NULL `customer_id` values documented until the business rule for guest purchases is confirmed.

## Key learning

A duplicate count depends on the metric being reported: 4,013 duplicated invoice IDs and 5,116 extra duplicate rows are both correct, but they answer different questions. Data-quality checks also produce useful evidence when the result is zero.
