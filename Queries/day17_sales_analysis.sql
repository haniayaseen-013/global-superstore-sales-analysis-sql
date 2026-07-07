--Which sub-category generated the highest total sales?
SELECT "Sub-Category", SUM(Sales) AS total_sales
FROM global_superstore
GROUP BY "Sub-Category"
ORDER BY total_sales DESC
LIMIT 1;
--Which state generated the highest total profit?
SELECT "State", round(SUM(Profit),2) AS total_profit
FROM global_superstore
GROUP BY "State"
ORDER BY total_profit DESC
LIMIT 1;
--Which region has the highest average shipping cost?
SELECT "Region", round(avg("Shipping Cost"),2) AS Average_Shipping_Cost
FROM global_superstore
GROUP BY "Region"
ORDER BY Average_Shipping_Cost DESC
LIMIT 1;
--List all product names whose total sales exceed $5000.
SELECT "Product Name", sum(Sales) AS Total_Sales
FROM global_superstore
GROUP BY "Product Name"
HAVING sum(Sales) > 5000;
--Find the Top 10 most profitable products.
SELECT "Product Name", round(SUM(Profit),2) AS Total_Profit
FROM global_superstore
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;