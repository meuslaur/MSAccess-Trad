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
' DateMod  : 05/08/2022 - 11:36
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
        ID          As String
        Num         As Long         '// N° de l'app pour ID (nom des app souvent beaucoup trop long).
        Nom         As String
        IDLang      As Long
        ReScan      As Boolean      '// Indique base déjà scannée.
        Track       As Boolean      '// Voir si l'option 'Track Name AutoCorrect Info' de la base est activée.
    End Type
    Private thisApp As TApp

    Private Type TObjet
        IDNet       As String      '// ID et Nom nettoyer des apostrophes (').
        Nom         As String
        NomNet      As String
        Type        As String
        Caption     As String
        Nouveau     As Boolean     '// Indique nouvel objet à enregistrer.
        TxtField    As Boolean     '// Indique si la table contient des champs txt ou memo.
    End Type
    Private thisObj As TObjet

    Private Type TChilds        '// Enfants des objets.
        IDNet       As String       '// ID et Nom nettoyer des apostrophes (').
        Nom         As String
        NomNet      As String
        Type        As String
        Parent      As String       '// Control parent du contrôle, si existe.
        Nouveau     As Boolean      '// Indique nouveau control à enregistrer.
    End Type
    Private thisChild As TChilds

    Private Type TTexte
        ID              As String
        Caption         As String
        StatusBarText   As String
        ControlTipText  As String
    End Type
    Private thisTxt     As TTexte

    Private ObjetAcc    As C_ObjetsAccess   '// Objet access utilisés (database, application...)

    Private m_oApp      As Application      '// App externe.

    Private m_oBDLocale As DAO.Database     '// Base Currentdb.
    Private qdfTemp     As DAO.QueryDef
'    Private m_TableControl  As DAO.Recordset    '// Table T_Controles.
'    Private m_TableTxtObj   As DAO.Recordset    '// Table T_ObjetChildTextes pour les forms/Reports.
'    Private m_TableTxtCtr   As DAO.Recordset    '// Table T_ObjetChildTextes pour les contrôles.

    Private InfoScan    As C_LabelsInfo     '// Affichage info texte et barre lors du scan.

    Private mRep        As Boolean
    Private m_DateMaJ   As Date             '// Date heure de la créaton ou de la mise à jour.

    Private mObjNomTmp  As String           '// Pour stockage des valeurs texte ignorées.
    Private mNonEnrg    As String           '// ""
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'NOTE:
'// Formulaires Type=32768
'// Tables      Type=1
'SELECT MSysNameMap.GUID FROM MSysNameMap
'WHERE (((MSysNameMap.Name)='iF_Recap') AND ((MSysNameMap.Type)=32768));


'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Initialize()

    If (ObjetAcc Is Nothing) Then Set ObjetAcc = New C_ObjetsAccess
    If (InfoScan Is Nothing) Then Set InfoScan = New C_LabelsInfo

    Set m_oBDLocale = CodeDb()

    If (qdfTemp Is Nothing) Then Set qdfTemp = m_oBDLocale.CreateQueryDef("")

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

Public Property Get ObjetsAccess() As C_ObjetsAccess
    If (Not ObjetAcc Is Nothing) Then Set ObjetsAccess = ObjetAcc
