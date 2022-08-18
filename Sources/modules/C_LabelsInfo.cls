VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "C_LabelsInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'@Folder("Dev")
' ------------------------------------------------------
' Name     : C_TradUtils
' ------------------------------------------------------
' Kind     : Module de classe
' Purpose  : Outils pour l'app TradAccess
' Author   : Laurent
' Sujet    : https://github.com/meuslaur/MsAccess-ProgressBarre
' Objectif :
' Date     : 03/07/2022 - 18:01
' DateMod  : 17/08/2022 - 13:43
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private Const MAX_LENG As Long = 50     '// Nb Max d'itérations, reprend à 0 si atteint.

    Private Enum T_Coul
        CoulA = 8630772     '// Début (Orange)
        CoulB = 6740479     '// Milieu (Bleu)
        CoulC = 9359785     '// Fin (Vert)
    End Enum

    Private colLabels   As Collection
    Private mLblBar     As C_LabelsInfoItem
    Private mLblTxt     As C_LabelsInfoItem

    Public Enum eNumLabel
        LabelNum1 = 1
        LabelNum2 = 2
    End Enum
    Private mCurLabel As eNumLabel
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Initialize()
    Set colLabels = New Collection
End Sub
Private Sub Class_Terminate()
    Set colLabels = Nothing
End Sub
'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get BarreIsUp(NumBar As eNumLabel) As Boolean

    If (mCurLabel = NumBar) Then BarreIsUp = mLblBar.LabelIsUp: Exit Property
    
    Dim cItem   As C_LabelsInfoItem
    Set cItem = colLabels("B" & CStr(NumBar))
    BarreIsUp = cItem.LabelIsUp
    Set cItem = Nothing

End Property
Public Property Get TexteIsUp(NumBar As eNumLabel) As Boolean

    If (mCurLabel = NumBar) Then TexteIsUp = mLblTxt.LabelIsUp: Exit Property

    Dim cItem   As C_LabelsInfoItem
    Set cItem = colLabels("T" & CStr(NumBar))
    TexteIsUp = cItem.LabelIsUp
    Set cItem = Nothing

End Property
'//====================================== END PROP =======================================

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'----------------------------------------------------------------
'// Initialise les label (pour le texte et pour la barre d'avancement)
'----------------------------------------------------------------
Public Sub InitialiseLabels(LabelBarre As Access.Label, LabelTexte As Access.Label, _
                            Optional LabelBarre2 As Access.Label, _
                            Optional LabelTexte2 As Access.Label)

    AddLabel "B1", LabelBarre
    AddLabel "T1", LabelTexte
    AddLabel "B2", LabelBarre2
    AddLabel "T2", LabelTexte2

End Sub

'----------------------------------------------------------------
'// CharBarre 1 caractère, NbChar nombre total de car à affiche.
'//     SetLengthBarre "a",25
'----------------------------------------------------------------
Public Sub SetLengthBarre(CharBarre As String, NbChar As Long, Optional NumLabel As eNumLabel = LabelNum1)

    If (NbChar < 1) Then Exit Sub                       'TODO: ERR ->Gestionnaire d'erreur / msg.
    If (Len(CharBarre) <> 1) Then Exit Sub              'TODO: ERR ->Gestionnaire d'erreur / msg.

    Set mLblBar = colLabels("B" & CStr(NumLabel))
    Set mLblTxt = colLabels("T" & CStr(NumLabel))

    mCurLabel = NumLabel

    If (mLblBar.LabelIsUp) Then mLblBar.LabelObj.Visible = True
    If (mLblTxt.LabelIsUp) Then mLblTxt.LabelObj.Visible = True

    If (Not mLblBar.LabelIsUp) Then Exit Sub

    mLblBar.NbChar = NbChar
    mLblBar.Caractere = CharBarre

    '// Détermine la taille de la barre...
    InitialiseTailleBarre
    CalculCoul NbChar

End Sub

