VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "C_TradScanText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'@Folder("Dev")
' ------------------------------------------------------
' Name     : C_TradScanTexte
' ------------------------------------------------------
' Kind     : Module de classe
' Purpose  : Extraction des textes à traduire.
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 30/06/2022 - 10:54
' DateMod  : 16/07/2022 - 13:54
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::

    Private m_lIDLang       As Long                 '// ID langue en cours.

    Private Const PROP_CAP  As String = "Caption"
    Private Const PROP_TIP  As String = "ControlTipText"
    Private Const PROP_BAR  As String = "StatusBarText"
'    Private Const PROP_VTXT As String = "ValidationText"    '// Table.

'    Private Type TObjet
'        ID      As String
'        Nom     As String
'        Type    As String
'        Caption As String
'    End Type
'    Private thisObj As TObjet
'    Private Type TControl
'        ID   As String
'        Nom  As String
'        Type As String
'    End Type
'    Private thisCtr As TControl

    Private m_ObjetID       As String
    Private m_ObjetNom      As String
    Private m_ObjetType     As String
    Private m_ObjetCaption  As String
    Private m_ControlID     As String
    Private m_ControlNom    As String
    Private m_ControlType   As String
    Private m_ParentNom     As String

    Private m_oApp          As Application      '// App externe.
    Private m_AppNom        As String           '// Nom App externe.
    Private m_oBDLocale     As DAO.Database     '// Base Currentdb.

    Private m_TableObjet    As DAO.Recordset    '// Table T_Objets.
    Private m_TableControl  As DAO.Recordset    '// Table T_Controles.
    Private m_TableTexte    As DAO.Recordset    '// Table T_TradTexte.
     Private qdfTemp        As DAO.QueryDef

    Private ObjetAcc        As C_ObjetsAccess   '// Objet access utilisés (database, application...)
    Private InfoScan        As C_LabelsInfo     '// Affichege info texte et barre lors du scan.
    Private m_bBarreInit    As Boolean          '// Indique classe InfoScan initialisée.

    Private bm              As cBenchmark       'TODO: Test temps
    Private bmC             As cBenchmark       'TODO: Test temps
    
'     Private testqdf As Boolean

'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Initialize()

    If (ObjetAcc Is Nothing) Then Set ObjetAcc = New C_ObjetsAccess
    If (InfoScan Is Nothing) Then Set InfoScan = New C_LabelsInfo
    
    If (qdfTemp Is Nothing) Then Set qdfTemp = CurrentDb.CreateQueryDef("")
    
    If (bm Is Nothing) Then Set bm = New cBenchmark
    If (bmC Is Nothing) Then Set bmC = New cBenchmark

    Set m_oBDLocale = CodeDb()
    m_bBarreInit = False
'TODO: Class_Initialize
End Sub

Private Sub Class_Terminate()

    If (Not m_oBDLocale Is Nothing) Then m_oBDLocale.Close
    Set m_oBDLocale = Nothing
    Set m_oApp = Nothing
    Set ObjetAcc = Nothing      '// Reset tous les objets.
    Set InfoScan = Nothing
    Set qdfTemp = Nothing
End Sub
'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get IDLangApp() As Long 'Note: Non utilisé
    IDLangApp = m_lIDLang
End Property
Public Property Let IDLangApp(IDLang As Long)
    m_lIDLang = LangueCheckID(IDLang)
End Property
'Public Property Let Settestqdf(activeTest As Boolean)
'    testqdf = activeTest
'End Property
'//====================================== END PROP =======================================

' TextLength

' Form.Caption
' Form.NavigationCaption

' Report.Caption

' Control.Caption
' Control.ControlTipText
' Control.StatusBarText

' Champs table Caption
' Champs table ValidationText msg si err

