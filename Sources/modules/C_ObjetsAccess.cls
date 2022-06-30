VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "C_ObjetsAccess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'@Folder("Test")
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

    '// Options définies dans le formulaire.
    Private m_oMsBase           As DAO.Database
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

    Set m_oMsBase = Nothing
    Set m_oMsApp = Nothing

End Sub
'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get GetMsApp() As Application
    If Me.MsAppIsUp Then Set GetMsApp = m_oMsApp
End Property
Public Property Get GetMsBase() As DAO.Database
    If Me.MsBaseIsOpen Then Set GetMsBase = m_oMsApp.CurrentDb
End Property

Public Property Get MsAppIsUp() As Boolean
    MsAppIsUp = m_bMsAppIsUp
End Property
Public Property Let MsAppIsUp(bNewVal As Boolean)
    m_bMsAppIsUp = IIf(m_oMsApp Is Nothing, False, bNewVal)
End Property

Public Property Get MsBaseIsOpen() As Boolean
    MsBaseIsOpen = m_bMsBaseIsOpen
End Property
Public Property Let MsBaseIsOpen(bNewVal As Boolean)
    m_bMsBaseIsOpen = IIf((m_oMsApp.CurrentProject.AccessConnection Is Nothing), False, bNewVal)
End Property
Public Property Get BaseOuverteFullPathName() As String
    BaseOuverteFullPathName = m_sBaseFullName
End Property
Public Property Get BaseOuverteNom() As String
    BaseOuverteNom = m_sBaseNom
End Property
Public Property Get GetLangue() As Long
    GetLangue = m_oMsApp.LanguageSettings.LanguageID(msoLanguageIDUI)
End Property
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
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TriSurFormContinu.CCreateFormContinu.OpenMsApp, ligne " & Erl & "."
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
    bRep = FSOCheckFileExist(sBaseFullName, "laccdb")
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
               "Note: il peux contenir du code qui vas fermer base ou l'application.", vbExclamation, "OpenMsBase"
        '// On ferme l'objet.
        m_oMsApp.DoCmd.Close acForm, sObj
    End If

    '// Vérification si la base est toujours ouverte.
    If (m_oMsApp.CurrentProject.AccessConnection Is Nothing) Then
        MsgBox "La base à était fermée par l'objet " & sObj, vbExclamation, "OpenMsBase"
        m_bMsBaseIsOpen = True      '// Evite message 'base déjà fermée".
        Exit Function
    End If

    m_bMsBaseIsOpen = True                      '// Flag base ouverte.
    m_sBaseFullName = sBaseFullName             '// Stock le chemin/nom complet.
    m_sBaseNom = FSOGetBaseName(sBaseFullName)  '// Extraire le nom de l'app...
    
    OpenMsBase = True

SORTIE_OpenMsBase:
    Exit Function

ERR_OpenMsBase:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TriSurFormContinu.CCreateFormContinu.OpenMsBase, ligne " & Erl & "."
    Resume SORTIE_OpenMsBase
End Function

Public Sub CloseMsBase(Optional CloseMsApp As Boolean = False)
    On Error GoTo ERR_CloseMsBase

'TODO:    m_oMsApp.Visible = True

'    If (Me.MsAppIsUp = False) Or (Me.MsBaseIsOpen = False) And (CloseMsApp = False) Then
'        MsgBox "La base est déjà fermée.", vbInformation + vbOKOnly, "OpenMsBase"
'        Exit Function
'    End If

    '// Ouverture de la base (sBaseName).
    If (Not m_oMsBase Is Nothing) Then
        If (Not m_oMsApp.CurrentProject.AccessConnection Is Nothing) Then m_oMsApp.CloseCurrentDatabase
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
    Me.MsAppIsUp = False
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TriSurFormContinu.CCreateFormContinu.CloseMsBase, ligne " & Erl & "."
    Resume SORTIE_CloseMsBase
End Sub
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


'// ################################ PRIVATE SUB/FUNC ####################################
Private Function HasAutoexec(ByRef MsBase As DAO.Database) As Boolean
    Dim oRst As DAO.Recordset
    Dim sSql As String
    
    sSql = "SELECT MSysObjects.Name FROM MSysObjects WHERE MSysObjects.Name = 'AutoExec' AND MSysObjects.Type = -32766"
    
    Set oRst = MsBase.OpenRecordset(sSql)
    If Not (oRst.EOF And oRst.BOF) Then HasAutoexec = True

    oRst.Close
    Set oRst = Nothing

End Function

Private Function GetStartUpForm(ByRef MsBase As DAO.Database) As String
    Dim oProp As DAO.Property

    For Each oProp In MsBase.Properties
        If oProp.Name = "StartUpForm" Then
            GetStartUpForm = oProp.Value
            Exit For
        End If
    Next
    Set oProp = Nothing

End Function
'// ################################# END PRIV. SUB/FUNC #################################
