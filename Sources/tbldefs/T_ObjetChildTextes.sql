CREATE TABLE [T_ObjetChildTextes] (
  [Prop_ID] VARCHAR (100) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [PropNom] VARCHAR (30),
  [PropTexte] LONGTEXT ,
  [IDChild] VARCHAR (100),
  [DateMaJ] DATETIME ,
  [ModPropTexte] BIT ,
  [Scanner] BIT ,
  [Nouveau] BIT 
)