' Menu
' barre d'outils
 

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
' ----------------------------------------------------------------
' Procedure Nom:    ScanObjetsApp
' Sujet:            Recherche tous les objets dans l'application,
'                   Stock les info dans la table, scan les controles et les tete à traduire.
' Procedure Kind:   Function
' Procedure Access: Public
'
'=== Paramètres ===
' eObjectType1 (T_ObjectTypeNum):  Filtre 1 sur type d'objet (voir Enum T_ObjectTypeNum).
' eObjectType2 (T_ObjectTypeNum):  Fitre 2 sur type d'objet (voir Enum T_ObjectTypeNum.
' eObjectType3 (T_ObjectTypeNum):  Fitre 3 sur type d'objet (voir Enum T_ObjectTypeNum.
' oAutreBd (Database):  Pour test.
'==================
'
' Return Type:  True si pas de problème.
' Author    : Laurent
' Date      : 27/04/2022 - 10:36
' DateMod   : 28/06/2022 - 18:29
'
' ----------------------------------------------------------------
Public Function ScanObjetsApp(eObjectType1 As T_ObjectTypeNum, _
                     Optional eObjectType2 As T_ObjectTypeNum, _
                     Optional eObjectType3 As T_ObjectTypeNum) As Boolean
On Error GoTo ERR_ScanObjetsApp

    '// App et base non ouverte, on sort.
    If (ObjetAcc Is Nothing) Then Exit Function
    If (ObjetAcc.MsAppIsUp = False Or ObjetAcc.MsBaseIsOpen = False) Then Exit Function

    Dim sSql     As String
    Dim sObjNom  As String
    Dim ObjType  As T_ObjectTypeNum
    Dim bRep     As Boolean
    Dim oBdExt   As DAO.Database
    Dim oRstSys  As DAO.Recordset

    '// Extraire les objets de la table MsysObjects.
    sSql = "SELECT MsysObjects.Type, MsysObjects.Flags, MsysObjects.Name AS ObjectName FROM MsysObjects " & _
           "WHERE (((MsysObjects.Flags)>=0) AND ((MsysObjects.Type)=" & eObjectType1
           
    If (eObjectType2) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType2
    If (eObjectType3) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType3
           
    sSql = sSql & ") AND ((MsysObjects.Name) Not Like '~*' And (MsysObjects.Name) Not Like 'MSys*'))" & _
                  "ORDER BY MsysObjects.Type, MsysObjects.Name;"

    If (m_oApp Is Nothing) Then Set m_oApp = ObjetAcc.GetMsApp()            '// Obtenir l'APP externe à utiliser...
    If (ObjetAcc.MsBaseIsOpen) Then m_AppNom = ObjetAcc.BaseOuverteNom()    '// Extraire le nom de la base.

    Set oBdExt = m_oApp.CurrentDb                                       '// Definir la base externe à utiliser.
    Set oRstSys = oBdExt.OpenRecordset(sSql, dbOpenSnapshot)            '// Ouvre MsysObjects de la base externe.

    If (m_oBDLocale Is Nothing) Then Set m_oBDLocale = CodeDb()

    If m_bBarreInit Then InfoScan.InitialiseBarre oRstSys.RecordCount   '// Initialise la taille de la barre.

Dim ttt As String
ttt = "Scan testQDF " '& IIf(testqdf, "ON", "OFF")
    '// Boucle sur les objets de la table MsysObjects.
bm.TrackByName ttt
    bRep = True
    With oRstSys
        If (.RecordCount <> 0) Then
            Do While Not .EOF
                sObjNom = .Fields("ObjectName").Value
                ObjType = .Fields("Type").Value
                bRep = ScanObjet(sObjNom, ObjType)      '// Enregistre les info...
                If (bRep = False) Then Exit Do

                .MoveNext
            Loop
        End If
    End With
bm.Report 'TODO: Test temps

    If (Not oRstSys Is Nothing) Then oRstSys.Close: Set oRstSys = Nothing
    If (Not oBdExt Is Nothing) Then oBdExt.Close: Set oBdExt = Nothing
    Set m_oApp = Nothing

    '// Femeture des objets.
    If Not (m_TableTexte Is Nothing) Then m_TableTexte.Close: Set m_TableTexte = Nothing
    If Not (m_TableControl Is Nothing) Then m_TableControl.Close: Set m_TableControl = Nothing
    If Not (m_TableObjet Is Nothing) Then m_TableObjet.Close: Set m_TableObjet = Nothing

    If (bRep = False) Then SuppDonneesTexte m_AppNom    '// Efface tous en cas d'erreur...

SORTIE_ScanObjetsApp:
    ScanObjetsApp = bRep
    Exit Function

ERR_ScanObjetsApp:
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : ScanObjetsApp" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    bRep = False
    Resume SORTIE_ScanObjetsApp
End Function

Public Function GetInstanceObjetAcc() As C_ObjetsAccess
    If (Not ObjetAcc Is Nothing) Then Set GetInstanceObjetAcc = ObjetAcc
End Function
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################

'----------------------------------------------------------------
' Procedure Nom   : ScanObjet
' ----------------------------------------------------------------
' Sujet           : Stock le texte à traduire de l'objet et de ses contrôles.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Requi           :
'
'=== Paramètres ===
' ObjetNom (String)       : Nom de l'objet à utiliser.
' ObjetType (T_ObjectTypeNum): Type de l'objet (T_ObjectTypeNum)
'==================
'
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:30
' DateMod : 28/06/2022 - 18:38
' ----------------------------------------------------------------
Private Function ScanObjet(ObjetNom As String, ObjetType As T_ObjectTypeNum) As Boolean

On Error GoTo ERR_ScanObjet

    Dim oObjet      As Object
    Dim oCtr        As Access.Control
    Dim bRep        As Boolean
    Dim sInfoAvance As String

    If (Len(ObjetNom) = 0) Or (ObjetNom = vbNullString) Then Exit Function

    m_ObjetNom = ObjetNom
    m_ObjetType = GetObjectTypeEnClair(ObjetType)           '// Traduire en clair le Type...

    sInfoAvance = m_ObjetType & " " & m_ObjetNom
    If m_bBarreInit Then InfoScan.UpdateBarre sInfoAvance   '// Affiche l'état d'avancement du scan...
    DoEvents

    Set oObjet = GetObjet(ObjetNom, ObjetType)      '// Ouvre le form pour scan des contrôles...
    If (oObjet Is Nothing) Then Exit Function       '// Erreur, on sort.

    m_ObjetCaption = LTrim$(oObjet.Caption)
    bRep = MaJTexteObjet()                          '// Enregistre les info et le texte à traduire de l'objet (Form, Report)...
    If (bRep = False) Then GoTo SORTIE_ScanObjet

    '// On boucle sur les contrôles de l'objet.
    For Each oCtr In oObjet.Controls

'        If (ControlIsVisible(oCtr) = True) Then     '// Voir si control invisible...    'TODO: Ignore les ctr invisibles ?
            m_ControlNom = oCtr.name
            m_ControlType = TypeName(oCtr)
            bRep = ScanProprietes(oCtr)             '// Scan les propriétés du contrôle...
            If (bRep = False) Then Exit For
'        End If
    Next

    CloseObjet ObjetNom, ObjetType    '// Femeture de l'objet...

'If testqdf = False Then
'    Set m_TableTexte = Nothing
'    Set m_TableControl = Nothing
'    Set m_TableObjet = Nothing
'End If

SORTIE_ScanObjet:
    ScanObjet = bRep
    Exit Function

ERR_ScanObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.ScanObjet, ligne " & Erl & "."
    bRep = False
    Resume SORTIE_ScanObjet
End Function

' ----------------------------------------------------------------
' Procedure Nom   : MaJTexteObjet
' ----------------------------------------------------------------
' Sujet           : Stock le texte Caption de l'objet(Form, Report) à traduire
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Usage           : Table T_ObjetsCaption : si existe déjà les champ ObjetCaption est mis à jour.
' Requi           : Utilise les tables T_Objets et T_ObjetsCaption.
'
'=== Paramètres ===
'==================
'
' Return Boolean : TRUE si pas de problème.
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:05
' DateMod :
' ----------------------------------------------------------------
Private Function MaJTexteObjet() As Boolean
On Error GoTo ERR_MaJTexteObjet

    Dim sSql As String
'    Dim bAdd As Boolean
    Dim bRep As Boolean


'If testqdf Then

    m_ObjetID = m_AppNom & "." & m_ObjetType & "." & m_ObjetNom

    If (m_TableObjet Is Nothing) Then
        sSql = "SELECT T_Objets.Objet_ID, T_Objets.ObjetNom FROM T_Objets;"
        Set m_TableObjet = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)
    End If
    bRep = MajTableObjet

    If (m_TableControl Is Nothing) Then
        sSql = "SELECT T_ObjetControles.Control_ID, T_ObjetControles.ObjetParent_ID FROM T_ObjetControles;"
        Set m_TableControl = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)
    End If
    If bRep Then bRep = MajTableControl

    If (m_TableTexte Is Nothing) Then
        sSql = "SELECT T_TradTexte.Trad_ID, T_TradTexte.PropNom FROM T_TradTexte;"
       Set m_TableTexte = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)
    End If
    If bRep Then bRep = MajTableTexte

