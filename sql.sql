#create a datacase
-- CREATE DATABASE e_commerce;

#create a customer table 
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

#create a table for products table
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


#create a order detail table
-- CREATE TABLE order_details (
--    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
--    order_id INT,
--    product_id INT,
--    quantity INT,
--    price DECIMAL(10, 2),
--    FOREIGN KEY (order_id) REFERENCES orders(order_id),
--    FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );
-- INSERT INTO customer (first_name, last_name, email, phone_number, address, city, state, zip_code)
-- VALUES 
-- ('John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Elm St', 'New York', 'NY', '10001'),
-- ('Jane', 'Smith', 'janesmith@example.com', '987-654-3210', '456 Maple Ave', 'Los Angeles', 'CA', '90001'),
-- ('Alice', 'Johnson', 'alicej@example.com', '555-555-5555', '789 Oak St', 'Chicago', 'IL', '60601'),
-- ('Bob', 'Brown', 'bobb@example.com', '444-444-4444', '321 Pine St', 'Houston', 'TX', '77001');

-- INSERT INTO products (product_name, product_description, price, stock_quantity, inventory_date)
-- VALUES
-- ('Laptop', '15-inch laptop with 8GB RAM and 256GB SSD', 799.99, 10, '2024-11-01'),
-- ('Headphones', 'Noise-cancelling over-ear headphones', 199.99, 20, '2024-10-15'),
-- ('Mouse', 'Wireless mouse with ergonomic design', 29.99, 50, '2024-11-10'),
-- ('Keyboard', 'Mechanical keyboard with RGB lighting', 89.99, 30, '2024-09-25');

-- INSERT INTO order_details (order_id, product_id, quantity, price)
-- VALUES 
-- (1, 1, 1, 799.99),  
-- (1, 2, 2, 199.99),   
-- (1, 3, 1, 29.99);   
  
-- Insert into order_details table
INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 799.99),  -- 1 Laptop at $799.99 (Order 1, Product 1)
(1, 2, 2, 199.99),  -- 2 Headphones at $199.99 each (Order 1, Product 2)
(1, 3, 1, 29.99),   -- 1 Wireless Mouse at $29.99 (Order 1, Product 3)
(2, 2, 3, 199.99),  -- 3 Headphones at $199.99 each (Order 2, Product 2)
(2, 4, 1, 89.99),   -- 1 Keyboard at $89.99 (Order 2, Product 4)
(3, 5, 2, 699.99),  -- 2 Smartphones at $699.99 each (Order 3, Product 5)
(3, 1, 1, 799.99),  -- 1 Laptop at $799.99 (Order 3, Product 1)
(3, 3, 3, 29.99),   -- 3 Wireless Mice at $29.99 each (Order 3, Product 3)
(3, 4, 2, 89.99);   -- 2 Keyboards at $89.99 each (Order 3, Product 4)


#testing the custmer table 
-- SELECT * FROM customer;

#testing the order_details table 
-- SELECT * FROM order_details;

#testing the products table
--  SELECT * FROM products;

#testing the orders table 
-- SELECT * FROM orders;


-- Join 'orders' and 'customers' to get order details with customer information
SELECT 
    o.order_id,          
    o.order_date,        
    o.order_status,      
    o.total_amount,      
    c.first_name,         
    c.last_name,         
    c.email               
FROM 
    orders o              
JOIN 
    customer c ON o.customer_id = c.customer_id;

-- Join 'order_details', 'orders', and 'products' to get order line items
SELECT 
    od.order_detail_id,       
    od.order_id,               
    od.product_id,             
    p.product_name,            
    od.quantity,               
    od.price,                  
    (od.quantity * od.price) AS total_price  
FROM 
    order_details od           
JOIN 
    orders o ON od.order_id = o.order_id  
JOIN 
    products p ON od.product_id = p.product_id;

-- Calculate total revenue per customer by summing order amounts
SELECT 
    c.customer_id,             
    c.first_name,              
    c.last_name,               
    SUM(o.total_amount) AS total_revenue  
FROM 
    orders o                   
JOIN 
    customer c ON o.customer_id = c.customer_id  
GROUP BY 
    c.customer_id, c.first_name, c.last_name;

-- Calculate total revenue for all orders
SELECT 
    SUM(total_amount) AS total_revenue  
FROM 
    orders;

-- Calculate the average order value
SELECT 
    AVG(total_amount) AS average_order_value  
FROM 
    orders;

-- Count the number of orders per customer
SELECT 
    c.customer_id,             
    c.first_name,              
    c.last_name,               
    COUNT(o.order_id) AS number_of_orders  
FROM 
    orders o                   
JOIN 
    customer c ON o.customer_id = c.customer_id  
GROUP BY 
    c.customer_id, c.first_name, c.last_name;

#Reflection Questions

#How do primary and foreign keys help maintain data integrity?
-- Primary keys ensure unique records, and foreign keys link related data across tables.

#What insights can be gained by joining multiple tables?
-- Joining tables combines data to understand customer behavior, product sales, etc.

#How can aggregate functions summarize data?
-- Aggregate functions calculate totals, averages, or counts to simplify data analysis.

#What types of analyses are enabled by date functions?
-- Date functions help analyze trends, group data by time, and compare performance over periods.

#How might you extend this database for additional e-commerce features?
-- Add tables for user accounts, payments, shipping, discounts, reviews, and inventory.
