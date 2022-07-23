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
'    Private Const PROP_VTXT As String = "ValidationText"    'TODO: Table (ValidationText)
    
    Private Enum eReponse
        Faux = 0
        Valide = 1
        Inconnu = 2
        Erreur = 3
    End Enum

    Private Type TObjet
        ID      As String
        Nom     As String
        Type    As String
        Caption As String
        Nouveau As Boolean      '// Indique nouvel objet à enregistrer.
    End Type
    Private thisObj As TObjet

    Private Type TControl
        ID      As String
        Nom     As String
        Type    As String
        Parent  As String       '// Control parent du contrôle, si existe.
        Nouveau As Boolean      '// Indique nouveau control à enregistrer.
    End Type
    Private thisCtr As TControl

    Private Type TTexte
        Caption         As String
        StatusBarText   As String
        ControlTipText  As String
        Vide            As Boolean      '// Indique aucun texte a stoker.
    End Type
    Private thisTxt As TTexte

    Private m_oApp          As Application      '// App externe.
    Private m_AppNom        As String           '// Nom App externe.
    Private m_ReScanApp     As Boolean          '// Indique que l'app existe et vas être re scannée.

    Private m_oBDLocale     As DAO.Database     '// Base Currentdb.
    Private m_TableControl  As DAO.Recordset    '// Table T_Controles.
    Private m_TableTxtObj   As DAO.Recordset    '// Table T_TradTexte pour les forms/Reports.
    Private m_TableTxtCtr   As DAO.Recordset    '// Table T_TradTexte pour les contrôles.
    Private qdfTemp         As DAO.QueryDef

    Private ObjetAcc        As C_ObjetsAccess   '// Objet access utilisés (database, application...)
    Private InfoScan        As C_LabelsInfo     '// Affichage info texte et barre lors du scan.
    Private m_bBarreInit    As Boolean          '// Indique classe InfoScan initialisée.

    Private m_DateMaJ       As Date             '// Date heure de la créaton ou de la mise à jour(T_TradTexte).

'    Private bm              As cBenchmark       'TODO: Test temps
'    Private bmC             As cBenchmark       'TODO: Test temps
    
'     Private testqdf As Boolean

'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Initialize()

    If (ObjetAcc Is Nothing) Then Set ObjetAcc = New C_ObjetsAccess
    If (InfoScan Is Nothing) Then Set InfoScan = New C_LabelsInfo

    Set m_oBDLocale = CodeDb()

    If (qdfTemp Is Nothing) Then Set qdfTemp = m_oBDLocale.CreateQueryDef("")
    
'    If (bm Is Nothing) Then Set bm = New cBenchmark    'TODO: Test temps
'    If (bmC Is Nothing) Then Set bmC = New cBenchmark  'TODO: Test temps

    m_bBarreInit = False

End Sub

Private Sub Class_Terminate()

    Set qdfTemp = Nothing
    If (Not m_oBDLocale Is Nothing) Then m_oBDLocale.Close
    Set m_oBDLocale = Nothing
    Set ObjetAcc = Nothing      '// Reset tous les objets.
    Set m_oApp = Nothing
    Set InfoScan = Nothing
End Sub
'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get IDLangApp() As Long 'Note: Non utilisé
    IDLangApp = m_lIDLang
End Property
Public Property Let IDLangApp(IDLang As Long)
    m_lIDLang = LangueCheckID(IDLang)
End Property
Public Property Let ReScannerApp(ReScanner As Boolean)
    m_ReScanApp = ReScanner
End Property

