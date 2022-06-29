SELECT [Order Details Extended].[Order ID] AS OrderID, Sum([Order Details Extended].[Extended Price]) AS [Price Total]
FROM [Order Details Extended]
GROUP BY [Order Details Extended].[Order ID];
