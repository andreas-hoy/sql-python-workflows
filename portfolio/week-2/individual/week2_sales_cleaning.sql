-- ============================================================
-- DACA Week 2 — Sales Data Quality / Cleaning Script
-- Role: A — Sales Data Cleaning
-- Purpose: Diagnose sales-data quality issues safely on a test copy.
-- Rule: Test copy first. Diagnose -> verify -> document -> only then fix.
-- ============================================================

-- 1. Create a safe test copy
CREATE TABLE sales_test AS
SELECT * FROM sales;

-- Ensure a unique row identifier exists for duplicate handling
ALTER TABLE sales_test
ADD COLUMN IF NOT EXISTS id SERIAL;

-- Verify row count
SELECT COUNT(*) AS row_count
FROM sales_test;


-- 2. Identify duplicated invoice IDs
SELECT
    invoice_id,
    COUNT(*) AS copy_count
FROM sales_test
GROUP BY invoice_id
HAVING COUNT(*) > 1
ORDER BY copy_count DESC;

-- Count distinct invoice IDs that appear more than once
SELECT COUNT(*) AS duplicated_invoice_ids
FROM (
    SELECT invoice_id
    FROM sales_test
    GROUP BY invoice_id
    HAVING COUNT(*) > 1
) duplicates;


-- 3. Count extra duplicate rows
-- Keep the row with the smallest id for each invoice_id;
-- every additional row is counted as a duplicate.
SELECT COUNT(*) AS duplicate_rows
FROM sales_test
WHERE id NOT IN (
    SELECT MIN(id)
    FROM sales_test
    GROUP BY invoice_id
);


-- 4. Check NULL values in critical fields
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
    COUNT(*) FILTER (WHERE sale_date IS NULL) AS null_sale_date,
    COUNT(*) FILTER (WHERE total_price IS NULL) AS null_total_price
FROM sales_test;


-- 5. Check impossible dates
SELECT COUNT(*) AS impossible_dates
FROM sales_test
WHERE sale_date > CURRENT_DATE
   OR sale_date < DATE '2020-01-01';


-- 6. Optional validation query:
-- prove that the date-check logic is capable of returning rows.
SELECT COUNT(*) AS dates_after_test_threshold
FROM sales_test
WHERE sale_date > DATE '2023-06-01';


-- ============================================================
-- VALIDATED RESULTS FROM WEEK 2 GROUP WORK
-- Duplicated invoice_id values: 4,013
-- Extra duplicate rows:         5,116
-- NULL customer_id:             1,487
-- NULL sale_date:               0
-- NULL total_price:             0
-- Impossible dates:             0
--
-- Interpretation:
-- Duplicate invoice rows are the main data-quality issue because
-- they can overstate sales. NULL customer_id values may represent
-- valid guest purchases and should not be replaced automatically.
-- ============================================================

-- ADVANCED CLEANING STEP (NOT RUN AS PART OF THE BASE-LEVEL WORK):
-- Only run after validation and according to the course's safe-cleaning workflow.
--
-- DELETE FROM sales_test
-- WHERE id NOT IN (
--     SELECT MIN(id)
--     FROM sales_test
--     GROUP BY invoice_id
-- );
--
-- SELECT COUNT(*) AS rows_after_deduplication
-- FROM sales_test;
