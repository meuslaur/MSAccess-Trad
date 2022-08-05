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

    Private Const PROP_CAP  As String = "Caption"
    Private Const PROP_TIP  As String = "ControlTipText"
    Private Const PROP_BAR  As String = "StatusBarText"
'    Private Const PROP_VTXT As String = "ValidationText"    'TODO: Table (ValidationText)

'-----------------------------------------
    '// Filtre le début de la chaine,
    '// ignore les valeurs sans caractère alphaNum
    '// ignore les valeurs defini par une source(commence par un '=').
    Private Const REG_PAT   As String = "(^[a-zA-Z0-9-&%éè""'[({]{1,})+([A-Za-zÀ0-9-ÖØ-öø-ÿ& ,.-@~`!@#$%^&*\[\]\{\}()_=+°\\'|;:""\/?>.<,-]){1,}$"
'-----------------------------------------

    Private Type TApp
        ID      As String
        Num     As Long         '// N° de l'app pour ID (nom des app souvent beaucoup trop long).
        Nom     As String
        IDLang  As Long
        ReScan  As Boolean      '// Indique base déjà scannée.
    End Type
    Private thisApp As TApp

    Private Type TObjet
'        ID      As String
        IDNet   As String       '// ID et Nom nettoyer des apostrophes (').
        Nom     As String
        NomNet  As String
        Type    As String
        Caption As String
        Nouveau As Boolean      '// Indique nouvel objet à enregistrer.
    End Type
    Private thisObj As TObjet

    Private Type TControl
'        ID      As String
        IDNet   As String       '// ID et Nom nettoyer des apostrophes (').
        Nom     As String
        NomNet  As String
        Type    As String
        Parent  As String       '// Control parent du contrôle, si existe.
        Nouveau As Boolean      '// Indique nouveau control à enregistrer.
    End Type
    Private thisCtr As TControl

    Private Type TTexte
        ID              As String
        Caption         As String
        StatusBarText   As String
        ControlTipText  As String
    End Type
    Private thisTxt As TTexte

    Private ObjetAcc        As C_ObjetsAccess   '// Objet access utilisés (database, application...)

    Private m_oApp          As Application      '// App externe.

    Private m_oBDLocale     As DAO.Database     '// Base Currentdb.
    Private qdfTemp         As DAO.QueryDef
'    Private m_TableControl  As DAO.Recordset    '// Table T_Controles.
'    Private m_TableTxtObj   As DAO.Recordset    '// Table T_PropTextes pour les forms/Reports.
'    Private m_TableTxtCtr   As DAO.Recordset    '// Table T_PropTextes pour les contrôles.


    Private InfoScan        As C_LabelsInfo     '// Affichage info texte et barre lors du scan.

    Private mRep            As Boolean
    Private m_DateMaJ       As Date             '// Date heure de la créaton ou de la mise à jour.

    Private mObjNomTmp      As String           '// Pour stockage des valeurs texte ignorées.
    Private mPrpIgnore      As String           '// ""
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Initialize()

    If (ObjetAcc Is Nothing) Then Set ObjetAcc = New C_ObjetsAccess
    If (InfoScan Is Nothing) Then Set InfoScan = New C_LabelsInfo

    Set m_oBDLocale = CodeDb()

    If (qdfTemp Is Nothing) Then Set qdfTemp = m_oBDLocale.CreateQueryDef("")

    InfoScan.UseBarre = False

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
Public Property Get AppID() As String
    AppID = thisApp.ID
End Property
'Public Property Let AppID(NewIDApp As String) 'Note: Non utilisé
'    thisApp.ID = NewIDApp
'End Property

'Public Property Get IDLangApp() As Long 'Note: Non utilisé
'    IDLangApp = thisApp.IDLang
'End Property
Public Property Let IDLangApp(IDLang As Long)
    thisApp.IDLang = LangueCheckID(IDLang)
End Property

Public Property Get ReScannerApp() As Boolean
    ReScannerApp = thisApp.ReScan
End Property
Public Property Let ReScannerApp(ReScanner As Boolean)
    thisApp.ReScan = ReScanner
End Property

'----------------------------------------------------------------
'// - Extraire le Guid des prop de la base,
'// - Rechercher le guid dans la table T_App,
'// - Comparer les 2.
'// Retourne Exist si tout est ok.
'----------------------------------------------------------------
Public Function IsNewApp() As eReponse
    Dim sres As String
    Dim eRep As eReponse
    Dim vTmp As Variant

    thisApp.ID = vbNullString
    sres = ObjetAcc.GetPropTxt(PROP_GUID)   '// Obtenir le guid de la base...
    If (sres = PROP_NA) Then IsNewApp = Inconnu: Exit Function  '// Inconnue, on sort.

    eRep = CompareGuidAppEtTable(sres)      '// Vérifier les guid...

    Select Case eRep

        Case eReponse.Valide
            thisApp.ID = sres
            vTmp = DLookup("[Num]", "T_App", "[App_ID]=" & thisApp.ID)      '// Extraire N° de l'app.
            thisApp.Num = CLng(vTmp)
            IsNewApp = Exist    '// ok.

        Case eReponse.Inconnu   '// Pas dans la table.
            IsNewApp = Faux

        Case eReponse.Faux      '// ne correspond pas.
            IsNewApp = Erreur
        Case Else
    End Select

