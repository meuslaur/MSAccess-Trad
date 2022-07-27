CREATE TABLE [T_Objets] (
  [ObjetGuid] VARCHAR (50) CONSTRAINT [ObjetGuid] UNIQUE CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [ObjetNom] VARCHAR (50),
  [ObjetType] VARCHAR (30),
  [AppGuid] VARCHAR (50) CONSTRAINT [T_AppT_Objets] REFERENCES [T_App] ([AppGuid]) ON UPDATE CASCADE  ON DELETE CASCADE ,
  [Scanner] BIT ,
  [Nouveau] BIT 
)
