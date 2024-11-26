# E-Commerce Database Schema

This project outlines a basic database schema for an e-commerce store using MySQL. The schema is designed to manage customers, products, orders, and order details. It includes tables for storing customer data, product inventory, and order information, as well as the relationships between these tables.

## Schema Overview

The schema consists of the following tables:

1. **Customers**: Stores customer information.
2. **Products**: Stores product details and inventory.
3. **Orders**: Tracks customer orders.
4. **Order Details**: Stores the specifics of products within each order.

---

## Tables

### 1. Customers Table

Stores customer details such as name, contact information, and registration date.

| Column             | Description                                             |
|--------------------|---------------------------------------------------------|
| `customer_id`      | Unique identifier for each customer (auto-increment).   |
| `first_name`       | Customer's first name.                                  |
| `last_name`        | Customer's last name.                                   |
| `email`            | Customer's email address (unique).                      |
| `phone_number`     | Customer's phone number.                                |
| `address`          | Customer's address.                                     |
| `city`             | City of residence.                                      |
| `state`            | State of residence.                                     |
| `zip_code`         | Customer's zip code.                                    |
| `registration_date`| Date and time the customer registered (default: current timestamp). |

---

### 2. Products Table

Stores product details, including pricing and stock quantity.

| Column          | Description                                             |
|-----------------|---------------------------------------------------------|
| `product_id`    | Unique identifier for each product (auto-increment).    |
| `name`          | Name of the product.                                    |
| `description`   | Detailed product description.                           |
| `price`         | Price of the product (up to two decimal places).        |
| `stock_quantity`| Quantity of the product in stock.                       |
| `date_added`    | Date the product was added to the inventory.            |

---

### 3. Orders Table

Tracks orders placed by customers, including status and total amount.

| Column        | Description                                                |
|---------------|------------------------------------------------------------|
| `order_id`    | Unique identifier for each order (auto-increment).         |
| `customer_id` | Links to the `customer_id` in the Customers table (foreign key). |
| `order_date`  | Date and time the order was placed.                        |
| `order_status`| Current status of the order (Pending, Shipped, Delivered, Cancelled). |
| `total_amount`| Total price of the order.                                  |

---

### 4. Order Details Table

Stores specifics of each product included in an order.

| Column          | Description                                             |
|-----------------|---------------------------------------------------------|
| `order_detail_id`| Unique identifier for each order item (auto-increment).|
| `order_id`      | Links to the `order_id` in the Orders table (foreign key).|
| `product_id`    | Links to the `product_id` in the Products table (foreign key). |
| `quantity`      | Quantity of the product ordered.                        |
| `price`         | Price of the product at the time of the order.          |

---

## Relationships

1. **Orders → Customers**:
   - Linked via the `customer_id` foreign key.
   - Tracks which customer placed each order.

2. **Order Details → Orders and Products**:
   - Linked via the `order_id` and `product_id` foreign keys.
   - Tracks products in each order and their respective quantities.

---

## Sample Queries

### 1. Get All Orders for a Specific Customer
```sql
SELECT order_id, order_date, total_amount, order_status
FROM orders
WHERE customer_id = 1;







# Installation Guide for E-Commerce Application

This guide explains how to set up your e-commerce database and application.

---

## Step 1: Install Required Tools

### a. Install SQL Server

1. **Download SQL Server**:
   - Visit the [SQL Server Downloads](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) page.
   - Choose **SQL Server Community Edition**.
2. **Run the Installer**:
   - Select **Full Installation**.

---

### b. Install Node.js and npm

1. **Download Node.js**:
   - Visit the [Node.js Downloads](https://nodejs.org/en/download/) page.
   - Install the **LTS version**.
2. **Verify Installation**:
   ```bash
   node -v
   npm -v
# Installation Steps

## c. Install Git

1. **Download Git** from the [official page](https://git-scm.com/).
2. **Configure Git**:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "youremail@example.com"

## Step 2: Clone the GitHub Repository

```bash
git clone <repository_url>
cd <repository_name>

## Step 3: Set Up the Application

### Install Dependencies

```bash
npm install

### Configure the `.env` File

Create a `.env` file in the project root with the following content:

```env
DB_HOST=localhost
DB_PORT=3306
DB_NAME=database_name
DB_USER=root
DB_PASSWORD=database_password
PORT=3000

## Step 4: Run the Application

### Start the Application

```bash
npm run dev
### Test the App

Visit [http://localhost:3000](http://localhost:3000) in your browser.


# Reflection Questions

## How do primary and foreign keys help maintain data integrity?
- **Primary keys** ensure unique records.
- **Foreign keys** link related data across tables.

## What insights can be gained by joining multiple tables?
- Joining tables combines data to understand customer behavior, product sales, etc.

## How can aggregate functions summarize data?
- Aggregate functions calculate totals, averages, or counts to simplify data analysis.

## What types of analyses are enabled by date functions?
- Date functions help analyze trends, group data by time, and compare performance over periods.

## How might you extend this database for additional e-commerce features?
- Add tables for user accounts, payments, shipping, discounts, reviews, and inventory.