'Else
'    sSql = "SELECT T_Objets.* FROM T_Objets " & _
'           "WHERE (((T_Objets.ObjetNom)='" & m_ObjetNom & "'));"
'    Set m_TableObjet = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)
'
'    m_ObjetID = m_AppNom & "." & m_ObjetType & "." & m_ObjetNom
'
'    '// Stock les info sur l'objet.
'    With m_TableObjet
'        If (.RecordCount = 0) Then
'            .AddNew
'            .Fields("Objet_ID").Value = m_ObjetID
'            .Fields("ObjetNom").Value = m_ObjetNom
'            .Fields("ObjetType").Value = m_ObjetType
'            .Fields("ObjetApp").Value = m_AppNom
'            .Update
'            bAdd = True
'        Else
'            m_ObjetID = .Fields("Objet_ID").Value
'       End If
'    End With
'
'    If (Not m_TableObjet Is Nothing) Then m_TableObjet.Close
'
'    sSql = "SELECT T_ObjetControles.* FROM T_ObjetControles " & _
'           "WHERE (((T_ObjetControles.Control_ID)='" & m_ObjetID & "'));"
'    Set m_TableControl = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)
'
'    With m_TableControl
'        .FindFirst ("Control_ID='" & m_ObjetID & "'")
'
'        If (.NoMatch) Then
'            .AddNew
'            .Fields("Control_ID").Value = m_ObjetID
'            .Fields("ControlNom").Value = m_ObjetNom
'            .Fields("ControlType").Value = m_ObjetType
'            .Fields("ObjetParent_ID").Value = m_ObjetID
'            .Fields("ControlParentName").Value = m_AppNom
'            .Update
'        End If
'
'    End With
'    If (Not m_TableControl Is Nothing) Then m_TableControl.Close
'
'    sSql = "SELECT T_TradTexte.* FROM T_TradTexte " & _
'           "WHERE (((T_TradTexte.Trad_ID)='" & m_ObjetID & "'));"
'    Set m_TableTexte = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)
'
'    '// Ajout/MàJ de la table du texte d'origine à traduire de l'objet.
'    With m_TableTexte
'        If bAdd Then
'            .AddNew
'            .Fields("Trad_ID").Value = m_ObjetID
'            .Fields("PropNom").Value = PROP_CAP
'            .Fields("PropTexte").Value = m_ObjetCaption
'            .Fields("LangueCode").Value = m_lIDLang
'            .Fields("DateMaJ").Value = Now()
'            .Fields("DefLangue").Value = True
'        Else
'            .Edit
'            .Fields("PropTexte").Value = m_ObjetCaption
'            .Fields("DateMaJ").Value = Now()
'        End If
'
'        .Update
'
'    End With
'
'    If (Not m_TableTexte Is Nothing) Then m_TableTexte.Close
'
'    bRep = True
'End If

