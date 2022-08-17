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
' DateMod  : 29/07/2022 - 10:38
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
    Public Enum MessageFSO
        Masquer = 0
        Afficher = 1
        Trouver = 2
        NonTrouver = 3
    End Enum

    Private Const CHUNK_SIZE As Long = 131072    ' (128K)
    Private mFSO             As Object
    Private mRep             As Boolean
    Private mMsg             As String
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Public Function GetFSO() As Object

    Static pFSO As Object

    If pFSO Is Nothing Then
        Set pFSO = CreateObject("Scripting.FileSystemObject")
    End If

    Set GetFSO = pFSO

End Function

' ----------------------------------------------------------------
'// Renvoi TRUE si le dossier existe
'// - PathToFolder peut être un chemin 'C:\Folder1\Folder2' avec ou sans '\' a la fin.
'// - Ou le chemlin et le fichier 'C:\Folder1\Folder2\file/txt'
' ----------------------------------------------------------------
Public Function FSOFolderExist(ByVal PathToFolder As String, Optional Message As MessageFSO = 0) As Boolean

    Dim sTmp  As String
    Dim sPath As String

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    sPath = PathToFolder
    '// Recupère que le chemin si le fichier est inclus (i.e 'C:\Folder\fichier.txt' renvoi 'C:\Folder'
    sTmp = mFSO.GetExtensionName(PathToFolder)
    If (Len(sTmp) > 0) Then sPath = mFSO.GetParentFolderName(PathToFolder)

    mRep = mFSO.FolderExists(sPath)

    mMsg = vbCrLf & PathToFolder
    Select Case Message
        Case MessageFSO.NonTrouver
            If (Not mRep) Then MsgBox "Dossier non trouvé :" & mMsg, vbExclamation, "FSOFolderExist"
        Case MessageFSO.Trouver
            If (mRep) Then MsgBox "Ce dossier existe déjà :" & mMsg, vbExclamation, "FSOFolderExist"
    End Select

    FSOFolderExist = mRep

End Function

' ----------------------------------------------------------------
' Procedure Nom:    FSOFileExist
' Sujet:            Vérifier si le fichier existe
' Procedure Kind:   Function
' Procedure Access: Private
'
'=== Paramètres ===
' FullPathFileName (String) : Chemin complet et nom du fichier.
' Message (MessageFSO)      : Affiche ou non le message d'erreur.
'==================
' Return Type:  Boolean, TRUE si le fichier existe.
' Author  : Laurent
' Date    : 20/04/2022 - 06:21
' DateMod : 29/07/2022 - 13:41
' ----------------------------------------------------------------
Public Function FSOFileExist(ByVal FullPathFileName As String, _
                             Optional Message As MessageFSO = 0, _
                             Optional ExtFile As String) As Boolean

    Dim sPath   As String
    Dim sFolder As String
    Dim sFile   As String
    Dim sBase   As String
    Dim sExt    As String

    If (Len(FullPathFileName) = 0) Then Exit Function
    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    sFolder = mFSO.GetParentFolderName(FullPathFileName) & "\"
    If Not FSOFolderExist(sFolder) Then Exit Function

    '// Utilise l'extension de fichier indiquer.
    If (ExtFile <> vbNullString) Then
        sFolder = mFSO.GetParentFolderName(FullPathFileName) & "\"
        sFile = mFSO.GetFileName(FullPathFileName)
        sBase = mFSO.GetBaseName(sFile)
    
        '// Ajoute le '.' si besoin
        If (Left$(ExtFile, 1) <> ".") Then sExt = "." & ExtFile
        
        sPath = sFolder & sBase & sExt
    Else
        sPath = FullPathFileName
    End If

    mRep = mFSO.FileExists(sPath)

    mMsg = vbCrLf & sPath
    Select Case Message
        Case MessageFSO.NonTrouver
            If (Not mRep) Then MsgBox "Fichier non trouvé :" & mMsg, vbExclamation, "FSOFileExist"
        Case MessageFSO.Trouver
            If (mRep) Then MsgBox "Ce fichier existe déjà :" & mMsg, vbExclamation, "FSOFileExist"
    End Select

    FSOFileExist = mRep

End Function

