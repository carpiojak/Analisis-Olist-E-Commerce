-- Review promedio por vendedor, consideramos solo pedidos entregados "delivered" y vendedores que tengan más de 20 pedidos
-- 1. Relacionamos a vendedores y reseñas de forma única
WITH reviews_by_seller AS (
    SELECT 
        orv.review_id,
        oi.seller_id,
        MIN(orv.review_score) AS review_score -- Extraemos el puntaje único de esa reseña
    FROM order_reviews orv
    JOIN order_items oi 
        ON orv.order_id = oi.order_id
    JOIN orders o 
        ON o.order_id = orv.order_id
    WHERE o.order_status = "delivered"
    GROUP BY orv.review_id, oi.seller_id
)

-- 2. Calculamos los puntajes promedio por vendedor
SELECT
    seller_id,
    ROUND(AVG(review_score), 2) AS average_review,
    COUNT(*) AS reviewed_orders
FROM reviews_by_seller
GROUP BY seller_id
HAVING COUNT(*) >= 20
ORDER BY average_review DESC;

-- Review según atraso de entrega
SELECT
    CASE
        WHEN advance_or_delay_days >= 10 THEN '10+ días antes'
        WHEN advance_or_delay_days >= 5 THEN '5-9 días antes'
        WHEN advance_or_delay_days >= 1 THEN '1-4 días antes'
        WHEN advance_or_delay_days = 0 THEN 'A tiempo'
        WHEN advance_or_delay_days >= -4 THEN '1-4 días tarde'
        WHEN advance_or_delay_days >= -9 THEN '5-9 días tarde'
        ELSE '10+ días tarde'
    END AS delivery_performance,
    COUNT(*) AS orders,
    ROUND(AVG(review_score), 2) AS average_review
FROM orders o
JOIN order_reviews r
ON o.order_id=r.order_id
WHERE o.order_status = "delivered"
GROUP BY delivery_performance
ORDER BY
CASE
    WHEN delivery_performance='10+ días antes' THEN 1
    WHEN delivery_performance='5-9 días antes' THEN 2
    WHEN delivery_performance='1-4 días antes' THEN 3
    WHEN delivery_performance='A tiempo' THEN 4
    WHEN delivery_performance='1-4 días tarde' THEN 5
    WHEN delivery_performance='5-9 días tarde' THEN 6
    ELSE 7
END;
