#create a datacase
-- CREATE DATABASE e_commerce;
-- Create the customer table
-- CREATE TABLE customer (
--    customer_id INT AUTO_INCREMENT PRIMARY KEY,
--    first_name VARCHAR(50) NOT NULL,
--    last_name VARCHAR(50) NOT NULL,
--    email VARCHAR(100) UNIQUE,
--    phone_number VARCHAR(15),
--    address VARCHAR(100),
--    city VARCHAR(50),
--    state VARCHAR(50),
--    zip_code VARCHAR(10)
-- );

-- Create the products table
-- CREATE TABLE products (
--    product_id INT AUTO_INCREMENT PRIMARY KEY,
--    product_name VARCHAR(100) NOT NULL,
--    product_description TEXT,
--    price DECIMAL(10, 2),
--    stock_quantity INT,
--    inventory_date DATE
-- );

-- Create the orders table
-- CREATE TABLE orders (
--    order_id INT AUTO_INCREMENT PRIMARY KEY,
--    customer_id INT,
--    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
--    order_status VARCHAR(50),
--    total_amount DECIMAL(10, 2),
--    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
-- );

-- Create the order_details table
-- CREATE TABLE order_details (
--    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
--    order_id INT,
--    product_id INT,
--    quantity INT,
--    price DECIMAL(10, 2),
--    FOREIGN KEY (order_id) REFERENCES orders(order_id),
--    FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );

-- Insert data into the customer table
-- INSERT INTO customer (first_name, last_name, email, phone_number, address, city, state, zip_code)
-- VALUES ('John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Elm St', 'New York', 'NY', '10001');

-- Insert data into the products table
-- INSERT INTO products (product_name, product_description, price, stock_quantity, inventory_date)
-- VALUES 
-- ('Laptop', '15-inch laptop with 8GB RAM and 256GB SSD', 799.99, 10, '2024-11-01'),
-- ('Headphones', 'Noise-cancelling over-ear headphones', 199.99, 20, '2024-10-15'),
-- ('Mouse', 'Wireless mouse with ergonomic design', 29.99, 50, '2024-11-10'),
-- ('Keyboard', 'Mechanical keyboard with RGB lighting', 89.99, 30, '2024-09-25');

-- Insert data into the orders table (assuming customer_id 1)
-- INSERT INTO orders (customer_id, order_status, total_amount)
-- VALUES (1, 'Pending', 1129.96);


-- Insert data into the order_details table (assuming order_id 1 and valid product_ids)
-- INSERT INTO order_details (order_id, product_id, quantity, price)
-- VALUES 
-- (1, 1, 1, 799.99),   -- 1 Laptop at $799.99
-- (1, 2, 2, 199.99),   -- 2 Headphones at $199.99 each
-- (1, 3, 1, 29.99);    -- 1 Mouse at $29.99
--    


-- Testing the customer table
-- SELECT * FROM customer;

-- Testing the order_details table
-- SELECT * FROM order_details;

-- Testing the products table
-- SELECT * FROM products;
-- SELECT * FROM orders WHERE order_id = 1;
