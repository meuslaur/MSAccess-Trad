CREATE TABLE [USysPPVs] (
  [VariableID] AUTOINCREMENT CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [VariableName] VARCHAR (255),
  [VariableValue] VARCHAR (255),
  [VariableType] UNSIGNED BYTE ,
  [VariableDescription] VARCHAR (255),
  [UserMaintainable] BIT 
)
