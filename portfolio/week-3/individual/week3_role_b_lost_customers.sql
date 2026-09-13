-- DACA Week 3
-- Role B: Customers Without Purchases
-- Topic: LEFT JOIN + WHERE IS NULL
-- Business question:
-- Which registered UrbanStyle customers have never made a purchase?


-- 1. List customers who have never purchased
SELECT
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.registration_date,
    s.sale_id
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;


-- 2. Count customers who have never purchased
SELECT
    COUNT(*) AS lost_customers
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;


-- 3. Lost customers by city
SELECT
    c.city,
    COUNT(*) AS lost_customers
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
GROUP BY c.city
ORDER BY lost_customers DESC;


-- 4. Lost customers by registration date
SELECT
    c.first_name || ' ' || c.last_name AS customer,
    c.registration_date,
    c.city,
    c.loyalty_tier
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
ORDER BY c.registration_date DESC;


-- 5. Compare lost vs active customer counts
SELECT
    CASE
        WHEN s.sale_id IS NULL THEN 'Lost (no purchases)'
        ELSE 'Active (has purchased)'
    END AS status,
    COUNT(DISTINCT c.customer_id) AS customers
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY
    CASE
        WHEN s.sale_id IS NULL THEN 'Lost (no purchases)'
        ELSE 'Active (has purchased)'
    END;


-- 6. Advanced extension: lost customers by registration month
SELECT
    DATE_TRUNC('month', c.registration_date) AS registration_month,
    COUNT(*) AS lost_customers
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
GROUP BY DATE_TRUNC('month', c.registration_date)
ORDER BY registration_month;


-- Results observed
-- Lost customers: 599
-- Active customers: 2,551
-- Largest lost-customer groups:
-- Tallinn: 231
-- Tartu: 133
-- Pärnu: 70
--
-- Time-based finding:
-- Non-purchasing registrations increased noticeably from mid-2023,
-- with the highest counts in late 2024 and early 2025.
--
-- Business conclusion:
-- UrbanStyle has 599 registered customers who have never made a purchase,
-- around 19% of the customer base.
-- A targeted first-purchase campaign could be tested first in Tallinn,
-- with different messaging for recent versus long-term inactive registrations.
-- Total registrations by month should be reviewed before concluding
-- that conversion performance has worsened.
