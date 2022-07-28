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
' Name     : C_TradScanText
' ------------------------------------------------------
' Kind     : Module de classe
' Purpose  : Extraction des textes à traduire.
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 30/06/2022 - 10:54
' DateMod  : 16/07/2022 - 13:54
' Requi    : module : MD_Utils, MD_FSO
'            classe : C_LabelsInfo, C_ObjetsAccess
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::

    Private Const PROP_CAP  As String = "Caption"
    Private Const PROP_TIP  As String = "ControlTipText"
    Private Const PROP_BAR  As String = "StatusBarText"
'    Private Const PROP_VTXT As String = "ValidationText"    'TODO: Table (ValidationText)
    Private Const TAG_GUIDD As String = "{guid {"       '// Repères pour extraction du tag.
    Private Const TAG_GUIDF As String = "}}"            '//  ""

    Private Type TApp
        Guid        As String
        Nom         As String
        IDLang      As Long
        ReScan      As Boolean      '// Indique aucun texte a stoker.
    End Type
    Private thisApp As TApp

    Private Type TObjet
        Guid    As String
        Nom     As String
        Type    As String
        Caption As String
        Nouveau As Boolean      '// Indique nouvel objet à enregistrer.
    End Type
    Private thisObj As TObjet

    Private Type TControl
        Guid    As String
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

    Private m_oBDLocale     As DAO.Database     '// Base Currentdb.
    Private m_TableTxtCtr   As DAO.Recordset    '// Table T_TradTexte pour les contrôles.
    Private qdfTemp         As DAO.QueryDef

    Private ObjetAcc        As C_ObjetsAccess   '// Objet access utilisés (database, application...)
    Private InfoScan        As C_LabelsInfo     '// Affichage info texte et barre lors du scan.
    Private m_bBarreInit    As Boolean          '// Indique classe InfoScan initialisée.

    Private m_DateMaJ       As Date             '// Date heure de la créaton ou de la mise à jour(T_TradTexte).
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Initialize()

    If (ObjetAcc Is Nothing) Then Set ObjetAcc = New C_ObjetsAccess
    If (InfoScan Is Nothing) Then Set InfoScan = New C_LabelsInfo

    Set m_oBDLocale = CodeDb()

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
Public Property Get IDLangApp() As Long
    IDLangApp = thisApp.IDLang
End Property
Public Property Let IDLangApp(IDLang As Long) 'Note: Non utilisé
    thisApp.IDLang = LangueCheckID(IDLang)
End Property

Public Property Get ReScannerApp() As Boolean
    ReScannerApp = thisApp.ReScan
End Property
Public Property Let ReScannerApp(ReScanner As Boolean)
    thisApp.ReScan = ReScanner
End Property

Public Property Get AppGuid() As String
    AppGuid = thisApp.Guid
End Property
Public Property Let AppGuid(NewGuid As String) 'Note: Non utilisé
    thisApp.Guid = NewGuid
End Property
'//====================================== END PROP =======================================

'----------------------------------------------------------------
'// - Extraire le Guid des prop de la base,
'// - Rechercher le guid dans la table T_App,
'// - Comparer les 2.
'// Retourne Exist si tout est ok.
'----------------------------------------------------------------
Public Function IsNewApp() As eReponse
    Dim sRes As String
    Dim eRep As eReponse

    thisApp.Guid = vbNullString
    sRes = ObjetAcc.GetPropTxt(PROP_GUID)   '// Obtenir le guid de la base...
    If (sRes = PROP_NA) Then IsNewApp = Inconnu: Exit Function  '// Inconnue, on sort.

    eRep = CompareGuidAppEtTable(sRes)      '// Vérifier les guid...

    Select Case eRep
        Case eReponse.Valide
            thisApp.Guid = sRes
            IsNewApp = Exist    '// ok.
        Case eReponse.Inconnu '// Pas dans la table.
            IsNewApp = Faux
        Case eReponse.Faux     '// ne correspond pas.
            IsNewApp = Erreur
        Case Else
    End Select

End Function

Public Function GetNewGuid() As String
    Dim sGuid As String

    sGuid = MD_Utils.CreateGuid()

    If (Len(sGuid) = 0) Then Exit Function   '// Erreur.

    GetNewGuid = sGuid      '// Retourne le guid.

