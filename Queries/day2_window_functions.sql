-- Question#06 Display every product along with its category and total sales. Assign a row number to each product within its category, ordered by total sales (highest first).
SELECT "Product Name", Category, sum(Sales) AS Total_Sales,
ROW_NUMBER() OVER(
    PARTITION BY Category
    ORDER BY sum(Sales) DESC
) AS row_num 
FROM
global_superstore
GROUP BY Category, "Product Name";
-- Question#07 Display every product along with its category and total sales. Assign a rank to each product within its category, ordered by total sales (highest first).
SELECT "Product Name", Category, sum(Sales) AS Total_Sales,
rank() OVER(
    PARTITION BY Category
    ORDER BY sum(Sales) DESC
) AS Ranking
FROM
global_superstore
GROUP BY Category, "Product Name";
-- Question#08 Display every product along with its category and total sales. Assign a dense rank to each product within its category, ordered by total sales (highest first).
SELECT "Product Name", Category, sum(Sales) AS Total_Sales,
dense_rank() OVER(
    PARTITION BY Category
    ORDER BY sum(Sales) DESC
) AS Ranking
FROM
global_superstore
GROUP BY Category, "Product Name";
-- Question#09 Calculate the total sales for each category using a CTE, then rank the categories from highest to lowest total sales.
WITH Category_Sales_CTE AS 
(
SELECT Category, sum(Sales) AS Total_Sales
FROM global_superstore
GROUP BY Category
)
SELECT
    Category,
    Total_Sales,
    RANK() OVER(ORDER BY Total_Sales  DESC) AS Sales_Rank
FROM Category_Sales_CTE;
-- Question#10 Find the top 3 highest-selling products within each category.
WITH ProductSales AS
(
		SELECT Category, "Product Name", sum(Sales) AS Total_Sales,
		row_number() OVER (PARTITION BY Category ORDER BY sum(Sales) DESC) AS Row_Num
		FROM global_superstore
		GROUP BY Category, "Product Name"
)
SELECT *
FROM ProductSales
WHERE Row_Num <= 3;