End Property
'//====================================== END PROP =======================================

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'----------------------------------------------------------------
'// - Extraire le Guid des prop de la base,
'// - Rechercher le guid dans la table T_App,
'// - Comparer les 2.
'// Retourne Exist si tout est ok.
'----------------------------------------------------------------
Public Function IsNewApp() As eReponse
    Dim sRes As String
    Dim eRep As eReponse
    Dim vTmp As Variant
    Dim lRep As Long
    Dim sMsg As String

    thisApp.ID = vbNullString
    sRes = ObjetAcc.GetPropTxt(PROP_GUID)   '// Obtenir le guid de la base...

    If (sRes = PROP_NA) Then IsNewApp = Inconnu: Exit Function '// Inconnue, on sort.

    eRep = CompareGuidAppEtTable(sRes)      '// Vérifier les guid...

    Select Case eRep

        Case eReponse.Valide        '// Existe, demande confirmation

            thisApp.ID = sRes
            vTmp = DLookup("[Num]", "T_App", "[App_ID]=" & thisApp.ID)      '// Extraire N° de l'app.
            thisApp.Num = CLng(vTmp)

            sMsg = "La base '" & ObjetAcc.BaseNom & "' est déjà enregistrée dans la table T_Objets." & vbCrLf & _
                   "Les données concernant cette base vont être mise à jour." & vbCrLf & _
                   "Voulez-vous continuer ?"
            lRep = MsgBox(sMsg, vbExclamation + vbYesNo + vbDefaultButton2, "Base déjà enregistrée")
            If (lRep = vbNo) Then
                IsNewApp = Erreur
            Else
                IsNewApp = Valide
            End If
            Exit Function

        Case eReponse.Inconnu       '// Pas dans la table.

            MsgBox "Erreur App_ID pas dans la table.", vbCritical, "cmbSelectBdd_Click"
            Exit Function

        Case eReponse.Faux          '// ne correspond pas.

            MsgBox "Erreur App_ID/table ne correspondent pas.", vbCritical, "cmbSelectBdd_Click"
            Exit Function

        Case Else
    End Select

    IsNewApp = Erreur

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
Public Function ScanObjetsApp(CurrentAppID As String) As Boolean  '(eObjectType1 As E_ObjectTypeNum, _
                     Optional eObjectType2 As E_ObjectTypeNum, _
                     Optional eObjectType3 As E_ObjectTypeNum) As Boolean
On Error GoTo ERR_ScanObjetsApp

    '// App et base non ouverte, on sort.
    If (ObjetAcc Is Nothing) Then Exit Function
    If (ObjetAcc.MsAppIsUp = False Or ObjetAcc.MsBaseIsOpen = False) Then Exit Function

    Dim oBdExt  As DAO.Database
    Dim oRstSys As DAO.Recordset
    Dim ObjType As E_ObjectType
    Dim sSql    As String
    Dim sBarTxt As String

    '// Extraire les objets de la table MsysObjects.
    sSql = "SELECT  MsysObjects.id, MsysObjects.Type, MsysObjects.Name " & _
           "FROM MsysObjects " & _
           "WHERE (((MsysObjects.Type) = " & ObjetForm & " Or (MsysObjects.Type) = " & ObjetReport & " Or (MsysObjects.Type) = " & TableLocale & " Or (MsysObjects.Type) = " & TableLinked & ") " & _
           "AND ((MsysObjects.Name) Not Like '~*' And (MsysObjects.Name) Not Like 'MSys*')  AND ((MsysObjects.Flags)>=0)) " & _
           "ORDER BY MsysObjects.Type, MsysObjects.Name;"

    Set m_oApp = ObjetAcc.GetMsApp          '// Obtenir l'APP externe à utiliser...
    Set oBdExt = ObjetAcc.GetMsBase         '// Definir la base externe à utiliser...

    Set oRstSys = oBdExt.OpenRecordset(sSql, dbOpenSnapshot, dbReadOnly)   '// Ouvre MsysObjects de la base externe.

    If (m_oBDLocale Is Nothing) Then Set m_oBDLocale = CodeDb()

    If InfoScan.BarreIsUp Then InfoScan.SetLengthBarre "a", oRstSys.RecordCount  '// Initialise la taille de la barre...

    '// Reset.
    thisApp.ID = CurrentAppID
    thisApp.Nom = ObjetAcc.BaseNom
    thisApp.Track = ObjetAcc.OptionTrackNameObjet
    m_DateMaJ = Now()       '// Defini la date à utiliser.
    thisObj.IDNet = vbNullString
    thisChild.IDNet = vbNullString
    thisTxt.ID = vbNullString
    mObjNomTmp = vbNullString

    If thisApp.ReScan Then      '// Déjà scannée, reset des champs etats avant le scan.

        mRep = ResetEtatsTables()
        If mRep = False Then GoTo RESET_ScanObjetsApp

    Else                        '// Nouvelle app, obtenir un id.

        thisApp.ID = MD_Utils.CreateGuid()  '// Création ID...
        mRep = MaJAppID()

        If Not mRep Then
            MsgBox "Erreur ID Prop base", vbCritical, "ScanObjetsApp"
            GoTo RESET_ScanObjetsApp
        End If
    End If

    '// Boucle sur les objets de la table MsysObjects.
    With oRstSys
        If (.RecordCount <> 0) Then

            Do While Not .EOF

                thisObj.Nom = .Fields("Name").value
                thisObj.NomNet = MD_Utils.CheckApostrophe(thisObj.Nom)
                ObjType = .Fields("Type").value
                thisObj.Type = GetObjectTypeEnClair(ObjType)    '// Traduire en clair le Type...

                sBarTxt = thisObj.Type & " " & thisObj.Nom
                If InfoScan.BarreIsUp Then InfoScan.UpdateBarre sBarTxt '// Affiche l'état d'avancement du scan...
                DoEvents

                If (ObjType = ObjetForm Or ObjType = ObjetReport) Then
                    '--------------------------
                    mRep = ScanObjet(ObjType)           '// Enregistre les info forms/reports...
                    '--------------------------
                    If (Not mRep) Then Exit Do
                End If

                If (ObjType = TableLocale Or ObjType = TableLinked) Then
                    '--------------------------
                    mRep = ScanTables()                 '// Enregistre les info Tables...
                    '--------------------------
                    If (Not mRep) Then Exit Do

                End If

                .MoveNext
            Loop
        End If
    End With

    If mRep Then    '// Tout est ok.

        sSql = "UPDATE T_App SET T_App.DernierScan = '" & m_DateMaJ & "' " & _
               "WHERE (((T_App.App_ID)='" & thisApp.ID & "'));"
        ExecuteQdfTemp sSql

        MaJTableNonInclus       '// Stock les éléments non enregistrés...
    End If