End Function

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
Public Function ScanObjetsApp(eObjectType1 As eObjectTypeNum, _
                     Optional eObjectType2 As eObjectTypeNum, _
                     Optional eObjectType3 As eObjectTypeNum) As Boolean
On Error GoTo ERR_ScanObjetsApp

    '// App et/ou base non ouverte, on sort.
    If (ObjetAcc Is Nothing) Then Exit Function
    If (ObjetAcc.MsAppIsUp = False Or ObjetAcc.MsBaseIsOpen = False) Then Exit Function

    Dim sSql     As String
    Dim ObjType  As eObjectTypeNum
    Dim bRep     As Boolean
    Dim oBdExt   As DAO.Database
    Dim oRstSys  As DAO.Recordset
    Dim vTmp     As Variant

    '// Extraire les objets de la table MsysObjects.
    sSql = "SELECT MsysObjects.Type, MsysObjects.Flags, MsysObjects.Name AS ObjectName FROM MsysObjects " & _
           "WHERE (((MsysObjects.Flags)>=0) AND ((MsysObjects.Type)=" & eObjectType1

    If (eObjectType2) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType2
    If (eObjectType3) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType3

    sSql = sSql & ") AND ((MsysObjects.Name) Not Like '~*' And (MsysObjects.Name) Not Like 'MSys*'))" & _
                  "ORDER BY MsysObjects.Type, MsysObjects.Name;"

    If (m_oApp Is Nothing) Then Set m_oApp = ObjetAcc.GetMsApp()            '// Obtenir l'APP externe à utiliser...
    If (ObjetAcc.MsBaseIsOpen) Then thisApp.Nom = ObjetAcc.BaseOuverteNom()

    Set oBdExt = ObjetAcc.GetMsBase()               '// Definir la base externe à utiliser.
    Set oRstSys = oBdExt.OpenRecordset(sSql, dbOpenSnapshot)                '// Ouvre MsysObjects de la base externe.

    If (m_oBDLocale Is Nothing) Then Set m_oBDLocale = CodeDb()

    If m_bBarreInit Then InfoScan.InitialiseBarre oRstSys.RecordCount       '// Initialise la taille de la barre...

    '// Reset des champs etats des tables avant le Rescan...
    If thisApp.ReScan Then bRep = ResetEtatsTables()

    '// Defini la date à utiliser(Champ DateMaJ de T_TradTexte).
    m_DateMaJ = Now()

    '// Nouvelle app, obtenir un guid...
    If (thisApp.ReScan = False) Then
        thisApp.Guid = MD_Utils.CreateGuid()
        bRep = MaJGuidApp() '// Si trouver, voir si dans la table, si non modifier la prop.
        
        If bRep = False Then
            vTmp = DLookup("[AppGuid]", "T_App", "[AppGuid]='" & thisApp.Guid & "'")
            If IsNull(vTmp) Then bRep = ObjetAcc.SetPropTxt(PROP_GUID, thisApp.Guid)
            If bRep = False Then
                MsgBox "Erreur Guid", vbCritical, "ScanObjetsApp"
                GoTo RESET_ScanObjetsApp
            End If
        End If
    End If

'DBEngine(0).BeginTrans
    '// Boucle sur les objets de la table MsysObjects.
    With oRstSys
        If (.RecordCount <> 0) Then
            Do While Not .EOF
                thisObj.Nom = .Fields("ObjectName").Value
                ObjType = .Fields("Type").Value
                thisObj.Type = MD_Utils.GetObjectTypeEnClair(ObjType)   '// Traduire en clair le Type...
                ' -----------------------
                bRep = ScanObjet(ObjType)                               '// Enregistre les info...
                ' -----------------------
                If (bRep = False) Then Exit Do
                .MoveNext
            Loop
        End If
    End With

    If bRep Then    '// Tout est ok.
        '// MàJ de la date du scan de l'app.
        sSql = "UPDATE T_App SET T_App.DernierScan = '" & m_DateMaJ & "';"
        ExecuteQdfTemp sSql
'DBEngine(0).CommitTrans

    Else            '// Erreur.