' ----------------------------------------------------------------
'// Retourne le dossier parent.
'// 'C:\Folder1\Folder2' retourne 'C:\Folder1\'.
'// 'C:\Folder1\Folder2\file.txt' retourne 'C:\Folder1\Folder2\'
' ----------------------------------------------------------------
Public Function FSOGetParentFolder(FullPath As String, Optional checkFolder As Boolean = True, Optional Message As MessageFSO = 0) As String

    If (Len(FullPath) = 0) Then Exit Function

    Dim sFolder As String

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    If checkFolder Then
        mRep = FSOFolderExist(FullPath, Message)
        If Not mRep Then Exit Function
    End If

    sFolder = mFSO.GetParentFolderName(FullPath) & "\"
    FSOGetParentFolder = sFolder

End Function

' ----------------------------------------------------------------
'// Renvoie une chaîne contenant le nom de base du dernier composant,
'// sans l'extension de fichier, dans un chemin d'accès.
' ----------------------------------------------------------------
Public Function FSOGetFileName(FileSpec As String, Optional Message As MessageFSO = 0) As String

    If (Len(FileSpec) = 0) Then Exit Function

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    mRep = FSOFileExist(FileSpec, Message)
    If mRep Then FSOGetFileName = Trim$(mFSO.GetFileName(FileSpec))

End Function

' ----------------------------------------------------------------
'// Renvoie une chaîne contenant le nom de base du dernier composant,
'// sans l'extension de fichier, dans un chemin d'accès.
' ----------------------------------------------------------------
Public Function FSOGetBaseName(FullPathFileName As String, Optional Message As MessageFSO = 0) As String

    If (Len(FullPathFileName) = 0) Then Exit Function
    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    mRep = FSOFileExist(FullPathFileName, Message)
    If mRep Then FSOGetBaseName = Trim$(mFSO.GetBaseName(FullPathFileName))

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
    ElseIf Not FSOFolderExist(Path) Then
        Err.Raise 76    '"Path not found."
    End If

    Dim TempFName   As String

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()
    TempFName = Path & Prefix & "." & Ext

    Do
        If Not FSOFileExist(TempFName) Then
            FSOGetTempFile = TempFName
            Exit Do
        End If
        Dim i As Long
        i = i + 1
        TempFName = Path & Prefix & "_" & Format$(i, "000") & "." & Ext
    Loop

End Function

' ----------------------------------------------------------------
'Writes a text file with the contents of a string
'   - Creates the file if it does not exist
'   - Overwrites the contents of an existing file without warning
'   - Returns true if successful
' ----------------------------------------------------------------
Public Function FSOFileWrite(FullPathFileName As String, Contents As String, _
                             Optional Message As MessageFSO = 0, _
                             Optional OverwritesFile As Boolean = False) As Boolean

    If (Len(FullPathFileName) = 0) Then Exit Function

    Dim FNum As Integer
    Dim Msg  As MessageFSO

    Msg = IIf(OverwritesFile, MessageFSO.Masquer, Message)
    mRep = FSOFileExist(FullPathFileName, Msg)
    If (mRep And (Not OverwritesFile)) Then Exit Function

    If mRep Then If Not FSODeleteFile(FullPathFileName) Then Exit Function

    FNum = FreeFile()
    Open FullPathFileName For Output As FNum
    'trailing semi-colon needed to prevent adding blank line at end of file
    '  see: http://stackoverflow.com/a/9445141/154439
    Print #FNum, Contents;
    Close #FNum

    FSOFileWrite = True

End Function

'---------------------------------------------------------------------------------------
' Procedure : WriteFile
' Author    : Adam Waller
' Date      : 1/23/2019
' Purpose   : Save string variable to text file. (Building the folder path if needed)
'           : Saves in UTF-8 encoding, adding a BOM if extended or unicode content
'           : is found in the file. https://stackoverflow.com/a/53036838/4121863
'---------------------------------------------------------------------------------------

Public Function ADOFileWrite(FullPathFileName As String, TextSource As String, _
                             Optional Message As MessageFSO = 0, _
                             Optional OverwritesFile As Boolean = False) As Boolean

    If (Len(FullPathFileName) = 0) Then Exit Function

    Dim oStream As Object
    Dim Msg     As MessageFSO

    Msg = IIf(OverwritesFile, Masquer, Message)
    mRep = FSOFileExist(FullPathFileName, Msg)
    If (mRep And Not OverwritesFile) Then Exit Function

    Set oStream = CreateObject("ADODB.Stream")

    'With New ADODB.Stream
    With oStream        ' Write to a UTF-8 encoded file
        .Type = 2       'adTypeBinary 1, adTypeText 2
        .Open
        .Charset = "utf-8"
        .WriteText TextSource
        ' Ensure that we are ending the content with a vbcrlf
        If Right$(TextSource, 2) <> vbCrLf Then .WriteText vbCrLf
        ' Write to disk
        .SaveToFile FullPathFileName, 2     'adSaveCreateNotExist 1, adSaveCreateOverWrite 2
        .Close
    End With

    ADOFileWrite = True
    Set oStream = Nothing

