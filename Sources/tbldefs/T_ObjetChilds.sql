CREATE TABLE [T_ObjetChilds] (
  [Child_ID] VARCHAR (100) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [ChildNom] VARCHAR (50),
  [ChildType] VARCHAR (30),
  [IDObjet] VARCHAR (100),
  [ControlParentName] VARCHAR (50),
  [Scanner] BIT ,
  [Nouveau] BIT ,
  [Ignorer] BIT 
)