RESET_ScanObjetsApp:
    '// Femeture des objets.
    If (Not oRstSys Is Nothing) Then oRstSys.Close: Set oRstSys = Nothing
    If (Not oBdExt Is Nothing) Then oBdExt.Close: Set oBdExt = Nothing
'    If Not (m_TableTxtObj Is Nothing) Then m_TableTxtObj.Close: Set m_TableTxtObj = Nothing
'    If Not (m_TableControl Is Nothing) Then m_TableControl.Close: Set m_TableControl = Nothing
'    If Not (m_TableTxtCtr Is Nothing) Then m_TableTxtCtr.Close
'    Set m_TableTxtCtr = Nothing

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
    InfoScan.InitialiseLabels lblBarre, lblTexte
End Sub
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
Private Function ScanObjet(ObjType As E_ObjectType) As Boolean
On Error GoTo ERR_ScanObjet

    Dim oObjet      As Object
    Dim oCtr        As Access.Control

    Set oObjet = GetObjet(thisObj.Nom, ObjType)             '// Ouvre le form/report mode création pour scan des contrôles...
    If (oObjet Is Nothing) Then mRep = False: Exit Function '// Erreur, on sort.

    thisObj.Caption = LTrim$(oObjet.Caption)

    '---------------
    mRep = MajObjet()                                     '// Enregistre les info et le texte à traduire de l'objet (Form, Report)...
    '---------------

    If (mRep) Then

        '// On boucle sur les contrôles de l'objet.
        For Each oCtr In oObjet.Controls

            'If (ControlIsVisible(oCtr) = True) Then 'TODO: Ignore les ctr invisibles ?
                thisChild.Nom = oCtr.name
                thisChild.NomNet = MD_Utils.CheckApostrophe(thisChild.Nom)
                thisChild.Type = TypeName(oCtr)
                '// Extraire le parent du control (page, label, etc.).
                thisChild.Parent = IIf((oCtr.Parent.name <> thisObj.Nom), TypeName(oCtr.Parent) & "." & oCtr.Parent.name, vbNullString)

                '----------------------------
                mRep = ScanObjChilds(oCtr)               '// Scan les propriétés du contrôle...
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
'// Stock les champs texte/memo des tables.
' DateMod: 07/08/2022 - 18:25
' ----------------------------------------------------------------
Private Function ScanTables() As Boolean
On Error GoTo ERR_ScanTables

    Dim oRstTab As DAO.Recordset
    Dim oFld    As DAO.Field
    Dim sRep    As String
    Dim sTxt    As String
