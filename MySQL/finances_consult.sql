-- Ingreso mensual, excluyendo el último mes
SELECT
    DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS month,
    ROUND(SUM(payment_value), 2) AS revenue
FROM orders o
JOIN order_payments op
    ON o.order_id=op.order_id
WHERE DATE_FORMAT(order_purchase_timestamp,'%Y-%m')
<
(
    SELECT DATE_FORMAT(MAX(order_purchase_timestamp),'%Y-%m')
    FROM orders
)
GROUP BY month
ORDER BY month;

-- Facturación por vendedor, sin incluir el flete,
SELECT
    seller_id,
    ROUND(SUM(price),2) AS revenue,
    ROUND(100*SUM(price)/(SELECT SUM(price) FROM order_items), 2) AS revenue_percentage
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC;

-- Distribución de métodos de pago, consideramos solo pedidos entregados
SELECT
    op.payment_type,
    COUNT(*) AS transactions,
    ROUND(100*COUNT(*)/(
    SELECT COUNT(*)
    FROM order_payments op2
    JOIN orders o2
		ON o2.order_id = op2.order_id
	WHERE o2.order_status = "delivered"
    )
    , 2) AS percentage
FROM order_payments op
JOIN orders o
	ON o.order_id = op.order_id
WHERE o.order_status = "delivered"
GROUP BY op.payment_type
ORDER BY transactions DESC;