End Function

' ----------------------------------------------------------------
'Returns the contents of file FName as a string
' ----------------------------------------------------------------
Public Function FSOFileRead(FullPathFileName As String, Optional Message As MessageFSO = 0) As String    'Note: Non utilisé

    If (Len(FullPathFileName) = 0) Then Exit Function
    If Not FSOFileExist(FullPathFileName, Message) Then Exit Function

    Dim FNum    As Integer
    Dim Result  As String

    Result = Space(FileLen(FullPathFileName))
    FNum = FreeFile
    Open FullPathFileName For Binary Access Read As #FNum
    Get #FNum, , Result
    Close FNum
    FSOFileRead = Result

End Function

'---------------------------------------------------------------------------------------
' Procedure : ReadFile
' Author    : Adam Waller / Indigo
' Date      : 11/4/2020
' Purpose   : Read text file.
'           : Read in UTF-8 encoding, removing a BOM if found at start of file.
'---------------------------------------------------------------------------------------
Public Function ADOFileRead(FullPathFileName As String, _
                            Optional Message As MessageFSO = 0, _
                            Optional Charset As String = "utf-8") As String

    If (Len(FullPathFileName) = 0) Then Exit Function
    If Not FSOFileExist(FullPathFileName, Message) Then Exit Function

    Dim oStream As Object
    Dim sText   As String

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()
    Set oStream = CreateObject("ADODB.Stream")

'    With New ADODB.Stream
    With oStream
        .Charset = Charset
        .Open
        .LoadFromFile FullPathFileName
        ' Read chunks of text, rather than the whole thing at once for massive
        ' performance gains when reading large files.
        ' See https://docs.microsoft.com/is-is/sql/ado/reference/ado-api/readtext-method
        Do While Not .EOS
            sText = .ReadText(CHUNK_SIZE)
        Loop
        .Close
    End With

    Set oStream = Nothing
    ADOFileRead = sText

End Function

' ----------------------------------------------------------------
'Appends the contents to the end of a file
' - if the file does not exist, it is created
' - a new line is implicitly added after the contents
'   `- this means that FileAppend may be repeatedly called without passing any vbCrLf's
' ----------------------------------------------------------------
Public Function FSOFileAppend(FullPathFileName As String, Contents As String, _
                         Optional CreateIfNotExist As Boolean = False, _
                         Optional Message As MessageFSO = 0) As Boolean                 'Note: Non utilisé

    If (Len(FullPathFileName) = 0) Then Exit Function

    Dim Msg As MessageFSO

    Msg = IIf(CreateIfNotExist, MessageFSO.Masquer, Message)
    
    mRep = FSOFileWrite(FullPathFileName, Contents, Msg)   '// Création du fichier.

    If ((Not mRep) And (Not CreateIfNotExist)) Then Exit Function '// Existe pas et create false, on sort.

    Dim FNum As Integer
    FNum = FreeFile()
    Open FullPathFileName For Append Access Write As #FNum
    Print #FNum, Contents
    Close #FNum

    FSOFileAppend = True

End Function

' ----------------------------------------------------------------
'https://nolongerset.com/kill-failed-let-user-try-again/
' ----------------------------------------------------------------
Public Function FSODeleteFile(FullPathFileName As String, _
                    Optional DelayInSeconds As Long = 0, _
                    Optional Message As MessageFSO = 0) As Boolean
