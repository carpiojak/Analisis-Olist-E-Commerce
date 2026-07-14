/*VISTA DE VENTAS: vw_sales
Esta será la vista principal para todos los análisis comerciales y financieros.*/
CREATE VIEW vw_sales AS

SELECT

    o.order_id,
    o.customer_unique_id,
    o.order_purchase_timestamp,
    o.order_status,

    oi.order_item_id,
    oi.seller_id,
    oi.product_id,
    oi.price,
    oi.freight_value,

    p.product_category_name,
    p.product_weight_g,
    p.product_vol_cm3

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id;
    
/*VISTA DE LOGÍSTICA Y CALIDAD: vw_delivery_reviews
Aquí reunimos toda la información necesaria para estudiar logística y satisfacción del cliente.*/
CREATE VIEW vw_delivery_reviews AS

SELECT

    o.order_id,
    o.customer_unique_id,

    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    o.delivery_days,
    o.advance_or_delay_days,

    oi.seller_id,
    oi.product_id,

    p.product_category_name,

    r.review_score,
    r.review_creation_date

FROM orders o

JOIN order_reviews r
    ON o.order_id = r.order_id

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id;
    
/*VISTA DE CLIENTES: vw_customers_orders
Enfocada al cliente*/
CREATE VIEW vw_customers_orders AS

SELECT

    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    o.order_id,
    o.order_purchase_timestamp,
    o.order_status

FROM customers c

JOIN orders o
    ON c.customer_unique_id = o.customer_unique_id;