End Function
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
' eObjectType1 (E_ObjectTypeNum):  Filtre 1 sur type d'objet (voir Enum E_ObjectTypeNum).
' eObjectType2 (E_ObjectTypeNum):  Filtre 2 sur type d'objet (voir Enum E_ObjectTypeNum.
' eObjectType3 (E_ObjectTypeNum):  Filtre 3 sur type d'objet (voir Enum E_ObjectTypeNum.
' oAutreBd (Database):  Pour test.
'==================
'
' Return Type:  True si pas de problème.
' Author    : Laurent
' Date      : 27/04/2022 - 10:36
' DateMod   : 28/06/2022 - 18:29
'
' ----------------------------------------------------------------
Public Function ScanObjetsApp() As Boolean '(eObjectType1 As E_ObjectTypeNum, _
                     Optional eObjectType2 As E_ObjectTypeNum, _
                     Optional eObjectType3 As E_ObjectTypeNum) As Boolean
On Error GoTo ERR_ScanObjetsApp

    '// App et base non ouverte, on sort.
    If (ObjetAcc Is Nothing) Then Exit Function
    If (ObjetAcc.MsAppIsUp = False Or ObjetAcc.MsBaseIsOpen = False) Then Exit Function

    Dim oBdExt  As DAO.Database
    Dim oRstSys As DAO.Recordset
    Dim ObjType As E_ObjectTypeNum
    Dim sSql    As String

    '// Extraire les objets de la table MsysObjects.
'    sSql = "SELECT MsysObjects.Type, MsysObjects.Flags, MsysObjects.Name AS ObjectName FROM MsysObjects " & _
'           "WHERE (((MsysObjects.Flags)>=0) AND ((MsysObjects.Type)=" & eObjectType1
    sSql = "SELECT  MsysObjects.id, MsysObjects.Type, MsysObjects.Name " & _
           "FROM MsysObjects " & _
           "WHERE (((MsysObjects.Type) = " & ObjetForm & " Or (MsysObjects.Type) = " & ObjetReport & ")) " & _
           "ORDER BY MsysObjects.Type, MsysObjects.Name;"

'    If (eObjectType2) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType2
'    If (eObjectType3) Then sSql = sSql & " Or (MsysObjects.Type)=" & eObjectType3
           
'    sSql = sSql & ") AND ((MsysObjects.Name) Not Like '~*' And (MsysObjects.Name) Not Like 'MSys*'))" & _
'                  "ORDER BY MsysObjects.Type, MsysObjects.Name;"

    If (m_oApp Is Nothing) Then Set m_oApp = ObjetAcc.GetMsApp()            '// Obtenir l'APP externe à utiliser...
    If (ObjetAcc.MsBaseIsOpen) Then thisApp.Nom = ObjetAcc.BaseNom()    '// Extraire le nom de la base.

    Set oBdExt = ObjetAcc.GetMsBase()                           '// Definir la base externe à utiliser.
    Set oRstSys = oBdExt.OpenRecordset(sSql, dbOpenSnapshot, dbReadOnly)   '// Ouvre MsysObjects de la base externe.

    If (m_oBDLocale Is Nothing) Then Set m_oBDLocale = CodeDb()

    If InfoScan.UseBarre Then InfoScan.InitialiseBarre oRstSys.RecordCount  '// Initialise la taille de la barre...

    If thisApp.ReScan Then
        mRep = ResetEtatsTables()                       '// Reset des champs etats des tables avant le scan...
        If mRep = False Then GoTo RESET_ScanObjetsApp
    End If

    '// Boucle sur les objets de la table MsysObjects.
    m_DateMaJ = Now()   '// Defini la date à utiliser.

    mPrpIgnore = vbNullString

    '// Nouvelle app, obtenir un id...
    If (Not thisApp.ReScan) Then
        thisApp.ID = MD_Utils.CreateGuid()
        mRep = MaJAppID()             '// Création ID...

        If Not mRep Then
            MsgBox "Erreur ID Prop base", vbCritical, "ScanObjetsApp"
            GoTo RESET_ScanObjetsApp
        End If
    End If

    With oRstSys
        If (.RecordCount <> 0) Then
            Do While Not .EOF
                thisObj.Nom = .Fields("Name").Value
                thisObj.NomNet = MD_Utils.CheckApostrophe(thisObj.Nom)
                ObjType = .Fields("Type").Value
                thisObj.Type = GetObjectTypeEnClair(ObjType)    '// Traduire en clair le Type...
                '--------------------------
                mRep = ScanObjet(ObjType)                       '// Enregistre les info...
                '--------------------------
                If (Not mRep) Then Exit Do
                .MoveNext
            Loop
        End If
    End With

    If mRep Then    '// Tout est ok.
        '// MàJ de la date du scan de l'app.
        sSql = "UPDATE T_App SET T_App.DernierScan = '" & m_DateMaJ & "';"
        ExecuteQdfTemp sSql
        MaJTableTxtIgnore       '///...
    End If

RESET_ScanObjetsApp:
    '// Femeture des objets.
    If (Not oRstSys Is Nothing) Then oRstSys.Close: Set oRstSys = Nothing
    If (Not oBdExt Is Nothing) Then oBdExt.Close: Set oBdExt = Nothing
'    If Not (m_TableTxtObj Is Nothing) Then m_TableTxtObj.Close: Set m_TableTxtObj = Nothing
'    If Not (m_TableControl Is Nothing) Then m_TableControl.Close: Set m_TableControl = Nothing
'    If Not (m_TableTxtCtr Is Nothing) Then m_TableTxtCtr.Close
'    Set m_TableTxtCtr = Nothing

'    If (mrep = False) Then SuppDonneesTexte m_AppNom    '// 'NOTE: Efface tous en cas d'erreur...

SORTIE_ScanObjetsApp:
    Set m_oApp = Nothing
    Set m_oApp = Nothing
    ScanObjetsApp = mRep
    Exit Function

ERR_ScanObjetsApp:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.ScanObjetsApp" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
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
' ObjetNom (String)          : Nom de l'objet à utiliser.
' ObjetType (E_ObjectTypeNum): Type de l'objet (E_ObjectTypeNum)
'==================
'
'
' Author  : Laurent
' Date    : 23/06/2022 - 11:30
' DateMod : 28/06/2022 - 18:38
' ----------------------------------------------------------------
Private Function ScanObjet(ObjType As E_ObjectTypeNum) As Boolean
On Error GoTo ERR_ScanObjet

    Dim oObjet      As Object
    Dim oCtr        As Access.Control
    Dim sInfoAvance As String

    sInfoAvance = thisObj.Type & " " & thisObj.Nom
    If InfoScan.UseBarre Then InfoScan.UpdateBarre sInfoAvance  '// Affiche l'état d'avancement du scan...
    DoEvents

    Set oObjet = GetObjet(thisObj.Nom, ObjType)             '// Ouvre le form mode création pour scan des contrôles...
    If (oObjet Is Nothing) Then mRep = False: Exit Function '// Erreur, on sort.

    thisObj.Caption = LTrim$(oObjet.Caption)

    '---------------
    mRep = MajObjet()                                     '// Enregistre les info et le texte à traduire de l'objet (Form, Report)...
    '---------------

    If (mRep) Then

        '// On boucle sur les contrôles de l'objet.
        For Each oCtr In oObjet.Controls

            'If (ControlIsVisible(oCtr) = True) Then 'TODO: Ignore les ctr invisibles ?
                thisCtr.Nom = oCtr.name
                thisCtr.NomNet = MD_Utils.CheckApostrophe(thisCtr.Nom)
                thisCtr.Type = TypeName(oCtr)
                '// Extraire le parent du control (page, label, etc.).
                thisCtr.Parent = IIf((oCtr.Parent.name <> thisObj.Nom), TypeName(oCtr.Parent) & "." & oCtr.Parent.name, vbNullString)

                '----------------------------
                mRep = ScanProprietes(oCtr)               '// Scan les propriétés du contrôle...
                '----------------------------

                If (mRep = False) Then Exit For
            'End If
        Next
    End If

    CloseObjet thisObj.Nom, ObjType                     '// Femeture de l'objet...

SORTIE_ScanObjet:
    ScanObjet = mRep
    Exit Function

ERR_ScanObjet:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.ScanObjet" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
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
On Error GoTo ERR_MajObjet

    Dim vTmp As Variant
    Dim lTmp As Long

'    thisObj.ID = thisApp.Num & "." & thisObj.Type & "." & thisObj.Nom
    thisObj.IDNet = thisApp.Num & "." & thisObj.Type & "." & thisObj.NomNet

    mRep = MajTableObjet              '// ...
    If mRep = False Then Exit Function

    lTmp = Len(thisObj.Caption)

    If ((lTmp = 0) And (thisObj.Nouveau)) Then MajObjet = True: Exit Function       '// Nouveau et caption vide, on sort.

    '// Voir si à déjà été enregistrer.
    If ((lTmp = 0) And (Not thisObj.Nouveau)) Then
        vTmp = DLookup("[Control_ID]", "T_ObjetControles", "[Control_ID]='" & thisObj.IDNet & "'")
        If IsNull(vTmp) Then GoTo SORTIE_MajObjet                                   '// Jamais enregistrer et caption vide, on sort.
    End If

    mRep = MajTableControlObjet()     '// ...
    If (mRep = False) Then Exit Function

    thisTxt.ID = thisObj.IDNet & "." & PROP_CAP
    mRep = MajTexteObjet              '// ...

SORTIE_MajObjet:
    MajObjet = mRep
    Exit Function

ERR_MajObjet:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.MajObjet" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_MajObjet
End Function

'--------------------------------------------------------------
'// Stock les objets (forms/reports).
'--------------------------------------------------------------
Private Function MajTableObjet() As Boolean
On Error GoTo ERR_MajTableObjet

    Dim sSql As String
    Dim vRep As Variant

    vRep = DLookup("[Objet_ID]", "T_Objets", "[Objet_ID]='" & thisObj.IDNet & "'")

    If (IsNull(vRep)) Then      '// Nouvel Objet.

        thisObj.Nouveau = True
        thisCtr.Nouveau = True

        sSql = "INSERT INTO T_Objets " & _
                "(Objet_ID, ObjetNom, ObjetType, IDApp, Scanner, Nouveau) " & _
                "VALUES ('" & thisObj.IDNet & "', '" & thisObj.NomNet & "', '" & thisObj.Type & "', '" & _
                thisApp.ID & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                        '// Déjà enregistrer..
        thisObj.Nouveau = False
        sSql = "UPDATE T_Objets SET T_Objets.Scanner=" & CInt(True) & _
               " WHERE (((T_Objets.Objet_ID)='" & thisObj.IDNet & "'));"
    End If

    ExecuteQdfTemp sSql
    MajTableObjet = True

SORTIE_MajTableObjet:
    Exit Function

ERR_MajTableObjet:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.MajTableObjet" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_MajTableObjet
End Function

'--------------------------------------------------------------
'// Stock les contrôles de l'objet en cours (Les forms et reports sont aussi stocker ici pour leur prop caption).
'--------------------------------------------------------------
Private Function MajTableControlObjet() As Boolean
On Error GoTo ERR_MajTableControlObjet

    Dim sSql As String

    If (thisObj.Nouveau) Then   '// Nouvel Objet.
        sSql = "INSERT INTO T_ObjetControles " & _
               "(Control_ID, ControlNom, ControlType, IDObjet, Scanner, Nouveau) " & _
               "VALUES ('" & thisObj.IDNet & "', '" & thisObj.NomNet & "', '" & thisObj.Type & "', '" & _
               thisObj.IDNet & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                '// Existe déjà.
        sSql = "UPDATE T_ObjetControles SET T_ObjetControles.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetControles.Control_ID)='" & thisObj.IDNet & "'));"
    End If

    ExecuteQdfTemp sSql
    MajTableControlObjet = True

SORTIE_MajTableControlObjet:
    Exit Function

ERR_MajTableControlObjet:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.MajTableControlObjet" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_MajTableControlObjet
End Function

'--------------------------------------------------------------
'// Stock les contrôles de l'objet en cours.
'--------------------------------------------------------------
Private Function MajTableControl() As Boolean
On Error GoTo ERR_MajTableControl

    Dim sSql As String
    Dim vTmp As Variant

    '// Si déjà scanner, voir si déjà enregistrer (nouv ctr ajouter dans l'objet).
    If (Not thisObj.Nouveau) Then
        vTmp = DLookup("[Control_ID]", "T_ObjetControles", "[Control_ID]='" & thisCtr.IDNet & "'")
        thisCtr.Nouveau = IsNull(vTmp)
    End If

    If (thisCtr.Nouveau) Then
        sSql = "INSERT INTO T_ObjetControles " & _
               "(Control_ID, ControlNom, ControlType, IDObjet, ControlParentName, Scanner, Nouveau) " & _
               "VALUES ('" & thisCtr.IDNet & "', '" & thisCtr.NomNet & "', '" & thisCtr.Type & "', '" & _
               thisObj.IDNet & "', '" & thisCtr.Parent & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else
        sSql = "UPDATE T_ObjetControles SET T_ObjetControles.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetControles.Control_ID)='" & thisCtr.IDNet & "'));"
    End If      '// Nouvel objet on passe directement a Execute.

    ExecuteQdfTemp sSql
    MajTableControl = True

