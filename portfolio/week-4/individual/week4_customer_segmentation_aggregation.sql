-- Week 4 — SQL Aggregation
-- Individual contribution: Role B — Customer Segmentation
-- Tables used: customers, sales
--
-- Business question:
-- How can UrbanStyle segment purchasing customers by total spend,
-- identify its highest-value customers, and show where VIP customers are located?
--
-- Final spend thresholds used in this analysis:
--   VIP     > €2,000
--   Regular > €800 and <= €2,000
--   New     <= €800
--
-- Note:
-- The task uses the label "New" for the lowest-spend segment.
-- This is a spend-based segment, not a measure of how recently a customer registered.


-- ============================================================
-- 0. THRESHOLD CHECK / VALIDATION
-- Used to choose reasonable spend thresholds from the data.
-- ============================================================

WITH customer_summary AS (
    SELECT
        c.customer_id,
        SUM(s.total_price) AS total_revenue
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY c.customer_id
)
SELECT
    ROUND(AVG(total_revenue), 2) AS average_revenue,
    ROUND(MIN(total_revenue), 2) AS minimum_revenue,
    ROUND(MAX(total_revenue), 2) AS maximum_revenue,
    ROUND(
        PERCENTILE_CONT(0.50)
        WITHIN GROUP (ORDER BY total_revenue)::numeric,
        2
    ) AS median_revenue,
    ROUND(
        PERCENTILE_CONT(0.75)
        WITHIN GROUP (ORDER BY total_revenue)::numeric,
        2
    ) AS p75_revenue,
    ROUND(
        PERCENTILE_CONT(0.90)
        WITHIN GROUP (ORDER BY total_revenue)::numeric,
        2
    ) AS p90_revenue
FROM customer_summary;

-- Observed values:
-- average_revenue = 1028.12
-- median_revenue  = 760.31
-- p75_revenue     = 1275.27
-- p90_revenue     = 1855.50
--
-- Therefore €2,000 is a reasonable VIP threshold, roughly above the 90th percentile,
-- while €800 is close to the median and provides a practical boundary for Regular customers.


-- ============================================================
-- 1. CUSTOMER SEGMENTATION WITH A CTE
-- CTE + GROUP BY + CASE WHEN
-- ============================================================

WITH customer_summary AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS name,
        c.city,
        COUNT(s.sale_id) AS order_count,
        SUM(s.total_price) AS total_revenue
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
)
SELECT
    name,
    city,
    order_count,
    ROUND(total_revenue, 2) AS total_revenue,
    CASE
        WHEN total_revenue > 2000 THEN 'VIP'
        WHEN total_revenue > 800 THEN 'Regular'
        ELSE 'New'
    END AS segment
FROM customer_summary
ORDER BY total_revenue DESC;

-- Result: 2,551 purchasing customers were included.


-- ============================================================
-- 2. TOP 10 CUSTOMERS
-- GROUP BY + HAVING
-- Filters out one-time buyers and keeps the highest-revenue customers.
-- ============================================================

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS name,
    COUNT(s.sale_id) AS order_count,
    ROUND(SUM(s.total_price), 2) AS total_revenue
FROM customers c
JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(s.sale_id) >= 2
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 3. SEGMENT SUMMARY STATISTICS
-- Two CTEs: first summarise by customer, then assign a segment.
-- ============================================================

WITH customer_summary AS (
    SELECT
        c.customer_id,
        c.city,
        SUM(s.total_price) AS total_revenue
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.city
),
customer_segments AS (
    SELECT
        customer_id,
        city,
        total_revenue,
        CASE
            WHEN total_revenue > 2000 THEN 'VIP'
            WHEN total_revenue > 800 THEN 'Regular'
            ELSE 'New'
        END AS segment
    FROM customer_summary
)
SELECT
    segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_revenue), 2) AS average_revenue
FROM customer_segments
GROUP BY segment
ORDER BY average_revenue DESC;

-- Observed result:
-- VIP     = 206 customers, average revenue €3,978.87
-- Regular = 1,022 customers, average revenue €1,243.80
-- New     = 1,323 customers, average revenue €402.06


-- ============================================================
-- 4. VIP CUSTOMERS BY CITY
-- Shows where the highest-value customers are concentrated.
-- ============================================================

WITH customer_summary AS (
    SELECT
        c.customer_id,
        c.city,
        SUM(s.total_price) AS total_revenue
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.city
)
SELECT
    city,
    COUNT(*) AS vip_customers
FROM customer_summary
WHERE total_revenue > 2000
GROUP BY city
ORDER BY vip_customers DESC;

-- Main observed locations:
-- Tallinn = 71 VIP customers
-- Tartu   = 42 VIP customers
-- Pärnu   = 31 VIP customers


-- ============================================================
-- 5. ADVANCED: CUSTOMER RANKING WITHIN EACH CITY
-- Window function: RANK() OVER (PARTITION BY ...)
-- ============================================================

WITH customer_summary AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS name,
        c.city,
        COUNT(s.sale_id) AS order_count,
        SUM(s.total_price) AS total_revenue
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
)
SELECT
    name,
    city,
    order_count,
    ROUND(total_revenue, 2) AS total_revenue,
    RANK() OVER (
        PARTITION BY city
        ORDER BY total_revenue DESC
    ) AS rank_in_city
FROM customer_summary
ORDER BY city, rank_in_city;


-- ============================================================
-- BUSINESS SUMMARY
-- ============================================================
-- The customer base contains 206 VIP, 1,022 Regular and 1,323 New/low-spend
-- purchasing customers under the chosen spend thresholds.
-- VIP customers have by far the highest average revenue per customer and are
-- concentrated mainly in Tallinn, Tartu and Pärnu.
-- Anna should prioritise retaining VIP customers while using the Regular segment
-- as the clearest pool for developing future high-value customers.