'    Dim sSql    As String
'    Dim vRep    As Variant

    thisObj.IDNet = thisObj.Type & "!" & thisObj.NomNet

    sRep = ObjetAcc.CheckTdfLinked(thisObj.Nom)     '// Vérifier liaison si tbl liée...
    If (sRep <> vbNullString) Then
        sTxt = "Table : " & thisObj.Type & "." & thisObj.NomNet & " (Liaison rompue)" & vbCrLf & "--- [" & sRep & "]" & vbCrLf
        SauveTexte sTxt
        ScanTables = True
        Exit Function 'TODO: Liaison rompue, on continu quand même sur les autres tables.
    End If

    mRep = MajTableObjet              '// ...
    If mRep = False Then Exit Function

    Set oRstTab = ObjetAcc.GetRecordset(thisObj.Nom, True)
    If oRstTab Is Nothing Then Exit Function

    '// On boucle sur les champs de la table.
    thisObj.TxtField = False
    For Each oFld In oRstTab.Fields

        '// Voir si la table contient des champs Texte ou Memo.
        If ((oFld.Type = dbMemo) Or (oFld.Type = dbText)) Then

            thisObj.TxtField = True

            thisChild.Nom = oFld.name
            thisChild.NomNet = MD_Utils.CheckApostrophe(thisChild.Nom)
            thisChild.Type = IIf(oFld.Type = dbMemo, "dbMeno", "dbText")
            thisChild.Parent = vbNullString

'            thisFld.Texte = oFld.Value
'            thisFld.Texte = CheckTxtIgnore(oFld.Value)      '// Filtrage texte...
            thisChild.IDNet = thisObj.IDNet & "!" & thisChild.NomNet
            '-------------------------
            mRep = MajTableChild()          '// Stock le champ...
            '-------------------------
            If (mRep = False) Then Exit For

        End If
'    If (mRep) Then mRep = MajTableChildPropTexte(PROP_CAP, thisTxt.Caption)          '// Stock ses textes...
    Next

'    If thisObj.TxtField Then ExecuteQdfTemp sSql    '// Champs texte trouvés, on enregistre la table.

    ObjetAcc.CloseOpenRecordset
    ScanTables = True

SORTIE_ScanTables:
    Exit Function

ERR_ScanTables:
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.ScanTables" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_ScanTables
End Function

' ----------------------------------------------------------------
' Procedure Nom   : MaJObjet
' ----------------------------------------------------------------
' Sujet           : Stock les forms/report, et leur prop texte Caption à traduire.
' Procedure Kind  : Function
' Procedure Access: Private
' Objectif        :
' Requi           : MajTableObjet, MajTableObjetProp, MajTableObjetTexte.
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

    thisObj.IDNet = thisObj.Type & "!" & thisObj.NomNet

    mRep = MajTableObjet                    '// ...
    If mRep = False Then Exit Function

    lTmp = Len(thisObj.Caption)

    If ((lTmp = 0) And (thisObj.Nouveau)) Then MajObjet = True: Exit Function       '// Nouveau et caption vide, on sort.

    '// Voir si à déjà été enregistrer.
    If ((lTmp = 0) And (Not thisObj.Nouveau)) Then
        vTmp = DLookup("[Child_ID]", "T_ObjetChilds", "[Child_ID]='" & thisObj.IDNet & "'")
        If IsNull(vTmp) Then GoTo SORTIE_MajObjet                                   '// Jamais enregistrer et caption vide, on sort.
    End If

    mRep = MajTableObjetProp()              '// ...
    If (mRep = False) Then Exit Function

    thisTxt.ID = thisObj.IDNet & "." & PROP_CAP
    mRep = MajTableObjetTexte              '// ...

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

    Dim sSql As String
    Dim vRep As Variant

    vRep = DLookup("[Objet_ID]", "T_Objets", "[Objet_ID]='" & thisObj.IDNet & "'")

    If (IsNull(vRep)) Then      '// Nouvel Objet.

        thisObj.Nouveau = True
        thisChild.Nouveau = True

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

