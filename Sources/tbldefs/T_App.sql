CREATE TABLE [T_App] (
  [App_ID] VARCHAR (40) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [AppNom] VARCHAR (100),
  [AppFullPath] VARCHAR (255),
  [LangueCodeBase] LONG ,
  [DernierScan] DATETIME ,
  [Num] AUTOINCREMENT
)
