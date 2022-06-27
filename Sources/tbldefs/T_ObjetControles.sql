CREATE TABLE [T_ObjetControles] (
  [Control_ID] VARCHAR (80) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [ControlNom] VARCHAR (50),
  [ControlType] VARCHAR (30),
  [ObjetParent_ID] VARCHAR (80),
  [ControlParentName] VARCHAR (50)
)