'DBEngine(0).Rollback
    End If

RESET_ScanObjetsApp:

    '// Femeture des objets.
    If (Not oRstSys Is Nothing) Then oRstSys.Close
    Set oRstSys = Nothing
    If (Not oBdExt Is Nothing) Then oBdExt.Close
    Set oBdExt = Nothing
    If Not (m_TableTxtCtr Is Nothing) Then m_TableTxtCtr.Close
    Set m_TableTxtCtr = Nothing
    Set m_oApp = Nothing

'    If (bRep = False) Then SuppDonneesTexte thisapp.nom    '// Efface tous en cas d'erreur... 'TODO: transactions

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
Private Function ScanObjet(ObjType As eObjectTypeNum) As Boolean
On Error GoTo ERR_ScanObjet

    Dim oObjet      As Object
    Dim oCtr        As Access.Control
    Dim bRep        As Boolean
    Dim sInfoAvance As String
    Dim sGuid       As String
    Dim tCtr        As TControl

    sInfoAvance = thisObj.Type & " " & thisObj.Nom
    If m_bBarreInit Then InfoScan.UpdateBarre sInfoAvance   '// Affiche l'état d'avancement du scan...
    DoEvents

    Set oObjet = GetObjet(thisObj.Nom, ObjType)             '// Ouvre le form pour scan des contrôles...
    If (oObjet Is Nothing) Then Exit Function   '// Erreur, on sort.

    thisObj.Caption = LTrim$(oObjet.Caption)
Debug.Print thisObj.Nom

    bRep = CheckIDObjet(oObjet)     '// Vérifier/extraire id Objet...

    ' ---------------
    bRep = MajObjet()                                   '// Enregistre les info et le texte à traduire de l'objet (Form, Report)...
    ' ---------------

    If (bRep) Then

        '// On boucle sur les contrôles de l'objet.
        For Each oCtr In oObjet.Controls

            'If (ControlIsVisible(oCtr) = True) Then 'TODO: Ignore les ctr invisibles ?
Debug.Print oCtr.name
                ' ---------------
                bRep = ScanProprietes(oCtr)             '// Scan les propriétés du contrôle...
                ' ---------------
                If (bRep = False) Then Exit For
            'End If
        Next
    End If

    If bRep Then
        CloseObjet thisObj.Nom, ObjType, acSaveYes  '// Ferme et enregistre de l'objet...
    Else
        CloseObjet thisObj.Nom, ObjType             '// Ferme sans enregistrer l'objet...
    End If

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
'// Vérifier si nouveau control, extraire ou créer guid, vérifier avec table.
' ----------------------------------------------------------------
Private Function CheckIDObjet(ObjVerif As Object) As Boolean
    Dim sGuid As String
    Dim sTag  As String
    Dim vTmp  As Variant

    sGuid = GetGuidObjet(ObjVerif)  '// Extraire guid du tag...

    vTmp = DFirst("[ObjetGuid]", "T_Objets", "[ObjetGuid]='" & sGuid & "'")

    If (Len(sGuid) = 0) Then        '// Pas de guid.
        sGuid = GetNewGuid()
        If (IsNull(vTmp)) Then      '//Pas tag pas table, créer et applique.

            thisObj.Nouveau = True

            sTag = ObjVerif.Tag
            If (Len(sTag) > 0) Then
                sTag = sTag & ";"
                Debug.Print "Tag modifier : ", ObjVerif.name, sTag
'                Stop
            End If
            ObjVerif.Tag = sTag & sGuid
        Else
            MsgBox "Err Guid, pas de tag mais dans table", vbCritical, "CheckIDCtr"
            Stop
            Exit Function
        End If
    Else

        If ((Len(sGuid) > 0) And (IsNull(vTmp))) Then
            MsgBox "Err Guid, tag mais pas dans table", vbCritical, "CheckIDCtr"
            Stop
            Exit Function
        End If

        thisObj.Nouveau = False
    End If

    thisObj.Guid = sGuid
    CheckIDObjet = True

End Function

