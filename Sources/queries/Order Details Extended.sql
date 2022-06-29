SELECT [Order Details].*, CCur([Quantity]*[Unit Price]*(1-[Discount])) AS [Extended Price], [Order Details Status].[Status Name]
FROM [Order Details] LEFT JOIN [Order Details Status] ON [Order Details].[Status ID]=[Order Details Status].[Status ID];