SORTIE_MajTableControl:
    Exit Function

ERR_MajTableControl:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.MajTableControl" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_MajTableControl
End Function

'--------------------------------------------------------------
'// Utiliser que pour les forms et les reports (MajTextePropriete pour les contrôles).
'// On stock les valeurs même vide pour les forms et les reports.
'--------------------------------------------------------------
Private Function MajTexteObjet() As Boolean
On Error GoTo ERR_MajTexteObjet

    Dim sSql  As String
    Dim sTest As String
    Dim sTxt  As String
    Dim bMod  As Boolean    '// Indique si la valeur de PropTexte à été modifiée.
    Dim vTmp  As Variant

    If (Len(thisObj.Caption) > 2) Then
        sTest = CheckApostrophe(thisObj.Caption)                    '// Vérifier si apostrophe dans le texte...
        sTxt = IIf(sTest = vbNullString, thisObj.Caption, sTest)
    End If

    If thisObj.Nouveau Then     '// Nouveau.

        sSql = "INSERT INTO T_PropTextes " & _
               "(Prop_ID, PropNom, PropTexte, IDControl, DateMaJ, Scanner, Nouveau) " & _
               "VALUES ('" & thisTxt.ID & "', '" & PROP_CAP & "', '" & sTxt & "', '" & thisObj.IDNet & "', '" & _
               m_DateMaJ & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                    '// Déjà enregistrer.

        '// Voir si le texte à été modifié.
        vTmp = DLookup("[PropTexte]", "T_PropTextes", "[Prop_ID]='" & thisTxt.ID & "'")
        If (StrComp(thisObj.Caption, CStr(Nz(vTmp, vbNullString)), vbBinaryCompare) <> 0) Then bMod = True

        sSql = "UPDATE T_PropTextes " & _
               "SET PropTexte='" & sTxt & "', " & _
               "DateMaJ='" & m_DateMaJ & "', " & _
               "ModPropTexte=" & CInt(bMod) & "," & _
               "Scanner=" & CInt(True) & _
               " WHERE (((T_PropTextes.Prop_ID)='" & thisTxt.ID & "'));"
    End If

    ExecuteQdfTemp sSql
    MajTexteObjet = True