' ----------------------------------------------------------------
'// Vérifier si nouveau control, extraire ou créer guid, vérifier avec table.
' ----------------------------------------------------------------
Private Function CheckIDCtr(CtrVerif As Access.Control) As Boolean
    Dim sGuid As String
    Dim sTag  As String
    Dim vTmp  As Variant

    sGuid = GetGuidObjet(CtrVerif)  '// Extraire guid du tag...

    vTmp = DFirst("[ControlGuid]", "T_ObjetControles", "[ControlGuid]='" & sGuid & "'")

    If (Len(sGuid) = 0) Then        '// Pas de guid.
        sGuid = GetNewGuid()
        If (IsNull(vTmp)) Then      '//Pas tag pas table, créer et applique.

            thisCtr.Nouveau = True

            sTag = CtrVerif.Tag
            If (Len(sTag) > 0) Then
                sTag = sTag & ";"
                Debug.Print "Tag modifier : "; thisObj.Nom, CtrVerif.name, sTag
'                Stop
            End If
            CtrVerif.Tag = sTag & sGuid
        Else
            MsgBox "Err Guid, pas de tag mais dans table", vbCritical, "CheckIDCtr"
            Stop
            Exit Function
        End If
    Else

        If ((Len(sGuid) > 0) And (IsNull(vTmp))) Then
            MsgBox "Err Guid, tag mais pas dans table", vbCritical, "CheckIDCtr"
            Stop
            Exit Function
        End If

        thisCtr.Nouveau = False
    End If

    thisCtr.Guid = sGuid
    CheckIDCtr = True

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

    bRep = MajTableObjet            '// ...
    If bRep = False Then Exit Function

    If (Len(thisObj.Caption) = 0) Then MajObjet = True: Exit Function   '// Rien a enregistrer, on sort.

    bRep = MajTableControlObjet()   '// ...
    If bRep = False Then Exit Function

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

' ------------------------------------------------------
'// Stock les objets (forms/reports).
' ------------------------------------------------------
Private Function MajTableObjet() As Boolean

    Dim sSql  As String
'    Dim vRep  As Variant

    If (thisObj.Nouveau = False) Then   '// Déjà enregistrer, extraire guid, le vérifié, Maj champ scan.

'        vRep = DLookup("[ObjetGuid]", "T_Objets", "[ObjetGuid]='" & thisObj.Guid & "'")
'TODO: A CONTROLER        If (IsNull(vRep)) Then
        sSql = "UPDATE T_Objets SET T_Objets.Scanner=" & CInt(True) & _
               " WHERE (((T_Objets.ObjetGuid)='" & thisObj.Guid & "'));"

    Else                                '// Nouvel Objet.

        sSql = "INSERT INTO T_Objets " & _
                "(ObjetGuid, ObjetNom, ObjetType, AppGuid, Scanner, Nouveau) VALUES " & _
                "('" & thisObj.Guid & "', '" & thisObj.Nom & "', '" & thisObj.Type & "', '" & thisApp.Guid & "', " & _
                CInt(True) & ", " & CInt(True) & ");"
    End If

    ExecuteQdfTemp sSql

    MajTableObjet = True

End Function

' ------------------------------------------------------
'// Stock les contrôles de l'objet en cours (Les forms et reports sont aussi stocker ici pour leur prop caption).
' ------------------------------------------------------
Private Function MajTableControlObjet() As Boolean

    Dim sSql As String

    If (thisObj.Nouveau) Then   '// Nouvel Objet.
        sSql = "INSERT INTO T_ObjetControles " & _
               "(ControlGuid, ControlNom, ControlType, ObjetParentGuid, ControlParentName, Scanner, Nouveau) VALUES " & _
               "('" & thisObj.Guid & "', '" & thisObj.Nom & "', '" & thisObj.Type & "', '" & thisObj.Guid & "', '" & thisApp.Nom & _
               "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                '// Existe déjà.
        sSql = "UPDATE T_ObjetControles SET T_ObjetControles.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetControles.ControlGuid)='" & thisObj.Guid & "'));"
    End If

    ExecuteQdfTemp sSql

    MajTableControlObjet = True

End Function

' ------------------------------------------------------
'// Stock les contrôles de l'objet en cours.
' ------------------------------------------------------
Private Function MajTableControl() As Boolean

    Dim sSql As String
    Dim vTmp As Variant

