-- Which customer has generated the highest total sales?
SELECT  "Customer ID","Customer Name", SUM(Sales) AS total_sales
FROM global_superstore
GROUP by "Customer ID","Customer Name"
ORDER BY total_sales DESC
LIMIT 1;
-- Which customer has placed the highest number of orders?
SELECT  "Customer ID","Customer Name", count("Order ID") AS total_orders
FROM global_superstore
GROUP by "Customer ID","Customer Name"
ORDER BY total_orders DESC
LIMIT 1;
-- Which customer has the highest average order value?
SELECT  "Customer ID","Customer Name", avg("Sales") AS average_sales
FROM global_superstore
GROUP by "Customer ID","Customer Name"
ORDER BY average_sales DESC
LIMIT 1;
--Which shipping mode is used most frequently?
SELECT "ship mode", count(*) AS frequent_ship_mode 
FROM global_superstore
GROUP BY "Ship Mode"
ORDER BY  frequent_ship_mode DESC
LIMIT 1;
--Which customer segment generated the highest total profit?
SELECT Segment,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY Segment
ORDER BY Total_Profit DESC
LIMIT 1;