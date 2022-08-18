VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "C_LabelsInfoItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'@Folder("Dev")
' ------------------------------------------------------
' Name     : C_LabelsInfoItem
' ------------------------------------------------------
' Kind     : Module de classe
' Purpose  :
' Author   : Laurent
' Sujet    : https://github.com/meuslaur/MsAccess-ProgressBarre
' Objectif :
' Date     : 18/08/2022 - 06:39
' DateMod  :
' Requi    : C_LabelInfo
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private Type T_Label
        objLabel    As Access.Label
        LabelIsUp   As Boolean
        LabelCompt  As Long
        LabelChar   As String * 1
        LabelNbChar As Long
    End Type
    Private thisLabel As T_Label
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//----------------------------------       INIT/TERM       ------------------------------
Private Sub Class_Terminate()
    Set thisLabel.objLabel = Nothing
End Sub
'//---------------------------------------------------------------------------------------

'//==================================       PROP        ==================================
Public Property Get LabelObj() As Access.Label
    Set LabelObj = thisLabel.objLabel
End Property
Public Property Set LabelObj(ByVal NewLabel As Access.Label)
    Set thisLabel.objLabel = NewLabel
End Property

Public Property Get LabelIsUp() As Boolean
    LabelIsUp = thisLabel.LabelIsUp
End Property
Public Property Let LabelIsUp(ByVal IsUp As Boolean)
    thisLabel.LabelIsUp = IsUp
End Property

Public Property Get Compteur() As Long
    Compteur = thisLabel.LabelCompt
End Property
Public Property Let Compteur(ByVal NewVal As Long)
    thisLabel.LabelCompt = NewVal
End Property

Public Property Get Caractere() As String
    Caractere = thisLabel.LabelChar
End Property
Public Property Let Caractere(ByVal NewChar As String)
    If (Len(NewChar) <> 1) Then Exit Property   'TODO: ERR ->Gestionnaire d'erreur / msg.
    thisLabel.LabelChar = NewChar
End Property

Public Property Get NbChar() As Long
    NbChar = thisLabel.LabelNbChar
End Property
Public Property Let NbChar(ByVal NewNbChar As Long)
    If (NewNbChar < 1) Then Exit Property       'TODO: ERR ->Gestionnaire d'erreur / msg.
    thisLabel.LabelNbChar = NewNbChar
End Property
'//====================================== END PROP =======================================