'Public Property Let Settestqdf(activeTest As Boolean)  'TODO: Test Code
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
'                   Stock les info dans la table, scan les controles et les texte à traduire.
' Procedure Kind:   Function
' Procedure Access: Public
'
'=== Paramètres ===
' eObjectType1 (T_ObjectTypeNum):  Filtre 1 sur type d'objet (voir Enum T_ObjectTypeNum).
' eObjectType2 (T_ObjectTypeNum):  Filtre 2 sur type d'objet (voir Enum T_ObjectTypeNum.
' eObjectType3 (T_ObjectTypeNum):  Filtre 3 sur type d'objet (voir Enum T_ObjectTypeNum.
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

    Set oBdExt = m_oApp.CurrentDb                               '// Definir la base externe à utiliser.
    Set oRstSys = oBdExt.OpenRecordset(sSql, dbOpenSnapshot)    '// Ouvre MsysObjects de la base externe.

    If (m_oBDLocale Is Nothing) Then Set m_oBDLocale = CodeDb()

    If m_bBarreInit Then InfoScan.InitialiseBarre oRstSys.RecordCount       '// Initialise la taille de la barre...

    If m_ReScanApp Then bRep = ResetEtatsTables(m_AppNom)                   '// Reset des champs etats des tables avant le scan...

'Dim ttt As String
'ttt = "Scan testQDF " '& IIf(testqdf, "ON", "OFF")
''bm.TrackByName ttt

    '// Boucle sur les objets de la table MsysObjects.
    bRep = True
    m_DateMaJ = Now()   '// Defini la date à utiliser(Champ DateMaJ de T_TradTexte).
    With oRstSys
        If (.RecordCount <> 0) Then
            Do While Not .EOF
                thisObj.Nom = .Fields("ObjectName").Value
                ObjType = .Fields("Type").Value
                thisObj.Type = GetObjectTypeEnClair(ObjType)    '// Traduire en clair le Type...

                bRep = ScanObjet(ObjType)                       '// Enregistre les info...

                If (bRep = False) Then Exit Do
                .MoveNext
            Loop
        End If
    End With

'bm.Report 'TODO: Test temps

    If (Not oRstSys Is Nothing) Then oRstSys.Close: Set oRstSys = Nothing
    If (Not oBdExt Is Nothing) Then oBdExt.Close: Set oBdExt = Nothing
    Set m_oApp = Nothing

    '// Femeture des objets.
    If Not (m_TableTxtObj Is Nothing) Then m_TableTxtObj.Close: Set m_TableTxtObj = Nothing
    If Not (m_TableControl Is Nothing) Then m_TableControl.Close: Set m_TableControl = Nothing

'    If (bRep = False) Then SuppDonneesTexte m_AppNom    '// Efface tous en cas d'erreur... 'TODO: transactions

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
' ObjType (T_ObjectTypeNum): Type de l'objet (T_ObjectTypeNum)
'==================
'
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:30
' DateMod : 28/06/2022 - 18:38
' ----------------------------------------------------------------
Private Function ScanObjet(ObjType As T_ObjectTypeNum) As Boolean

On Error GoTo ERR_ScanObjet

    Dim oObjet      As Object
    Dim oCtr        As Access.Control
    Dim bRep        As Boolean
    Dim sInfoAvance As String

    sInfoAvance = thisObj.Type & " " & thisObj.Nom
    If m_bBarreInit Then InfoScan.UpdateBarre sInfoAvance   '// Affiche l'état d'avancement du scan...
    DoEvents

    Set oObjet = GetObjet(thisObj.Nom, ObjType)             '// Ouvre le form pour scan des contrôles...
    If (oObjet Is Nothing) Then Exit Function   '// Erreur, on sort.

    thisObj.Caption = LTrim$(oObjet.Caption)

    bRep = MajObjet()                                       '// Enregistre les info et le texte à traduire de l'objet (Form, Report)...

    If (bRep) Then

        '// On boucle sur les contrôles de l'objet.
        For Each oCtr In oObjet.Controls

            'If (ControlIsVisible(oCtr) = True) Then 'TODO: Ignore les ctr invisibles ?
                thisCtr.Nom = oCtr.name
                thisCtr.Type = TypeName(oCtr)
                bRep = ScanProprietes(oCtr)                 '// Scan les propriétés du contrôle...
                If (bRep = False) Then Exit For
            'End If
        Next

        CloseObjet thisObj.Nom, ObjType                     '// Femeture de l'objet...
    End If

SORTIE_ScanObjet:
    ScanObjet = bRep
    Exit Function

ERR_ScanObjet:
'    If (Err.Number <> 3034) Then    '// 3034 valide ou annule transaction sans débuter de transaction.

        MsgBox "Erreur " & Err.Number & vbCrLf & _
                " (" & Err.Description & ")" & vbCrLf & _
                "Dans  TradAccess.MD_Dev.ScanObjet, ligne " & Erl & "."
'    End If
    bRep = False
    Resume SORTIE_ScanObjet
End Function

' ----------------------------------------------------------------
' Procedure Nom   : MaJObjet
' ----------------------------------------------------------------
' Sujet           : Stock les forms/report, et leur prop texte Caption à traduire.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Requi           : MajTableObjet, MajTableControl, MajTexteObjet.
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
Private Function MajObjet() As Boolean
On Error GoTo ERR_MaJObjet

    Dim sSql As String
    Dim bRep As Boolean

    thisObj.ID = m_AppNom & "." & thisObj.Type & "." & thisObj.Nom

    bRep = MajTableObjet            '// ...

    If bRep = False Then Exit Function
    If (m_TableControl Is Nothing) Then
        sSql = "SELECT T_ObjetControles.Control_ID, T_ObjetControles.ObjetParent_ID FROM T_ObjetControles;"
        Set m_TableControl = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)
    End If
    bRep = MajTableControlObjet()   '// ...

    If bRep = False Then Exit Function
    If (m_TableTxtObj Is Nothing) Then
        sSql = "SELECT T_TradTexte.Trad_ID, T_TradTexte.PropNom, T_TradTexte.PropTexte FROM T_TradTexte;"
        Set m_TableTxtObj = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)
    End If
    bRep = MajTexteObjet            '// ...

