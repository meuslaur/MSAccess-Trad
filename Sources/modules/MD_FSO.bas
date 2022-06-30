Attribute VB_Name = "MD_FSO"
'@Folder("Outils")
' ------------------------------------------------------
' Name     : MD_FSO
' ------------------------------------------------------
' Kind     : Module
' Purpose  : Outils pour FSO
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 18/06/2022 - 14:11
' DateMod  :
' Requi    :
' ------------------------------------------------------
Option Compare Database
Option Explicit


'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::


'// ################################ PRIVATE SUB/FUNC ####################################
Public Function GetFSO() As Object

Static pFSO As Object

    If pFSO Is Nothing Then
        Set pFSO = CreateObject("Scripting.FileSystemObject")
    End If

    Set GetFSO = pFSO

End Function
'// ################################# END PRIV. SUB/FUNC #################################


'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


'Returns True if the folder exists (and is accessible)
' - trailing backslash is completely optional
' - returns False if the full path to an existing file is passed
'   to the function (and not just the folder part)
Public Function FSOCheckFolderExists(ByVal PathToFolder As String) As Boolean

    Dim oFSO As Object
    Dim bRes As Boolean

    Set oFSO = GetFSO
    bRes = oFSO.FolderExists(PathToFolder)

    Set oFSO = Nothing
    FSOCheckFolderExists = bRes
    Set oFSO = Nothing

End Function

'Convenience function to avoid creating a File System Object
' This should be used in place of the Len(Dir()) construct because
' Dir() has terrible performance compared to FileExists, especially in
' certain use cases (e.g., checking for the existence of a single file
' in a very large (300,000+ files) UNC directory, such as G:\Photos\)
'
'Includes support for wild-card characters ("*" and "?")
'--== Project-wide find & replace ==--
'We can use the MZ-Tools Find & Replace RegEx mode to do a program wide change:
'
' Find: Len\(Dir\(([^,]+)\)\) > 0
' Find: Dir\(([^,]+)\) <> ""
' Repl: FileExists($1)
'
' Find: Len\(Dir\(([^,]+)\)\) = 0
' Find: Dir\(([^,]+)\) = ""
' Repl: Not FileExists($1)
'
' Note: Some existing code may have defined FileExists() properties or functions
' that will overlap and cause problems; to work around this, we can simply
' add "FileFunctions." to fully qualify the function call:
' FileFunctions.FileExists(PathToMyFile)
' ----------------------------------------------------------------
' Procedure Nom:    FSOCheckFileExist
' Sujet:            Vérifier si le fichier existe
' Procedure Kind:   Function
' Procedure Access: Private
'
'=== Paramètres ===
' sFullPathFile (String):   Chemin complet et nom du fichier.
' sExtFile (String):        Extension a utiliser.
' ProcedureName (String):   Nom de la procédure appelante.
'==================
' Return Type:  Boolean, TRUE si le fichier existe.
' Author:       ?
' Date:         20/04/2022 - 06:21
' DateMod:      04/05/2022 - 17:5
'
' ----------------------------------------------------------------
Public Function FSOCheckFileExist(ByVal sFullPathFile As String, Optional ByVal sExtFile As String) As Boolean

    Dim oFSO    As Object
    Dim sPath   As String
    Dim sFolder As String
    Dim sFile   As String
    Dim sBase   As String
    Dim sExt    As String
    Dim bRes    As Boolean

    Set oFSO = GetFSO

    '// Utilise l'extension de fichier indiquer.
    If (sExtFile <> vbNullString) Then
        sFolder = oFSO.GetParentFolderName(sFullPathFile) & "\"
        sFile = oFSO.GetFileName(sFullPathFile)
        sBase = oFSO.GetBaseName(sFile)
    
        '// Ajoute le '.' si besoin
        If (Left$(sExtFile, 1) <> ".") Then sExt = "." & sExtFile
        
        sPath = sFolder & sBase & sExt
    Else
        sPath = sFullPathFile
    End If

    bRes = oFSO.FileExists(sPath)

    FSOCheckFileExist = bRes
    Set oFSO = Nothing

End Function

Public Function FSOGetBaseName(BaseName As String) As String
    Dim oFSO    As Object
    Dim bRes    As Boolean

    Set oFSO = GetFSO

    bRes = FSOCheckFileExist(BaseName)
    If bRes Then FSOGetBaseName = Trim$(oFSO.GetBaseName(BaseName))
    Set oFSO = Nothing

End Function
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

