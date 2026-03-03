# Online Store Database (PostgreSQL)

## Project Goal
Design and implement a relational database schema for an online store using PostgreSQL.

The project demonstrates:
- Database normalization
- One-to-Many and Many-to-Many relationships
- Foreign key constraints
- Data integrity rules (CHECK, UNIQUE, CASCADE)
- Analytical SQL queries

---

## Database Structure

### Core Entities
- Customers
- Products
- Categories
- Orders
- Payments

### Relationship Tables
- Order_Items (1:N)
- Product_Categories (N:N)

---

## Data Integrity

- Foreign keys with `ON DELETE CASCADE` and `ON DELETE RESTRICT`
- CHECK constraints for non-negative values
- UNIQUE constraints for emails and product-order pairs
- Composite primary key for many-to-many relationship

### Performance Optimization

The database includes indexes to improve query performance:

- Index on `orders(customer_id)` for fast customer order lookup  
- Index on `orders(order_date)` for time-based analytics  
- Index on `order_items(product_id)` for product sales analysis  
- Index on `payments(order_id)` for payment tracking  

Indexes ensure efficient execution of analytical queries on large datasets.
---
## Example Analytics

The project includes analytical SQL queries demonstrating business insights:

- Total revenue calculation
- Top customers by revenue
- Best-selling products
- Monthly revenue aggregation
- Payment success rate

These queries illustrate how the database can be used for real-world business analytics.

---

## Tech Stack

- PostgreSQL
- DBeaver
- SQL (DDL + analytical queries)

---

## How to Run

1. Create a PostgreSQL database
2. Execute `create_tables.sql`
3. Run analytical queries from `sample_queries.sql`
