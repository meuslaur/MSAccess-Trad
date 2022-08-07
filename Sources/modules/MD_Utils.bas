Attribute VB_Name = "MD_Utils"
'@Folder("Outils")
' ------------------------------------------------------
' Name     : MD_Utils
' ------------------------------------------------------
' Kind     : Module
' Purpose  : Utilitaires divers.
' Author   : Laurent
' Date     : 18/06/2022 - 14:06
' DateMod  : 06/07/2022 - 17:48
' Requi    : Module MD_FSO
' ------------------------------------------------------
Option Compare Database
Option Explicit

'Declare PtrSafe Function CoCreateGuid Lib "ole32.dll" (Guid As GUID_TYPE) As Long
'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
'// FileDialog type pour la fonction OuvreBoite
    Public Enum T_FileDialogType
        FD_TypeFilePicker = 3
        FD_TypeFolderPicker = 4
        FD_TypeFileOpen = 1
        FD_TypeFileSaveAs = 2
    End Enum
    Public Enum T_FileDialogView
        FD_ViewDetails = 2
        FD_ViewLargeIcons = 6
        FD_ViewList = 1
        FD_ViewPreview = 4
        FD_ViewProperties = 3
        FD_ViewSmallIcons = 7
        FD_ViewThumbnail = 5
        FD_ViewTiles = 9
        FD_ViewWebView = 8
    End Enum

    '// Objets Types. (type table MsysObjets)
    Public Enum E_ObjectTypeNum
        TableLocale = 1
        TableOdbc = 4
        TableLinked = 6
        'T_QueriesType = 5
        ObjetForm = -32768
        ObjetReport = -32764
        'T_MacrosType = -32766
        'T_ModulesType = -32761
    End Enum

    '// Valeur de retour pour les functions.
    Public Enum eReponse
        Faux = 0
        Valide = 1
        Inconnu = 2
        Exist = 3
        Erreur = 5
    End Enum

    Public Const C_TABLE_LOCALE As String = "Table_local"
    Public Const C_TABLE_LINK   As String = "Table_Linked"
'    Public Const C_TABLE_ODBC   As String = "Table_ODBC"
'    Public Const C_QUERY        As String = "Query"
    Public Const C_FORM         As String = "Form"
    Public Const C_REPORT       As String = "Report"
'    Public Const C_MACRO        As String = "Macro"
'    Public Const C_MODULE       As String = "Module"

    Private oRegex  As Object

'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

' ----------------------------------------------------------------
' Procedure Nom:    OuvreBoite
' Sujet:            Ouvre la boite de dialogue fichiers.
' Procedure Kind:   Function
' Procedure Access: Public
' Références:       Microsoft Office 16.0 Object Library
'
'=== Paramètres ===
' sFltDes (String):                 Désignation du filtre (ex: "Fichiers MS Access").
' sFltExt (String):                 Extension a filtrer (ex : "*.accdb;*.txt").
' sTitre (String):                  Titre de la boite.
' sInitialPath (String):            Dossier de départ (defaut oldforlder use or currentapp path).
' lDialogType (MsoFileDialogType):  Type de boite (defaut Files select).
' bReturnFullPath (Boolean):        Retourne ou non le chemin complet (defaut return fullpath/file).
'==================
'
' Return Type:  String
' Author:       Laurent
' Date:         28/04/2022 - 10:51
' ----------------------------------------------------------------
Public Function OuvreBoite(Optional sFltDes As String = "Tous fichiers", _
                           Optional sFltExt As String = "*.*", _
                           Optional sTitre As String, _
                           Optional sInitialPath As String, _
                           Optional eDialogType As T_FileDialogType = FD_TypeFilePicker) As String
On Error GoTo ERR_OuvreBoite

    Dim oFd             As Object
    Dim vSelectedItem   As Variant
    Dim sValRet         As String

    Set oFd = Application.FileDialog(eDialogType)

    '// Se place sur le dossier de la valeur indiquer.
    If (sInitialPath <> vbNullString) Then oFd.InitialFileName = sInitialPath
    
    If (sTitre = vbNullString) Then sTitre = "Sélectionnez un dossier /  fichier"

    With oFd

        .Title = sTitre
        .AllowMultiSelect = False
        .InitialView = FD_ViewDetails

        '// Applique le filtre si pas en mode boite dossier.
        If (eDialogType <> FD_TypeFolderPicker) Then
            .Filters.Clear
            .Filters.Add sFltDes, sFltExt, 1
        End If

        '// Ouvre la boite, récupère la sélection.
        If .Show = True Then
            For Each vSelectedItem In .SelectedItems
                sValRet = vSelectedItem
            Next vSelectedItem

            OuvreBoite = sValRet

        End If
    End With

SORTIE_OuvreBoite:
    Set oFd = Nothing
Exit Function

ERR_OuvreBoite:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "MD_Utils.OuvreBoite"
    Resume SORTIE_OuvreBoite
End Function

