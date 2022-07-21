Attribute VB_Name = "A_Test"
'@IgnoreModule
'@Folder("Test")
Option Compare Database
Option Explicit

'Private temps As Collection
'
'Private Type tempst
'    Debut As Currency
'    fin As Currency
'    temp As Currency
'End Type
'Dim tbltemps() As tempst




Public Sub fff()
    DoCmd.OpenForm "F_Recap", , , , , acDialog, "BaseTemp"
End Sub