SORTIE_MajTexteObjet:
    Exit Function

ERR_MajTexteObjet:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.MajTexteObjet" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
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
Private Function ScanProprietes(ByRef ObjControl As Access.Control) As Boolean
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
    Dim eRep    As eReponse    '// Retour function.

    '// Extraire les texte à utiliser. NOTE: peut contenir de retour de ligne (vbNewLine).
    thisTxt.Caption = vbNullString: thisTxt.StatusBarText = vbNullString: thisTxt.ControlTipText = vbNullString

    thisTxt.Caption = ObjControl.Properties(PROP_CAP).Value
    '----------------------------------
    thisTxt.Caption = CheckTxtIgnore()      '// Filtrage texte Caption...
    '----------------------------------

    thisTxt.StatusBarText = LTrim$(ObjControl.Properties(PROP_BAR).Value)
    thisTxt.ControlTipText = LTrim$(ObjControl.Properties(PROP_TIP).Value)

    thisCtr.IDNet = thisObj.IDNet & "." & thisCtr.NomNet

    eRep = Texte_A_Enregistrer()        '// Voir si on doit enregistrer le control...

    If (eRep = Faux) Then ScanProprietes = True: Exit Function  '// Pas de texte à stocker, on sort.
    If (eRep = Erreur) Then Exit Function                       '// Erreur, on sort.

    '-------------------------
    mRep = MajTableControl              '// Stock le control...
    '-------------------------

    If (mRep) Then mRep = MajTextePropriete(PROP_CAP, thisTxt.Caption)          '// Stock ses textes...
    If (mRep) Then mRep = MajTextePropriete(PROP_TIP, thisTxt.ControlTipText)   '// ...
    If (mRep) Then mRep = MajTextePropriete(PROP_BAR, thisTxt.StatusBarText)    '// ...

