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
' Name     : C_TradTexte
' ------------------------------------------------------
' Kind     : Module de classe
' Purpose  : Extraction des textes à traduire.
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 30/06/2022 - 10:54
' DateMod  :
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
'// Project Types
    Public Enum T_ObjectType
        Table_Local = 1
        Table_Linked_ODBC = 4
        Table_Linked = 6
    '    QueriesType = 5
        FormType = -32768
        ReportType = -32764
    '    MacrosType = -32766
    '    ModulesType = -32761
    End Enum

    Public Enum T_ImageSize
        Small = 16
        Medium = 32
    End Enum

    Private Const DOS_DRAP  As String = "\Flags\"   '// Dossier des drapeaux (sous dossier de l'app).
    Private m_lIDLang       As Long                 '// ID langue en cours.

    Private Const PROP_CAP  As String = "Caption"
    Private Const PROP_TIP  As String = "ControlTipText"
    Private Const PROP_BAR  As String = "StatusBarText"
    
    Private m_ObjetID       As String
    Private m_ObjetNom      As String
    Private m_ObjetType     As String
    Private m_ObjetCaption  As String
    Private m_ControlID     As String
    Private m_ControlNom    As String
    Private m_ControlType   As String

    Private m_oApp          As Application      '// App externe.
    Private m_AppNom        As String           '// Nom App externe.
    Private m_oBDLocale     As DAO.Database     '// Base Currentdb.
    Private m_RstObjet      As DAO.Recordset    '// Table T_Objets.
    Private m_RstControl    As DAO.Recordset    '// Table T_Controles.
    Private m_RstControlTxt As DAO.Recordset    '// Table T_TradTexte.

    Private m_ObjetAcc      As C_ObjetsAccess   '// Objet access utilisés (database, application...)
    Private m_Barre         As C_TradBarre      '// Affichege info texte et barre lors du scan.
    Private m_bBarreInit    As Boolean          '// Indique classe m_Barre initialisée.

'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Initialize()

    If (m_ObjetAcc Is Nothing) Then Set m_ObjetAcc = New C_ObjetsAccess
    If (m_Barre Is Nothing) Then Set m_Barre = New C_TradBarre

    Set m_oBDLocale = CodeDb()
    m_bBarreInit = False
' TODO: Class_Initialize
End Sub

Private Sub Class_Terminate()
    If (Not m_oBDLocale Is Nothing) Then m_oBDLocale.Close
    Set m_oBDLocale = Nothing
    Set m_oApp = Nothing
    Set m_ObjetAcc = Nothing        '// Reset tous les objets.
End Sub
'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get IDLangApp() As Long
    IDLangApp = m_lIDLang
End Property
Public Property Let IDLangApp(IDLang As Long)
    m_lIDLang = LangueCheckID(IDLang)
End Property
'//====================================== END PROP =======================================

' TextLength

' Form.Caption
' Form.NavigationCaption

' Report.Caption

' ControlTipText
' StatusBarText

