# 🛒 Walmart Sales Data Analysis using PostgreSQL

## 📌 Project Overview

This project focuses on analyzing Walmart sales data using SQL in PostgreSQL to generate meaningful business insights. The analysis covers sales performance, customer behavior, payment methods, branch performance, product category ratings, revenue trends, and transaction patterns.

The project demonstrates practical SQL skills commonly used in real-world data analyst roles, including:

* Data querying
* Aggregation and grouping
* Window functions
* Common Table Expressions (CTEs)
* Subqueries
* Business KPI analysis
* Revenue trend analysis
* Time-based analysis

---

# 🎯 Objectives

The primary objectives of this project are:

* Analyze Walmart sales transactions
* Identify customer purchasing behavior
* Evaluate branch and category performance
* Discover sales and revenue trends
* Generate business insights using SQL
* Practice real-world business problem-solving 


---

#  Technologies Used

* PostgreSQL
* SQL
* Jupyter Notebook
* Python (Environment Setup)
* pgAdmin

---

#  Dataset Information

The dataset contains Walmart transactional sales data including:

* Branch information
* Product categories
* Payment methods
* Sales quantity
* Revenue
* Profit margin
* Ratings
* Date & time of transactions

---

#  Business Problems Solved 

#  Business Questions Answered

This project aims to solve the following business problems using SQL analysis on Walmart sales data:

1. What are the different payment methods, and how many transactions and quantities were recorded for each?

2. Which product category received the highest average rating in each branch?

3. What is the busiest day for each Walmart branch based on transaction volume?

4. What is the total quantity of items sold for each payment method?

5. What are the average, minimum, and maximum ratings for each category in different cities?

6. Which product categories generate the highest profit?

7. What is the most commonly used payment method in each branch?

8. How are sales distributed across different times of the day (Morning, Afternoon, Evening)?

9. Which branches experienced the highest revenue decrease ratio between 2022 and 2023?

10. How can SQL window functions, CTEs, subqueries, and aggregations be used to generate actionable business insights?

---

#  SQL Concepts Used

* SELECT Statements
* Filtering & Aggregation
* GROUP BY
* ORDER BY
* Window Functions
* Common Table Expressions (CTEs)
* Subqueries
* CASE WHEN
* Date & Time Functions
* Ranking Functions
* Revenue & Profit Calculations


## 1. Payment Method Analysis

* Identified different payment methods
* Calculated total transactions by payment type
* Measured quantity sold per payment method

---

## 2. Highest Rated Category by Branch

* Determined the top-rated product category for each branch
* Calculated average ratings

### Key SQL Concepts:

* Window Functions
* `RANK() OVER()`
* Aggregation

---

## 3. Busiest Day for Each Branch

* Identified the busiest transaction day for every branch

### Key SQL Concepts:

* Date formatting
* `TO_DATE()`
* `TO_CHAR()`
* Window Functions

---

## 4. Quantity Sold by Payment Method

* Calculated total quantity sold using each payment method

### Key SQL Concepts:

* Aggregation
* `SUM()`
* `GROUP BY`

---

## 5. Category Rating Analysis by City

* Calculated:

  * Average rating
  * Minimum rating
  * Maximum rating

## Key SQL Concepts:

* `AVG()`
* `MIN()`
* `MAX()`

---

## 6. Profit Analysis by Category

* Calculated total revenue
* Estimated total profit using profit margin

### Key SQL Concepts:

* Business KPI calculations
* Revenue & profit analysis

---

## 7. Most Common Payment Method by Branch

* Identified the most frequently used payment method in each branch

### Key SQL Concepts:

* CTEs
* Window Functions
* Ranking

---

## 8. Sales Shift Analysis

* Categorized sales into:

  * Morning
  * Afternoon
  * Evening
* Calculated invoice count per shift

### Key SQL Concepts:

* `CASE WHEN`
* Time extraction
* Grouping

---

## 9. Revenue Decrease Analysis

* Compared yearly revenue between 2022 and 2023
* Identified branches with the highest revenue decrease ratio

## Key SQL Concepts:

* CTEs
* Year extraction
* Revenue comparison
* Percentage calculation

---

# Key Skills Demonstrated

* SQL Query Writing
* Data Cleaning & Transformation
* Business Analysis
* Analytical Thinking
* KPI Reporting
* Revenue Analysis
* Time-Series Analysis
* Window Functions
* Subqueries & CTEs

---

#  Future Improvements

Possible future enhancements for this project:


* Automate reporting using Python
* Create ETL pipelines
* Perform predictive sales analysis using Machine Learning
* Deploy dashboards for real-time reporting

---

#  Sample Analysis Areas

* Payment behavior analysis
* Branch performance comparison
* Sales trend analysis
* Revenue insights
* Customer rating analysis
* Shift-based sales analysis



---

# Connect With Me

##  NisHat Tasnim

* LinkedIn: https://www.linkedin.com/in/nishat-tasnim-5b9943251


---

# Conclusion

This project demonstrates practical SQL and business analysis skills by transforming raw Walmart sales data into meaningful insights. It reflects real-world data analyst workflows involving reporting, KPI analysis, and business intelligence problem-solving.