'    If (thisCtr.Nouveau = False) Then
'        vTmp = DLookup("[ControlGuid]", "T_ObjetControles", "[ControlGuid]='" & thisCtr.Guid & "'")
'        thisCtr.Nouveau = IsNull(vTmp)
'
'    End If

    If (thisCtr.Nouveau) Then
'        thisCtr.Guid = GetNewGuid()
        sSql = "INSERT INTO T_ObjetControles " & _
               "(ControlGuid, ControlNom, ControlType, ObjetParentGuid, ControlParentName, Scanner, Nouveau) VALUES " & _
               "('" & thisCtr.Guid & "', '" & thisCtr.Nom & "', '" & thisCtr.Type & "', '" & thisObj.Guid & "', '" & _
               thisCtr.Parent & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else
        sSql = "UPDATE T_ObjetControles SET T_ObjetControles.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetControles.ControlGuid)='" & thisCtr.Guid & "'));"
    End If      '// Nouvel objet on passe directement a Execute.

    ExecuteQdfTemp sSql

    MajTableControl = True

End Function

' ------------------------------------------------------
'// Utiliser que pour les forms et les reports (MajTextePropriete pour les contrôles).
'// On stock les valeurs même vide pour les forms et les reports.
' ------------------------------------------------------
Private Function MajTexteObjet() As Boolean

    Dim sSql  As String
    Dim sTest As String
    Dim sTxt  As String
    Dim vTmp  As String
    Dim bMod  As Boolean    '// Indique si la valeur de PropTexte à été modifiée.

    If (Len(thisObj.Caption) > 2) Then
        sTest = MD_Utils.CheckApostrophe(thisObj.Caption)       '// Vérifier si apostrophe dans le texte...
        sTxt = IIf(sTest = vbNullString, thisObj.Caption, sTest)
    End If

    If thisObj.Nouveau Then     '// Nouveau.

        sSql = "INSERT INTO T_TradTexte " & _
               "(CtrParentGuid, PropNom, PropTexte, LangueCode, DateMaJ, DefLangue, Scanner, Nouveau) VALUES " & _
               "('" & thisObj.Guid & "', '" & PROP_CAP & "', '" & sTxt & "', " & thisApp.IDLang & ", '" & m_DateMaJ & "', " & _
               CInt(True) & ", " & CInt(True) & ", " & CInt(True) & ");"

    Else                    '// Déjà enregistrer.

        '// Voir si le texte(Caption) à été modifié.
        vTmp = DFirst("[PropTexte]", "T_TradTexte", "[CtrParentGuid]='" & thisObj.Guid & "'")
        sTest = CStr(vTmp)
        If (StrComp(thisObj.Caption, sTest, vbBinaryCompare) <> 0) Then bMod = True

        sSql = "UPDATE T_TradTexte " & _
               "SET PropTexte='" & sTxt & "', " & _
               "DateMaJ='" & m_DateMaJ & "', " & _
               "ModifTxt=" & CInt(bMod) & ", " & _
               "Scanner=" & CInt(True) & _
               " WHERE (((T_TradTexte.CtrParentGuid)='" & thisObj.Guid & "'));"
    End If

    ExecuteQdfTemp sSql

    MajTexteObjet = True
    
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
' ObjCtr (Control):
'==================
'
' Return Boolean : TRUE si pas de problème.
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:31
' DateMod :
' ----------------------------------------------------------------
Private Function ScanProprietes(ObjCtr As Access.Control) As Boolean
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
    thisCtr.Parent = IIf((ObjCtr.Parent.name <> thisObj.Nom), TypeName(ObjCtr.Parent) & "." & ObjCtr.Parent.name, vbNullString)

    '// Extraire les texte à utiliser.
    thisTxt.Caption = vbNullString: thisTxt.StatusBarText = vbNullString: thisTxt.ControlTipText = vbNullString
    thisTxt.Caption = LTrim$(ObjCtr.Properties(PROP_CAP).Value)
    thisTxt.StatusBarText = LTrim$(ObjCtr.Properties(PROP_BAR).Value)
    thisTxt.ControlTipText = LTrim$(ObjCtr.Properties(PROP_TIP).Value)

    eRep = Texte_A_Enregistrer()        '// Voir si on doit enregistrer le control...

    If (eRep = Faux) Then ScanProprietes = True: Exit Function  '// Pas de texte à stocker, on sort.
    If (eRep = Erreur) Then Exit Function                       '// Erreur, on sort.

    thisCtr.Nom = ObjCtr.name
    thisCtr.Type = TypeName(ObjCtr)

    bRep = CheckIDCtr(ObjCtr)           '// Vérifier/extraire id control...

    '// --------------------
    bRep = MajTableControl              '// Stock le control...
    '// --------------------

    sSql = "SELECT T_TradTexte.CtrParentGuid, T_TradTexte.PropNom, T_TradTexte.PropTexte FROM T_TradTexte " & _
           "WHERE T_TradTexte.CtrParentGuid='" & thisCtr.Guid & "';"
    Set m_TableTxtCtr = m_oBDLocale.OpenRecordset(sSql, dbOpenSnapshot)

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

    Dim sSql    As String
    Dim sTest   As String
    Dim sTxt    As String
    Dim bMod    As Boolean      '// 1 modifier 0 non modifier.
    Dim eMod    As eReponse     '// Retour function.

    If (Len(PropTexte) > 2) Then
        sTest = MD_Utils.CheckApostrophe(PropTexte)         '// Vérifier si apostrophe dans le texte...
        sTxt = IIf(sTest <> vbNullString, sTest, PropTexte)
    End If

    If thisCtr.Nouveau Then     '// Nouveau control.

        '// Ignore la propriété si elle ne contient pas de texte à traduire.
        If (Len(PropTexte) < 3) Then MajTextePropriete = True: Exit Function  '// Rien a faire, on sort.

        sSql = "INSERT INTO T_TradTexte " & _
               "(CtrParentGuid, PropNom, PropTexte, LangueCode, DateMaJ, DefLangue, Scanner, Nouveau) VALUES " & _
               "('" & thisCtr.Guid & "', '" & PropNom & "', '" & sTxt & "', " & thisApp.IDLang & ", '" & m_DateMaJ & "', " & _
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
                   "ModifTxt=" & CInt(bMod) & ", " & _
                   "Scanner=" & CInt(True) & _
                   " WHERE (((T_TradTexte.CtrParentGuid)='" & thisCtr.Guid & "') " & _
                   "AND ((T_TradTexte.PropNom)='" & PropNom & "'));"
        Else
           MajTextePropriete = True: Exit Function  '// Rien a faire, on sort.
        End If
    End If

    ExecuteQdfTemp sSql

    MajTextePropriete = True

