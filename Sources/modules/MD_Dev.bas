Attribute VB_Name = "MD_Dev"
'@Folder("Dev")
' ------------------------------------------------------
' Name     : MD_Dev
' ------------------------------------------------------
' Kind     : Module
' Purpose  :
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 21/06/2022 - 08:44
' DateMod  :
' Requi    :
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

Private Const CODELANG  As Long = "1036"
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

Private m_oBD           As DAO.Database
Private m_RstObjet      As DAO.Recordset
Private m_RstControl    As DAO.Recordset
Private m_RstControlTxt As DAO.Recordset

'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&     EVENTS        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& END EVENTS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

'//----------------------------------       INIT/TERM       ------------------------------
'//---------------------------------------------------------------------------------------


'//==================================       PROP        ==================================
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
'----------------------------------------------------------------
' Procedure Nom   : ScanObjet
' ----------------------------------------------------------------
' Sujet           :
' Procedure Kind  : Function
' Procedure Access: Public
' Objectif        :
' Note            :
' Requi           :
'
'=== Paramètres ===
' ObjetNom (String):
' ObjetType (T_ObjectType):
'==================
'
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:30
' DateMod :
' ----------------------------------------------------------------
Public Function ScanObjet(ObjetNom As String, ObjetType As T_ObjectType) As Boolean

    Dim oObjet      As Object
    Dim oCtr        As Access.Control
    Dim bRep        As Boolean

    If Len(ObjetNom) = 0 Then Exit Function
    
    Set oObjet = GetObjet(ObjetNom, ObjetType)  '// Ouvre le form pour scan des contrôles...
    If (oObjet Is Nothing) Then Exit Function   '// Erreur, on sort.

    m_ObjetNom = ObjetNom
    m_ObjetType = ObjectTypeName(ObjetType)
    m_ObjetCaption = LTrim(oObjet.Caption)

    bRep = UpdateRstObjet()                     '// Enregistre les info et le texte à traduire de l'objet...

    '// On boucle sur les contrôles de l'objet.
    For Each oCtr In oObjet.Controls

        m_ControlNom = oCtr.Name
        m_ControlType = TypeName(oCtr)
        bRep = ScanProprietes(oCtr)             '// Voir si des propriétés à traduire...
        If (bRep = False) Then Exit For

    Next

    '// Femeture des objets.
    If Not (m_RstControlTxt Is Nothing) Then Set m_RstControlTxt = Nothing
    If Not (m_RstControl Is Nothing) Then m_RstControl.Close: Set m_RstControl = Nothing
    If Not (m_RstObjet Is Nothing) Then m_RstObjet.Close: Set m_RstObjet = Nothing
    If (Not m_oBD Is Nothing) Then m_oBD.Close: Set m_oBD = Nothing

    CloseObjet ObjetNom, ObjetType

    ScanObjet = True

