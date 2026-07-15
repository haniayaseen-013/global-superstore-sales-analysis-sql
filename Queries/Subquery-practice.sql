-- Question#01 Find all orders where the Sales value is greater than the average sales of all orders.
SELECT "Order ID",
       Sales
FROM global_superstore
WHERE Sales >
(
    SELECT avg(Sales) 
	FROM global_superstore
);
-- Question#02 Find all products whose Profit is greater than the average profit of all products (individual rows, not total profit).
SELECT "Product Name",
       Profit
FROM global_superstore
WHERE Profit >
(
    SELECT avg(Profit) 
	FROM global_superstore
);
-- Question#03 Find all customers who have placed more orders than the average number of orders per customer.
SELECT "Customer ID",
       COUNT("Order ID") AS Order_Count
FROM global_superstore
GROUP BY "Customer ID"
HAVING COUNT("Order ID") >
(
    SELECT AVG(Order_Count)
    FROM
    (
        SELECT COUNT("Order ID") AS Order_Count
        FROM global_superstore
        GROUP BY "Customer ID"
    )
);
--Question#04 Find all products whose total sales are greater than the average total sales of all products.
SELECT "Product Name",
	sum(Sales) AS Total_Sales
FROM global_superstore	
GROUP BY "Product Name"
HAVING sum(Sales) > 
(
	SELECT avg(Total_Sales)
	FROM
	(
		SELECT sum(Sales) AS Total_Sales
		FROM global_superstore
		GROUP BY "Product Name"
	) AS ProductSales
);
--Question#05 Find all categories whose total profit is greater than the average total profit across all categories using only subqueries.
SELECT Category,
	sum(Profit) AS Total_Profit
FROM global_superstore
GROUP BY Category
HAVING 	sum(Profit) >
(
SELECT avg(Total_Profit)
FROM
	(
		SELECT Category, 
		sum(Profit) AS Total_Profit
		FROM global_superstore
		GROUP BY Category
	) AS CategoryProfit
);