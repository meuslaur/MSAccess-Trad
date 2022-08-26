CREATE TABLE [T_Objets] (
  [Objet_ID] VARCHAR (100) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [ObjetNom] VARCHAR (50),
  [IDType] LONG ,
  [IDApp] VARCHAR (40),
  [Scanner] BIT ,
  [Nouveau] BIT ,
  [Ignorer] BIT ,
  [TblLink] VARCHAR (100)
)
