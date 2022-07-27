CREATE TABLE [T_TradTexte] (
  [CtrParentGuid] VARCHAR (50),
  [PropNom] VARCHAR (30),
  [PropTexte] LONGTEXT ,
  [LangueCode] LONG  CONSTRAINT [T_LanguesT_TradTexte] REFERENCES [T_Langues] ([LangueCode]) ON UPDATE CASCADE ,
  [DateMaJ] DATETIME ,
  [DefLangue] BIT ,
  [ModifTxt] BIT ,
  [Scanner] BIT ,
  [Nouveau] BIT ,
   CONSTRAINT [PrimaryKey] PRIMARY KEY ([CtrParentGuid], [PropNom])
)