' Champs table Caption
' Champs table ValidationText msg si err
' Champs table Caption

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
' eObjectType1 (T_ObjectType):  Filtre 1 sur type d'objet (voir Enum T_ObjectType).
' eObjectType2 (T_ObjectType):  Fitre 2 sur type d'objet (voir Enum T_ObjectType.
' eObjectType3 (T_ObjectType):  Fitre 3 sur type d'objet (voir Enum T_ObjectType.
' oAutreBd (Database):  Pour test.
'==================
'
' Return Type:  True si pas de problème.
' Author    : Laurent
' Date      : 27/04/2022 - 10:36
' DateMod   : 28/06/2022 - 18:29
'
' ----------------------------------------------------------------
Public Function ScanObjetsApp(eObjectType1 As T_ObjectType, _
                            Optional eObjectType2 As T_ObjectType, _
                            Optional eObjectType3 As T_ObjectType) As Boolean ', _
                            'Optional lblInfo As Access.Label = Nothing, _
                            'Optional lblBarre As Access.TextBox = Nothing) As Boolean
On Error GoTo ERR_ScanObjetsApp

    '// App et base non ouverte, on sort.
    If (m_ObjetAcc Is Nothing) Then Exit Function
    If (m_ObjetAcc.MsAppIsUp = False Or m_ObjetAcc.MsBaseIsOpen = False) Then Exit Function

    Dim sSql     As String
    Dim sObjNom  As String
    Dim ObjType  As T_ObjectType
    Dim bRep     As Boolean
    Dim oBdExt   As DAO.Database
    Dim oRst     As DAO.Recordset

    Dim lNbBar   As Long  '// Label Barre avancement du scan dans le formulaire F_MainTxt. TODO: lblBarre
 
    '// Extraire les objets de la table MsysObjects.
    sSql = "SELECT MsysObjects.Type, MsysObjects.Flags, MsysObjects.Name AS ObjectName FROM MsysObjects " & _
           "WHERE (((MsysObjects.Flags)>=0) AND ((MsysObjects.Type)=" & eObjectType1
           
    If (eObjectType2) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType2
    If (eObjectType3) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType3
           
    sSql = sSql & ") AND ((MsysObjects.Name) Not Like '~*' And (MsysObjects.Name) Not Like 'MSys*'))" & _
                  "ORDER BY MsysObjects.Type, MsysObjects.Name;"

    If (m_oApp Is Nothing) Then Set m_oApp = m_ObjetAcc.GetMsApp()              '// Obtenir l'APP externe à utiliser...
    If (m_ObjetAcc.MsBaseIsOpen) Then m_AppNom = m_ObjetAcc.BaseOuverteNom()    '// Extraire le nom de la base.
'    m_lIDLang = Application.LanguageSettings.LanguageID(msoLanguageIDUI) TODO: Def lang...

    Set oBdExt = m_oApp.CurrentDb                                   '// Definir la base externe à utiliser.
    Set oRst = oBdExt.OpenRecordset(sSql, dbOpenSnapshot)           '// Ouvre MsysObjects de la base externe.

    If (m_oBDLocale Is Nothing) Then Set m_oBDLocale = CodeDb()

    If m_bBarreInit Then m_Barre.InitialiseBarre = oRst.RecordCount  '// Initialise la taille de la barre.

    '// Boucle sur les objets de la table MsysObjects.
    bRep = True
    With oRst
        If (.RecordCount <> 0) Then
            Do While Not .EOF
                sObjNom = .Fields("ObjectName").Value
                ObjType = .Fields("Type").Value

                '// Affiche l'état d'avancement du scan.
                If m_bBarreInit Then m_Barre.UpdateBarre sObjNom
                DoEvents

                bRep = ScanObjet(sObjNom, ObjType)  '// Enregistre les info... TODO: lblAvance
                If (bRep = False) Then Exit Do

                .MoveNext
            Loop
        End If
    End With

    ScanObjetsApp = bRep

SORTIE_ScanObjetsApp:

'    If (Not m_oBDLocale Is Nothing) Then m_oBDLocale.Close: Set m_oBDLocale = Nothing  TODO: bdlocale reset
    If (Not oRst Is Nothing) Then oRst.Close: Set oRst = Nothing

    If (Not oBdExt Is Nothing) Then Set oBdExt = Nothing
    Set m_oApp = Nothing
'    Set LblAvance = Nothing

    If (bRep = False) Then SuppDonneesApp m_AppNom      '// Efface tous en cas d'erreur...
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

Public Function GetClsObjAcc() As C_ObjetsAccess
    If (Not m_ObjetAcc Is Nothing) Then Set GetClsObjAcc = m_ObjetAcc
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
' Note            :
' Requi           :
'
'=== Paramètres ===
' ObjetNom (String)       : Nom de l'objet à utiliser.
' ObjetType (T_ObjectType): Type de l'objet (T_ObjectType)
'==================
'
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:30
' DateMod : 28/06/2022 - 18:38
' ----------------------------------------------------------------
Private Function ScanObjet(ObjetNom As String, ObjetType As T_ObjectType) As Boolean

On Error GoTo ERR_ScanObjet

    Dim oObjet      As Object
    Dim oCtr        As Access.Control
    Dim bRep        As Boolean

    If Len(ObjetNom) = 0 Then Exit Function
    
    DoCmd.Hourglass True

    Set oObjet = GetObjet(ObjetNom, ObjetType)  '// Ouvre le form pour scan des contrôles...
    If (oObjet Is Nothing) Then Exit Function   '// Erreur, on sort.

    m_ObjetNom = ObjetNom
    m_ObjetType = ObjectTypeName(ObjetType)     '// Traduire en clair le Type...
    m_ObjetCaption = LTrim$(oObjet.Caption)

    bRep = UpdateRstObjet()                     '// Enregistre les info et le texte à traduire de l'objet...
    If (bRep = False) Then GoTo SORTIE_ScanObjet

    '// On boucle sur les contrôles de l'objet.
    For Each oCtr In oObjet.Controls

        m_ControlNom = oCtr.Name
        m_ControlType = TypeName(oCtr)
        bRep = ScanProprietes(oCtr)             '// Voir si des propriétés du contrôle à traduire...
        If (bRep = False) Then Exit For

    Next

    '// Femeture des objets.
    If Not (m_RstControl Is Nothing) Then m_RstControl.Close
    If Not (m_RstObjet Is Nothing) Then m_RstObjet.Close

    CloseObjet ObjetNom, ObjetType
    
SORTIE_ScanObjet:
    ScanObjet = bRep

    Set m_RstControlTxt = Nothing
    Set m_RstControl = Nothing
    Set m_RstObjet = Nothing
    DoCmd.Hourglass False
    Exit Function

ERR_ScanObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.ScanObjet, ligne " & Erl & "."
            Resume Next
    bRep = False
    Resume SORTIE_ScanObjet
End Function

' ----------------------------------------------------------------
' Procedure Nom   : UpdateRstObjet
' ----------------------------------------------------------------
' Sujet           : Stock le texte Caption de l'objet à traduire
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Usage           :
' Note            : Table T_ObjetsCaption : si existe déjà les champ ObjetCaption est mis à jour.
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
Private Function UpdateRstObjet() As Boolean
On Error GoTo ERR_UpdateRstObjet

    Dim sSql As String
    Dim bAdd As Boolean

    sSql = "SELECT T_Objets.* FROM T_Objets " & _
           "WHERE (((T_Objets.ObjetNom)='" & m_ObjetNom & "'));"
    Set m_RstObjet = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)
    
    '// Stock les info sur l'objet.
    With m_RstObjet
        If (.RecordCount = 0) Then
            .AddNew
            m_ObjetID = m_AppNom & "." & m_ObjetType & "." & m_ObjetNom
            .Fields("Objet_ID").Value = m_ObjetID
            .Fields("ObjetNom").Value = m_ObjetNom
            .Fields("ObjetType").Value = m_ObjetType
            .Fields("ObjetApp").Value = m_AppNom
            .Update
            bAdd = True
        Else
             m_ObjetID = .Fields("Objet_ID").Value
       End If
    End With

    If (Not m_RstObjet Is Nothing) Then m_RstObjet.Close

    sSql = "SELECT T_ObjetControles.* FROM T_ObjetControles " & _
           "WHERE (((T_ObjetControles.Control_ID)='" & m_ObjetID & "'));"
    Set m_RstObjet = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)

    With m_RstObjet
        .FindFirst ("Control_ID='" & m_ObjetID & "'")

        If (.NoMatch) Then
            .AddNew
            .Fields("Control_ID").Value = m_ObjetID
            .Fields("ControlNom").Value = m_ObjetNom
            .Fields("ControlType").Value = m_ObjetType
            .Fields("ObjetParent_ID").Value = m_ObjetID
            .Fields("ControlParentName").Value = m_AppNom
            .Update
        End If

    End With

    If (Not m_RstObjet Is Nothing) Then m_RstObjet.Close
    sSql = "SELECT T_TradTexte.* FROM T_TradTexte " & _
           "WHERE (((T_TradTexte.Trad_ID)='" & m_ObjetID & "'));"
    Set m_RstObjet = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)

    '// Ajout/MàJ de la table du texte d'origine à traduire de l'objet.
    With m_RstObjet
        If bAdd Then
            .AddNew
            .Fields("Trad_ID").Value = m_ObjetID
            .Fields("PropNom").Value = PROP_CAP
            .Fields("PropTexte").Value = m_ObjetCaption
            .Fields("LangueCode").Value = m_lIDLang
            .Fields("DateMaJ").Value = Now()
            .Fields("DefLangue").Value = True
        Else
            .Edit
            .Fields("PropTexte").Value = m_ObjetCaption
            .Fields("DateMaJ").Value = Now()
        End If

        .Update

    End With

    If (Not m_RstObjet Is Nothing) Then m_RstObjet.Close
    Set m_RstObjet = Nothing

    UpdateRstObjet = True

    