SORTIE_MaJTexteObjet:
    MaJTexteObjet = bRep
    Exit Function

ERR_MaJTexteObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.MaJTexteObjet, ligne " & Erl & "."
    bRep = False
    Resume SORTIE_MaJTexteObjet
End Function

Private Function MajTableObjet() As Boolean

    Dim sSql As String

    m_TableObjet.FindFirst "[ObjetNom]='" & m_ObjetNom & "'"

    If m_TableObjet.NoMatch = False Then
        m_ObjetID = m_TableObjet.Fields("Objet_ID").Value
        Exit Function
    End If

    sSql = "INSERT INTO T_Objets " & _
            "(Objet_ID, ObjetNom, ObjetType, ObjetApp) VALUES " & _
            "('" & m_ObjetID & "', '" & m_ObjetNom & "', '" & m_ObjetType & "', '" & m_AppNom & "');"

    qdfTemp.SQL = sSql
    qdfTemp.Execute
    MajTableObjet = True

End Function

Private Function MajTableControl(Optional ScanProp As Boolean = False) As Boolean

    Dim sSql As String

    If ScanProp = False Then
        m_TableControl.FindFirst "[Control_ID]='" & m_ObjetID & "'"

        If m_TableObjet.NoMatch = False Then Exit Function

        sSql = "INSERT INTO T_ObjetControles " & _
               "(Control_ID, ControlNom, ControlType, ObjetParent_ID, ControlParentName) VALUES " & _
               "('" & m_ObjetID & "', '" & m_ObjetNom & "', '" & m_ObjetType & "', '" & m_ObjetID & "', '" & m_AppNom & "');"
    Else

        m_TableControl.FindFirst "[ObjetParent_ID]='" & m_ObjetID & "'"

        If m_TableObjet.NoMatch = False Then
            m_ControlID = m_TableControl.Fields("Control_ID").Value
            Exit Function
        End If
    
        sSql = "INSERT INTO T_ObjetControles " & _
               "(Control_ID, ControlNom, ControlType, ObjetParent_ID, ControlParentName) VALUES " & _
               "('" & m_ControlID & "', '" & m_ControlNom & "', '" & m_ControlType & "', '" & m_ObjetID & "', '" & m_ParentNom & "');"