End Function

'--------------------------------------------------------------
'// Pour la prop Caption des forms et des reports.
'--------------------------------------------------------------
Private Function MajTableObjetProp() As Boolean

    Dim sSql As String

    If (thisObj.Nouveau) Then   '// Nouvel Objet.
        sSql = "INSERT INTO T_ObjetChilds " & _
               "(Child_ID, ChildNom, ChildType, IDObjet, Scanner, Nouveau) " & _
               "VALUES ('" & thisObj.IDNet & "', '" & thisObj.NomNet & "', '" & thisObj.Type & "', '" & _
               thisObj.IDNet & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                '// Existe déjà.
        sSql = "UPDATE T_ObjetChilds SET T_ObjetChilds.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetChilds.Child_ID)='" & thisObj.IDNet & "'));"
    End If

    ExecuteQdfTemp sSql
    MajTableObjetProp = True

End Function

'--------------------------------------------------------------
'// Utiliser que pour les forms et les reports (MajTableChildPropTexte pour les contrôles).
'// On stock les valeurs même vide pour les forms et les reports.
'--------------------------------------------------------------
Private Function MajTableObjetTexte() As Boolean

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

        sSql = "INSERT INTO T_ObjetChildTextes " & _
               "(Prop_ID, PropNom, PropTexte, IDChild, DateMaJ, Scanner, Nouveau) " & _
               "VALUES ('" & thisTxt.ID & "', '" & PROP_CAP & "', '" & sTxt & "', '" & thisObj.IDNet & "', '" & _
               m_DateMaJ & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                    '// Déjà enregistrer.

        '// Voir si le texte à été modifié.
        vTmp = DLookup("[PropTexte]", "T_ObjetChildTextes", "[Prop_ID]='" & thisTxt.ID & "'")
        If (StrComp(thisObj.Caption, CStr(Nz(vTmp, vbNullString)), vbBinaryCompare) <> 0) Then bMod = True

        sSql = "UPDATE T_ObjetChildTextes " & _
               "SET PropTexte='" & sTxt & "', " & _
               "DateMaJ='" & m_DateMaJ & "', " & _
               "ModPropTexte=" & CInt(bMod) & "," & _
               "Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetChildTextes.Prop_ID)='" & thisTxt.ID & "'));"
    End If

    ExecuteQdfTemp sSql
    MajTableObjetTexte = True

End Function

'----------------------------------------------------------------
' Procedure Nom   : ScanObjChilds
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
Private Function ScanObjChilds(ByRef ObjControl As Access.Control) As Boolean
On Error GoTo ERR_ScanObjChilds

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

    '----------------------------------
    thisTxt.Caption = CheckTxtIgnore(ObjControl.Properties(PROP_CAP).value)     '// Filtrage texte Caption...
    '----------------------------------

    thisTxt.StatusBarText = LTrim$(ObjControl.Properties(PROP_BAR).value)
    thisTxt.ControlTipText = LTrim$(ObjControl.Properties(PROP_TIP).value)

    thisChild.IDNet = thisObj.IDNet & "!" & thisChild.NomNet

    eRep = Texte_A_Enregistrer()        '// Voir si on doit enregistrer le control...

    If (eRep = Faux) Then ScanObjChilds = True: Exit Function  '// Pas de texte à stocker, on sort.
    If (eRep = Erreur) Then Exit Function                       '// Erreur, on sort.

    '-------------------------
    mRep = MajTableChild        '// Stock le control...
    '-------------------------

    If (mRep) Then mRep = MajTableChildPropTexte(PROP_CAP, thisTxt.Caption)         '// Stock ses textes...
    If (mRep) Then mRep = MajTableChildPropTexte(PROP_TIP, thisTxt.ControlTipText)  '// ...
    If (mRep) Then mRep = MajTableChildPropTexte(PROP_BAR, thisTxt.StatusBarText)   '// ...

