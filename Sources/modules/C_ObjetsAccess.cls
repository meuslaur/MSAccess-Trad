VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "C_ObjetsAccess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'@Folder("Dev")
' ------------------------------------------------------
' Name     : C_ObjetsAccess
' ------------------------------------------------------
' Kind     : Module de classe
' Purpose  : Utilisation des objets Access
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 27/06/2022 - 11:01
' DateMod  :
' Requi    :
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private m_oMsApp            As Access.Application
    Private m_oMsBase           As DAO.Database
    Private m_oRst              As DAO.Recordset

    Private m_sBaseFullName     As String   '// Chemin\nom complet de la base.
    Private m_sBaseNom          As String   '// Nom de la base sans extension.
    Private m_bMsAppIsUp        As Boolean
    Private m_bMsBaseIsOpen     As Boolean
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&     EVENTS        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& END EVENTS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Terminate()

    On Error Resume Next

    If (MsBaseIsOpen And (Not m_oMsBase Is Nothing)) Then m_oMsBase.Close
    If (MsAppIsUp And (Not m_oMsApp Is Nothing)) Then m_oMsApp.Quit
    DoEvents

    CloseOpenRecordset
    Set m_oMsBase = Nothing
    Set m_oMsApp = Nothing

End Sub
'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get GetMsApp() As Application
    If Me.MsAppIsUp Then Set GetMsApp = m_oMsApp
End Property
Public Property Get GetMsBase() As DAO.Database 'Note: Non utilisé
    If Me.MsBaseIsOpen Then Set GetMsBase = m_oMsApp.CurrentDb
End Property

Public Property Get MsAppIsUp() As Boolean
    MsAppIsUp = m_bMsAppIsUp
End Property
Public Property Let MsAppIsUp(NouvelEtat As Boolean)
    m_bMsAppIsUp = IIf(m_oMsApp Is Nothing, False, NouvelEtat)
End Property

Public Property Get MsBaseIsOpen() As Boolean
    MsBaseIsOpen = m_bMsBaseIsOpen
End Property
Public Property Let MsBaseIsOpen(NouvelEtat As Boolean)
    m_bMsBaseIsOpen = IIf((m_oMsApp.CurrentProject.Connection Is Nothing), False, NouvelEtat)
End Property
Public Property Let BaseFullPathName(NewVal As String)
    m_sBaseFullName = NewVal
End Property
Public Property Get BaseNom() As String
    BaseNom = m_sBaseNom
End Property
Public Property Get OptionTrackNameObjet() As Boolean
    OptionTrackNameObjet = m_oMsApp.GetOption("Track Name AutoCorrect Info")
End Property
'Public Property Get GetLangue() As Long 'Note: Non utilisé
'    GetLangue = m_oMsApp.LanguageSettings.LanguageID(msoLanguageIDUI)
'End Property
'//====================================== END PROP =======================================

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Public Function OpenMsApp() As Boolean
On Error GoTo ERR_OpenMsApp

    If Me.MsAppIsUp Then
        MsgBox "Un objet Access.Application à déjà était créer.", vbInformation + vbOKOnly, "OpenMsApp"
        Exit Function
    End If

    '// Création de l'objet Access.Application.
    Set m_oMsApp = New Access.Application
    DoEvents
    m_oMsApp.Visible = False
    m_bMsAppIsUp = True
    OpenMsApp = True
  
SORTIE_OpenMsApp:
    Exit Function

ERR_OpenMsApp:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "C_ObjetsAccess.OpenMsApp"
    Resume SORTIE_OpenMsApp
End Function

