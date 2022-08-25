Attribute VB_Name = "MD_TradLinkTbl"
'@FOLDER("Dev")
Option Compare Database
Option Explicit

    Private mBD      As DAO.Database
    Private moFrm    As Access.Form
    Private mFrmOpen As Boolean

Public Function AfficheTable(BaseNom As String, TableNom As String) As eReponse
    Dim eRep As eReponse

    DoCmd.Hourglass True

    If (mBD Is Nothing) Then Set mBD = CodeDb()

    eRep = LinkTableMsAccess(BaseNom, TableNom)             '// ...

    If (eRep = Valide) Then AfficheTable = CreerTable()     '// ...

    DoCmd.Hourglass False

End Function

Public Sub CleanAfficheTable()
    If (Not mBD Is Nothing) Then Set mBD = Nothing
End Sub

'---------------------------------------------------------------------
'// Création linen vers la table TableNom.
'---------------------------------------------------------------------
Private Function CreerTable() As eReponse
    Dim oTdf    As DAO.TableDef
    Dim oFld    As DAO.Field
    Dim sSql    As String   '// Source du formulaire FRM_LINK.
    Dim sFld    As String   '// Extraction des champs texte et mémo de la table TableNom.

    Set oTdf = mBD.TableDefs(TBL_LINK)

    '// Détermine les champs à créer dans a_tmp et les champs a sélectionnée dans la table source.
    For Each oFld In oTdf.Fields
        Select Case oFld.Type
            Case dbMemo
                sFld = sFld & TBL_LINK & ".[" & oFld.Name & "], "
            Case dbText
                sFld = sFld & TBL_LINK & ".[" & oFld.Name & "], "
        End Select
    Next

    If (Len(sFld) = 0) Then CreerTable = Inconnu: Exit Function     '// Pas de champs texte ou memo, on sort.

    sFld = left$(sFld, Len(sFld) - 2)
    sSql = "SELECT " & sFld & " FROM " & TBL_LINK & ";"

    CreerTable = MajForm(sSql)      '// Création des controls dans le form FRM_LINK ...

End Function

'---------------------------------------------------------------------
'// Parcour les champs de la table pour création des controls.
'---------------------------------------------------------------------
Private Function MajForm(sqlSrc As String) As eReponse
On Error GoTo ERR_MajForm

    Dim oRst As DAO.Recordset
    Dim oFld As DAO.Field
    Dim lCtr As Long

    Set oRst = mBD.OpenRecordset(sqlSrc, dbOpenDynaset)

'    If (oRst.RecordCount > 0) Then
'        oRst.MoveLast
'        If (oRst.RecordCount < 300) Then        'TODO: AVOIR  MajForm limité le nombre d'enregistrements ?
'    End If

    If (oRst.RecordCount = 0) Then
        oRst.Close
        Set oRst = Nothing
        MajForm = Inconnu
        Exit Function           '// pas d'enregistrements ou pas de champs text/memo.
    End If

    '// Parcours les champs et créer le control.
    For Each oFld In oRst.Fields
        CreerControl oFld.Name, lCtr    '// ...
        lCtr = lCtr + 1
    Next

    moFrm.RecordSource = sqlSrc
    DoCmd.Close acForm, FRM_LINK, acSaveYes

    oRst.Close
    MajForm = Valide

SORTIE_MajForm:
    mFrmOpen = False
    Set oRst = Nothing
    Set moFrm = Nothing
    Exit Function

ERR_MajForm:
    MajForm = Erreur
    If mFrmOpen Then DoCmd.Close acForm, FRM_LINK, acSaveNo
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : a_Module1.MajForm" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_MajForm
End Function

'---------------------------------------------------------------------
'// Création du control section détail pour le champ indiquer.
'---------------------------------------------------------------------
Private Sub CreerControl(ctrNom As String, CtrItem As Long)

    Dim oCtr As Access.Control

    Dim lLeft       As Long
    Const C_TOP     As Long = 0
    Const C_WIDTH   As Long = 200 '2265
    Const C_HEIGHT  As Long = 300
    Dim lCtr        As Long

    If (moFrm Is Nothing) Then

        DoCmd.OpenForm FRM_LINK, acDesign, , , , acHidden
        Set moFrm = Forms(FRM_LINK)
        mFrmOpen = True

        '// Supprime les anciens control section détail.
        For lCtr = 0 To moFrm.Section(0).Controls.count - 1
            Set oCtr = moFrm.Section(0).Controls(0)
            DeleteControl FRM_LINK, oCtr.Name
        Next
    End If

    '// Détermine la prochaine position du control.
    If (CtrItem > 0) Then
        lCtr = moFrm.Section(0).Controls.count - 1
        Set oCtr = moFrm.Section(0).Controls(lCtr)
        lLeft = oCtr.left + C_WIDTH + 3
    End If

    '// Création du control, defini ses paramètres.
    Set oCtr = CreateControl(FRM_LINK, acTextBox, acDetail, , ctrNom, lLeft, C_TOP, C_WIDTH, C_HEIGHT)
    oCtr.Name = ctrNom
    oCtr.ControlSource = ctrNom

    Set oCtr = Nothing

End Sub

Private Function LinkTableMsAccess(FullPathBaseName As String, SourceTableName As String, Optional TableName As String = TBL_LINK) As eReponse
On Error GoTo ERR_LinkTableMsAccess

    Dim oTdf     As DAO.TableDef
    Dim sConnect As String
    Dim sNom     As String
    Dim eRep     As eReponse

    sNom = IIf(TableName = vbNullString, SourceTableName, TableName)
    sConnect = "MS Access;PWD="";DATABASE=" & FullPathBaseName

    With mBD

        .TableDefs.Refresh

        eRep = RemoveTableLinked(sNom)      '// ...
        If (eRep = Erreur) Then Exit Function

        Set oTdf = .CreateTableDef(sNom)
        oTdf.Connect = sConnect
        oTdf.SourceTableName = SourceTableName
        .TableDefs.Append oTdf
        .TableDefs.Refresh

    End With

    LinkTableMsAccess = Valide
    
SORTIE_LinkTableMsAccess:
    Exit Function

ERR_LinkTableMsAccess:
    LinkTableMsAccess = Erreur
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : a_Module1.LinkTableMsAccess" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_LinkTableMsAccess
End Function

Private Function RemoveTableLinked(TableName As String) As eReponse
On Error GoTo ERR_RemoveTableLinked

    With mBD

        .TableDefs.Refresh
        If (.TableDefs(TableName).Connect <> vbNullString) Then
            .TableDefs.Delete TableName
            RemoveTableLinked = Valide
        End If
        .TableDefs.Refresh

    End With
    
SORTIE_RemoveTableLinked:
    Exit Function

ERR_RemoveTableLinked:
    If (Err.Number = 3265 Or Err.Number = 3011) Then Resume Next    '// Table n'existe pas (Retourne TRUE). 'TODO: ERR msg RemoveTableLinked table non trouver.
    RemoveTableLinked = Erreur
    MsgBox "L’erreur suivante s’est produite" & vbCrLf & vbCrLf & _
           "Erreur N°: " & Err.Number & vbCrLf & _
           "Source : a_Module1.RemoveTableLinked" & vbCrLf & _
           "Description: " & Err.Description & _
           Switch(Erl = 0, vbNullString, Erl <> 0, vbCrLf & "Line No: " & Erl), _
           vbOKOnly + vbCritical, "Erreur survenue !"
    Resume SORTIE_RemoveTableLinked
End Function