End Function
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################

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

    Dim sSql As String
    Dim sApp As String
    Dim bAdd As Boolean

    Set m_oBD = CodeDb

    sSql = "SELECT T_Objets.* FROM T_Objets " & _
           "WHERE (((T_Objets.ObjetNom)='" & m_ObjetNom & "'));"
    Set m_RstObjet = m_oBD.OpenRecordset(sSql, dbOpenDynaset)

    sApp = FSOGetBaseName(CurrentDb.Name)   '// Extraire le nom de l'app...
    
    '// Stock les info sur l'objet.
    With m_RstObjet
        If (.RecordCount = 0) Then
            .AddNew
            m_ObjetID = sApp & "." & m_ObjetType & "." & m_ObjetNom
            !Objet_ID = m_ObjetID
            !ObjetNom = m_ObjetNom
            !ObjetType = m_ObjetType
            !ObjetApp = sApp
            .Update
            bAdd = True
        Else
             m_ObjetID = !Objet_ID
       End If
    End With

    If (Not m_RstObjet Is Nothing) Then m_RstObjet.Close

    sSql = "SELECT T_ObjetControles.* FROM T_ObjetControles " & _
           "WHERE (((T_ObjetControles.Control_ID)='" & m_ObjetID & "'));"
    Set m_RstObjet = m_oBD.OpenRecordset(sSql, dbOpenDynaset)

    With m_RstObjet
        .FindFirst ("Control_ID='" & m_ObjetID & "'")

        If (.NoMatch) Then
            .AddNew
            !Control_ID = m_ObjetID
            !ControlNom = m_ObjetNom
            !ControlType = m_ObjetType
            !ObjetParent_ID = m_ObjetID
            !ControlParentName = sApp
            .Update
        End If

    End With

    If (Not m_RstObjet Is Nothing) Then m_RstObjet.Close
    sSql = "SELECT T_TradTexte.* FROM T_TradTexte " & _
           "WHERE (((T_TradTexte.Trad_ID)='" & m_ObjetID & "'));"
    Set m_RstObjet = m_oBD.OpenRecordset(sSql, dbOpenDynaset)

    '// Ajout/MàJ de la table du texte d'origine à traduire de l'objet.
    With m_RstObjet
        If bAdd Then
            .AddNew
            !Trad_ID = m_ObjetID
            !PropNom = PROP_CAP
            !PropTexte = m_ObjetCaption
            !LangueCode = CODELANG
            !DateMaJ = Now()
            !DefLangue = True
        Else
            .Edit
            !PropTexte = m_ObjetCaption
            !DateMaJ = Now()
        End If

        .Update

    End With

    If (Not m_RstObjet Is Nothing) Then m_RstObjet.Close
    Set m_RstObjet = Nothing

    UpdateRstObjet = True

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

    sCaption = LTrim(ObjControl.Properties(PROP_CAP).Value)
    sStatusBarText = LTrim(ObjControl.Properties(PROP_BAR).Value)
    sControlTipText = LTrim(ObjControl.Properties(PROP_TIP).Value)

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
    Dim bRep As Boolean

    '// Stock les info sur le contrôle de l'objet en cours, si pas déjà fait.
    If (m_RstControl Is Nothing) Then
        sSql = "SELECT T_ObjetControles.* FROM T_ObjetControles " & _
               "WHERE (((T_ObjetControles.ObjetParent_ID)='" & m_ObjetID & "'));"
        Set m_RstControl = m_oBD.OpenRecordset(sSql, dbOpenDynaset)
    End If

    m_ControlID = m_ObjetID & "." & m_ControlNom
    With m_RstControl
        .FindFirst ("Control_ID='" & m_ControlID & "'")

        If (.NoMatch) Then
            .AddNew
            !Control_ID = m_ControlID
            !ControlNom = m_ControlNom
            !ControlType = m_ControlType
            !ObjetParent_ID = m_ObjetID
            !ControlParentName = ctrParentName
            .Update
        Else
            m_ControlID = !Control_ID
        End If

    End With

    '// Stock les textes à traduire du contrôle, ou les met à jour.
    sSql = "SELECT T_TradTexte.* FROM T_TradTexte " & _
           "WHERE (((T_TradTexte.Trad_ID) LIKE '" & m_ControlID & "*'));"
    Set m_RstControlTxt = m_oBD.OpenRecordset(sSql, dbOpenDynaset)

    '// Stock les valeurs des propriétés...
    bRep = UpdateControleProp(PROP_CAP, ctrCaption)
    UpdateControleProp PROP_TIP, ctrTipText
    UpdateControleProp PROP_BAR, ctrStatusBarText

    m_RstControlTxt.Close
    UpdateRstControl = True
    
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

    '// Ignore la proppriété si elle ne contient pas de texte à traduire.
'    If (Len(sPropVal) = 0) Then UpdateControleProp = True: Exit Function   'TODO: Test

    '// Stock le texte de la langue d'origine pour traduction.
    With m_RstControlTxt
        .FindFirst ("[PropNom]='" & sPropName & "'")
    
        If (.NoMatch) Then
            .AddNew
            !Trad_ID = m_ControlID
            !PropNom = sPropName
            !PropTexte = sPropVal
            !LangueCode = CODELANG
            !DateMaJ = Now()
            !DefLangue = True
        Else
            .Edit
            !PropTexte = sPropVal
            !DateMaJ = Now()
        End If
    
        .Update
    End With

    UpdateControleProp = True

