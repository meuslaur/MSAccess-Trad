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
    Private m_BdSelect  As DAO.Database     '// Utiliser pour la fonction PropExist
    Private mRep        As Boolean
    Private mMsg        As String

'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

' ------------------------------------------------------
'// Créer la prop 'PropNom'(Text), retourne TRUE si c'est fait.
' ------------------------------------------------------
Public Function CreatePropText(PropNom As String, PropVal As String, Optional ByRef BDSelect As DAO.Database, Optional errMsg As Boolean = True) As Boolean

    Dim oPrp As Property

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    mRep = PropExist(PropNom)   '// Voir si la prop existe...

    Select Case mRep
        Case False              '// Création.
            Set oPrp = m_BdSelect.CreateProperty(PropNom, dbText, PropVal)
            m_BdSelect.Properties.Append oPrp
            CreatePropText = True

        Case True
            If errMsg Then
                mMsg = "La propriété '" & PropNom & "' existe déjà."
                MsgBox mMsg, vbCritical, "CreatePropText"
            End If
    End Select

    Set m_BdSelect = Nothing

End Function

' ------------------------------------------------------
'// Supprime la prop, retourne TRUE si c'est fait.
' ------------------------------------------------------
Public Function DeleteProp(PropNom As String, Optional ByRef BDSelect As DAO.Database, Optional errMsg As Boolean = True) As Boolean

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    mRep = PropExist(PropNom)     '// Voir si la prop existe...

    Select Case mRep
        Case True
            m_BdSelect.Properties.Delete PropNom
            DeleteProp = True

        Case False
            If errMsg Then
                mMsg = "Propriété '" & PropNom & "' inconnue."
                MsgBox mMsg, vbCritical, "DeleteProp"
            End If
    End Select

    Set m_BdSelect = Nothing

End Function

' ------------------------------------------------------
'// Retoune la valeur de la prop 'PropNom'(text), nullstring si la prop n'existe pas,
' ------------------------------------------------------
Public Function GetTextProp(PropNom As String, Optional ByRef BDSelect As DAO.Database, Optional errMsg As Boolean = True) As String

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    mRep = PropExist(PropNom)     '// Test si la prop PropNom existe....

    Select Case mRep
        Case True
            GetTextProp = m_BdSelect.Properties(PropNom).Value

        Case False
            If errMsg Then
                mMsg = "Propriété '" & PropNom & "' inconnue."
                MsgBox mMsg, vbCritical, "GetTextProp"
            End If
            GetTextProp = PROP_NA
    End Select

    Set m_BdSelect = Nothing

End Function

' ------------------------------------------------------
'// Applique la valeur sur la prop 'PropNom'(text). Retourne TRUE si c'est fait.
' ------------------------------------------------------
Public Function SetTextProp(PropNom As String, NouvVal As String, Optional ByRef BDSelect As DAO.Database, Optional errMsg As Boolean = True) As Boolean

    Set m_BdSelect = IIf(BDSelect Is Nothing, CodeDb, BDSelect)

    mRep = PropExist(PropNom)     '// Retourne la valeur de la prop si elle existe....

    Select Case mRep
        Case True
            BDSelect.Properties(PropNom).Value = NouvVal
            SetTextProp = True

        Case False
            If errMsg Then
                mMsg = "Propriété '" & PropNom & "' inconnue."
                MsgBox mMsg, vbCritical, "SetTextProp"
            End If
    End Select

    Set m_BdSelect = Nothing

End Function

'----------------------------------------------------------------
' Procedure Nom   : ExportProps
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
Public Function ExportProps(ExportFolder As String, Optional BDSelect As DAO.Database, _
                                Optional OnlyPropUser As Boolean = False) As Boolean
On Error GoTo ERR_ExportProps

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

    ExportProps = True

SORTIE_ExportProps:
    Set TxtFile = Nothing
    Set oFSO = Nothing
    Set obd = Nothing
    Exit Function

ERR_ExportProps:
    If (Err.Number = 3251) Then Resume Next     'Opération non autorisée pour ce type d'objet.
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  MD_DBProp.ExportProps, ligne " & Erl & "."
    Resume SORTIE_ExportProps
End Function
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################

' ------------------------------------------------------
'// Test si la propriété 'PropNom' existe, retourne 'Exist' si oui, 'Inconnu' si non.
' ------------------------------------------------------
Private Function PropExist(PropNom As String) As Boolean
On Error GoTo ERR_PropExist

    If (Len(PropNom) = 0) Then Exit Function

    Dim sTmp As String
    sTmp = m_BdSelect.Properties(PropNom).name
    PropExist = True

SORTIE_PropExist:
    Exit Function

ERR_PropExist:
    '// Err 3270 propriété non trouvée.
    If (Err.Number = 3270) Then Resume SORTIE_PropExist
    MsgBox Err.Number & vbCrLf & Err.Description
End Function
'// ################################# END PRIV. SUB/FUNC #################################
