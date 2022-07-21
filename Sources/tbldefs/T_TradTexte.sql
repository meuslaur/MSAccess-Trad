CREATE TABLE [T_TradTexte] (
  [Trad_ID] VARCHAR (100),
  [PropNom] VARCHAR (30),
  [PropTexte] LONGTEXT ,
  [LangueCode] LONG  CONSTRAINT [{42B9E965-3965-4A62-B8E2-C08F096C8C7C}] REFERENCES [T_Langues] ([LangueCode]) ON UPDATE CASCADE  ON DELETE CASCADE ,
  [DateMaJ] DATETIME ,
  [DefLangue] BIT ,
  [ModPropTexte] BIT ,
  [Scanner] BIT ,
  [Nouveau] BIT ,
   CONSTRAINT [PrimaryKey] PRIMARY KEY ([Trad_ID], [PropNom])
)
