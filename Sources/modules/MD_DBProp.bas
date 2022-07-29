Attribute VB_Name = "MD_DBProp"
'@Folder("Outils")
' ------------------------------------------------------
' Name     : MD_DBProp
' ------------------------------------------------------
' Kind     : Module
' Purpose  : Outils pour la manipulations des propriétés d'une base.
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 24/07/2022 - 12:30
' DateMod  : 25/07/2022 - 17:04
' Requi    : module MD_FSO, MD_Utils
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Public Const PROP_NA As String = "N/A"  '// Indique prop non trouvée.

    Private m_BdSelect   As DAO.Database     '// Utiliser pour la fonction DBPropTextExist
    Private m_bRep       As Boolean
    Private m_sMsg       As String

'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

' ------------------------------------------------------
'// Créer la prop 'PropNom'(Text), retourne TRUE si c'est fait.
' ------------------------------------------------------
Public Function DBPropTextCreate(PropNom As String, PropVal As String, ByRef BDSelect As DAO.Database) As Boolean

    Dim oPrp As Property

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    m_bRep = DBPropTextExist(PropNom)   '// Voir si la prop existe...

    Select Case m_bRep
        Case False              '// Création.
            Set oPrp = m_BdSelect.CreateProperty(PropNom, dbText, PropVal)
            m_BdSelect.Properties.Append oPrp
            DBPropTextCreate = True

        Case True
            m_sMsg = "La propriété '" & PropNom & "' existe déjà."
            MsgBox m_sMsg, vbCritical, "DBPropTextCreate"
    End Select

    Set m_BdSelect = Nothing

End Function

' ------------------------------------------------------
'// Supprime la prop, retourne TRUE si c'est fait.
' ------------------------------------------------------
Public Function DBPropTextDelete(PropNom As String, ByRef BDSelect As DAO.Database) As Boolean

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    m_bRep = DBPropTextExist(PropNom)     '// Voir si la prop existe...

    Select Case m_bRep
        Case True
            m_BdSelect.Properties.Delete PropNom
            DBPropTextDelete = True

        Case False
            m_sMsg = "La propriété '" & PropNom & "' inconnue."
            MsgBox m_sMsg, vbCritical, "DBPropTextCreate"
    End Select

    Set m_BdSelect = Nothing

End Function

' ------------------------------------------------------
'// Retoune la valeur de la prop 'PropNom'(text), nullstring si la prop n'existe pas,
' ------------------------------------------------------
Public Function DBPropTextGet(PropNom As String, ByRef BDSelect As DAO.Database, Optional errMsg As Boolean = True) As String

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    m_bRep = DBPropTextExist(PropNom)     '// Retourne la valeur de la prop si elle existe....

    Select Case m_bRep
        Case True
            DBPropTextGet = m_BdSelect.Properties(PropNom).Value

        Case False
            If errMsg Then
                m_sMsg = "Propriété '" & PropNom & "' inconnue."
                MsgBox m_sMsg, vbCritical, "DBPropTextSet"
            End If
            DBPropTextGet = PROP_NA
    End Select

    Set m_BdSelect = Nothing

End Function

' ------------------------------------------------------
'// Applique la valeur sur la prop 'PropNom'(text). Retourne TRUE si c'est fait.
' ------------------------------------------------------
Public Function DBPropTextSet(PropNom As String, NouvVal As String, ByRef BDSelect As DAO.Database, Optional errMsg As Boolean = True) As Boolean

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    m_bRep = DBPropTextExist(PropNom)     '// Retourne la valeur de la prop si elle existe....

    Select Case m_bRep
        Case True
            BDSelect.Properties(PropNom).Value = NouvVal
            DBPropTextSet = True

        Case False
            If errMsg Then
                m_sMsg = "Propriété '" & PropNom & "' inconnue."
                MsgBox m_sMsg, vbCritical, "DBPropTextSet"
            End If
    End Select

    Set m_BdSelect = Nothing

