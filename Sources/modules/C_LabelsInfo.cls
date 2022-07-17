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
' DateMod  : 10/07/2022 - 15:07
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private Const LARG_CAR As Long = 182    '// Largeur 1 Caractèrre, Police Webdings size 8, 'TODO: Tester dans d'autre rédolutions

    Private m_LblTexte  As Access.Label     '// Label texte d'info.
    Private m_LblBarre  As Access.Label     '// Label barre.

    Private m_lNbBarre  As Long             '// Dimension label barre.
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
Public Property Get LongueurBarre() As Long
    BarreLongueur = m_lNbBarre
End Property
Public Property Let LabelTexte(LabelInfo As Access.Label)
     Set m_LblTexte = LabelInfo
End Property
Public Property Let LabelBarre(LabelBarre As Access.Label)
    Set m_LblBarre = LabelBarre
End Property
'//====================================== END PROP =======================================

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Public Sub InitialiseBarre(LongueurBarre As Long)

    If (LongueurBarre = 0) Then Exit Sub
    If (m_LblTexte Is Nothing) Or (m_LblBarre Is Nothing) Then Exit Sub

    m_lNbBarre = LongueurBarre
    m_LblBarre.Width = LARG_CAR * m_lNbBarre    '// Détermine la dimension de la barre.
    m_lCompte = 1
End Sub

'----------------------------------------------------------------
' Procedure Nom   : AfficheBarre
' ----------------------------------------------------------------
' Sujet           : Affiche de texte de de l'avancement du scan dans le form F_TradTxt
' Procedure Kind  : Sub
' Procedure Access: Public
' Objectif        :
' Requi           : F_TradTxt
'
'=== Paramètres ===
' sObjNom (String)  : Texte à afficher.
' NbObjets (Long)   : Nombre total d'objets à scanner, pour la barre d'avancement.
'==================
'
' Author  : Laurent
' Date    : 03/07/2022 - 17:50
' DateMod :
' ----------------------------------------------------------------
Public Sub UpdateBarre(NewTexte As String)
On Error GoTo ERR_testBarre

    If (m_LblTexte Is Nothing) Then Exit Sub

    m_LblTexte.Caption = NewTexte & "....."
    
    If (m_LblBarre Is Nothing) Then Exit Sub

    m_LblBarre.Caption = String(m_lCompte, "a")
    m_lCompte = m_lCompte + 1

SORTIE_testBarre:
    Exit Sub

ERR_testBarre:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TradAccess.MD_Test.testBarre, ligne " & Erl & "."
    Resume SORTIE_testBarre
End Sub


'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################
'// ################################# END PRIV. SUB/FUNC #################################

