CREATE TABLE [T_App] (
  [AppGuid] VARCHAR (50) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [AppNom] VARCHAR (100),
  [CodeLangOrigine] LONG ,
  [DernierScan] DATETIME 
)