End If

    qdfTemp.SQL = sSql
    qdfTemp.Execute
    MajTableControl = True

End Function

Private Function MajTableTexte() As Boolean
'// On sotck les valeur meme vide pour les forms et les reports.

    Dim sSql    As String
    Dim sTest   As String
    Dim sTxt As String

    sTest = CheckApostrophe(m_ObjetCaption)     '// Vérifier si apostrophe dans le texte...
    sTxt = IIf(sTest = vbNullString, m_ObjetCaption, sTest)

    m_TableTexte.FindFirst "[Trad_ID]='" & m_ObjetID & "'"

    If m_TableObjet.NoMatch Then

        sSql = "INSERT INTO T_TradTexte " & _
               "(Trad_ID, PropNom, PropTexte, LangueCode, DateMaJ, DefLangue) VALUES " & _
               "('" & m_ObjetID & "', '" & PROP_CAP & "', '" & sTxt & "', " & m_lIDLang & ", '" & Now() & "', " & -1 & ");"
    Else
        sSql = "UPDATE T_TradTexte " & _
               "SET PropTexte='" & m_ObjetCaption & "', " & _
               "DateMaJ='" & Now() & "';"
    End If

    qdfTemp.SQL = sSql
    qdfTemp.Execute
    MajTableTexte = True

End Function

'----------------------------------------------------------------
' Procedure Nom   : ScanProprietes
' ----------------------------------------------------------------
' Sujet           : Vérifier si du texte à traduire pour le control, (caption, tiptext, bartext)
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Requi           :
'
'=== Paramètres ===
' ObjControl (Control):
'==================
'
' Return Boolean : TRUE si pas de problème.
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:31
' DateMod :
' ----------------------------------------------------------------
Private Function ScanProprietes(ObjControl As Access.Control) As Boolean
On Error GoTo ERR_ScanProprietes

'ControlTipText
' acLabel-acTextBox-acListBox-acComboBox-acCommandButton-acOptionButton-
' acCheckBox-acToggleButton-acNavigationControl-acNavigationButton-acPage-
' acImage-acAttachment-acBoundObjectFrame-acObjectFrame-

'StatusBarText
' acTextBox-acListBox-acComboBox-acCommandButton-acOptionButton-acCheckBox-
' acToggleButton-acNavigationControl-acNavigationButton-acSubForm-acTabCtl-
' acPage-acAttachment-acBoundObjectFrame-acObjectFrame-

'Caption
' Form-Report
' acLabel-acCommandButton-acNavigationButton-acPage-acToggleButton

'NavigationCaption
' Form
 
' acLabel               100
' acTextBox             109
' acListBox             110
' acComboBox            111
' acCommandButton       104
' acOptionGroup         107
' acOptionButton        105
' acToggleButton        122
' acCheckBox            106
' acImage               103

' acTabCtl              123 Onglet
' acPage                124 Page onglet

' acNavigationControl   129
' acNavigationButton    130

' acSubForm             112 SubForm/SubReport

'                       113 Chart1
' acAttachment          126 Pièce jointe
' acBoundObjectFrame    108 Cadre d’objet dépendant
' acObjectFrame         114 Cadre d'objet indépendant


'Erreur :
'Label      StatusBarText
'Image      StatusBarText
'TabControl     ControlTipText
'SubForm        ControlTipText
'TextBox            Caption
'ComboBox           Caption
'TabControl         Caption
'OptionGroup        Caption
'ListBox            Caption
'CheckBox           Caption
'ObjectFrame        Caption
'Attachment         Caption
'OptionButton       Caption
'BoundObjectFrame   Caption
'Image              Caption
'ObjectFrame        Caption
'NavigationControl  Caption
'SubForm            Caption

    Dim sCaption        As String
    Dim sStatusBarText  As String
    Dim sControlTipText As String
    Dim bRep            As Boolean

    '// Voir si possède un control parent (page, label, etc...)
    m_ParentNom = IIf((ObjControl.Parent.name <> m_ObjetNom), TypeName(ObjControl.Parent) & "." & ObjControl.Parent.name, vbNullString)

    sCaption = LTrim$(ObjControl.Properties(PROP_CAP).Value)
    sStatusBarText = LTrim$(ObjControl.Properties(PROP_BAR).Value)
    sControlTipText = LTrim$(ObjControl.Properties(PROP_TIP).Value)