End Function

' ------------------------------------------------------
'// Voir si nouveau control et si du texte à enregistrer
'// Retourne Valide si on doit l'enregistrer.
' ------------------------------------------------------
Private Function Texte_A_Enregistrer() As eReponse

    '// Test les valeurs, passe à vide si que 2 caractères ou moins.    'TODO: que 2 caractères ou moins
    thisTxt.Vide = ((Len(thisTxt.Caption) < 3) And (Len(thisTxt.StatusBarText) < 3) And (Len(thisTxt.ControlTipText) < 3))

    Texte_A_Enregistrer = IIf((thisTxt.Vide), eReponse.Faux, eReponse.Valide)

End Function

' ------------------------------------------------------
'// Utiliser pour vérifier les texte pour les prop des controls.
'// Retourne 0(Faux) pas de changement, 1(valide) le texte à changer, 2(Inconnu) Non trouver pas de texte.
' ------------------------------------------------------
Private Function TexteModifier(NomProp As String, TexteOrg As String) As eReponse

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

End Function

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
Private Function GetObjet(ObjetNom As String, ObjetType As eObjectTypeNum) As Object
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

' ----------------------------------------------------------------
'// Ferme l'objet ouvert en mode création. acSaveNo par defaut.
' ----------------------------------------------------------------
Private Sub CloseObjet(ObjetNom As String, ObjetType As eObjectTypeNum, Optional Methode As AcCloseSave = acSaveNo)
On Error GoTo ERR_CloseObjet

    Select Case ObjetType
        Case FormType
            m_oApp.DoCmd.Close acForm, ObjetNom, Methode
        Case ReportType
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
'// Extraire le guid de l'objet à partir de son tag.
'// Test la validité de celui-ci.
' ----------------------------------------------------------------
Private Function GetGuidObjet(accObj As Object) As String
On Error GoTo ERR_GetGuidObjet

    Dim sTag    As String
    Dim sTmp    As String
    Dim lPosD   As Long
    Dim lPosF   As Long
    Dim lLen    As Long
    Dim aTest() As Byte     '// Pour test validité guid.

    sTag = accObj.Tag
    lLen = Len(sTag)
    If (lLen = 0) Then Exit Function        '// Tag vide, on sort.

    lPosD = InStr(sTag, TAG_GUIDD)
    lPosF = InStrRev(sTag, TAG_GUIDF)

