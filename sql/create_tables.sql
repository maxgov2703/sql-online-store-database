--schema
-- 1. Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- 2. Categories
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,
    parent_category_id INTEGER,
    CONSTRAINT fk_parent_category
        FOREIGN KEY (parent_category_id)
        REFERENCES categories(category_id)
        ON DELETE SET NULL
);
-- 3. Products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);
-- 4. Product_Categories (N:N)
CREATE TABLE product_categories (
    product_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,  
    PRIMARY KEY (product_id, category_id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE CASCADE
);
-- 5. Orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL CHECK (total_amount >= 0),
    delivery_method VARCHAR(100),
    store_id INTEGER,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT
);
-- 6. Order_Items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(10,2) NOT NULL CHECK (price_at_purchase >= 0), 
    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_order_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON DELETE RESTRICT,
    CONSTRAINT unique_order_product
        UNIQUE (order_id, product_id)
);
-- 7. Payments
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(12,2) NOT NULL CHECK (amount >= 0),
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,  
    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE
);