'If testqdf = False Then
'    bRep = MajTexteControl(sCaption, sStatusBarText, sControlTipText)   '// Enregistre les texte à traduire du contrôle...
'Else
    '// Les valeurs vide ou de moins de 2 caractères sont ignorées, on sort.    'TODO: voir si enregistrer quand même
    If ((Len(sCaption) < 2) And (Len(sControlTipText) < 2) And (Len(sStatusBarText) < 2)) Then
        ScanProprietes = True
        Exit Function
    End If

    m_ControlID = m_ObjetID & "." & m_ControlNom
    bRep = MajTableControl(True)
    If bRep Then bRep = MajTableTexteProp(PROP_CAP, sCaption)
    If bRep Then bRep = MajTableTexteProp(PROP_TIP, sStatusBarText)
    If bRep Then bRep = MajTableTexteProp(PROP_BAR, sControlTipText)

'End If

SORTIE_ScanProprietes:
    ScanProprietes = bRep
    Exit Function

ERR_ScanProprietes:
    If (Err.Number = 2455) Then Resume Next     '// Propriété inexistante.
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.Module1.ScanProprietes, ligne " & Erl & "."
    bRep = False
    Resume SORTIE_ScanProprietes
End Function

' ----------------------------------------------------------------
' Procedure Nom   : MajTexteControl
' ----------------------------------------------------------------
' Sujet           : Stock les texte à traduire du contrôles
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Usage           : Table T_ControlesTxt : si existe déjà tous les champs à traduire sont mis à jour.
' Requi           : Utilise les tables T_Controles et T_ControlesTxt.
'
'=== Paramètres ===
' ctrParentName (String)   : Nom du controle parent(si il y en as).
' ctrCaption (String)      :
' ctrTipText (String)      :
' ctrStatusBarText (String):
'==================
'
' Return Boolean :  TRUE si pas de problème.
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:01
' DateMod :
' ----------------------------------------------------------------
'Private Function MajTexteControl(ctrCaption As String, ctrTipText As String, ctrStatusBarText As String) As Boolean
'On Error GoTo ERR_MajTexteControl
'
'    '// Les valeurs vide ou de moins de 2 caractères sont ignorées, on sort.    'TODO: voir si enregistrer quand même
'    If ((Len(ctrCaption) < 2) And (Len(ctrTipText) < 2) And (Len(ctrStatusBarText) < 2)) Then
'        MajTexteControl = True
'        Exit Function
'    End If
'
'    Dim sSql    As String
'    Dim bRep    As Boolean
'
'    m_ControlID = m_ObjetID & "." & m_ControlNom
'
'
'    sSql = "SELECT T_ObjetControles.* FROM T_ObjetControles " & _
'           "WHERE (((T_ObjetControles.ObjetParent_ID)='" & m_ObjetID & "'));"
'    Set m_TableControl = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)
'
'    '// Stock les info sur le contrôle de l'objet en cours, si pas déjà fait.
'    With m_TableControl
'        .FindFirst ("Control_ID='" & m_ControlID & "'")
'
'        If (.NoMatch) Then
'            .AddNew
'            .Fields("Control_ID").Value = m_ControlID
'            .Fields("ControlNom").Value = m_ControlNom
'            .Fields("ControlType").Value = m_ControlType
'            .Fields("ObjetParent_ID").Value = m_ObjetID
'            .Fields("ControlParentName").Value = m_ParentNom
'            .Update
'        Else
'            m_ControlID = .Fields("Control_ID").Value
'        End If
'
'    End With
'    m_TableControl.Close
'
'    '// Stock les textes à traduire du contrôle, ou les met à jour.
'    sSql = "SELECT T_TradTexte.* FROM T_TradTexte " & _
'           "WHERE (((T_TradTexte.Trad_ID)='" & m_ControlID & "'));"
'    Set m_TableTexte = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)
'
'    '// Stock les valeurs des propriétés...
'    bRep = UpdateControleProp(PROP_CAP, ctrCaption)
'    If bRep Then bRep = UpdateControleProp(PROP_TIP, ctrTipText)
'    If bRep Then bRep = UpdateControleProp(PROP_BAR, ctrStatusBarText)
'
'    m_TableTexte.Close
'
'
'SORTIE_MajTexteControl:
'    MajTexteControl = bRep
'    Exit Function
'
'ERR_MajTexteControl:
'    MsgBox "Erreur " & Err.Number & vbCrLf & _
'            " (" & Err.Description & ")" & vbCrLf & _
'            "Dans  TradAccess.MD_Dev.MajTexteControl, ligne " & Erl & "."
'    bRep = False
'    Resume SORTIE_MajTexteControl
'End Function

