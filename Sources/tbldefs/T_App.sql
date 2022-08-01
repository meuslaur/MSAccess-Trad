CREATE TABLE [T_App] (
  [App_ID] VARCHAR (50) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [AppNom] VARCHAR (100),
  [LangueCodeBase] LONG ,
  [DernierScan] DATETIME 
)