' ----------------------------------------------------------------
' Procedure Nom:    OpenMsBase
' Sujet:            Ouvre la base.
' Procedure Kind:   Function
' Procedure Access: Public
' Références:       Ouvre la base.
'
'=== Paramètres ===
' sBaseFullName (String): Chemin et nom de la base à ouvrir.
'==================
'
' Return Type: Boolean TRUE si pas de problème.
'
' Author: Laurent
' Date:    30/04/2022 - 18:11
' DateMod: 07/05/2022 - 12:42
'
' !Use! : CheckFileExist, HasAutoexec, GetStartUpForm
' ----------------------------------------------------------------
Public Function OpenMsBase(sBaseFullName As String) As Boolean
On Error GoTo ERR_OpenMsBase

    If Me.MsBaseIsOpen Then
        MsgBox "Un objet DAO.Database est déjà ouvert, veuillez fermer cette base svp.", vbInformation + vbOKOnly, "OpenMsBase"
        Exit Function
    End If

    Dim sObj    As String
    Dim bRep    As Boolean
    Dim bAutoEx As Boolean

    '// Voir si la base déjà ouverte (fichier .laccdb)...
    bRep = FSOFileExist(sBaseFullName, , "laccdb")
    If bRep Then
        MsgBox "La base " & sBaseFullName & vbCrLf & "est déjà ouverte, opération annuler.", vbExclamation, "OpenMsBase"
        OpenMsBase = False
        Exit Function
    End If

    '// Ouverture de la base (sBaseName).
    m_oMsApp.OpenCurrentDatabase sBaseFullName, True
    m_oMsApp.Visible = False
    DoEvents

    Set m_oMsBase = m_oMsApp.CurrentDb
    '// Vérifie si bien initialisée.
    If (m_oMsBase Is Nothing) Then
        MsgBox "Impossible d'ouvrir la base " & sBaseFullName, vbCritical, "OpenMsBase"
        OpenMsBase = False
        Exit Function
    End If

    '// Vérifier si macro Autoexec...
    bAutoEx = HasAutoexec(m_oMsBase)
    If bAutoEx Then
        MsgBox "La base utilise une macro 'Autoexec', désactivez la avant d'utiliser cet outil." & vbCrLf & _
               "Opération annulée.", vbExclamation, "OpenMsBase"
        Me.MsBaseIsOpen = True
        Exit Function
    End If

    '// Vérifier si un form ouvert au démarrage...
    sObj = GetStartUpForm(m_oMsBase)
    If (sObj <> vbNullString) Then

        MsgBox "Le Formulaire '" & sObj & "' est ouvert automatiquement au lancement de la base," & vbCrLf & _
               "il doit être fermer pour continuer." & vbCrLf & vbCrLf & _
               "Note: il peut contenir du code qui vas fermer la base ou l'application.", vbExclamation, "OpenMsBase"
        '// On ferme l'objet.
        m_oMsApp.DoCmd.Close acForm, sObj
    End If

    '// Vérification si la base est toujours ouverte.
    If (m_oMsApp.CurrentProject.Connection Is Nothing) Then
        MsgBox "La base à était fermée par l'objet " & sObj, vbExclamation, "OpenMsBase"
        m_bMsBaseIsOpen = True      '// Evite message 'base déjà fermée".
        Exit Function
    End If

    m_bMsBaseIsOpen = True                      '// Flag base ouverte.
    Me.BaseFullPathName = sBaseFullName         '// Stock le chemin/nom complet.
    m_sBaseNom = FSOGetBaseName(sBaseFullName)  '// Extraire le nom de l'app...
    
    OpenMsBase = True

SORTIE_OpenMsBase:
    Exit Function

ERR_OpenMsBase:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "C_ObjetsAccess.OpenMsBase"
    Resume SORTIE_OpenMsBase
End Function

' ----------------------------------------------------------------
'// Femeture de la base.
'// si CloseMsApp = True : quitte l'application
' ----------------------------------------------------------------
Public Sub CloseMsBase(Optional CloseMsApp As Boolean = False)
On Error GoTo ERR_CloseMsBase

    If (Me.MsAppIsUp = False) Or (Me.MsBaseIsOpen = False) And (CloseMsApp = False) Then
        MsgBox "La base est déjà fermée.", vbInformation + vbOKOnly, "OpenMsBase"
        Exit Sub
    End If

    '// Fermeture de la base.
    If (Not m_oMsBase Is Nothing) Then
        If (Not m_oMsApp.CurrentProject.Connection Is Nothing) Then m_oMsApp.CloseCurrentDatabase
    End If
    DoEvents

    m_bMsBaseIsOpen = False
    Set m_oMsBase = Nothing

    '// On ferme aussi l'application ?
    If CloseMsApp Then
        If (MsAppIsUp And (Not m_oMsApp Is Nothing)) Then m_oMsApp.Quit
        MsAppIsUp = False
        DoEvents
        Set m_oMsApp = Nothing
    End If

SORTIE_CloseMsBase:
    Exit Sub

ERR_CloseMsBase:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "C_ObjetsAccess.CloseMsBase"
    Resume SORTIE_CloseMsBase
End Sub

' ----------------------------------------------------------------
'// Extraire prop de l'application
' ----------------------------------------------------------------
Public Function GetPropTxt(PropNom As String) As String
    If (Len(PropNom) = 0) Then Exit Function
    Dim sVal As String
    sVal = MD_DBProp.GetTextProp(PropNom, m_oMsBase, False)
    GetPropTxt = sVal