SORTIE_UpdateRstObjet:
    Exit Function

ERR_UpdateRstObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.UpdateRstObjet, ligne " & Erl & "."
            Resume Next
    Resume SORTIE_UpdateRstObjet
End Function

'----------------------------------------------------------------
' Procedure Nom   : ScanProprietes
' ----------------------------------------------------------------
' Sujet           : Vérifier si du texte à traduire pour le control, (caption, tiptext, bartext)
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Note            :
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

    Dim sParentNom      As String
    Dim sCaption        As String
    Dim sStatusBarText  As String
    Dim sControlTipText As String
    Dim bRep            As Boolean

    sParentNom = IIf((ObjControl.Parent.Name <> m_ObjetNom), TypeName(ObjControl.Parent) & "." & ObjControl.Parent.Name, vbNullString)

    sCaption = LTrim$(ObjControl.Properties(PROP_CAP).Value)
    sStatusBarText = LTrim$(ObjControl.Properties(PROP_BAR).Value)
    sControlTipText = LTrim$(ObjControl.Properties(PROP_TIP).Value)

    bRep = UpdateRstControl(sParentNom, sCaption, sStatusBarText, sControlTipText)      '// Enregistre les texte à traduire du contrôle...

    ScanProprietes = bRep

SORTIE_ScanProprietes:
    Exit Function

