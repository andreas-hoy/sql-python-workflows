-- 1. How many rows are in the sales table?
SELECT COUNT(*) AS row_count
FROM sales;

-- 2. Preview the sales table and inspect its columns
SELECT *
FROM sales
LIMIT 10;

-- 3. Which store locations are represented?
SELECT DISTINCT store_location
FROM sales
ORDER BY store_location;

-- 4. What are the 10 largest transactions?
SELECT *
FROM sales
ORDER BY total_price DESC
LIMIT 10;

-- 5. What are the 10 smallest transactions?
SELECT *
FROM sales
ORDER BY total_price ASC
LIMIT 10;
