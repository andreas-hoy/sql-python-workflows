## Week 1: Relational Query Foundations & Data Profiling
### Objective
Execute foundational SQL queries to profile the `UrbanStyle` dataset, establish data quality baselines, and identify structural anomalies within the relational schema prior to advanced aggregation.

### Individual Evidence: Data Profiling (`sales` table)
My individual technical focus was conducting a data quality audit of the `sales` table. I engineered SQL queries to execute the following checks:
- Volumetric analysis (row count validation).
- Spatial/Categorical extraction (identifying distinct store locations).
- Range and outlier detection (inspecting the maximum and minimum transaction values).

**Architectural Observations (Data Quality Audit):**
- **Volume:** The dataset contains 15,234 records.
- **Primary Key Integrity:** Detected duplicate `sale_id` instances (potential duplication anomaly).
- **Referential Integrity:** 1,487 records exhibit `NULL` values for `customer_id` (orphan records).
- **Business Logic Anomalies:** Identified transactions featuring non-positive (≤0) `total_price` values, requiring sanitization or business-logic clarification before utilizing the data for financial aggregations.

### Portfolio Artifacts
- **SQL Script:** [`individual/week1_sales_exploration.sql`](individual/week1_sales_exploration.sql)
- **Validation:** [`individual/week1_results_screenshot.png`](individual/week1_results_screenshot.png)

### Group Work: Macro Data Landscape
I integrated my individual table audits (`sales`) with the team's wider structural investigations to map the complete schema topology (encompassing `customers`, `products`, and `sales channels`). 

**Team Evidence:**
The synthesized Week 1 data landscape documentation is archived here:  
[`team/week1_data_landscape.md`](team/week1_data_landscape.md)
