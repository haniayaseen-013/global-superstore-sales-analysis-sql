--Find all products whose total profit is greater than the average total profit across all products.
WITH ProductProfit AS
(
    SELECT "Product Name",
           SUM(Profit) AS Total_Profit
    FROM global_superstore
    GROUP BY "Product Name"
)

SELECT *
FROM ProductProfit
WHERE Total_Profit >
(
    SELECT AVG(Total_Profit)
    FROM ProductProfit
);
--Calculate the total sales for each product category then display all categories along with their total sales.
WITH CategorySales AS
(
SELECT "Category", 
       sum(Sales) AS Total_Sales
FROM global_superstore
GROUP BY "Category"
)
SELECT *
FROM CategorySales
ORDER BY Total_Sales DESC;
--Calculate the total profit for each customer segment and display only the segments whose total profit is greater than 50000.
WITH SegmentProfit AS
(
SELECT "Segment", sum(round (Profit,2)) AS Total_Profit
FROM global_superstore
GROUP BY "Segment"
)
SELECT *
FROM SegmentProfit
WHERE  Total_Profit > 50000
ORDER BY Total_Profit DESC;
--Calculate the total sales for each country, then display only the countries whose total sales exceed 500,000, ordered from highest to lowest sales.
WITH CountrySales AS
(
SELECT "Country", sum(Sales) AS Total_Sales
FROM global_superstore
GROUP BY "Country"
)
SELECT *
FROM CountrySales
WHERE  Total_Sales > 500000
ORDER BY Total_Sales DESC;