On Error GoTo ERR_FSODeleteFile

    If (Len(FullPathFileName) = 0) Then Exit Function
    If Not FSOFileExist(FullPathFileName, Message) Then Exit Function

    Dim StartTime   As Date
    Dim Complete    As Boolean

    StartTime = Now()

    Do Until Complete
        Err.Clear
        Kill FullPathFileName

        If Not mFSO.FileExists(FullPathFileName) Then
            FSODeleteFile = True
            Complete = True
            Exit Function
        End If

        If Err.Number <> 0 Then
            If (Now() - StartTime) * 86400 > DelayInSeconds Then
                If Message <> Masquer Then
                    If MsgBox("Unable to delete file:" & vbCrLf & vbCrLf & _
                              FullPathFileName & vbCrLf & vbCrLf & _
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
    mRep = False
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  MD_FSO.FSODeleteFile, ligne " & Erl & "."
    Resume SORTIE_FSODeleteFile
End Function

'---------------------------------------------------------------------------------------
' Procedure : MkDirIfNotExist
' Author    : Adam Waller
' Date      : 1/25/2019
' DateMod   : 31/07/2022 - 13:44(Laurent)
' Purpose   : Create folder `Path`. Silently do nothing if it already exists.
'---------------------------------------------------------------------------------------
Public Function FSOMkDirIfNotExist(NewPath As String, Optional Message As MessageFSO = 0) As Boolean

    If (Len(NewPath) = 0) Then Exit Function

    '// Vérifier si le dossier existe déjà.
    mRep = FSOFolderExist(NewPath, Message)
    If mRep Then FSOMkDirIfNotExist = True: Exit Function

    Dim sPath As String

    '// Vérifier les dossiers parent.
    sPath = FSOGetParentFolder(NewPath, False)
    If (Len(sPath) = 0) Then
        MsgBox "Chemin ou non de dossier non valide :" & vbCrLf & NewPath, vbExclamation, "FSOMkDirIfNotExist"
        Exit Function
    End If

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    sPath = StripSlash(NewPath)

    mFSO.CreateFolder sPath
    FSOMkDirIfNotExist = True

End Function

'---------------------------------------------------------------------------------------
' Procedure : GetLastModifiedDate
' Author    : Adam Waller
' Date      : 7/30/2020
' Purpose   : Get the last modified date on a folder or file with Unicode support.
'---------------------------------------------------------------------------------------
Public Function FSOGetLastModifiedDate(PathOrFile As String, Optional Message As MessageFSO = 0) As Date

    If (Len(PathOrFile) = 0) Then Exit Function

    Dim oFile   As Object ' Scripting.File
    Dim oFolder As Object ' Scripting.Folder
    Dim sTmp    As String

    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    sTmp = mFSO.GetExtensionName(PathOrFile)
    If (Len(sTmp) > 0) Then
        mRep = FSOFileExist(PathOrFile, Message)   '// Fichier.
        If mRep Then
            Set oFile = mFSO.GetFile(PathOrFile)
            FSOGetLastModifiedDate = oFile.DateLastModified
        End If
        Set oFile = Nothing
        Exit Function
    End If

    mRep = FSOFolderExist(PathOrFile, Message)     '// Dossier.
    If mRep Then
        Set oFolder = mFSO.GetFolder(PathOrFile)
        FSOGetLastModifiedDate = oFolder.DateLastModified
    End If

    Set oFolder = Nothing

End Function

'---------------------------------------------------------------------------------------
' Procedure : AddSlash
' Author    : Laurent
' Date      : 31/07/2022 - 13:09
' Purpose   : Ajoute (suivant option) un slash avant et après le dossier.
'---------------------------------------------------------------------------------------
Public Function AddSlash(Dossier As String, _
                           Optional addLeft As Boolean = True, _
                           Optional addRight As Boolean = True) As String

    If (Len(Dossier) = 0) Then Exit Function
    If (mFSO Is Nothing) Then Set mFSO = GetFSO()

    Dim sFolder As String
    sFolder = Dossier

    If ((Right$(sFolder, 1) <> PathSep) And addRight) Then
        sFolder = sFolder & PathSep
    End If

    If ((Left$(sFolder, 1) <> PathSep) And addLeft) Then
        sFolder = PathSep & sFolder
    End If

    AddSlash = sFolder

End Function

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################

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

'---------------------------------------------------------------------------------------
' Procedure : StripSlash
' Author    : Adam Waller
' Date      : 1/25/2019
' Purpose   : Strip the trailing slash
'---------------------------------------------------------------------------------------
Private Function StripSlash(strText As String) As String
    If Right$(strText, 1) = PathSep Then
        StripSlash = Left$(strText, Len(strText) - 1)
    Else
        StripSlash = strText
    End If
End Function

'---------------------------------------------------------------------------------------
' Procedure : PathSep
' Author    : Adam Waller
' Date      : 3/3/2021
' Purpose   : Return the current path separator, based on language settings.
'           : Caches value to avoid extra calls to FSO object.
'---------------------------------------------------------------------------------------
Private Function PathSep() As String
    Static strSeparator As String
    If strSeparator = vbNullString Then strSeparator = Mid$(mFSO.BuildPath("a", "b"), 2, 1)
    PathSep = strSeparator
End Function

'// ################################# END PRIV. SUB/FUNC #################################