SORTIE_ScanProprietes:
    ScanProprietes = mRep
    Exit Function

ERR_ScanProprietes:
    If (Err.Number = 2455) Then Resume Next     '// Propriété inexistante.
'    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.ScanProprietes" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
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

    thisTxt.ID = thisCtr.IDNet & "." & PropNom

'TODO: Test nom trop long
If Len(thisTxt.ID) > 100 Then
    mPrpIgnore = mPrpIgnore & "<div>" & PropNom & " : <font color=white style=""BACKGROUND-COLOR:#FF0000"">" & thisTxt.ID & "</font></div>"
    MajTextePropriete = True
    Exit Function
End If
'TODO: Test nom trop long

    '// Vérifier si un/des apostrophe dans le texte...
    If (Len(PropTexte) > 2) Then
        sTest = CheckApostrophe(PropTexte)
        sTxt = IIf(sTest <> vbNullString, sTest, PropTexte)
    End If

    If thisCtr.Nouveau Then     '// Nouveau control.

        '// Ignore la propriété si elle ne contient pas de texte à traduire.
        If (Len(PropTexte) < 3) Then MajTextePropriete = True: Exit Function  '// Rien a faire, on sort.

        sSql = "INSERT INTO T_PropTextes " & _
               "(Prop_ID, PropNom, PropTexte, IDControl, DateMaJ, Scanner, Nouveau) " & _
               "VALUES ('" & thisTxt.ID & "', '" & PropNom & "', '" & sTxt & "', '" & thisCtr.IDNet & "', '" & _
               m_DateMaJ & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                        '// Déjà enregistrer.

        eMod = TexteModifier(PropTexte)         '// Vérifier ce qu'il faut faire avec le texte...

        If (eMod = Erreur) Then Exit Function   '// Erreur, on sort.

        '// MàJ si retourne 0(pas de changement) ou 2(modifier), si (Inconnu) on passe.
        If (eMod <> Inconnu) Then

            bMod = IIf(eMod = Faux, False, True)
            sSql = "UPDATE T_PropTextes " & _
                   "SET PropTexte='" & sTxt & "', " & _
                   "DateMaJ='" & m_DateMaJ & "', " & _
                   "ModPropTexte=" & CInt(bMod) & ", " & _
                   "Scanner=" & CInt(True) & _
                   " WHERE (((T_PropTextes.Prop_ID)='" & thisTxt.ID & "'));"
        Else
           MajTextePropriete = True: Exit Function  '// Rien a faire, on sort.
        End If
    End If

    ExecuteQdfTemp sSql
    MajTextePropriete = True
    