End Function

'Public Function SetPropTxt(PropNom As String, NouvVal As String) As Boolean
'    If (Len(PropNom) = 0) Then Exit Function
'    Dim bRep As Boolean
'    bRep = MD_DBProp.SetTextProp(PropNom, NouvVal, m_oMsBase)
'    SetPropTxt = bRep
'End Function

Public Function CreatePropTxt(PropNom As String, NouvVal As String) As Boolean
    If (Len(PropNom) = 0) Then Exit Function
    Dim bRep As Boolean
    bRep = MD_DBProp.CreatePropText(PropNom, NouvVal, m_oMsBase, False)
    CreatePropTxt = bRep
End Function

' ----------------------------------------------------------------
'// Retourne le recodset RstNom.
' ----------------------------------------------------------------
Public Function GetRecordset(RstNom As String, _
                             Optional CheckLinkTable As Boolean = False, _
                             Optional CheckTableName As Boolean = False) As DAO.Recordset

    If (Len(RstNom) = 0) Then Exit Function

    If CheckTableName Then
        If (CheckTableExist(RstNom) = False) Then Exit Function
    End If

    If CheckLinkTable Then
        If (CheckTdfLinked(RstNom) <> vbNullString) Then Exit Function  '// Vérifier la liason si liée...
    End If

    If (Not m_oRst Is Nothing) Then m_oRst.Close

    Set m_oRst = m_oMsBase.OpenRecordset(RstNom, dbOpenSnapshot, dbReadOnly)
    Set GetRecordset = m_oRst

End Function

Public Sub CloseOpenRecordset()
    If (Not m_oRst Is Nothing) Then m_oRst.Close
    Set m_oRst = Nothing
End Sub

' ----------------------------------------------------------------
'// Vérifier la liason de la table.
'// Retourne une chaine vide si ok, sinon le chemin de la base.
' ----------------------------------------------------------------
Public Function CheckTdfLinked(TdfName As String, Optional AfficheMsg As Boolean = False) As String

    Dim sBdSource As String
    Dim lPos      As Long
    Dim bRep      As Boolean
    Dim sRep      As String

    With m_oMsBase.TableDefs(TdfName)
        If (.Attributes = dbAttachedTable) Then      'TODO: tdf.Attributes = dbAttachedODBC
            sBdSource = .Connect
            lPos = InStr(1, sBdSource, "=")
            sBdSource = Mid$(sBdSource, lPos + 1)
            bRep = MD_FSO.FSOFileExist(sBdSource)   '// Verifier si la base est bien la...
            If (Not bRep) Then sRep = sBdSource
        End If
    End With

    If (Not bRep And AfficheMsg) Then
'        Beep
        MsgBox "Table liée [" & TdfName & "] liason rompue !", vbExclamation, "GetRecordset"
    End If

    CheckTdfLinked = sRep

End Function

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


'// ################################ PRIVATE SUB/FUNC ####################################

' ----------------------------------------------------------------
'// Vérifier si macro autoExec existe. (True si oui)
' ----------------------------------------------------------------
Private Function HasAutoexec(ByRef MsBase As DAO.Database) As Boolean
    Dim oRst As DAO.Recordset
    Dim sSql As String

    sSql = "SELECT MSysObjects.Name FROM MSysObjects WHERE MSysObjects.Name = 'AutoExec' AND MSysObjects.Type = -32766"

    Set oRst = MsBase.OpenRecordset(sSql)
    If Not (oRst.EOF And oRst.BOF) Then HasAutoexec = True

    oRst.Close
    Set oRst = Nothing

End Function

' ----------------------------------------------------------------
'// Retourne le nom du form lancer a l'ouverture de la base.
' ----------------------------------------------------------------
Private Function GetStartUpForm(ByRef MsBase As DAO.Database) As String
    Dim oProp As DAO.Property

    For Each oProp In MsBase.Properties
        If oProp.name = "StartUpForm" Then
            GetStartUpForm = oProp.Value
            Exit For
        End If
    Next
    Set oProp = Nothing

End Function

Private Function CheckTableExist(TableNom As String) As Boolean

    Dim oTdf As DAO.TableDef

    With m_oMsBase
        For Each oTdf In .TableDefs
            If (oTdf.name = TableNom) Then CheckTableExist = True: Exit For
        Next
    End With

    Set oTdf = Nothing

End Function
'// ################################# END PRIV. SUB/FUNC #################################