'    If ((lPosD = 1) And (lPosF = 0)) Then Exit Function  'Todo: Voir ce cas.
'    If ((lPosD = 0) And (lPosF > 0)) Then Exit Function  'Todo: Voir ce cas.
    If ((lPosD = 0) Or (lPosF = 0)) Then Exit Function  '// Tag non trouvé, on sort.

    If (lPosD = 1) Then     '// Rien avant tag.
        sTmp = Mid$(sTag, lPosD, (lPosF + 1))
    
    Else                    '// Quelquechose avant tag.
        lPosF = lPosF - 3
        sTmp = Mid$(sTag, lPosD, lPosF)
    End If

    '// Test le GUID, err 429 si non valide.
    aTest = Application.GUIDFromString(sTmp)
    GetGuidObjet = sTmp                         '// Guid trouvé et valide, on le renvoi.

SORTIE_GetGuidObjet:
    Exit Function

ERR_GetGuidObjet:
'429          Un composant ActiveX ne peut pas créer d'objet
'    If Err.Number = 429 Then 'TODO: Guid non valide, voir Quoi faire (utiliser celui de la table ?)
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "Trad-Access.C_TradScanText.GetGuidObjet"
    Resume SORTIE_GetGuidObjet
End Function

' ----------------------------------------------------------------
' Procedure Nom:            ControlIsVisible
' Sujet:                    Vérification si control non visible.
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

' ----------------------------------------------------------------
'// Extraire la langue de l'app
'// vérifier si elle existe dans la table T_Langues.
' ----------------------------------------------------------------
Private Function LangueCheckID(IDLang As Long) As Long
    Dim vLang As Variant

    vLang = DLookup("[LangueCode]", "T_Langues", "[LangueCode]=" & IDLang)
    If (IsNull(vLang)) Then
        LangueCheckID = 0
    Else
        LangueCheckID = CLng(vLang)
    End If

End Function

' ----------------------------------------------------------------
'// Détermine l'image à afficher suivant l'ID de la langue,
'// vérifie si le fichier image flag existe, retourne Null si pas trouver.
' ----------------------------------------------------------------
Public Function LangueExtraireFlag(Optional IDLang As Long = 0) As String
    Dim sImg As String
    Dim lID  As Long

    lID = IIf(IDLang = 0, thisApp.IDLang, 0)

    sImg = CurrentProject.Path & DOS_DRAP & LTrim$(str$(lID)) & ".png"
    If MD_FSO.FSOCheckFileExist(sImg) Then
        LangueExtraireFlag = sImg
    Else
        LangueExtraireFlag = vbNullString
    End If

End Function

' ----------------------------------------------------------------
'// Obtenir l'ID de la langue d'origine de la base.
' ----------------------------------------------------------------
Public Function GetIDLangBase(Optional AppGuid As String = vbNullString) As Long
    Dim vRes As Variant
    Dim sApp As String

    sApp = IIf(AppGuid = vbNullString, thisApp.Guid, AppGuid)

    vRes = Nz(DLookup("[CodeLangOrigine]", "T_App", "[AppGuid]='" & sApp & "'"), 0)

    GetIDLangBase = CLng(vRes)

End Function

' ----------------------------------------------------------------
'// Initialise les controles label à utiliser pour afficher les info et la barre d'avancement.
' ----------------------------------------------------------------
Public Sub InitialiseLabelsInfo(lblTexte As Access.Label, lblBarre As Access.Label)
    InfoScan.LabelBarre = lblBarre
    InfoScan.LabelTexte = lblTexte
    m_bBarreInit = True
