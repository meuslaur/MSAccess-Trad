Attribute VB_Name = "MD_TradUtils"
'@Folder("Dev")
Option Compare Database
Option Explicit

    Public Const DOS_DRAP  As String = "\Flags\"        '// Dossier des drapeaux (sous dossier de l'app).
    Public Const PROP_GUID As String = "TradAccGuid"    '// Nom de la propriété pour stocker le Guid.
    Public Const PROP_NA   As String = "N/A"            '// Indique prop non trouvée.

    Public Const TBL_LINK  As String = "aT_LinkTemp"
    Public Const FRM_LINK  As String = "aF_LinkTemp"