End Function

'----------------------------------------------------------------
' Procedure Nom   : DBPropsExport
' ----------------------------------------------------------------
' Sujet           : Enregistre les propriétés de la base dans un fichier .cvs
' Procedure Kind  : Function
' Procedure Access: Public
' Objectif        :
' Requi           : module MD_FSO
'
'=== Paramètres ===
' ExportFolder (String) : Dossier d'export (i.e 'test').
' BDSelect (Database)   : Base à utiliser.
' OnlyPropUser (Boolean): Export que les prop 'UserDefined' ?
'==================
'
' Return Boolean : True si pas de problème.
'
' Author  : Laurent
' Date    : 24/07/2022 - 11:56
' DateMod :
' ----------------------------------------------------------------
Public Function DBPropsExport(ExportFolder As String, BDSelect As DAO.Database, _
                                Optional OnlyPropUser As Boolean = False) As Boolean
On Error GoTo ERR_DBPropsExport

    If (Len(ExportFolder) = 0) Then Exit Function

    Dim obd         As DAO.Database
    Dim oFSO        As Object

    Dim TxtFile     As Variant  '// FSO TextFile.
    Dim Prop        As Variant
    Dim iProp       As Long
    Dim sPath       As String   '// Dossier courant app.
    Dim sExpPath    As String   '// Dossier d'exportation.
    Dim sFile       As String

    sExpPath = IIf(Right$(ExportFolder, 1) = "\", ExportFolder, ExportFolder & "\")
    sExpPath = IIf(Left$(ExportFolder, 1) = "\", sExpPath, "\" & sExpPath)

    sPath = CurrentProject.Path
    sExpPath = sPath & sExpPath

    If (MD_FSO.FSOFolderExist(sExpPath, NonTrouver) = False) Then Exit Function

    sFile = sExpPath & "Properties.cvs"

    Set oFSO = MD_FSO.GetFSO
    Set obd = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    Set TxtFile = oFSO.CreateTextFile(sFile, True)
    TxtFile.WriteLine Join(Array("Index", "Nom", "Valeur"), vbTab)

    If (OnlyPropUser = False) Then
        For iProp = 0 To obd.Properties.Count - 1
            Set Prop = obd.Properties(iProp)
            TxtFile.WriteLine Join(Array(iProp, Prop.name, Prop.Value), vbTab)
        Next
    End If

    For Each Prop In obd.Containers("Databases").Documents("UserDefined").Properties
        TxtFile.WriteLine Join(Array(iProp, Prop.name, Prop.Value), vbTab)        '// commence Item 8
    Next

    TxtFile.Close
    obd.Close

    DBPropsExport = True

SORTIE_DBPropsExport:
    Set TxtFile = Nothing
    Set oFSO = Nothing
    Set obd = Nothing
    Exit Function

ERR_DBPropsExport:
    If (Err.Number = 3251) Then Resume Next     'Opération non autorisée pour ce type d'objet.
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Test.DBPropsExport, ligne " & Erl & "."
    Resume SORTIE_DBPropsExport
End Function
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################

' ------------------------------------------------------
'// Test si la propriété 'PropNom' existe, retourne 'Exist' si oui, 'Inconnu' si non.
' ------------------------------------------------------
Private Function DBPropTextExist(PropNom As String) As Boolean
On Error GoTo ERR_ExistDBProp
    Dim sTmp As String
    If (Len(PropNom) = 0) Then Exit Function

    sTmp = m_BdSelect.Properties(PropNom).name
    DBPropTextExist = True

SORTIE_ExistDBProp:
    Exit Function

ERR_ExistDBProp:
    '// Err 3270 propriété non trouvée.
    If (Err.Number = 3270) Then Resume SORTIE_ExistDBProp
    MsgBox Err.Number & vbCrLf & Err.Description
End Function
'// ################################# END PRIV. SUB/FUNC #################################
