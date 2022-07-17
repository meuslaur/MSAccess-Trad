CREATE TABLE [T_TradTexte] (
  [Trad_ID] VARCHAR (100),
  [PropNom] VARCHAR (30),
  [PropTexte] LONGTEXT ,
  [LangueCode] LONG  CONSTRAINT [{9788F2E5-B4B4-4BAD-95EC-41B22F0149ED}] REFERENCES [T_Langues] ([LangueCode]) ON UPDATE CASCADE  ON DELETE CASCADE ,
  [DateMaJ] DATETIME ,
  [DefLangue] BIT ,
   CONSTRAINT [PrimaryKey] PRIMARY KEY ([Trad_ID], [PropNom])
)