'----------------------------------------------------------------
' Sujet : Affiche de texte et de l'avancement
'
'=== Paramètres ===
' NewTexte (String)  : Texte à afficher.
'==================
'
' Author  : Laurent
' Date    : 03/07/2022 - 17:50
' DateMod : 09/08/2022 - 17:26
' ----------------------------------------------------------------
Public Sub UpdateBarre(NewTexte As String)
On Error GoTo ERR_UpdateBarre

    If ((mLblTxt Is Nothing) And (mLblBar Is Nothing)) Then Exit Sub    'TODO: ERR ->Gestionnaire d'erreur / msg.

    If (mLblTxt.LabelIsUp) Then
        mLblTxt.LabelObj.Caption = NewTexte & "..."
    End If

    If (Not mLblBar.LabelIsUp) Then Exit Sub

    mLblBar.LabelObj.Caption = String(mLblBar.Compteur, mLblBar.Caractere)

    If (mLblBar.Compteur > MAX_LENG) Then           '// Trop long, on redim la barre avec le reste à faire...
        mLblBar.NbChar = (mLblBar.NbChar - mLblBar.Compteur)
        InitialiseTailleBarre
        mLblBar.Compteur = 0
        CalculCoul mLblBar.NbChar
    End If
    mLblBar.Compteur = mLblBar.Compteur + 1

SORTIE_UpdateBarre:
    Exit Sub

ERR_UpdateBarre:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "C_LabelsInfo.UpdateBarre"
    Resume SORTIE_UpdateBarre
End Sub

Public Sub ReturnFirstBarre()
    HiddenCurrentLabels
    Set mLblBar = colLabels("B1")
    Set mLblTxt = colLabels("T1")
End Sub

Public Sub HiddenCurrentLabels()
    If (mLblBar.LabelIsUp) Then mLblBar.LabelObj.Visible = False
    If (mLblTxt.LabelIsUp) Then mLblTxt.LabelObj.Visible = False
End Sub
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################
'----------------------------------------------------------------
' Sujet   : Détermine la taille de la brre d'vancement
' Author  : Laurent
' Date    : 09/08/2022 - 17:31
' DateMod :
' ----------------------------------------------------------------
Private Sub InitialiseTailleBarre()

    Dim lWidth  As Long
    Dim lHeight As Long
    Dim sTexte  As String
    Dim lMax    As Long

    lMax = IIf(mLblBar.NbChar > MAX_LENG, MAX_LENG, mLblBar.NbChar)   '// Limite à MAX_LENG caractères.

    sTexte = String(lMax, mLblBar.Caractere)

    With mLblBar.LabelObj
        WizHook.Key = 51488399
        WizHook.TwipsFromFont .FontName, .FontSize, .FontWeight, _
                              .FontItalic, .FontUnderline, 0, _
                              sTexte, 0, lWidth, lHeight
        .Width = lWidth + 60  '// + 60 pour la marge droite
        .Height = lHeight
        .Caption = vbNullString
    End With

End Sub

Private Sub CalculCoul(CurNbChar As Long)

    Dim lCoul As T_Coul

    Select Case CurNbChar
        Case Is > (MAX_LENG * 2)
            lCoul = CoulA
        Case Is > (MAX_LENG)
            lCoul = CoulB
        Case Is <= MAX_LENG
            lCoul = CoulC
    End Select

    mLblBar.LabelObj.BorderColor = lCoul
    mLblBar.LabelObj.ForeColor = lCoul

End Sub

Private Sub AddLabel(CleCol As String, LabelItem As Access.Label)

    Dim LblItem As C_LabelsInfoItem
    Set LblItem = New C_LabelsInfoItem

    With LblItem
        Set .LabelObj = LabelItem
        .LabelIsUp = IIf(LabelItem Is Nothing, False, True)
        .Compteur = 1
    End With

    colLabels.Add LblItem, CleCol
    Set LblItem = Nothing

End Sub
'// ################################# END PRIV. SUB/FUNC #################################
