VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "A_CTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'@IgnoreModule
'@Folder("Test")
' ------------------------------------------------------
' Name     : ACTest
' ------------------------------------------------------
' Kind     : Module de classe
' Purpose  : Classe de test
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 10/07/2022 - 15:09
' DateMod  :
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
Private colTemps As Collection

Private Type T_Test
    Code As String
    Debut As Currency
    fin As Currency
End Type

Private Test As T_Test

Public Property Get Code() As String
    Code = Test.Code
End Property
Public Property Let Code(ByVal CodeNom As String)
    Test.Code = CodeNom
End Property

Public Property Get Debut() As Currency
    Debut = Test.Debut
End Property
Public Property Let Debut(ByVal DebutTest As Currency)
    Test.Debut = DebutTest
End Property

Public Property Get fin() As Currency
    fin = Test.fin
End Property
Public Property Let fin(ByVal FinTest As Currency)
    Test.fin = FinTest
End Property

Public Sub LanceTest(Code As String)
'    colTemps.Add Item:=Test, Key:=1
End Sub
'//====================================== END PROP =======================================

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'// ################################ PRIVATE SUB/FUNC ####################################
'// ################################# END PRIV. SUB/FUNC #################################

