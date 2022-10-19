SELECT *
FROM sales_data;

--TIME-PROFIT ANALYSIS

--a.Total profit made by BuyBuy from 1Q11 to 4Q16(all quarters of every year)
-- The profit is calculated as a difference between the revenue generated and the cost used.
SELECT SUM(revenue - cost) AS "Total_profit"
FROM sales_data;


--b. Total profit made by BuyBuy in Q2 of every year from 2011 to 2016
-- A years is divided into 4 quarters, hence the second quarter start on 01-April to 30-June 
-- of each year.
SELECT 
			CASE
				WHEN data_sales.sales_date BETWEEN '2011-04-01' And '2011-06-30' THEN '2Q2011'
				WHEN data_sales.sales_date BETWEEN '2012-04-01' And '2012-06-30' THEN '2Q2012'
				WHEN data_sales.sales_date BETWEEN '2013-04-01' And '2013-06-30' THEN '2Q2013'
				WHEN data_sales.sales_date BETWEEN '2014-04-01' And '2014-06-30' THEN '2Q2014'
				WHEN data_sales.sales_date BETWEEN '2015-04-01' And '2015-06-30' THEN '2Q2015'
				WHEN data_sales.sales_date BETWEEN '2016-04-01' And '2016-06-30' THEN '2Q2016'
			ELSE 'Others'
			END AS Quarter,
			SUM(data_sales.revenue - data_sales.cost) Profit
FROM sales_data data_sales
GROUP BY Quarter
ORDER BY Quarter


--c.Annual profit made by BuyBuy from the year 2011 to 2016
SELECT sales_year, SUM(revenue - cost) AS Annual_profit
FROM sales_data
GROUP BY sales_year
ORDER BY sales_year;


--REGION-PROFIT ANALYSIS

--a. Write 2 queries that return the countries where BuyBuy has made the 
--most profit and also the least profit of all-time. Your query must 
--display both results on the same output.
SELECT cus_country, SUM(revenue - cost) AS Profit
FROM sales_data
GROUP BY cus_country
ORDER BY Profit DESC;


--b. Top-10 most profitable countries for BuyBuy sales operations from
--2011 to 2016
SELECT cus_country, SUM(revenue - cost) AS Profit
FROM sales_data
GROUP BY cus_country
ORDER BY Profit DESC
LIMIT 10;


--c. Top-10 least profitable countries for BuyBuy sales operations
SELECT cus_country, SUM(revenue - cost) AS Profit
FROM sales_data
GROUP BY cus_country
ORDER BY Profit ASC
LIMIT 10;


--PRODUCT-REVENUE ANALYSIS

--a. Rank all product categories sold by Buybuy, from least amount to
--the most amount of all-time revenue generated
SELECT prod_category, SUM(revenue) AS Revenue
FROM sales_data
GROUP BY prod_category
ORDER BY Revenue ASC;


--b. Top-2 product categories offered by Buybuy with an all-time high
--number of units sold
SELECT prod_category, SUM(ord_quantity) AS Units_sold
FROM sales_data
GROUP BY prod_category
ORDER BY Units_sold DESC
LIMIT 2;
	
	
--c. Top 10 highest-grossing products sold by BuyBuy based on all-time
--profits
SELECT product, SUM(revenue - cost) AS Profit
FROM sales_data
GROUP BY product
ORDER BY Profit DESC
LIMIT 10;