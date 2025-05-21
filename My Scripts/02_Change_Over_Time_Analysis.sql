/*
=======================================================================
2 - Change Over Time Analysis 
=======================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
=======================================================================
*/

-- Query To Analyse sales performance over time.
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

/* 
The above SQL query summarizes monthly sales performance by extracting the year and month from the order_date column in the gold.fact_sales table. 
It calculates the total sales amount and total quantity of items sold for each month, excluding any records where the order date is missing. 
The results are grouped by year and month, and then sorted chronologically to show how sales and quantity trends change over time.
*/

-- Query to display a quick Date function FORMAT()
SELECT
    FORMAT(order_date, 'yyyy-MMM') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');

/*
The above SQL query generates a monthly summary of sales performance from the gold.fact_sales table. It formats the order_date as 'yyyy-MMM' 
(e.g., 2024-Jan), and for each month, it calculates the total sales amount, total quantity sold, and the number of unique customers (customer_key).
It excludes any records with missing dates and groups the data by the formatted month. 
Finally, it orders the results chronologically by month to show trends over time.
*/
