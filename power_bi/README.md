# Power BI Measures & Calculated Columns

## Dashboard Overview

![Power BI Dashboard](dashboard_screenshot.png)

*Interactive dashboard showing customer behavior metrics, order trends, and retention analysis*

---

This file documents the calculated measures and columns created in Power BI to support customer behavior and retention analysis. These were built on top of the PostgreSQL dataset after establishing table relationships.

## Measures Created

### Total Revenue

```DAX
Total Revenue = 
SUM(order_items[price]) + SUM(order_items[freight_value])
```

**Purpose:** Calculates total revenue including product price and shipping costs.

---

### Total Orders

```DAX
Total Orders = 
DISTINCTCOUNT(orders[order_id])
```

**Purpose:** Counts unique orders placed.

---

### Average Order Value

```DAX
Avg Order Value = 
DIVIDE([Total Revenue], [Total Orders])
```

**Purpose:** Measures the average revenue generated per order.

---

### Total Customers

```DAX
Total Customers = 
DISTINCTCOUNT(customers[customer_id])
```

**Purpose:** Counts unique customers in the dataset.

---

### Average Review Score

```DAX
Avg Review Score = 
AVERAGE(order_reviews[review_score])
```

**Purpose:** Evaluates overall customer satisfaction.

---

## Calculated Columns

### Order Month

```DAX
Order Month = 
FORMAT(orders[order_purchase_timestamp], "YYYY-MM")
```

**Purpose:** Enables monthly trend analysis of orders.

---

### Customer Type

```DAX
Customer Type = 
IF(
    CALCULATE(
        COUNT(orders[order_id]),
        ALLEXCEPT(customers, customers[customer_id])
    ) > 1,
    "Repeat",
    "One-Time"
)
```

**Purpose:** Classifies customers as one-time or repeat buyers.

---

## Dashboard Filters (Slicers)

The following slicers were added to enable interactive exploration:

- **Order Status** — Filter by delivered, canceled, shipped, etc.
- **Order Purchase Date (Date Range)** — Filter by specific time periods

These filters allow stakeholders to interactively explore trends across different time periods and order states.

---

## How These Support Analysis

### Revenue Tracking

The Total Revenue and Average Order Value measures provide immediate visibility into business performance and help identify revenue trends over time.

### Retention Analysis

The Customer Type column enables segmentation of one-time versus repeat customers, revealing retention challenges and opportunities for loyalty initiatives.

### Customer Segmentation

By combining measures like Total Customers with filters on order status and date range, analysts can identify high-value customer segments and tailor marketing strategies accordingly.

### Interactive Dashboards

All measures and columns work together to create interactive Power BI dashboards suitable for executive review, allowing business leaders to drill down into specific time periods, order statuses, and customer behaviors.

---

## Outcome

These measures and columns enabled:

- Revenue tracking across time periods
- Retention analysis comparing one-time vs repeat buyers
- Customer segmentation for targeted marketing
- Interactive Power BI dashboards suitable for executive review
- Data-driven business recommendations

---

## Notes on DAX Best Practices

This project follows Power BI best practices:

- Measures are used for aggregations that change with filter context
- Calculated columns are used for row-level classifications
- DIVIDE function prevents division by zero errors
- DISTINCTCOUNT ensures accurate counting of unique entities
- FORMAT function enables proper time-based grouping

---

**Last Updated:** February 2026  
**Created For:** Customer Behavior & Retention Analysis Project
