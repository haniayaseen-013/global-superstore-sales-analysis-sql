-- Question#01 Display every product along with its total sales and assign a row number based on the highest total sales.
SELECT "Product Name", sum(Sales) AS Total_Sales,
row_number() OVER(ORDER BY sum(Sales) DESC) AS row_num
FROM global_superstore
GROUP BY "Product Name";
-- Question#02 Display every product along with its total profit and assign a rank based on the highest total profit.
SELECT "Product Name", sum(Profit) AS Total_Profit,
rank() OVER(ORDER BY sum(Profit) DESC) AS Profit_Rank
FROM global_superstore
GROUP BY "Product Name";
-- Question#02 Display every product along with its total profit and assign a rank based on the highest total profit.
SELECT "Product Name", sum(Profit) AS Total_Profit,
dense_rank() OVER(ORDER BY sum(Profit) DESC) AS Profit_Rank
FROM global_superstore
GROUP BY "Product Name";