End Sub

'----------------------------------------------------------------
'// Créer la propriété PROP_GUID pour la base en cours.
'// l'insère dans la table T_App.
'// Retourne TRUE si ok.
'----------------------------------------------------------------
Private Function MaJGuidApp() As Boolean
    Dim sRes  As String
    Dim bRep  As Boolean
    Dim sSql  As String

    sRes = ObjetAcc.GetPropTxt(PROP_GUID)   '// Doit retourner "N/A"(non trouvée), sinon erreur.

    If (sRes <> PROP_NA) Then Exit Function '// Erreur contient autre chose que "N/A".

    bRep = ObjetAcc.CreatePropTxt(PROP_GUID, thisApp.Guid)      '// Ajout de la prop dans la base...
    If (bRep = False) Then Exit Function    '// Erreur.

    '// MàJ de la table T_App...
    sSql = "INSERT INTO T_App ( AppGuid, AppNom, CodeLangOrigine ) " & _
           "VALUES ('" & thisApp.Guid & "', '" & thisApp.Nom & "', " & thisApp.IDLang & ");"
    ExecuteQdfTemp sSql

    MaJGuidApp = True     '// Tout est ok.

End Function

'----------------------------------------------------------------
'// Vérifier si le Guid existe dans la table, et les compares.
'----------------------------------------------------------------
Private Function CompareGuidAppEtTable(GuidBase As String) As eReponse
    Dim vRep  As Variant
    Dim sRep  As String
    Dim lRes  As Long

    vRep = DLookup("[AppGuid]", "T_App", "[AppGuid]='" & GuidBase & "'")
    sRep = CStr(Nz(vRep, vbNullString))

    If (sRep = vbNullString) Then CompareGuidAppEtTable = Inconnu   '// Pas dans la table.

    lRes = StrComp(GuidBase, sRep)
    If (lRes = 0) Then
        CompareGuidAppEtTable = Valide                              '// Ok correspond.
    Else
        CompareGuidAppEtTable = Faux                                '// Ne correspond pas.
    End If

End Function

'----------------------------------------------------------------
' Procedure Nom   : ResetEtatsTables
' ----------------------------------------------------------------
' Sujet           : Remet a 0 tous les états des objets, contrôles et texte de la base.
' Procedure Kind  : Sub
' Procedure Access: Public
' Objectif        : Place le champ Scanner et le champ ModPropTexte à 0, avant de lancer le scan.
'
'=== Paramètres ===
' BaseNom (String): Base à filtrer
'==================
'
' Author  : Laurent
' Date    : 20/07/2022 - 17:34
' DateMod :
' ----------------------------------------------------------------
Private Function ResetEtatsTables() As Boolean
    Dim sSql As String

    sSql = "UPDATE T_Objets " & _
           "INNER JOIN (T_ObjetControles " & _
           "INNER JOIN T_TradTexte ON T_ObjetControles.ControlGuid = T_TradTexte.CtrParentGuid) " & _
           "ON T_Objets.ObjetGuid = T_ObjetControles.ObjetParentGuid " & _
           "SET T_Objets.Scanner = 0, T_Objets.Nouveau = 0, T_ObjetControles.Scanner = 0, T_ObjetControles.Nouveau = 0, " & _
           "T_TradTexte.ModifTxt = 0, T_TradTexte.Scanner = 0, T_TradTexte.Nouveau = 0 " & _
           "WHERE (((T_Objets.AppGuid)='" & thisApp.Guid & "'));"

    ExecuteQdfTemp sSql

    ResetEtatsTables = True

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
Private Sub SuppDonneesTexte(AppNom As String)  'Note: Non utilisé en attente

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

Private Sub ExecuteQdfTemp(SqlVal As String)

    If (qdfTemp Is Nothing) Then Set qdfTemp = m_oBDLocale.CreateQueryDef("")

    qdfTemp.SQL = SqlVal
    qdfTemp.Execute dbFailOnError
    qdfTemp.Close

End Sub
'// ################################# END PRIV. SUB/FUNC #################################
