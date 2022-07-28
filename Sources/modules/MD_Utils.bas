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
' Requi    : Module : MD_FSO
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
'// FileDialog type pour la fonction OuvreBoite
    Public Enum eFileDialogType
        FD_TypeFilePicker = 3
        FD_TypeFolderPicker = 4
        FD_TypeFileOpen = 1
        FD_TypeFileSaveAs = 2
    End Enum
    Public Enum eFileDialogView
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
    Public Enum eObjectTypeNum
        TableLocaleType = 1
        TableOdbcType = 4
        TableLinkedType = 6
    '    QueriesType = 5
        FormType = -32768
        ReportType = -32764
    '    MacrosType = -32766
    '    ModulesType = -32761
    End Enum

    '// Valeur de retour pour les functions.
    Public Enum eReponse
        Faux = 0
        Valide = 1
        Inconnu = 2
        Exist = 3
        Erreur = 5
    End Enum

    Private Const TABLE_LOCALE  As String = "Table locale"
    Private Const TABLE_ODBC    As String = "Table liée (ODBC)"
    Private Const TABLE_LINK    As String = "Table liée"
'    Private Const C_QUERY       As String = "Requête"
    Private Const OBJFORM       As String = "Form"
    Private Const OBJREPORT     As String = "Report"
'    Private Const C_MACRO       As String = "Macro"
'    Private Const C_MODULE      As String = "Module"

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
                           Optional eDialogType As eFileDialogType = FD_TypeFilePicker) As String
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
    MsgBox Err.Number & vbCrLf & Err.Description, vbCritical, "Gestionnaire d'erreur"
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
' sFullPath (String): Nom compet (i.e : C:\Forlder\bdName.accdb)
'==================
'// Date     : 5/4/2020
'// DateMod: 18/06/2022 - 13:46
'---------------------------------------------------------------------------------------
Public Function GetBackupFileName(FullPathFile As String) As String
On Error GoTo ERR_GetBackupFileName

    Const BACKUP_FOLDER As String = "Backup\"
    Const SUFFIX        As String = "_BackUp("

    Dim oFSO        As Object

    Dim sFolder     As String
    Dim sFile       As String
    Dim sBase       As String
    Dim sBaseBackUp As String
    Dim sExt        As String
    Dim lFor        As Long
    Dim sTest       As String
    Dim sIncrement  As String
    Dim bRep        As Boolean

    Set oFSO = MD_FSO.GetFSO()

    bRep = MD_FSO.FSOCheckFileExist(FullPathFile)           '// Vérifier si le fichier existe bien...
    If (bRep = False) Then
        MsgBox "Fichier non trouvé" & vbCrLf & "(" & FullPathFile & ")", vbCritical, "GetBackupFileName"
        Exit Function
    End If

    sFolder = oFSO.GetParentFolderName(FullPathFile) & "\"
    sFile = oFSO.GetFileName(FullPathFile)
    sFolder = sFolder & BACKUP_FOLDER

    bRep = MD_FSO.FSOCheckFolderExists(sFolder)             '// Voir si créer le sous dossier 'Backup'...
    If (bRep = False) Then oFSO.CreateFolder sFolder    '// Création du dossier.

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
    Set oFSO = Nothing

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
    Select Case Err.Number
        Case 70
            MsgBox "The file is currently in use and therfore is locked and cannot be copied at this" & _
                    " time. Please ensure that no one is using the file and try again.", vbOKOnly, _
                    "File Currently in Use"
        Case 53
            MsgBox "The Source File '" & sSource & "' could not be found. Please validate the" & _
                    " location and name of the specifed Source File and try again", vbOKOnly, _
                    "File Currently in Use"
        Case Else
            MsgBox "MS Access has generated the following error" & vbCrLf & vbCrLf & "Error Number: " & _
                    Err.Number & vbCrLf & "Error Source: CopyFile" & vbCrLf & _
                    "Error Description: " & Err.Description, vbCritical, "An Error has Occurred!"
    End Select
    Exit Function
End Function

'// Retourne en clair le type de l'objet.
Public Function GetObjectTypeEnClair(eType As eObjectTypeNum) As String
    Dim sType As String

    Select Case eType
        Case TableLocaleType
            sType = TABLE_LOCALE
        Case TableOdbcType
            sType = TABLE_ODBC
        Case TableLinkedType
            sType = TABLE_LINK
'        Case QuerieType
'            sType = C_QUERY
        Case FormType
            sType = OBJFORM
        Case ReportType
            sType = OBJREPORT
'        Case T_MacroType
'            sType = C_MACRO
'        Case T_ModuleType
'            sType = C_MODULE
        Case Else
            sType = "???"   'TODO: stype ="???"
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
    Dim sValMod As String
    If InStr(1, sVal, "'") Then
        sValMod = Replace(sVal, "'", "''")
    End If
    CheckApostrophe = sValMod
End Function

Public Function CreateGuid() As String
On Error GoTo ERR_CreateGuid

    Dim qdf     As DAO.QueryDef
    Dim sSql    As String
    Dim vGuid() As Byte
    Dim sGuid   As String

    Set qdf = CurrentDb.CreateQueryDef("")

'    sSql = "CREATE TABLE [T_Guid] ([Guid] GUID  CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL, [test] VARCHAR(30))"
'    qdf.SQL = sSql
'    qdf.Execute dbFailOnError
'    CodeDb.TableDefs.Refresh

    sSql = "INSERT INTO T_Guid ( Test ) SELECT 'x';"
    qdf.SQL = sSql
    qdf.Execute dbFailOnError
    qdf.Close

    vGuid = DFirst("[Guid]", "T_Guid")
    sGuid = Application.StringFromGUID(vGuid)
    CreateGuid = sGuid

    sSql = "DELETE T_Guid.* FROM T_Guid;"
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

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
