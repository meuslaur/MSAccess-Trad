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
'Copy and paste the following code into a Standard module
Private Type POINTAPI
   x As Long
   y As Long
End Type

Private Declare PtrSafe Function GetCursorPos Lib "user32.dll" _
    (ByRef lpPoint As POINTAPI) As Long


Function ShowControlName(frm As Form)

   Dim pt As POINTAPI
   Dim accObject As Object
   
   GetCursorPos pt
   Set accObject = frm.AccHitTest(pt.x, pt.y)
   
   If Not accObject Is Nothing Then
       MsgBox "You just clicked on " & accObject.name
   End If

End Function


'[a-zA-Z]+
Public Sub ProcedureDeTest()

    Dim vRep As Variant

    vRep = DLookup("[Objet_ID]", "T_Objets", "[Objet_ID]='GraphExample_Crystal_170625_.Form.f_Graph'")

    DoCmd.OpenForm "iF_Recap", , , , , acDialog, "BaseTemp"

End Sub


