CREATE TABLE [aT_LinkTemp] (
  [ID] AUTOINCREMENT CONSTRAINT [PK_tblAccessErrorCodes] PRIMARY KEY UNIQUE NOT NULL,
  [ErrorNumber] LONG ,
  [ErrorDescription] LONGTEXT ,
  [Hyperlink] VARCHAR (100)
)