ERR_ScanProprietes:
    If (Err.Number = 2455) Then Resume Next     '// Propriété inexistante.
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.Module1.ScanProprietes, ligne " & Erl & "."
    Resume SORTIE_ScanProprietes
End Function

' ----------------------------------------------------------------
' Procedure Nom   : UpdateRstControl
' ----------------------------------------------------------------
' Sujet           : Stock les texte à traduire du contrôles
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Usage           :
' Note            : Table T_ControlesTxt : si existe déjà tous les champs à traduire sont mis à jour.
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
Private Function UpdateRstControl(ctrParentName As String, ctrCaption As String, ctrTipText As String, ctrStatusBarText As String) As Boolean
On Error GoTo ERR_UpdateRstControl

    '// Aucun texte à traduire, on sort.    'TODO: voir si enregistrer quand même
    If ((Len(ctrCaption) = 0) And (Len(ctrTipText) = 0) And (Len(ctrStatusBarText) = 0)) Then
        UpdateRstControl = True
        Exit Function
    End If

    Dim sSql    As String
    Dim bRep    As Boolean

    If (m_RstControl Is Nothing) Then
        sSql = "SELECT T_ObjetControles.* FROM T_ObjetControles " & _
               "WHERE (((T_ObjetControles.ObjetParent_ID)='" & m_ObjetID & "'));"
        Set m_RstControl = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)
    End If

    '// Stock les info sur le contrôle de l'objet en cours, si pas déjà fait.
    m_ControlID = m_ObjetID & "." & m_ControlNom
    With m_RstControl
        .FindFirst ("Control_ID='" & m_ControlID & "'")

        If (.NoMatch) Then
            .AddNew
            .Fields("Control_ID").Value = m_ControlID
            .Fields("ControlNom").Value = m_ControlNom
            .Fields("ControlType").Value = m_ControlType
            .Fields("ObjetParent_ID").Value = m_ObjetID
            .Fields("ControlParentName").Value = ctrParentName
            .Update
        Else
            m_ControlID = .Fields("Control_ID").Value
        End If

    End With

    '// Stock les textes à traduire du contrôle, ou les met à jour.
    sSql = "SELECT T_TradTexte.* FROM T_TradTexte " & _
           "WHERE (((T_TradTexte.Trad_ID) LIKE '" & m_ControlID & "*'));"
    Set m_RstControlTxt = m_oBDLocale.OpenRecordset(sSql, dbOpenDynaset)

    '// Stock les valeurs des propriétés...
    bRep = UpdateControleProp(PROP_CAP, ctrCaption)
    If bRep Then bRep = UpdateControleProp(PROP_TIP, ctrTipText)
    If bRep Then bRep = UpdateControleProp(PROP_BAR, ctrStatusBarText)

    m_RstControlTxt.Close
    UpdateRstControl = bRep
    