SORTIE_ScanObjChilds:
    ScanObjChilds = mRep
    Exit Function

ERR_ScanObjChilds:
    If (Err.Number = 2455) Then Resume Next     '// Propriété inexistante.
'    mRep = False
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : C_TradScanText.ScanObjChilds" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_ScanObjChilds
End Function

'--------------------------------------------------------------
'// Stock les enfants de l'objet en cours.
'--------------------------------------------------------------
Private Function MajTableChild() As Boolean

    Dim sSql As String
    Dim vTmp As Variant

    '// Si déjà scanner, voir si déjà enregistrer (nouv ctr ajouter dans l'objet).
    If (Not thisObj.Nouveau) Then
        vTmp = DLookup("[Child_ID]", "T_ObjetChilds", "[Child_ID]='" & thisChild.IDNet & "'")
        thisChild.Nouveau = IsNull(vTmp)
    End If

    If (thisChild.Nouveau) Then
        sSql = "INSERT INTO T_ObjetChilds " & _
               "(Child_ID, ChildNom, ChildType, IDObjet, ControlParentName, Scanner, Nouveau) " & _
               "VALUES ('" & thisChild.IDNet & "', '" & thisChild.NomNet & "', '" & thisChild.Type & "', '" & _
               thisObj.IDNet & "', '" & thisChild.Parent & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else
        sSql = "UPDATE T_ObjetChilds SET T_ObjetChilds.Scanner=" & CInt(True) & _
               " WHERE (((T_ObjetChilds.Child_ID)='" & thisChild.IDNet & "'));"
    End If      '// Nouvel objet on passe directement a Execute.

    ExecuteQdfTemp sSql
    MajTableChild = True

End Function

'----------------------------------------------------------------
' Procedure Nom   : MajTableChildPropTexte
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
Private Function MajTableChildPropTexte(PropNom As String, PropTexte As String) As Boolean

    Dim sSql    As String
    Dim sTest   As String
    Dim sTxt    As String
    Dim bMod    As Boolean      '// 1 modifier 0 non modifier.
    Dim eMod    As eReponse     '// Retour function.

    thisTxt.ID = thisChild.IDNet & "." & PropNom

    If Len(thisTxt.ID) > 100 Then   'TODO: Test nom trop long

        sTxt = "Nom trop long :" & thisObj.Type & "." & thisObj.NomNet & vbCrLf & PropNom & " - " & thisTxt.ID
        SauveTexte sTxt
        MajTableChildPropTexte = True
        Exit Function
    End If

    '// Vérifier si un/des apostrophe dans le texte...
    If (Len(PropTexte) > 2) Then
        sTest = CheckApostrophe(PropTexte)
        sTxt = IIf(sTest <> vbNullString, sTest, PropTexte)
    End If

    If thisChild.Nouveau Then       '// Nouveau control.

        '// Ignore la propriété si elle ne contient pas de texte à traduire.
        If (Len(PropTexte) < 3) Then MajTableChildPropTexte = True: Exit Function  '// Rien a faire, on sort.

        sSql = "INSERT INTO T_ObjetChildTextes " & _
               "(Prop_ID, PropNom, PropTexte, IDChild, DateMaJ, Scanner, Nouveau) " & _
               "VALUES ('" & thisTxt.ID & "', '" & PropNom & "', '" & sTxt & "', '" & thisChild.IDNet & "', '" & _
               m_DateMaJ & "', " & CInt(True) & ", " & CInt(True) & ");"

    Else                            '// Déjà enregistrer.

        eMod = TexteModifier(PropTexte)         '// Vérifier ce qu'il faut faire avec le texte...

        If (eMod = Erreur) Then Exit Function   '// Erreur, on sort.

        '// MàJ si retourne 0(pas de changement) ou 2(modifier), si (Inconnu) on passe.
        If (eMod <> Inconnu) Then

            bMod = IIf(eMod = Faux, False, True)
            sSql = "UPDATE T_ObjetChildTextes " & _
                   "SET PropTexte='" & sTxt & "', " & _
                   "DateMaJ='" & m_DateMaJ & "', " & _
                   "ModPropTexte=" & CInt(bMod) & ", " & _
                   "Scanner=" & CInt(True) & _
                   " WHERE (((T_ObjetChildTextes.Prop_ID)='" & thisTxt.ID & "'));"
        Else
           MajTableChildPropTexte = True
           Exit Function  '// Rien a faire, on sort.
        End If
    End If

    ExecuteQdfTemp sSql
    MajTableChildPropTexte = True
    
