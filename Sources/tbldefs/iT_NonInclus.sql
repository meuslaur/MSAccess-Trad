﻿CREATE TABLE [iT_NonInclus] (
  [IDApp] VARCHAR (40) CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL CONSTRAINT [T_AppiT_NonInclus] UNIQUE,
  [Nom] VARCHAR (50),
  [Valeur] LONGTEXT ,
  [bType] UNSIGNED BYTE 
)
