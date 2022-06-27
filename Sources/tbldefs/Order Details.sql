CREATE TABLE [Order Details] (
  [ID] AUTOINCREMENT CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [Order ID] LONG ,
  [Product ID] LONG ,
  [Quantity] VARCHAR ,
  [Unit Price] CURRENCY ,
  [Discount] DOUBLE ,
  [Status ID] LONG ,
  [Date Allocated] DATETIME ,
  [Purchase Order ID] LONG ,
  [Inventory ID] LONG 
)
