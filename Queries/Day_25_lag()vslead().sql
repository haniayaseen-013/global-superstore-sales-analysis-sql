--Display every product along with its total sales and the previous product's total sales when ordered from highest to lowest sales.
SELECT
"Product Name", sum(Sales) AS Total_Sale,
lag (sum(Sales)) OVER (
	ORDER BY sum(Sales) DESC
	) AS Previous_Total_Sale
FROM global_superstore 
GROUP BY "Product Name";
--Display every product along with its total sales and the next product's total sales when ordered from highest to lowest total sales.
SELECT
"Product Name", sum(Sales) AS Total_Sale,
lead (sum(Sales)) OVER (
	ORDER BY sum(Sales) DESC
	) AS Next_Total_Sale
FROM global_superstore 
GROUP BY "Product Name";
-- Calculate the difference between a product's total sales and the previous product's total sales.
SELECT
    "Product Name",
    SUM(Sales) AS Total_Sale,
    LAG(SUM(Sales)) OVER (
        ORDER BY SUM(Sales) DESC
    ) AS Previous_Total_Sale,
    SUM(Sales) -
    LAG(SUM(Sales)) OVER (
        ORDER BY SUM(Sales) DESC
    ) AS Difference
FROM global_superstore
GROUP BY "Product Name";