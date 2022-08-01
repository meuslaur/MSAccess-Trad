CREATE TABLE [T_Objets] (
  [Objet_ID] LONG  CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [ObjetNom] VARCHAR (50),
  [ObjetType] VARCHAR (30),
  [IDApp] VARCHAR (50),
  [Scanner] BIT ,
  [Nouveau] BIT 
)