SORTIE_MajTextePropriete:
    Exit Function

ERR_MajTextePropriete:
    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.MajTextePropriete" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_MajTextePropriete
End Function

'--------------------------------------------------------------
'// Voir si nouveau control et si du texte à enregistrer
'// Retourne Valide si on doit l'enregistrer.
'--------------------------------------------------------------
Private Function Texte_A_Enregistrer() As eReponse
    
    Dim bRes As Boolean

    '// Test les valeurs, passe à vide si que 2 caractères ou moins.    'TODO: que 2 caractères ou moins
    bRes = ((Len(thisTxt.Caption) < 3) And (Len(thisTxt.StatusBarText) < 3) And (Len(thisTxt.ControlTipText) < 3))

    Texte_A_Enregistrer = IIf((bRes), eReponse.Faux, eReponse.Valide)

End Function

'--------------------------------------------------------------
'// Utiliser pour vérifier les texte pour les prop des controls.
'// Retourne 0(Faux) pas de changement, 1(valide) le texte à changer, 2(Inconnu) Non trouver pas de texte.
'--------------------------------------------------------------
Private Function TexteModifier(TexteOrg As String) As eReponse

    Dim sTxt As String
    Dim vTmp As Variant

    vTmp = DLookup("[PropTexte]", "T_PropTextes", "[Prop_ID]='" & thisTxt.ID & "'")
    sTxt = IIf(IsNull(vTmp), PROP_NA, CStr(Nz(vTmp, vbNullString)))

    If (sTxt = PROP_NA) Then
        If (Len(TexteOrg) < 3) Then
            TexteModifier = Inconnu: Exit Function      '// Pas trouvé et pas de texte à enregistrer.
        End If
    Else
        If (StrComp(TexteOrg, sTxt, vbBinaryCompare) <> 0) Then TexteModifier = Valide  '// Texte modifié, sinon, pas de changement(0).
    End If

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
'Private Sub SuppDonneesTexte(AppNom As String)  'Note: Non utilisé en attante
'
'    Dim sSql As String
'
'    sSql = "DELETE T_Objets.* FROM T_Objets " & _
'           "WHERE (((T_Objets.IDApp)='" & thisApp.ID & "'));"
'    ExecuteQdfTemp sSql
'
'End Sub
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
' ObjetType (E_ObjectTypeNum)  : Type Const.
'==================
'
' Return Object :   L'objet ou nothing si erreur.
'
' Author  : Laurent
' Date    : 23/06/2022 - 15:35
' DateMod :
' ----------------------------------------------------------------
Private Function GetObjet(ObjetNom As String, ObjetType As E_ObjectTypeNum) As Object
On Error GoTo ERR_GetObjet

    Select Case ObjetType
        Case ObjetForm
            m_oApp.DoCmd.OpenForm ObjetNom, acDesign, , , , acHidden
            Set GetObjet = m_oApp.Forms.Item(ObjetNom)
        Case ObjetReport
            m_oApp.DoCmd.OpenReport ObjetNom, acViewDesign, , , acHidden
            Set GetObjet = m_oApp.Reports.Item(ObjetNom)
    End Select