SORTIE_MaJObjet:
    MajObjet = bRep
    Exit Function

ERR_MaJObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Dev.MaJObjet, ligne " & Erl & "."
    bRep = False
    Resume SORTIE_MaJObjet
End Function

'// Stock les objets (forms/reports).
Private Function MajTableObjet() As Boolean
On Error GoTo ERR_MajTableObjet

    Dim sSql As String
    Dim vRep As Variant

    vRep = DLookup("[Objet_ID]", "T_Objets", "[Objet_ID]='" & thisObj.ID & "'")

    If (IsNull(vRep)) Then      '// Nouvel Objet.

        thisObj.Nouveau = True
        thisCtr.Nouveau = True
        sSql = "INSERT INTO T_Objets " & _
                "(Objet_ID, ObjetNom, ObjetType, ObjetApp, Scanner, Nouveau) VALUES " & _
                "('" & thisObj.ID & "', '" & thisObj.Nom & "', '" & thisObj.Type & "', '" & m_AppNom & "', " & _
                CInt(True) & ", " & CInt(thisObj.Nouveau) & ");"

    Else                        '// Déjà enregistrer..
        MajTableObjet = True
        thisObj.Nouveau = False
        sSql = "UPDATE T_Objets SET T_Objets.Scanner=" & CInt(True) & _
               " WHERE (((T_Objets.Objet_ID)='" & thisObj.ID & "'));"
    End If

    qdfTemp.SQL = sSql
    qdfTemp.Execute dbFailOnError
    MajTableObjet = True

SORTIE_MajTableObjet:
    Exit Function

ERR_MajTableObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.C_TradScanText.MajTableObjet, ligne " & Erl & "."
    Resume SORTIE_MajTableObjet
End Function

'// Stock les contrôles de l'objet en cours (Les forms et reports sont aussi stocker ici pour leur prop caption).
Private Function MajTableControlObjet() As Boolean
On Error GoTo ERR_MajTableControlObjet

    Dim sSql As String

    If (thisObj.Nouveau) Then   '// Nouvel Objet.
        sSql = "INSERT INTO T_ObjetControles " & _
               "(Control_ID, ControlNom, ControlType, ObjetParent_ID, ControlParentName, Scanner, Nouveau) VALUES " & _
               "('" & thisObj.ID & "', '" & thisObj.Nom & "', '" & thisObj.Type & "', '" & thisObj.ID & _
               "', '" & m_AppNom & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                '// Existe déjà.
        sSql = "UPDATE T_ObjetControles SET T_ObjetControles.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetControles.Control_ID)='" & thisObj.ID & "'));"
    End If

    qdfTemp.SQL = sSql
    qdfTemp.Execute dbFailOnError
    MajTableControlObjet = True

SORTIE_MajTableControlObjet:
    Exit Function

ERR_MajTableControlObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.C_TradScanText.MajTableControlObjet, ligne " & Erl & "."
    Resume SORTIE_MajTableControlObjet
End Function

