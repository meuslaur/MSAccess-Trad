CREATE TABLE [T_TradTexte] (
  [Trad_ID] VARCHAR (80),
  [PropNom] VARCHAR (30),
  [PropTexte] VARCHAR (255),
  [LangueCode] LONG  CONSTRAINT [T_LanguesT_TradTexte] REFERENCES [T_Langues] ([LangueCode]) ON UPDATE CASCADE  ON DELETE CASCADE ,
  [DateMaJ] DATETIME ,
  [DefLangue] BIT ,
   CONSTRAINT [PrimaryKey] PRIMARY KEY ([Trad_ID], [PropNom])
)