End Function

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
            DoCmd.OpenForm ObjetNom, acDesign, , , , acHidden
            Set GetObjet = Forms.Item(ObjetNom)
        Case ReportType
            DoCmd.OpenReport ObjetNom, acViewDesign, , , acHidden
            Set GetObjet = Reports.Item(ObjetNom)
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
            DoCmd.Close acForm, ObjetNom, Methode
        Case ReportType
            DoCmd.Close acReport, ObjetNom, Methode
    End Select
End Sub

' ----------------------------------------------------------------
' Procedure Nom:    ListObjects
' Sujet:            Retourne sous forme de chaîne SQL ou de liste de valeurs,
'                   les objets d'une base suivant le/les type indiquer(T_ObjectType).
' Procedure Kind:   Function
' Procedure Access: Public
'
'=== Paramètres ===
' eObjectType1 (T_ObjectType):  Filtre 1 sur type d'objet (voir Enum T_ObjectType).
' eObjectType2 (T_ObjectType):  Fitre 2 sur type d'objet (voir Enum T_ObjectType.
' eObjectType3 (T_ObjectType):  Fitre 3 sur type d'objet (voir Enum T_ObjectType.
' bListeVal (Boolean):          Si a TRUE retourne une liste de valeur (pour une ListBox, ComboBox ou autre),
'                                   sinon retourne la chaine SQL pour une source de données.
' oAutreBd (Database):
'==================
'
' Return Type:  String Liste de valeur(bListeVal =True) ou chaine SQL(bListeVal =False).
' Author:       Laurent
' Date:         27/04/2022 - 10:36
' DateMod:      28/04/2022 - 16:57
'
' !Use! : Enum T_ObjectType
' !Use! : Function ObjectTypeName
' ----------------------------------------------------------------
Public Function ListObjects(eObjectType1 As T_ObjectType, _
                            Optional bListeVal As Boolean = False, _
                            Optional eObjectType2 As T_ObjectType, _
                            Optional eObjectType3 As T_ObjectType, _
                            Optional ByRef oAutreBd As DAO.Database) As String
On Error GoTo ERR_ListObjects

    Dim sSql    As String
 
    '// Création de la chaine SQL.
    sSql = "SELECT MsysObjects.Type, MsysObjects.Flags, MsysObjects.Name AS ObjectName FROM MsysObjects " & _
           "WHERE (((MsysObjects.Flags)>=0) AND ((MsysObjects.Type)=" & eObjectType1
           
    If (eObjectType2) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType2
    If (eObjectType3) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType3
           
    sSql = sSql & ") AND ((MsysObjects.Name) Not Like '~*' And (MsysObjects.Name) Not Like 'MSys*'))" & _
                  "ORDER BY MsysObjects.Type, MsysObjects.Name;"

    If (bListeVal = False) Then
        '// Retourne la chaine SQL, et on sort.
        ListObjects = sSql
        Exit Function
    End If

    Dim odb     As DAO.Database
    Dim oRst    As DAO.Recordset

    Set odb = IIf(oAutreBd Is Nothing, CurrentDb, oAutreBd)
    Set oRst = odb.OpenRecordset(sSql, dbOpenSnapshot)
    sSql = vbNullString

    '// Boucle sur les objets de la table système.
    '// Création de la liste de valeur sur 2 colonnes (Col0: Type, Col1: Name, col2: Type en clair).
    With oRst
        If .RecordCount <> 0 Then
            Do While Not .EOF
                sSql = sSql & ![Type] & ";" & ![ObjectName] & ";" & ObjectTypeName(![Type]) & ";"
                .MoveNext
            Loop
        End If
    End With
 
    '// Retourne la liste de valeurs.
    ListObjects = sSql

SORTIE_ListObjects:
    On Error Resume Next
    If Not oRst Is Nothing Then
        oRst.Close
        Set oRst = Nothing
    End If

    If Not odb Is Nothing Then Set odb = Nothing
    Exit Function
 
ERR_ListObjects:
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : ListObjects" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_ListObjects
End Function

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
'// ################################# END PRIV. SUB/FUNC #################################