'// Stock les contrôles de l'objet en cours.
Private Function MajTableControl() As Boolean
On Error GoTo ERR_MajTableControl

    Dim sSql As String
    Dim vTmp As Variant

    vTmp = DLookup("[Control_ID]", "T_ObjetControles", "[Control_ID]='" & thisCtr.ID & "'")
    thisCtr.Nouveau = IsNull(vTmp)

    If (thisCtr.Nouveau) Then
        sSql = "INSERT INTO T_ObjetControles " & _
               "(Control_ID, ControlNom, ControlType, ObjetParent_ID, ControlParentName, Scanner, Nouveau) VALUES " & _
               "('" & thisCtr.ID & "', '" & thisCtr.Nom & "', '" & thisCtr.Type & "', '" & thisObj.ID & "', '" & _
               thisCtr.Parent & "', " & CInt(True) & ", " & CInt(True) & ");"
        
    Else
        sSql = "UPDATE T_ObjetControles SET T_ObjetControles.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetControles.Control_ID)='" & thisCtr.ID & "'));"
    End If      '// Nouvel objet on passe directement a Execute.

    qdfTemp.SQL = sSql
    qdfTemp.Execute dbFailOnError
    MajTableControl = True

SORTIE_MajTableControl:
    Exit Function

ERR_MajTableControl:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.C_TradScanText.MajTableControl, ligne " & Erl & "."
    Resume SORTIE_MajTableControl
End Function

'// Utiliser que pour les forms et les reports (MajTextePropriete pour les contrôles).
'// On stock les valeurs même vide pour les forms et les reports.
Private Function MajTexteObjet() As Boolean
On Error GoTo ERR_MajTexteObjet

    Dim sSql  As String
    Dim sTest As String
    Dim sTxt  As String
    Dim bMod  As Boolean    '// Indique si la valeur de PropTexte à été modifiée.

    If (Len(thisObj.Caption) > 2) Then
        sTest = CheckApostrophe(thisObj.Caption)                    '// Vérifier si apostrophe dans le texte...
        sTxt = IIf(sTest = vbNullString, thisObj.Caption, sTest)
    End If

    If thisObj.Nouveau Then     '// Nouveau.

        sSql = "INSERT INTO T_TradTexte " & _
               "(Trad_ID, PropNom, PropTexte, LangueCode, DateMaJ, DefLangue, Scanner) VALUES " & _
               "('" & thisObj.ID & "', '" & PROP_CAP & "', '" & sTxt & "', " & m_lIDLang & ", '" & m_DateMaJ & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                    '// Déjà enregistrer.

        '// Voir si le texte à été modifié.
        m_TableTxtObj.FindFirst "[Trad_ID]='" & thisObj.ID & "'"
        If (StrComp(thisObj.Caption, m_TableTxtObj.Fields("PropTexte").Value, vbBinaryCompare) <> 0) Then bMod = True

        sSql = "UPDATE T_TradTexte " & _
               "SET PropTexte='" & sTxt & "', " & _
               "DateMaJ='" & m_DateMaJ & "', " & _
               "ModPropTexte=" & CInt(bMod) & "," & _
               "Scanner=" & CInt(True) & _
               " WHERE (((T_TradTexte.Trad_ID)='" & thisObj.ID & "'));"
    End If

    qdfTemp.SQL = sSql
    qdfTemp.Execute dbFailOnError
    MajTexteObjet = True
    
SORTIE_MajTexteObjet:
    Exit Function

ERR_MajTexteObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.C_TradScanText.MajTexteObjet, ligne " & Erl & "."
    Resume SORTIE_MajTexteObjet
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
'Label          StatusBarText
'Image          StatusBarText
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
    Dim sSql As String
    Dim bRep As Boolean
    Dim eRep As eReponse    '// Retour function.

    '// Extraire le parent du control (page, label, etc.).
    thisCtr.Parent = IIf((ObjControl.Parent.name <> thisObj.Nom), TypeName(ObjControl.Parent) & "." & ObjControl.Parent.name, vbNullString)

    '// Extraire les texte à utiliser.
    thisTxt.Caption = vbNullString: thisTxt.StatusBarText = vbNullString: thisTxt.ControlTipText = vbNullString
    thisTxt.Caption = LTrim$(ObjControl.Properties(PROP_CAP).Value)
    thisTxt.StatusBarText = LTrim$(ObjControl.Properties(PROP_BAR).Value)
    thisTxt.ControlTipText = LTrim$(ObjControl.Properties(PROP_TIP).Value)

    thisCtr.ID = thisObj.ID & "." & thisCtr.Nom
    sSql = "SELECT T_TradTexte.Trad_ID, T_TradTexte.PropNom, T_TradTexte.PropTexte FROM T_TradTexte " & _
           "WHERE T_TradTexte.Trad_ID='" & thisCtr.ID & "';"
    Set m_TableTxtCtr = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)

    eRep = Texte_A_Enregistrer()        '// Voir si on doit enregistrer le control...

    If (eRep = Faux) Then ScanProprietes = True: Exit Function  '// Pas de texte à stocker, on sort.
    If (eRep = Erreur) Then Exit Function                       '// Erreur, on sort.

    bRep = MajTableControl              '// Stock le control...

    If (bRep) Then bRep = MajTextePropriete(PROP_CAP, thisTxt.Caption)          '// Stock ses textes...
    If (bRep) Then bRep = MajTextePropriete(PROP_TIP, thisTxt.ControlTipText)   '// ...
    If (bRep) Then bRep = MajTextePropriete(PROP_BAR, thisTxt.StatusBarText)    '// ...

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

