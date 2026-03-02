-- 1. Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'paid';
-- 2. Top 5 customers by revenue
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'paid'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;
-- 3. Best-selling products
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;
-- 4. Monthly revenue
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS revenue
FROM orders
WHERE status = 'paid'
GROUP BY month
ORDER BY month;
-- 5. Payment success rate
SELECT 
    COUNT(*) FILTER (WHERE status = 'success') * 100.0 / COUNT(*) 
    AS success_rate_percent
FROM payments;