'----------------------------------------------------------------
' Procedure Nom   : UpdateControleProp
' ----------------------------------------------------------------
' Sujet           : Enregistre le texte à traduire de la propriété du contrôle.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Requi           :
'
'=== Paramètres ===
' sProp (String)    : Nom de la propriété.
' sPropVal (String) : Valeur de la propriété.
'==================
'
'
' Author  : Laurent
' Date    : 26/06/2022 - 09:46
' DateMod :
' ----------------------------------------------------------------
Private Function UpdateControleProp(sPropName As String, sPropVal As String) As Boolean
On Error GoTo ERR_UpdateControleProp

    '// Ignore la proppriété si elle ne contient pas de texte à traduire.
    If (Len(sPropVal) < 2) Or (sPropVal = vbNullString) Then UpdateControleProp = True: Exit Function

    '// Stock le texte de la langue d'origine pour traduction.
    With m_TableTexte
        .FindFirst ("[PropNom]='" & sPropName & "'")
    
        If (.NoMatch) Then
            .AddNew
            .Fields("Trad_ID").Value = m_ControlID
            .Fields("PropNom").Value = sPropName
            .Fields("PropTexte").Value = sPropVal
            .Fields("LangueCode").Value = m_lIDLang
            .Fields("DateMaJ").Value = Now()
            .Fields("DefLangue").Value = True
        Else
            .Edit
            .Fields("PropTexte").Value = sPropVal
            .Fields("DateMaJ").Value = Now()
        End If

        .Update
    End With

    UpdateControleProp = True

SORTIE_UpdateControleProp:
    Exit Function

ERR_UpdateControleProp:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.UpdateControleProp, ligne " & Erl & "."
    Resume SORTIE_UpdateControleProp
End Function

Private Function MajTableTexteProp(PropNom As String, PropTexte As String) As Boolean

    '// Ignore la proppriété si elle ne contient pas de texte à traduire.
    If (Len(PropTexte) < 2) Or (PropTexte = vbNullString) Then MajTableTexteProp = True: Exit Function

    Dim sSql    As String
    Dim sTest   As String
    Dim sTxt    As String

    sTest = CheckApostrophe(PropTexte)      '// Vérifier si apostrophe dans le texte...
    sTxt = IIf(sTest <> vbNullString, sTest, PropTexte)

    m_TableTexte.FindFirst "[Trad_ID]='" & m_ControlID & "' AND [PropNom]='" & PropNom & "'"

    If m_TableObjet.NoMatch Then
        sSql = "INSERT INTO T_TradTexte " & _
               "(Trad_ID, PropNom, PropTexte, LangueCode, DateMaJ, DefLangue) VALUES " & _
               "('" & m_ControlID & "', '" & PropNom & "', '" & sTxt & "', " & m_lIDLang & ", '" & Now() & "', " & -1 & ");"
    Else
        sSql = "UPDATE T_TradTexte " & _
               "SET PropTexte='" & PropTexte & "', " & _
               "DateMaJ='" & Now() & "';"
    End If

    qdfTemp.SQL = sSql
    qdfTemp.Execute
    MajTableTexteProp = True

End Function

'----------------------------------------------------------------
' Procedure Nom   : SuppDonneesTexte
' ----------------------------------------------------------------
' Sujet           : Efface toutes les données des tables pour l'app indiquer.
' Procedure Kind  : Sub
' Procedure Access: Private
' Objectif        :
' Usage           : Utilisée dans le cas ou une erreur survient lors du scan.
'
'=== Paramètres ===
' AppNom (String): Nom de l'application.
'==================
'
' Author  : Laurent
' Date    : 29/06/2022 - 17:08
' DateMod :
' ----------------------------------------------------------------
Private Sub SuppDonneesTexte(AppNom As String)

    Dim sSql As String
    Dim Bd   As DAO.Database
    Dim Qdef As DAO.QueryDef

    sSql = "DELETE T_Objets.* FROM T_Objets " & _
           "WHERE (((T_Objets.ObjetApp)='" & AppNom & "'));"
    Set Bd = CodeDb
    Set Qdef = Bd.CreateQueryDef("", sSql)
    Qdef.Execute dbFailOnError

    Qdef.Close
    Bd.Close
    Set Qdef = Nothing
    Set Bd = Nothing

