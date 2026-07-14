-- Facturación por categoría y % de aporte (2017)
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS revenue_BRL,
    ROUND(100*SUM(oi.price)/
        (
            SELECT SUM(oi2.price)
            FROM order_items oi2
            JOIN orders o2
				ON oi2.order_id = o2.order_id
            WHERE o2.order_purchase_timestamp >= '2017-01-01' -- Calculamos para el año 2017
			AND o2.order_purchase_timestamp < '2018-01-01'
            AND o2.order_status = "delivered" -- Solo consideramos pedidos entregado
        ),
        2
    ) AS revenue_percentage
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_purchase_timestamp >= '2017-01-01' -- Calculamos para el año 2017
AND o.order_purchase_timestamp < '2018-01-01'
AND o.order_status = "delivered" -- Solo consideramos pedidos entregados
GROUP BY p.product_category_name
ORDER BY revenue_BRL DESC;

-- Tasa de recompra, se considera recompra cuando un cliente tiene más de 1 pedido
SELECT
    COUNT(*) AS total_customers,
    SUM(customer_orders > 1) AS repeat_customers,
    ROUND(100*SUM(customer_orders > 1) / COUNT(*), 2) AS repeat_rate
FROM
(
    SELECT
        customer_unique_id,
        COUNT(order_id) AS customer_orders
    FROM orders
    WHERE order_status = "delivered"
    GROUP BY customer_unique_id
) t;
