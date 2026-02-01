-- Initial exploratory queries will go here
/* =====================================================
CUSTOMER BEHAVIOR & RETENTION — EXPLORATORY ANALYSIS
===================================================== */

-- =========================================
-- 1️⃣ Basic Row Counts (sanity check)
-- =========================================

SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS orders FROM orders;
SELECT COUNT(*) AS order_items FROM order_items;
SELECT COUNT(*) AS payments FROM order_payments;
SELECT COUNT(*) AS reviews FROM order_reviews;


-- =========================================
-- 2️⃣ Orders by Status
-- =========================================

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- =========================================
-- 3️⃣ Total Revenue
-- =========================================

SELECT
    ROUND(SUM(price + freight_value), 2) AS total_revenue
FROM order_items;


-- =========================================
-- 4️⃣ Revenue per Order
-- =========================================

SELECT
    order_id,
    ROUND(SUM(price + freight_value), 2) AS order_value
FROM order_items
GROUP BY order_id
ORDER BY order_value DESC
LIMIT 10;


-- =========================================
-- 5️⃣ Orders per Customer
-- =========================================

SELECT
    customer_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 20;


-- =========================================
-- 6️⃣ Repeat vs One-time Customers
-- =========================================

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)

SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY customer_type;


-- =========================================
-- 7️⃣ Repeat Customer Rate
-- =========================================

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS repeat_customer_percent
FROM customer_orders;


-- =========================================
-- 8️⃣ Average Order Value (AOV)
-- =========================================

SELECT
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT
        order_id,
        SUM(price + freight_value) AS order_total
    FROM order_items
    GROUP BY order_id
) t;


-- =========================================
-- 9️⃣ Average Review Score
-- =========================================

SELECT
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM order_reviews;


-- =========================================
-- 🔟 Review Score Distribution
-- =========================================

SELECT
    review_score,
    COUNT(*) AS reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;
