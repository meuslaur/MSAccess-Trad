CREATE TABLE [T_Objets] (
  [Objet_ID] VARCHAR (80) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [ObjetNom] VARCHAR (50),
  [ObjetType] VARCHAR (30),
  [ObjetApp] VARCHAR (30)
)
