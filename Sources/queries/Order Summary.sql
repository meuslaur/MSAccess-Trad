SELECT Orders.[Order ID], Orders.[Employee ID], Orders.[Customer ID], Orders.[Order Date], Orders.[Shipped Date], [Order Price Totals].[Price Total] AS [Sub Total], Orders.[Shipping Fee], Orders.Taxes, [Sub Total]+[Shipping Fee]+[Taxes] AS [Order Total], Orders.[Ship Name], Orders.[Ship Address], Orders.[Paid Date], [Orders Status].[status name] AS Status
FROM [Orders Status] RIGHT JOIN (Orders LEFT JOIN [Order Price Totals] ON Orders.[Order ID]=[Order Price Totals].OrderID) ON [Orders Status].[Status ID]=Orders.[Status ID]
ORDER BY Orders.[Order ID] DESC;