SORTIE_UpdateRstControl:
    Exit Function

ERR_UpdateRstControl:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.UpdateRstControl, ligne " & Erl & "."
    Resume SORTIE_UpdateRstControl
End Function

'----------------------------------------------------------------
' Procedure Nom   : UpdateControleProp
' ----------------------------------------------------------------
' Sujet           : Enregistre le texte à traduire de la propriété du contrôle.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Note            :
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
    If (Len(sPropVal) = 0) Then UpdateControleProp = True: Exit Function   'TODO: Test

    '// Stock le texte de la langue d'origine pour traduction.
    With m_RstControlTxt
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
            Resume Next
    Resume SORTIE_UpdateControleProp
End Function

'----------------------------------------------------------------
' Procedure Nom   : SuppDonneesApp
' ----------------------------------------------------------------
' Sujet           : Efface toutes les données des tables pour l'app indiquer.
' Procedure Kind  : Sub
' Procedure Access: Private
' Objectif        :
' Note            : Utilisée dans le cas ou une erreur survient lors du scan.
'
'=== Paramètres ===
' AppNom (String): Nom de l'application.
'==================
'
' Author  : Laurent
' Date    : 29/06/2022 - 17:08
' DateMod :
' ----------------------------------------------------------------
Private Sub SuppDonneesApp(AppNom As String)

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
' Sujet           : Ouvre l'objet de la base en mode création et non visible.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Note            :
' Requi           :
'
'=== Paramètres ===
' ObjetNom (String)         :
' ObjetType (T_ObjectType)  : Type Const.
'==================
'
' Return Object :   L'objet ou nothing si erreur.
'
' Author  : Laurent
' Date    : 23/06/2022 - 15:35
' DateMod :
' ----------------------------------------------------------------
Private Function GetObjet(ObjetNom As String, ObjetType As T_ObjectType) As Object
On Error GoTo ERR_GetObjet

    Select Case ObjetType
        Case FormType
            m_oApp.DoCmd.OpenForm ObjetNom, acDesign, , , , acHidden
            Set GetObjet = m_oApp.Forms.Item(ObjetNom)
        Case ReportType
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

Private Sub CloseObjet(ObjetNom As String, ObjetType As T_ObjectType, Optional Methode As AcCloseSave = acSaveNo)
    Select Case ObjetType
        Case FormType
            m_oApp.DoCmd.Close acForm, ObjetNom, Methode
        Case ReportType
            m_oApp.DoCmd.Close acReport, ObjetNom, Methode
    End Select
End Sub

'// Retourne en clair le type de l'objet.
Private Function ObjectTypeName(eType As T_ObjectType) As String
    Dim sType As String

    Select Case eType
        Case Table_Local
            sType = "Table locale"
        Case Table_Linked_ODBC
            sType = "Table liée (ODBC)l"
        Case Table_Linked
            sType = "Table liée"
'        Case QuerieType
'            sType = "Requête"
        Case FormType
            sType = "Form"
        Case ReportType
            sType = "Report"
'        Case MacroType
'            sType = "Macro"
'        Case ModuleType
'            sType = "Module"
        Case Else
            sType = "???"   'TODO: stype ="???"
    End Select

    ObjectTypeName = sType

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

    sImg = CurrentProject.Path & DOS_DRAP & LTrim$(Str$(lID)) & ".png"
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

Public Sub InitialiseBarre(lblTexte As Access.Label, lblBarre As Access.Label)
'// Initialise les controles à utiliser pour afficher les info et la barre d'avancement.
    m_Barre.LabelBarre = lblBarre
    m_Barre.LabelTexte = lblTexte
    m_bBarreInit = True
End Sub
'// ################################# END PRIV. SUB/FUNC #################################
