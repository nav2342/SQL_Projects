# REQUEST - 2

-- What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields

-- unique_products_2020 
-- unique_products_2021 
-- percentage_chg 

WITH `2020` AS (SELECT 
    COUNT(DISTINCT(product_code)) AS unique_products_2020
FROM fact_sales_monthly
WHERE fiscal_year = 2020),
`2021` AS (SELECT
    COUNT(DISTINCT(product_code)) AS unique_products_2021
FROM fact_sales_monthly
WHERE fiscal_year = 2021)
SELECT *,
	ROUND(((unique_products_2021 - unique_products_2020) / unique_products_2020) * 100, 2) AS percentage_chg
FROM `2020`
JOIN `2021`;