' ----------------------------------------------------------------
' Procedure Nom   : GetBackupFileName
' ----------------------------------------------------------------
' Sujet           : Obtenir le nom du fichier pour la sauvegarde.
' Procedure Kind  : Function
' Procedure Access: Public
' Objectif        : Obtenir le nom du fichier pour la sauvegarde
' Usage           :
' Return String   : folder;BaseBackup;Base Chemin et nom complet du fichier de sauvegarde.
'                   Utilisez Split¨pour extraire les valeurs.
'                   i.e : C:\Folder1\Folder2\;MyBdName_BackUp(00).accdb;MyBdName.accdb
'=== Paramètres ===
' sFullPath (String)        : Nom compet (i.e : C:\Forlder\bdName.accdb)
' BackUpFolderName (String) : Sous-Dossier de backup. (defaut 'Backup').
'==================
'// Date     : 5/4/2020
'// DateMod: 31/07/2022 - 13:42
'---------------------------------------------------------------------------------------
Public Function GetBackupFileName(FullPathFile As String, Optional BackUpFolderName As String = "\Backup\") As String
On Error GoTo ERR_GetBackupFileName

    Const BACKUP_FOLDER As String = "\Backup\"
    Const SUFFIX        As String = "_BackUp("

    Dim oFSO        As Object

    Dim sFolder     As String
    Dim sFolderBk   As String
    Dim sFile       As String
    Dim sBase       As String
    Dim sBaseBackUp As String
    Dim sExt        As String
    Dim lFor        As Long
    Dim sTest       As String
    Dim sIncrement  As String
    Dim bRep        As Boolean

    Set oFSO = MD_FSO.GetFSO()

    bRep = MD_FSO.FSOFileExist(FullPathFile, NonTrouver)    '// Vérifier si le fichier existe bien...
    If (bRep = False) Then Exit Function

    sFolder = oFSO.GetParentFolderName(FullPathFile)
    sFile = oFSO.GetFileName(FullPathFile)


    sFolderBk = BackUpFolderName
    If (sFolderBk <> BACKUP_FOLDER) Then
        sFolderBk = MD_FSO.AddSlash(BackUpFolderName)   '// Ajoute slashs si besoin...
        sFolder = sFolder & sFolderBk
    Else
        sFolder = sFolder & BACKUP_FOLDER
    End If

    bRep = MD_FSO.FSOMkDirIfNotExist(sFolder, Masquer)  '// Création du dossier.
    If Not bRep Then Exit Function

    sBase = oFSO.GetBaseName(sFile)
    sExt = "." & oFSO.GetExtensionName(sFile)
    sIncrement = "00"

    '// Créer le nom du fichier de sauvegarde (i.e. DatabaseName__BackUp(08).accdb)
    For lFor = 1 To 50
        sBaseBackUp = sBase & SUFFIX & sIncrement & ")" & sExt
        sTest = sFolder & sBaseBackUp
        If oFSO.FileExists(sTest) Then
            '// Incrément le n° de la sauvegarde.
            sIncrement = CStr(lFor)
            If (Len(sIncrement) < 2) Then sIncrement = "0" & sIncrement
        Else
            Exit For
        End If
    Next lFor

    '// Retourne fullpath dossier backup, nom fichier backup, nom du fichier de la base.
    GetBackupFileName = sFolder & ";" & sBaseBackUp & ";" & sFile

SORTIE_GetBackupFileName:
    Exit Function

ERR_GetBackupFileName:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.MD_Utils.GetBackupFileName, ligne " & Erl & "."
    Resume SORTIE_GetBackupFileName
End Function

'---------------------------------------------------------------------------------------
' Procedure :   CopyFile
' Author :      Daniel Pineault, CARDA Consultants Inc.
' Website :     http://www.cardaconsultants.com
' Purpose :     Copy a file
'               Overwrites existing copy without prompting
'               Cannot copy locked files (currently in use)
' ~~~~~~~~~~~~~~~~
' sSource - Path/Name of the file to be copied
' sDest -   Path/Name for copying the file to
'
' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
' 1 2007-Apr-01 Initial Release
'---------------------------------------------------------------------------------------
Public Function CopyFile(sSource As String, sDest As String) As Boolean     'Note: Non utilisé
    On Error GoTo CopyFile_Error

    FileCopy sSource, sDest
    CopyFile = True
    Exit Function

CopyFile_Error:
    If Err.Number = 70 Then
        MsgBox "The file is currently in use and therfore is locked and cannot be copied at this" & _
                " time. Please ensure that no one is using the file and try again.", vbOKOnly, _
                "File Currently in Use"
    ElseIf Err.Number = 53 Then
        MsgBox "The Source File '" & sSource & "' could not be found. Please validate the" & _
                " location and name of the specifed Source File and try again", vbOKOnly, _
                "File Currently in Use"
        Else
            MsgBox "MS Access has generated the following error" & vbCrLf & vbCrLf & "Error Number: " & _
                    Err.Number & vbCrLf & "Error Source: CopyFile" & vbCrLf & _
                    "Error Description: " & Err.Description, vbCritical, "An Error has Occurred!"
    End If
    Exit Function
End Function


'// Retourne en clair le type de l'objet.
Public Function GetObjectTypeEnClair(eType As E_ObjectTypeNum) As String
    Dim sType As String

    Select Case eType
        Case TableLocale
            sType = C_TABLE_LOCALE
'        Case TableOdbc
'            sType = C_TABLE_ODBC
        Case TableLinked
            sType = C_TABLE_LINK
'        Case QuerieType
'            sType = C_QUERY
        Case ObjetForm
            sType = C_FORM
        Case ObjetReport
            sType = C_REPORT
'        Case T_MacroType
'            sType = C_MACRO
'        Case T_ModuleType
'            sType = C_MODULE
        Case Else
            sType = "???"   'TODO: sType ="???"
    End Select

    GetObjectTypeEnClair = sType

End Function

'----------------------------------------------------------------
' Procedure Nom   : CheckApostrophe
' ----------------------------------------------------------------
' Sujet           : Remplace le caractère ' par un double ''.
' Procedure Kind  : Function
' Procedure Access: Public
' Objectif        : Utiliser pour les chaîne SQL dans les requêtes.
'
'=== Paramètres ===
' sVal (String): Valeur a contrôler.
'==================
'
' Return String : une chaîne vide ou la chiane modifier.
'
' Author  : Laurent
' Date    : 16/07/2022 - 15:59
' DateMod :
' ----------------------------------------------------------------
Public Function CheckApostrophe(sVal As String) As String

    If InStr(1, sVal, "'") Then
        CheckApostrophe = Replace(sVal, "'", "''")
    Else
        CheckApostrophe = sVal
    End If

End Function

Public Function CreateGuid() As String
On Error GoTo ERR_CreateGuid

    Dim qdf     As DAO.QueryDef
    Dim sSql    As String
    Dim vGuid() As Byte
    Dim sGuid   As String
    Dim lPos    As Long

    Set qdf = CurrentDb.CreateQueryDef("")

'    sSql = "CREATE TABLE [aTg] ([Guid] GUID  CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL, [test] VARCHAR(30))"
'    qdf.SQL = sSql
'    qdf.Execute dbFailOnError
'    CodeDb.TableDefs.Refresh

    sSql = "INSERT INTO aTg ( Test ) SELECT 'x';"
    qdf.SQL = sSql
    qdf.Execute dbFailOnError
    qdf.Close

    vGuid = DFirst("[Guid]", "aTg")
    sGuid = Application.StringFromGUID(vGuid)
    lPos = InStr(2, sGuid, "{")
    sGuid = Mid$(sGuid, lPos, (Len(sGuid) - lPos))
    CreateGuid = sGuid

    sSql = "DELETE aTg.* FROM aTg;"
    qdf.SQL = sSql
    qdf.Execute dbFailOnError
    qdf.Close

SORTIE_CreateGuid:
    Set qdf = Nothing
   Exit Function

ERR_CreateGuid:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "Trad-Access.MD_Utils.CreateGuid"
    Resume SORTIE_CreateGuid
End Function

'---------------------------------------------------------------------------------------
' Procedure : RegEx
' Author    : Mike Wolfe <mike@nolongerset.com>
' Date      : 9/1/2010
' Purpose   : Perform a regular expression search on a string and return the first match
'               or the null string if no matches are found.
' Usage     : If Len(RegEx("\d{1,2}[/-]\d{1,2}[/-]\d{2,4}", txt)) = 0 Then MsgBox "No date in " & txt
'           : TheDate = RegEx("\d{1,2}[/-]\d{1,2}[/-]\d{2,4}", txt)
'           : CUSIP = Regex("[A-Za-z0-9]{8}[0-9]",txt)
'---------------------------------------------------------------------------------------
Public Function RegEx(Pattern As String, TextToSearch As String, Optional IgnoreCase As Boolean = False) As String
'    Dim RE As Object
    Dim ReMatches As Object

    If (oRegex Is Nothing) Then Set oRegex = CreateObject("vbscript.regexp")
'    Set RE = CreateObject("vbscript.regexp")

    With oRegex
        .MultiLine = True
        .Global = False
        .IgnoreCase = IgnoreCase
        .Pattern = Pattern
    End With

    Set ReMatches = oRegex.Execute(TextToSearch)

    If ReMatches.Count > 0 Then
'        RegEx = REMatches(0)
        RegEx = TextToSearch
    Else
        RegEx = vbNullString
    End If

    Set ReMatches = Nothing

End Function

Public Function RegexReplaceChevrons(TexteBase As String) As String

    If (oRegex Is Nothing) Then Set oRegex = CreateObject("vbscript.regexp")

    Dim sres As String

    With oRegex
        .MultiLine = True
        .Global = True
        .IgnoreCase = True
        .Pattern = "([<])"
    sres = .Replace(TexteBase, "&lt;")
        .Pattern = "([>])"
    sres = .Replace(sres, "&gt;")
    End With

    RegexReplaceChevrons = sres

End Function
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