SORTIE_GetObjet:
    Exit Function

ERR_GetObjet:
    mRep = False
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans C_TradScanText.GetObjet, ligne " & Erl & "."
    Resume SORTIE_GetObjet
End Function

Private Sub CloseObjet(ObjetNom As String, ObjetType As E_ObjectTypeNum, Optional Methode As AcCloseSave = acSaveNo)
On Error GoTo ERR_CloseObjet

    Select Case ObjetType
        Case ObjetForm
            m_oApp.DoCmd.Close acForm, ObjetNom, Methode
        Case ObjetReport
            m_oApp.DoCmd.Close acReport, ObjetNom, Methode
    End Select
    
SORTIE_CloseObjet:
    Exit Sub

ERR_CloseObjet:
    mRep = False
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  C_TradScanText.CloseObjet, ligne " & Erl & "."
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
'Private Function ControlIsVisible(oCtr As Control) As Boolean   'Note: Non utilisé en attente ControlIsVisible
'
'    If (oCtr Is Nothing) Then Exit Function
'    ControlIsVisible = (oCtr.Visible)
'
'End Function

'--------------------------------------------------------------
'// Extraire la langue de l'app
'// vérifier si elle existe dans la table T_Langues.
'--------------------------------------------------------------
Private Function LangueCheckID(IDLang As Long) As Long
    Dim vLang As Variant

    vLang = DLookup("[LangueCode]", "T_Langues", "[LangueCode]=" & IDLang)
    If (IsNull(vLang)) Then
        LangueCheckID = 0
    Else
        LangueCheckID = Val(vLang)
    End If

End Function

'--------------------------------------------------------------
'// Détermine l'image à afficher suivant l'ID de la langue,
'// vérifie si le fichier image flag existe, retourne Null si pas trouver.
'--------------------------------------------------------------
Public Function LangueExtraireFlag(Optional IDLang As Long = 0) As String
    Dim sImg As String
    Dim lID  As Long

    lID = IIf(IDLang = 0, thisApp.IDLang, 0)

    sImg = CurrentProject.Path & DOS_DRAP & LTrim$(str$(lID)) & ".png"
    If FSOFileExist(sImg) Then
        LangueExtraireFlag = sImg
    Else
        LangueExtraireFlag = vbNullString
    End If

End Function

' ----------------------------------------------------------------
'// Obtenir l'ID de la langue d'origine de la base.
' ----------------------------------------------------------------
Public Function GetIDLangBase(Optional AppID As String = vbNullString) As Long
    Dim vRes As Variant
    Dim sApp As String

    sApp = IIf(AppID = vbNullString, thisApp.ID, AppID)

    vRes = Nz(DLookup("[LangueCodeBase]", "T_App", "[App_ID]='" & sApp & "'"), 0)

    GetIDLangBase = CLng(vRes)

End Function

Public Sub InitialiseLabelsInfo(lblTexte As Access.Label, lblBarre As Access.Label)
'// Initialise les controles label à utiliser pour afficher les info et la barre d'avancement.
    InfoScan.LabelBarre = lblBarre
    InfoScan.LabelTexte = lblTexte
    InfoScan.UseBarre = True
End Sub


'----------------------------------------------------------------
'// Créer la propriété PROP_GUID pour la base en cours.
'// l'insère dans la table T_App.
'// Retourne TRUE si ok.
'----------------------------------------------------------------
Private Function MaJAppID() As Boolean
    Dim sres As String
    Dim sSql As String
    Dim vTmp As Long

    sres = ObjetAcc.GetPropTxt(PROP_GUID)   '// Doit retourner "N/A"(non trouvée), sinon erreur.

    If (sres <> PROP_NA) Then Exit Function '// Erreur contient autre chose que "N/A".

    mRep = ObjetAcc.CreatePropTxt(PROP_GUID, thisApp.ID)      '// Ajout de la prop dans la base...
    If (mRep = False) Then Exit Function    '// Erreur.

    '// MàJ de la table T_App.
    sSql = "INSERT INTO T_App ( App_ID, AppNom, LangueCodeBase ) " & _
           "VALUES ('" & thisApp.ID & "', '" & thisApp.Nom & "', " & thisApp.IDLang & ");"
    ExecuteQdfTemp sSql

    vTmp = DLookup("[Num]", "T_App", "[App_ID]=" & thisApp.ID)      '// Extraire N° de l'app.
    thisApp.Num = CLng(vTmp)

    MaJAppID = True     '// Tout est ok.

End Function