End Function
'
''--------------------------------------------------------------
''// Stock les champs txt de la table en cours.
''--------------------------------------------------------------
'Private Function MajTableFields() As Boolean
'On Error GoTo ERR_MajTableFields
'
'    Dim sSql As String
'    Dim vTmp As Variant
'
'    '// Si déjà scanner, voir si déjà enregistrer (nouv ctr ajouter dans l'objet).
'    If (Not thisObj.Nouveau) Then
'        vTmp = DLookup("[Child_ID]", "T_ObjetChilds", "[Child_ID]='" & thisFld.IDNet & "'")
'        thisFld.Nouveau = IsNull(vTmp)
'    End If
'
'    If (thisFld.Nouveau) Then
'        sSql = "INSERT INTO T_ObjetChilds " & _
'               "(Child_ID, ChildNom, ChildType, IDObjet, ControlParentName, Scanner, Nouveau) " & _
'               "VALUES ('" & thisFld.IDNet & "', '" & thisFld.NomNet & "', '" & thisFld.Type & "', '" & _
'               thisObj.IDNet & "', '" & vbNullString & "', " & CInt(True) & ", " & CInt(True) & ");"
'
'    Else
'        sSql = "UPDATE T_ObjetChilds SET T_ObjetChilds.Scanner=" & CInt(True) & _
'               " WHERE (((T_ObjetChilds.Child_ID)='" & thisFld.IDNet & "'));"
'    End If      '// Nouvel objet on passe directement a Execute.
'
'    ExecuteQdfTemp sSql
'    MajTableFields = True
'
'SORTIE_MajTableFields:
'    Exit Function
'
'ERR_MajTableFields:
'    mRep = False
'    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
'           "Erreur N°: " & Err.Number & vbCrLf & _
'           "Source : C_TradScanText.MajTableFields" & vbCrLf & _
'           "Description: " & Err.Description & _
'           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
'           vbOKOnly + vbCritical, "Erreur survenue !"
'    Resume SORTIE_MajTableFields
'End Function

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

    vTmp = DLookup("[PropTexte]", "T_ObjetChildTextes", "[Prop_ID]='" & thisTxt.ID & "'")
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
Private Function GetObjet(ObjetNom As String, ObjetType As E_ObjectType) As Object
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

Private Sub CloseObjet(ObjetNom As String, ObjetType As E_ObjectType, Optional Methode As AcCloseSave = acSaveNo)
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