'----------------------------------------------------------------
' Procedure Nom   : MajTextePropriete
' ----------------------------------------------------------------
' Sujet           : Stock les textes pour chaque propriété du contrôle.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Requi           :
'
'=== Paramètres ===
' PropNom (String): Nom de la propriété.
'==================
'
' Return Boolean :
'
' Author  : Laurent
' Date    : 17/07/2022 - 13:11
' DateMod :
' ----------------------------------------------------------------
Private Function MajTextePropriete(PropNom As String, PropTexte As String) As Boolean
On Error GoTo ERR_MajTextePropriete

    Dim sSql    As String
    Dim sTest   As String
    Dim sTxt    As String
    Dim bMod    As Boolean      '// 1 modifier 0 non modifier.
    Dim eMod    As eReponse     '// Retour function.

    '// Vérifier si un/des apostrophe dans le texte...
    If (Len(PropTexte) > 2) Then
        sTest = CheckApostrophe(PropTexte)
        sTxt = IIf(sTest <> vbNullString, sTest, PropTexte)
    End If

    If thisCtr.Nouveau Then     '// Nouveau control.

        '// Ignore la propriété si elle ne contient pas de texte à traduire.
        If (Len(PropTexte) < 3) Then MajTextePropriete = True: Exit Function  '// Rien a faire, on sort.

        sSql = "INSERT INTO T_TradTexte " & _
               "(Trad_ID, PropNom, PropTexte, LangueCode, DateMaJ, DefLangue, Scanner, Nouveau) VALUES " & _
               "('" & thisCtr.ID & "', '" & PropNom & "', '" & sTxt & "', " & m_lIDLang & ", '" & m_DateMaJ & "', " & _
               CInt(True) & ", " & CInt(True) & ", " & CInt(True) & ");"

    Else                        '// Déjà enregistrer.

        eMod = TexteModifier(PropNom, PropTexte)    '// Vérifier ce qu'il faut faire avec le texte...

        If (eMod = Erreur) Then Exit Function   '// Erreur, on sort.

        '// MàJ si retourne 0(pas de changement) ou 2(modifier), si (Inconnu) on passe.
        If (eMod <> Inconnu) Then

            bMod = IIf(eMod = Faux, False, True)
            sSql = "UPDATE T_TradTexte " & _
                   "SET PropTexte='" & sTxt & "', " & _
                   "DateMaJ='" & m_DateMaJ & "', " & _
                   "ModPropTexte=" & CInt(bMod) & ", " & _
                   "Scanner=" & CInt(True) & _
                   " WHERE (((T_TradTexte.Trad_ID)='" & thisCtr.ID & "') " & _
                   "AND ((T_TradTexte.PropNom)='" & PropNom & "'));"
        Else
           MajTextePropriete = True: Exit Function  '// Rien a faire, on sort.
        End If
    End If

    qdfTemp.SQL = sSql
    qdfTemp.Execute dbFailOnError
    MajTextePropriete = True

SORTIE_MajTextePropriete:
    Exit Function

ERR_MajTextePropriete:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.C_TradScanText.MajTextePropriete, ligne " & Erl & "."
    Resume SORTIE_MajTextePropriete
End Function

'// Voir si nouveau control et si du texte à enregistrer
'// Retourne Valide si on doit l'enregistrer.
Private Function Texte_A_Enregistrer() As eReponse
On Error GoTo ERR_Texte_A_Enregistrer

    '// Test les valeurs, passe à vide si que 2 caractères ou moins.    'TODO: que 2 caractères ou moins
    thisTxt.Vide = ((Len(thisTxt.Caption) < 3) And (Len(thisTxt.StatusBarText) < 3) And (Len(thisTxt.ControlTipText) < 3))

    Texte_A_Enregistrer = IIf((thisTxt.Vide), eReponse.Faux, eReponse.Valide)

