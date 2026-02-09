# Customer Behavior & Retention Analysis (SQL)

## Project Overview

This project explores customer purchasing behavior, retention patterns, and revenue drivers using SQL and a real-world e-commerce dataset. The goal was to simulate how a data analyst would investigate customer activity, identify repeat purchase behavior, evaluate customer value, and extract actionable business insights from transactional data.

The project follows a full analytics workflow — from raw data ingestion and database modeling to behavioral analysis and business interpretation — using PostgreSQL.

This repository demonstrates practical SQL skills, data modeling, analytical thinking, and the ability to translate query outputs into business insights.

---

## Business Objectives

The analysis was designed to answer key business questions such as:

- How are customers purchasing over time?
- What does customer lifetime value look like?
- How frequently do customers place repeat orders?
- Which customers generate the most revenue?
- What patterns indicate retention or churn risk?
- How do reviews and payment methods relate to revenue?

---

## Dataset Used

**Dataset:** Brazilian E-Commerce Public Dataset by Olist  
**Source:** Public dataset available on Kaggle  
**Why this dataset was chosen:**

- Real-world transactional e-commerce data
- Multiple related tables (customers, orders, items, payments, reviews)
- Suitable for relational database modeling
- Rich enough for retention and behavioral analysis
- Commonly used in professional data analytics portfolios

The dataset contains information on orders, customers, products, payments, and reviews from a Brazilian e-commerce platform.

Only the tables relevant to customer behavior and retention analysis were used in this project.

---

## Tables Used in Analysis

- `customers` — customer location and identifiers  
- `orders` — order lifecycle and timestamps  
- `order_items` — product and pricing details  
- `order_payments` — payment methods and values  
- `order_reviews` — customer satisfaction scores  

These tables were loaded into PostgreSQL and linked using foreign key relationships to create a structured analytical database.

---

## Technical Workflow

### Data Preparation
- Downloaded raw CSV files from the Olist dataset
- Created a PostgreSQL database
- Designed relational tables
- Imported data using CSV load tools
- Corrected schema mismatches during import
- Added primary and foreign key constraints

### Database Modeling
Relationships were created between:

- Customers → Orders
- Orders → Order Items
- Orders → Payments
- Orders → Reviews

This ensured referential integrity and enabled multi-table analysis.

### SQL Analysis Performed

The SQL analysis included:

- Order status distribution
- Revenue aggregation
- Average order value
- Customer lifetime value (CLV)
- Purchase frequency analysis
- Time between customer orders (window functions)
- Monthly order and revenue trends
- Cohort grouping by first purchase month
- Review score vs order value analysis
- Payment method distribution

Advanced SQL features used include:

- JOINs across multiple tables
- Window functions (LAG)
- CTEs (Common Table Expressions)
- Aggregations and grouping
- Cohort-style calculations
- Time-based analysis using timestamps

---

## Key Findings (From Query Results)

- The majority of orders were successfully delivered, indicating strong fulfillment performance.
- Total revenue exceeded **15.8M**, showing meaningful business scale.
- Average order value was approximately **160.58**.
- Customer satisfaction was high, with an average review score of **4.09**.
- Revenue distribution is uneven, with some very high-value orders.
- Most customers appear as one-time buyers under the order-level customer ID structure.
- Payment method usage is concentrated among a few primary payment types.

Detailed results and interpretations are documented in the `/insights` folder.

---

## Repository Structure

```
customer-behavior-retention-analysis-sql/

data/raw/                  → Original CSV datasets
sql/
  01_create_tables.sql
  02_load_data.sql
  03_foreign_keys_and_relationships.sql
  04_exploratory_queries.sql
  04_retention_analysis.sql

insights/
  customer_behavior_insights.md
  05_query_results_summary.md

README.md
```

---

## Tools & Technologies

- PostgreSQL
- SQL
- GitHub
- CSV data processing
- Relational database modeling

---

## What This Project Demonstrates

This project showcases the ability to:

- Work with real-world messy datasets
- Design relational database schemas
- Load and validate data
- Write analytical SQL queries
- Use window functions and CTEs
- Perform customer behavior analysis
- Compute customer lifetime value metrics
- Interpret results in business terms
- Document analytical work clearly

---



