CREATE TABLE [T_ObjetControles] (
  [ControlGuid] VARCHAR (50) CONSTRAINT [ControlGuid] UNIQUE CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [ControlNom] VARCHAR (50),
  [ControlType] VARCHAR (30),
  [ObjetParentGuid] VARCHAR (50),
  [ControlParentName] VARCHAR (50),
  [Scanner] BIT ,
  [Nouveau] BIT 
)