'----------------------------------------------------------------
'// Créer la propriété PROP_GUID pour la base en cours.
'// l'insère dans la table T_App.
'// Retourne TRUE si ok.
'----------------------------------------------------------------
Private Function MaJAppID() As Boolean
    Dim sRes As String
    Dim sSql As String
    Dim vTmp As Long

    sRes = ObjetAcc.GetPropTxt(PROP_GUID)   '// Doit retourner "N/A"(non trouvée), sinon erreur.

    If (sRes <> PROP_NA) Then Exit Function '// Erreur contient autre chose que "N/A".

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

    '// Avec textes.
    sSql = "UPDATE T_Objets INNER JOIN (T_ObjetChilds INNER JOIN T_ObjetChildTextes " & _
           "ON T_ObjetChilds.Child_ID = T_ObjetChildTextes.IDChild) " & _
           "ON T_Objets.Objet_ID = T_ObjetChilds.IDObjet " & _
           "SET T_Objets.Scanner = 0, T_Objets.Nouveau = 0, T_ObjetChilds.Scanner = 0, T_ObjetChilds.Nouveau = 0, " & _
           "T_ObjetChildTextes.Scanner = 0, T_ObjetChildTextes.ModPropTexte = 0, T_ObjetChildTextes.Nouveau = 0 " & _
           "WHERE (((T_Objets.IDApp)='" & thisApp.ID & "'));"
    ExecuteQdfTemp sSql

    sSql = "UPDATE T_Objets INNER JOIN T_ObjetChilds ON T_Objets.Objet_ID = T_ObjetChilds.IDObjet " & _
           "SET T_Objets.Scanner = 0, T_Objets.Nouveau = 0, T_ObjetChilds.Scanner = 0, T_ObjetChilds.Nouveau = 0 " & _
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
'// Stock erreur / les textes ignorés par les filtres (caption dans ScanPropreties)
' ----------------------------------------------------------------
Private Sub MaJTableNonInclus()

    Dim sSql As String
    Dim vTmp As Variant
    Dim sTxt As String

    vTmp = DLookup("[IDApp]", "iT_NonInclus", "[IDApp]='" & thisApp.ID & "'")

    If (IsNull(vTmp) And (mNonEnrg = vbNullString)) Then Exit Sub   '// Rien a faire on sort.

    sTxt = MD_Utils.CheckApostrophe(mNonEnrg)

    If (IsNull(vTmp)) Then                      '// Ajoute les textes.

        sSql = "INSERT INTO iT_NonInclus (IDApp, Valeur) " & _
               "VALUES ('" & thisApp.ID & "', '" & sTxt & "');"
    Else

        If (mNonEnrg = vbNullString) Then       '// Plus de texte, efface les anciennes données.
            sSql = "DELETE iT_NonInclus.* FROM iT_NonInclus " & _
                   "WHERE (((iT_NonInclus.IDApp)='" & thisApp.ID & "'));"

        Else                                    '// MàJ du texte.

            sSql = "UPDATE iT_NonInclus SET iT_NonInclus.Valeur = '" & sTxt & "' " & _
                   "WHERE (((iT_NonInclus.IDApp)='" & thisApp.ID & "'));"
        End If
    End If

    ExecuteQdfTemp sSql

End Sub

' ----------------------------------------------------------------
'// TxtCheck texte à vérifier.
'// Stock dans la table iT_NonInclus tous les textes rejetés par les filtres.
'// Retourne Null string si ne passe pas les filtres, sinon retourne le texte d'origine.
' ----------------------------------------------------------------
Private Function CheckTxtIgnore(TxtCheck As String) As String
    Dim sCap    As String
    Dim sCapTmp As String

    sCapTmp = Trim$(TxtCheck)
    sCapTmp = IIf(Len(sCapTmp) < 2, vbNullString, sCapTmp)   '// Min 2 car.

    If (sCapTmp <> vbNullString) Then

        sCap = RegEx(REG_PAT, sCapTmp, True)            '// Applique la pattern Regex (voir Const REG_PAT)...

        If (sCap = vbNullString) Then                   '// Rejet Regex, on stock le texte ignoré.

            Dim sTxt As String
            If (mObjNomTmp <> thisObj.Nom) Then

                '// Entete si changement d'objet.
                sTxt = "Valeur filtrée : " & thisObj.Type & "." & thisObj.NomNet & vbCrLf
                mObjNomTmp = thisObj.Nom    '// Changement d'objet seulement ici.
           End If

            '// Cellules
            sTxt = sTxt & "---> " & thisChild.Type & "." & thisChild.NomNet & " - " & sCapTmp

            SauveTexte sTxt
        Else
            sCap = TxtCheck                             '// Passe les filtres retroune le texte d'origine.
        End If
    End If

    CheckTxtIgnore = sCap   '// Null ou le texte d'origine.

End Function

Private Sub SauveTexte(NouvTxt As String, Optional Fermer As Boolean = False)

    mNonEnrg = mNonEnrg & NouvTxt & vbCrLf

End Sub
'// ################################# END PRIV. SUB/FUNC #################################
