-- Tasa de demora por vendedor, consideramos solo pedidos entregados y vendedores con 20 pedidos o más
SELECT
    oi.seller_id,
    COUNT(DISTINCT o.order_id) AS delivered_orders,
    COUNT(DISTINCT
		CASE
            WHEN o.advance_or_delay_days < 0
            THEN o.order_id
        END
	) AS delayed_orders,
    ROUND(
        (100.0 * COUNT(DISTINCT
			CASE
                WHEN o.advance_or_delay_days < 0
                THEN o.order_id
            END
        ) / COUNT(DISTINCT o.order_id))::numeric, 
        2
	) AS delay_rate
FROM orders o
JOIN order_items oi
	ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT o.order_id) >= 20
ORDER BY delay_rate DESC;
