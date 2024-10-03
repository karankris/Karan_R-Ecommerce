create database ecommerce;
use ecommerce;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(25) NOT NULL
);

-- Inserting 5 rows into customers table
INSERT INTO customers (customer_id, name, email, password) VALUES
(1, 'Vijai', 'vijai@gmail.com', 'Vijai@123'),
(2, 'Karan', 'karan@gmail.com', 'karan@456'),
(3, 'Kamal', 'kamal@gmail.com', 'kamal@124'),
(4, 'Vikram', 'vikram@gmail.com', 'vikram@789'),
(5, 'David', 'david@gmail.com', 'david@123');

select * from customers;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    stockQuantity INT NOT NULL
);

-- Inserting 5 rows into products table
INSERT INTO products (product_id, name, price, description, stockQuantity) VALUES
(1, 'Laptop', 120000.00, 'High performance laptop', 10),
(2, 'Smartphone', 18000.00, 'Latest model smartphone', 25),
(3, 'Headphones', 1500.00, 'Noise-cancelling headphones', 50),
(4, 'Smartwatch', 2500.00, 'Fitness tracking smartwatch', 30),
(5, 'Tablet', 60000.00, '10-inch display tablet', 15);

select * from products;

CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Inserting 5 rows into cart table
INSERT INTO cart (cart_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 5, 2);

select * from cart;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    shipping_address VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Inserting 5 rows into orders table
INSERT INTO orders (order_id, customer_id, order_date, total_price, shipping_address) VALUES
(1, 1, '2024-09-01', 240000.00, '123 Main St, Chennai'),
(2, 2, '2024-09-02', 18000.00, '456 Oak St, Banglore'),
(3, 3, '2024-09-03', 45000.00, '789 Pine St, Delhi'),
(4, 4, '2024-09-04', 2500.00, '101 Maple St, Chennai'),
(5, 5, '2024-09-05', 12000.00, '202 Cedar St, Delhi');

select * from orders;

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Inserting 5 rows into order_items table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 5, 2);

select * from order_items;

SELECT SUM(quantity) AS total_quantity
FROM cart
WHERE customer_id = 1;

SELECT SUM(quantity) AS total_products_sold
FROM order_items;

SELECT AVG(quantity) AS average_products_per_order
FROM order_items;

SELECT * FROM cart
WHERE customer_id = 2;

SELECT product_id, name, price
FROM products
WHERE stockQuantity = 10;