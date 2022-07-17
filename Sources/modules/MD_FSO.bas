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

#If VBA7 Then
    Private Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
#Else
    Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
#End If


'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private mFSO As Object
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

    Dim bRes As Boolean

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()
    bRes = mFSO.FolderExists(PathToFolder)

    FSOCheckFolderExists = bRes

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
' Info: Some existing code may have defined FileExists() properties or functions
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

    Dim sPath   As String
    Dim sFolder As String
    Dim sFile   As String
    Dim sBase   As String
    Dim sExt    As String
    Dim bRes    As Boolean

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    '// Utilise l'extension de fichier indiquer.
    If (sExtFile <> vbNullString) Then
        sFolder = mFSO.GetParentFolderName(sFullPathFile) & "\"
        sFile = mFSO.GetFileName(sFullPathFile)
        sBase = mFSO.GetBaseName(sFile)
    
        '// Ajoute le '.' si besoin
        If (Left$(sExtFile, 1) <> ".") Then sExt = "." & sExtFile
        
        sPath = sFolder & sBase & sExt
    Else
        sPath = sFullPathFile
    End If

    bRes = mFSO.FileExists(sPath)

    FSOCheckFileExist = bRes

End Function

Public Function FSOGetBaseName(FileSpec As String) As String
'// Renvoie une chaîne contenant le nom de base du dernier composant, sans l'extension de fichier, dans un chemin d'accès.
    Dim bRes    As Boolean

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    bRes = FSOCheckFileExist(FileSpec)
    If bRes Then FSOGetBaseName = Trim$(mFSO.GetBaseName(FileSpec))

End Function

Public Function FSOGetFileName(FileSpec As String) As String
'// Renvoie une chaîne contenant le nom de base du dernier composant, sans l'extension de fichier, dans un chemin d'accès.
    Dim bRes    As Boolean

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    bRes = FSOCheckFileExist(FileSpec)
    If bRes Then FSOGetFileName = Trim$(mFSO.GetFileName(FileSpec))

End Function
'-----------------------------------------------------------------------------------
' Author    : Mike Wolfe
' Source    : https://nolongerset.com/tempfilename/
' Purpose   : Returns an unused file name but does not create the file.  Path can be
'             passed with or without the trailing '\'.
' Requires  : TempPath() function:
'                 https://nolongerset.com/finding-the-temporary-folder-with-vba/
' Notes     - Supports up to 2,147,483,647 temp files with same prefix (2 ^ 31) - 1
'           - Performance will likely be terrible if the number of existing temp
'               files grows too high; remember to clean up your temp files!
'           - To improve performance, we create the FSO one time outside the loop
'           - Requires absolute path (helps avoid subtle bugs)
'-----------------------------------------------------------------------------------
'
Public Function FSOGetTempFile(Optional ByVal Path As String = "WINDOWS TEMP FOLDER", _
                      Optional Ext As String = "txt", _
                      Optional Prefix As String = "temp") As String         'Note: Non utilisé

    If Path = "WINDOWS TEMP FOLDER" Then Path = FSOGetTempPath
    If Right$(Path, 1) <> "\" Then Path = Path & "\"

    If Not (Path Like "?:\*" Or Path Like "\\*") Then
        Err.Raise 52    '"Bad file name or number."
    ElseIf Not FSOCheckFolderExists(Path) Then
        Err.Raise 76    '"Path not found."
    End If

    Dim TempFName   As String

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()
    TempFName = Path & Prefix & "." & Ext

    Do
        If Not mFSO.FileExists(TempFName) Then
            FSOGetTempFile = TempFName
            Exit Do
        End If
        Dim i As Long
        i = i + 1
        TempFName = Path & Prefix & "_" & Format$(i, "000") & "." & Ext
    Loop

End Function

'---------------------------------------------------------------------
' Author    : Mike Wolfe
' Source    : https://nolongerset.com/finding-the-temporary-folder-with-vba/
' Purpose   : Returns something like:
'               C:\Users\Mike\AppData\Local\Temp\
' Notes     - Use PathJoin() function to simplify backslash handling
'               https://nolongerset.com/joining-paths-in-vba/
'---------------------------------------------------------------------
Private Function FSOGetTempPath(Optional WithTrailingBackslash As Boolean = True) As String

    Dim TempFolder  As String
    Const TemporaryFolder = 2

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()
    TempFolder = mFSO.GetSpecialFolder(TemporaryFolder)

    If WithTrailingBackslash Then TempFolder = TempFolder & "\"
    FSOGetTempPath = TempFolder

End Function
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'Returns the contents of file FName as a string
Private Function FSOFileRead(FName As String) As String     'Note: Non utilisé

    Dim FNum    As Integer
    Dim Result  As String

    Result = Space(FileLen(FName))
    FNum = FreeFile
    Open FName For Binary Access Read As #FNum
    Get #FNum, , Result
    Close FNum
    FSOFileRead = Result

End Function

'Writes a text file with the contents of a string
'   - Creates the file if it does not exist
'   - Overwrites the contents of an existing file without warning
'   - Returns true if successful
Private Function FSOFileWrite(FName As String, Contents As String) As Boolean

    If Not FSODeleteFile(FName) Then Exit Function

    Dim FNum As Integer
    FNum = FreeFile()
    Open FName For Output As FNum
    'trailing semi-colon needed to prevent adding blank line at end of file
    '  see: http://stackoverflow.com/a/9445141/154439
    Print #FNum, Contents;
    Close #FNum
    FSOFileWrite = True

End Function

'Appends the contents to the end of a file
' - if the file does not exist, it is created
' - a new line is implicitly added after the contents
'   `- this means that FileAppend may be repeatedly called without passing any vbCrLf's
Public Sub FSOFileAppend(FName As String, Contents As String)   'Note: Non utilisé

    If Not FSOCheckFileExist(FName) Then
        'File does not exist, create new via FileWrite
        FSOFileWrite FName, Contents & vbCrLf
    Else
        Dim FNum As Integer
        FNum = FreeFile()
        Open FName For Append Access Write As #FNum
        Print #FNum, Contents
        Close #FNum
    End If

End Sub

'https://nolongerset.com/kill-failed-let-user-try-again/
Public Function FSODeleteFile(FName As String, _
                    Optional DelayInSeconds As Long = 0, _
                    Optional Silent As Boolean = False) As Boolean
On Error GoTo ERR_FSODeleteFile

    Dim StartTime   As Date
    Dim Complete    As Boolean

    StartTime = Now()

    Do Until Complete
        Err.Clear
        Kill FName

        If Not FSOCheckFileExist(FName) Then
            FSODeleteFile = True
            Complete = True
            Exit Function
        End If

        If Err.Number <> 0 Then
            If (Now() - StartTime) * 86400 > DelayInSeconds Then
                If Not Silent Then
                    If MsgBox("Unable to delete file:" & vbCrLf & vbCrLf & _
                              FName & vbCrLf & vbCrLf & _
                              "Ensure the file is closed and you have the permissions to delete it.", _
                              vbRetryCancel, "File Delete Failed") = vbCancel Then
                        FSODeleteFile = False
                        Complete = True
                        Exit Function
                    End If
                Else
                    Complete = True
                End If
            Else
                Sleep 1000 ' wait for 1 second before trying again
            End If
        End If
    Loop

SORTIE_FSODeleteFile:
    Exit Function

ERR_FSODeleteFile:
    If (Err.Number = 53) Then Resume Next     '// Fichier introuvable
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_FSO.FSODeleteFile, ligne " & Erl & "."
    Resume SORTIE_FSODeleteFile
End Function