'----------------------------------------------------------------
'// Vérifier si le Guid existe dans la table, et les compares.
'----------------------------------------------------------------
Private Function CompareGuidAppEtTable(GuidBase As String) As eReponse
    Dim vRep  As Variant
    Dim sRep  As String
    Dim lRes  As Long

    vRep = DLookup("[App_ID]", "T_App", "[App_ID]='" & GuidBase & "'")
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
Private Function ResetEtatsTables() As Boolean
    Dim sSql As String

    sSql = "UPDATE (T_Objets INNER JOIN T_ObjetControles " & _
           "ON T_Objets.Objet_ID = T_ObjetControles.IDObjet) " & _
           "INNER JOIN T_PropTextes " & _
           "ON T_ObjetControles.Control_ID = T_PropTextes.IDControl " & _
           "SET T_Objets.Scanner = 0, T_Objets.Nouveau = 0, " & _
           "T_ObjetControles.Scanner = 0, T_ObjetControles.Nouveau = 0, " & _
           "T_PropTextes.Scanner = 0, T_PropTextes.ModPropTexte = 0, T_PropTextes.Nouveau = 0 " & _
           "WHERE (((T_Objets.IDApp)='" & thisApp.ID & "'));"

    ExecuteQdfTemp sSql
    ResetEtatsTables = True

End Function

Private Sub ExecuteQdfTemp(SqlVal As String)

    If (qdfTemp Is Nothing) Then Set qdfTemp = m_oBDLocale.CreateQueryDef("")

    qdfTemp.SQL = SqlVal
    qdfTemp.Execute dbFailOnError
    qdfTemp.Close

End Sub

' ----------------------------------------------------------------
'// Stock les textes ignorés par les filtres (caption dans ScanPropreties)
' ----------------------------------------------------------------
Private Sub MaJTableTxtIgnore()

    Dim sSql As String
    Dim vTmp As Variant
    Dim sTxt As String

    vTmp = DLookup("[ID]", "iT_TextesIgnores", "[ID]='" & thisApp.ID & "'")

    If (IsNull(vTmp)) Then

        If (mPrpIgnore = vbNullString) Then Exit Sub            '// Rien a faire on sort.
                               
        sTxt = MD_Utils.CheckApostrophe(mPrpIgnore)             '// Ajoute les texte.
        sSql = "INSERT INTO iT_TextesIgnores (ID, Texte) " & _
               "VALUES ('" & thisApp.ID & "', '" & sTxt & "');"
    Else

        If (mPrpIgnore = vbNullString) Then                     '// Plus de texte, efface les anciennes données.
            sSql = "DELETE iT_TextesIgnores.* FROM iT_TextesIgnores " & _
                   "WHERE (((iT_TextesIgnores.ID)='" & thisApp.ID & "'));"

        Else                                                    '// MàJ de la table.
        sTxt = MD_Utils.CheckApostrophe(mPrpIgnore)
            sSql = "UPDATE iT_TextesIgnores SET iT_TextesIgnores.Texte = '" & sTxt & "' " & _
                   "WHERE (((iT_TextesIgnores.ID)='" & thisApp.ID & "'));"
        End If
    End If

    ExecuteQdfTemp sSql

End Sub

' ----------------------------------------------------------------
'// Stock dans la table iT_TextesIgnores tous les textes rejetés par les filtres.
'// Retourne Null string si ne passe pas les filtres, sinon retourne le texte d'origine.
' ----------------------------------------------------------------
Private Function CheckTxtIgnore() As String
    Dim sCap    As String
    Dim sCapTmp As String

    sCap = thisTxt.Caption
    If (sCap <> vbNullString) Then

        sCapTmp = LTrim$(thisTxt.Caption)
        sCap = RegEx(REG_PAT, sCapTmp, True)            '// Applique la pattern Regex (voir Const REG_PAT)...
    
        If (sCap = vbNullString) Then                   '// Rejet Regex, on stock le texte ingoré.
            If (mObjNomTmp <> thisObj.Nom) Then
                    mPrpIgnore = mPrpIgnore & "<div>----</div><div><font size=3><strong>" & thisObj.Type & "." & thisObj.Nom & "</strong></font></div><div>----</div><div>"
                    mObjNomTmp = thisObj.Nom
            End If
            sCapTmp = RegexReplaceChevrons(thisTxt.Caption) '// Peux contenir des '< >'...
            mPrpIgnore = mPrpIgnore & "<div>" & thisCtr.Type & "." & thisCtr.Nom & " : <font color=""#F2F2F2"" style=""BACKGROUND-COLOR:#000080"">" & sCapTmp & "</font></div>"
        Else
            sCap = thisTxt.Caption                      '// Passe les filtres retroune le texte d'origine.
        End If
    End If

    CheckTxtIgnore = sCap   '// Null ou le texte d'origine.

End Function
'// ################################# END PRIV. SUB/FUNC #################################
