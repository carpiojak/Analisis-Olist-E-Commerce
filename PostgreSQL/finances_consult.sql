-- Ingreso mensual, excluyendo el último mes
SELECT
    TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
    ROUND(SUM(payment_value)::numeric, 2) AS revenue
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
WHERE TO_CHAR(order_purchase_timestamp, 'YYYY-MM') < 
(
    SELECT TO_CHAR(MAX(order_purchase_timestamp), 'YYYY-MM')
    FROM orders
)
GROUP BY TO_CHAR(order_purchase_timestamp, 'YYYY-MM')
ORDER BY month;

-- Facturación por vendedor, sin incluir el flete
SELECT
    seller_id,
    ROUND(SUM(price)::numeric, 2) AS revenue,
    ROUND((100.0*SUM(price)/(SELECT SUM(price) FROM order_items))::numeric, 2) AS revenue_percentage
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC;

-- Distribución de métodos de pago, consideramos solo pedidos entregados
SELECT
    op.payment_type,
    COUNT(*) AS transactions,
    ROUND(
        (100.0 * COUNT(*) / (
            SELECT COUNT(*)
            FROM order_payments op2
            JOIN orders o2
                ON o2.order_id = op2.order_id
            WHERE o2.order_status = 'delivered'
        ))::numeric, 
        2
    ) AS percentage
FROM order_payments op
JOIN orders o
    ON o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY op.payment_type
ORDER BY transactions DESC;