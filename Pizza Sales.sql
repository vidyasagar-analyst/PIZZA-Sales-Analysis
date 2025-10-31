select * from pizza_sales

--KPI's

--Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales 

--Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS 
Avg_Order_value FROM pizza_sales

--Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_sold FROM pizza_sales

--Total order
SELECT COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales

--Average Pizza Per Order
SELECT SUM(quantity)/COUNT(DISTINCT order_id) AS Avg_Pizza_Per_Order FROM pizza_sales 

SELECT CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
AS Avg_Pizza_Per_Order FROM pizza_sales				--change the data type to get exact value

-- Problem Statement

--Daily Trends For Total Orders
SELECT DATENAME(DW,order_date) AS Order_day,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY Total_Orders DESC

--Monthly Trends for Total Orders
SELECT DATENAME(MONTH,order_date) AS Order_Month,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_Orders DESC

--Percentage Of Sales By Category
SELECT pizza_category,SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS Percent_of_Total_Sale
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percent_of_Total_Sale

--Percentage Of Sales By Size
SELECT pizza_size,SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS Percent_Of_Sales_size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percent_Of_Sales_size DESC

--Top 5 Best Seller By Revenue
SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Top 5 Worst Seller By Revenue
SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue 

--Top 5 Best Selling pizza By Quantity
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Top 5 Worst Selling pizza By Quantity
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity 

--Top 5 Best Selling pizza By Orders
SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Top 5 Worst Selling pizza By Orders
SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders 