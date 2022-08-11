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
' Sujet    :
' Objectif :
' Date     : 03/07/2022 - 18:01
' DateMod  : 11/08/2022 - 15:25
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

    Private m_LblTexte  As Access.Label     '// Label texte d'info.
    Private m_LblBarre  As Access.Label     '// Label barre.

    Private m_BarreUp   As Boolean          '// Indique si on utilise le label barre.
    Private m_TexteUp   As Boolean          '// Indique si on utilise le label Texte.

    Private m_CharBar   As String * 1       '// Caractère à afficher dans la barre.
    Private m_NbChar    As Long             '// Nb de caractère total a afficher.

    Private m_lCompte   As Long             '// Compteur pour la barre d'avancement.
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
'Private Sub Class_Initialize()
'
'End Sub

Private Sub Class_Terminate()
    Set m_LblTexte = Nothing
    Set m_LblBarre = Nothing
End Sub

'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get BarreIsUp() As Boolean
    BarreIsUp = m_BarreUp
End Property
'Public Property Let BarreIsUp(ActiveBarre As Boolean)
'    m_BarreUp = ActiveBarre
'End Property
Public Property Get TexteIsUp() As Boolean
    TexteIsUp = m_TexteUp
End Property
'Public Property Let TexteIsUp(ActiveTexte As Boolean)
'    m_TexteUp = ActiveTexte
'End Property
'//====================================== END PROP =======================================

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'----------------------------------------------------------------
'// Initialise les label (pour le texte et pour la barre d'avancement)
'----------------------------------------------------------------
Public Sub InitialiseLabels(LabelBarre As Access.Label, LabelTexte As Access.Label)

    If (Not LabelBarre Is Nothing) Then Set m_LblBarre = LabelBarre: m_BarreUp = True
    If (Not LabelTexte Is Nothing) Then Set m_LblTexte = LabelTexte: m_TexteUp = True

    If (m_LblTexte Is Nothing) And (m_LblBarre Is Nothing) Then Exit Sub

    m_lCompte = 1

End Sub

'----------------------------------------------------------------
'// CharBarre 1 caractère, NbChar nombre total de car à affiche.
'//     SetLengthBarre "a",25
'----------------------------------------------------------------
Public Sub SetLengthBarre(CharBarre As String, nbChar As Long)

    If (nbChar < 1) Then Exit Sub

    m_CharBar = Left$(CharBarre, 1)

    '// Détermine la taille de la barre...
    m_NbChar = nbChar
    CalculCoul
    InitialiseTailleBarre nbChar

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

    If (TexteIsUp) Then
        m_LblTexte.Caption = NewTexte & "..."
    End If

    If (Not BarreIsUp) Then Exit Sub

    m_LblBarre.Caption = String(m_lCompte, m_CharBar)

    If (m_lCompte > MAX_LENG) Then          '// Trop long, on redim la barre avec le reste à faire...
        m_NbChar = (m_NbChar - m_lCompte)
        InitialiseTailleBarre (m_NbChar)
        m_lCompte = 0
        CalculCoul
    End If
    m_lCompte = m_lCompte + 1

SORTIE_UpdateBarre:
    Exit Sub

ERR_UpdateBarre:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")", vbCritical, _
            "C_LabelsInfo.UpdateBarre"
    Resume SORTIE_UpdateBarre
End Sub

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################

'----------------------------------------------------------------
' Sujet   : Détermine la taille de la brre d'vancement
' Author  : Laurent
' Date    : 09/08/2022 - 17:31
' DateMod :
' ----------------------------------------------------------------
Private Sub InitialiseTailleBarre(NbCharBar As Long)
    
    Dim lWidth  As Long
    Dim lHeight As Long
    Dim sTexte  As String
    Dim lMax    As Long

    lMax = IIf(NbCharBar > MAX_LENG, MAX_LENG, NbCharBar)   '// Limite à MAX_LENG caractères.

    sTexte = String(lMax, m_CharBar)

    WizHook.Key = 51488399
    WizHook.TwipsFromFont m_LblBarre.FontName, m_LblBarre.FontSize, m_LblBarre.FontWeight, _
                          m_LblBarre.FontItalic, m_LblBarre.FontUnderline, 0, _
                          sTexte, 0, lWidth, lHeight

    m_LblBarre.Width = lWidth + 50  '// + 50 pour la marge droite
    m_LblBarre.Height = lHeight

End Sub

Private Sub CalculCoul()

    Dim lCoul As T_Coul

    Select Case m_NbChar
        Case Is > (MAX_LENG * 2)
            lCoul = CoulA
        Case Is > (MAX_LENG)
            lCoul = CoulB
        Case Is <= MAX_LENG
            lCoul = CoulC
    End Select
    m_LblBarre.BorderColor = lCoul
    m_LblBarre.Caption = m_CharBar
    m_LblBarre.ForeColor = lCoul
End Sub
'// ################################# END PRIV. SUB/FUNC #################################

