-- Customers
INSERT INTO customers (first_name, last_name, email, phone, date_of_birth)
VALUES
('Ivan', 'Petrov', 'ivan@example.com', '+79990000001', '1995-05-12'),
('Anna', 'Sidorova', 'anna@example.com', '+79990000002', '1998-03-22'),
('Sergey', 'Ivanov', 'sergey@example.com', '+79990000003', '1992-11-05');
-- Categories
INSERT INTO categories (category_name, description)
VALUES
('Electronics', 'Electronic devices'),
('Accessories', 'Device accessories');
-- Products
INSERT INTO products (product_name, description, price, stock_quantity)
VALUES
('Smartphone', 'Android smartphone', 30000.00, 50),
('Headphones', 'Wireless headphones', 5000.00, 100),
('Phone Case', 'Protective case', 1500.00, 200);
-- Product Categories
INSERT INTO product_categories (product_id, category_id)
VALUES
(1, 1),
(2, 1),
(3, 2);
-- Orders
INSERT INTO orders (customer_id, status, total_amount, delivery_method)
VALUES
(1, 'paid', 35000.00, 'courier'),
(2, 'paid', 5000.00, 'pickup');
-- Order Items
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase)
VALUES
(1, 1, 1, 30000.00),
(1, 3, 1, 1500.00),
(2, 2, 1, 5000.00);
-- Payments
INSERT INTO payments (order_id, amount, payment_method, status)
VALUES
(1, 35000.00, 'card', 'success'),
(2, 5000.00, 'card', 'success');