SORTIE_Texte_A_Enregistrer:
    Exit Function

ERR_Texte_A_Enregistrer:
    Texte_A_Enregistrer = Erreur
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.C_TradScanText.Texte_A_Enregistrer, ligne " & Erl & "."
    Resume SORTIE_Texte_A_Enregistrer
End Function

'// Utiliser pour vérifier les texte pour les prop des controls.
'// Retourne 0(Faux) pas de changement, 1(valide) le texte à changer, 2(Inconnu) Non trouver pas de texte.
Private Function TexteModifier(NomProp As String, TexteOrg As String) As eReponse
On Error GoTo ERR_TexteModifier

    Dim sTxt As String

    m_TableTxtCtr.FindFirst "PropNom='" & NomProp & "'"

    If (m_TableTxtCtr.NoMatch) Then
        If (Len(TexteOrg) < 3) Then
            TexteModifier = Inconnu: Exit Function      '// Pas trouvé et pas de texte à enregistrer.
        End If
    Else
        sTxt = m_TableTxtCtr.Fields("PropTexte").Value
        If (StrComp(TexteOrg, sTxt, vbBinaryCompare) <> 0) Then TexteModifier = Valide  '// Texte modifié, sinon, pas de changement(0).
    End If

SORTIE_TexteModifier:
    Exit Function

ERR_TexteModifier:
    TexteModifier = Erreur
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.C_TradScanText.TexteModifier, ligne " & Erl & "."
    Resume SORTIE_TexteModifier
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
Private Sub SuppDonneesTexte(AppNom As String)  'Note: Non utilisé en attante

    Dim sSql As String
    Dim BD   As DAO.Database
    Dim Qdef As DAO.QueryDef

    sSql = "DELETE T_Objets.* FROM T_Objets " & _
           "WHERE (((T_Objets.ObjetApp)='" & AppNom & "'));"
    Set BD = CodeDb
    Set Qdef = BD.CreateQueryDef("", sSql)
    Qdef.Execute dbFailOnError

    Qdef.Close
    BD.Close
    Set Qdef = Nothing
    Set BD = Nothing

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
On Error GoTo ERR_CloseObjet

    Select Case ObjetType
        Case T_FormType
            m_oApp.DoCmd.Close acForm, ObjetNom, Methode
        Case T_ReportType
            m_oApp.DoCmd.Close acReport, ObjetNom, Methode
    End Select
    
SORTIE_CloseObjet:
    Exit Sub

ERR_CloseObjet:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  Trad-Access.C_TradScanText.CloseObjet, ligne " & Erl & "."
    Resume SORTIE_CloseObjet
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
           "WHERE (((T_Objets.ObjetApp)='" & AppName & "') AND ((T_TradTexte.DefLangue)=" & CInt(True) & "));"
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

'----------------------------------------------------------------
' Procedure Nom   : ResetEtatsTables
' ----------------------------------------------------------------
' Sujet           : Remet a 0 tous les états des objets, contrôles et texte de la base.
' Procedure Kind  : Sub
' Procedure Access: Public
' Objectif        : Place le champ Scanner et le champ ModPropTexte à 0, avant de lancer le scanne.
'
'=== Paramètres ===
' BaseNom (String): Base à filtrer
'==================
'
' Author  : Laurent
' Date    : 20/07/2022 - 17:34
' DateMod :
' ----------------------------------------------------------------
Private Function ResetEtatsTables(BaseNom As String) As Boolean
    Dim sSql As String

    sSql = "UPDATE (T_Objets INNER JOIN T_ObjetControles ON T_Objets.Objet_ID = T_ObjetControles.ObjetParent_ID) " & _
           "INNER JOIN T_TradTexte ON T_ObjetControles.Control_ID = T_TradTexte.Trad_ID " & _
           "SET T_Objets.Nouveau = False, " & _
           "T_ObjetControles.Nouveau = False, " & _
           "T_TradTexte.ModPropTexte = False, T_TradTexte.Nouveau = False" & _
           "WHERE (((T_Objets.ObjetApp)='" & BaseNom & "'));"

    qdfTemp.SQL = sSql
    qdfTemp.Execute dbFailOnError
    ResetEtatsTables = True

End Function
'// ################################# END PRIV. SUB/FUNC #################################