End Sub
'----------------------------------------------------------------
' Procedure Nom   : GetObjet
' ----------------------------------------------------------------
' Sujet           : Ouvre l'objet (Form,Report) de la base en mode création et non visible.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Requi           :
'
'=== Paramètres ===
' ObjetNom (String)         :
' ObjetType (T_ObjectTypeNum)  : Type Const.
'==================
'
' Return Object :   L'objet ou nothing si erreur.
'
' Author  : Laurent
' Date    : 23/06/2022 - 15:35
' DateMod :
' ----------------------------------------------------------------
Private Function GetObjet(ObjetNom As String, ObjetType As T_ObjectTypeNum) As Object
On Error GoTo ERR_GetObjet

    Select Case ObjetType
        Case T_FormType
            m_oApp.DoCmd.OpenForm ObjetNom, acDesign, , , , acHidden
            Set GetObjet = m_oApp.Forms.Item(ObjetNom)
        Case T_ReportType
            m_oApp.DoCmd.OpenReport ObjetNom, acViewDesign, , , acHidden
            Set GetObjet = m_oApp.Reports.Item(ObjetNom)
    End Select

SORTIE_GetObjet:
    Exit Function

ERR_GetObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.GetObjet, ligne " & Erl & "."
    Resume SORTIE_GetObjet
End Function

Private Sub CloseObjet(ObjetNom As String, ObjetType As T_ObjectTypeNum, Optional Methode As AcCloseSave = acSaveNo)
    Select Case ObjetType
        Case T_FormType
            m_oApp.DoCmd.Close acForm, ObjetNom, Methode
        Case T_ReportType
            m_oApp.DoCmd.Close acReport, ObjetNom, Methode
    End Select
End Sub

' ----------------------------------------------------------------
' Procedure Nom:            ControlIsVisible
' Sujet:                    Vérification si control non visible.
' Procedure Kind:           Function
' Procedure Access:         Private
' Parameter oCtr (Control): Control a vérifier
' Return Type:              Boolean, TRUE Visible.
' Author:                   Laurent
' Date:                     15/04/2022
' ----------------------------------------------------------------
Private Function ControlIsVisible(oCtr As Control) As Boolean   'Note: Non utilisé en attente ControlIsVisible
On Error GoTo ERR_ControlIsVisible

    Dim bRep As Boolean
    bRep = (oCtr.Visible)

SORTIE_ControlIsVisible:
    ControlIsVisible = bRep
    Exit Function

ERR_ControlIsVisible:
    bRep = False
    Resume SORTIE_ControlIsVisible
End Function

Private Function LangueCheckID(IDLang As Long) As Long
'// Extraire la langue de l'app
'// vérifier si elle existe dans la table T_Langues.
    Dim vLang As Variant

    vLang = DLookup("[LangueCode]", "T_Langues", "[LangueCode]=" & IDLang)
    If (IsNull(vLang)) Then
        LangueCheckID = 0
    Else
        LangueCheckID = Val(vLang)
    End If

End Function

Public Function LangueExtraireFlag(Optional IDLang As Long = 0) As String
'// Détermine l'image à afficher suivant l'ID de la langue,
'// vérifie si le fichier image flag existe, retourne Null si pas trouver.
    Dim sImg As String
    Dim lID  As Long

    lID = IIf(IDLang = 0, m_lIDLang, 0)

    sImg = CurrentProject.Path & DOS_DRAP & LTrim$(str$(lID)) & ".png"
    If FSOCheckFileExist(sImg) Then
        LangueExtraireFlag = sImg
    Else
        LangueExtraireFlag = vbNullString
    End If

End Function

Public Function LangueGetIDLangBase(AppName As String) As Long
'// Obtenir l'ID de la langue d'origine de la base.
    Dim oRst As DAO.Recordset
    Dim sSql As String
    Dim lID  As Long

    sSql = "SELECT DISTINCT T_TradTexte.LangueCode FROM T_Objets " & _
           "LEFT JOIN T_TradTexte ON T_Objets.Objet_ID = T_TradTexte.Trad_ID " & _
           "WHERE (((T_Objets.ObjetApp)='" & AppName & "') AND ((T_TradTexte.DefLangue)=True));"
    Set oRst = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)
    If (oRst.RecordCount <> 0) Then lID = oRst.Fields.Item("LangueCode").Value

    oRst.Close
    Set oRst = Nothing
    LangueGetIDLangBase = lID

End Function

Public Sub InitialiseLabelsInfo(lblTexte As Access.Label, lblBarre As Access.Label)
'// Initialise les controles label à utiliser pour afficher les info et la barre d'avancement.
    InfoScan.LabelBarre = lblBarre
    InfoScan.LabelTexte = lblTexte
    m_bBarreInit = True
End Sub
'// ################################# END PRIV. SUB/FUNC #################################
