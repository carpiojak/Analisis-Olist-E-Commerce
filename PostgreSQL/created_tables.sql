-- Tabla de clientes
CREATE TABLE customers (
    customer_unique_id INT,
    customer_zip_code_prefix INT,
    customer_city VARCHAR(50),
    customer_state VARCHAR(50),
    PRIMARY KEY (customer_unique_id)
);

-- Tabla de vendedores
CREATE TABLE sellers (
    seller_id INT,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(50),
    seller_state VARCHAR(50),
    PRIMARY KEY (seller_id)
);

-- Tabla de pedidos
CREATE TABLE orders (
    order_id INT,
    customer_unique_id INT,
    order_status VARCHAR(20),
    order_purchase_timestamp DATE,
    order_approved_at DATE,
    order_delivered_carrier_date DATE,
    order_delivered_customer_date DATE,
    order_estimated_delivery_date DATE,
    delivery_days INT,
    advance_or_delay_days INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_unique_id) REFERENCES customers(customer_unique_id)
);

-- Tabla de reseñas de pedidos
CREATE TABLE order_reviews (
    review_id INT,
    order_id INT,
    review_score INT,
    review_comment_title VARCHAR(50),
    review_comment_message VARCHAR(300),
    review_creation_date DATE,
    PRIMARY KEY (review_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Tabla de productos
CREATE TABLE products (
    product_id INT,
    product_category_name VARCHAR(50),
    product_weight_g FLOAT CHECK (product_weight_g >= 0),
    product_vol_cm3 FLOAT CHECK (product_vol_cm3 >= 0),
    PRIMARY KEY (product_id)
);

-- Tabla de items de pedidos
CREATE TABLE order_items (
    order_id INT,
    order_item_id INT,
    product_id INT,
    seller_id INT,
    shipping_limit_date DATE,
    price FLOAT CHECK (price >= 0),
    freight_value FLOAT CHECK (freight_value >= 0),
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

-- Tabla de pagos de pedidos
CREATE TABLE order_payments (
    order_id INT,
    payment_sequential INT,
    payment_type VARCHAR(20),
    payment_installments INT,
    payment_value FLOAT CHECK (payment_value >= 0),
    PRIMARY KEY (order_id, payment_sequential),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
