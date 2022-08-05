Attribute VB_Name = "A_Test"
'@IgnoreModule
'@Folder("Test")
Option Compare Database
Option Explicit


Public Function RegTest(Txt As String) As String

    Const REgAT   As String = "(^[a-zA-Z0-9-&éè""'[({]{1,})+([A-Za-zÀ0-9-ÖØ-öø-ÿ& ,.-@~`!@#$%^&*\[\]\{\}()_=+°\\'|;:""\/?>.<,-]){1,}$"
    Dim oRegex As Object
    Dim REMatches As Object
    Dim REMatche  As Object

    Set oRegex = CreateObject("vbscript.regexp")

    With oRegex
        .MultiLine = True
        .Global = False
        .IgnoreCase = True
        .Pattern = REgAT
    End With

    Set REMatches = oRegex.Execute(Txt)

    If REMatches.Count > 0 Then
        RegTest = Txt
    Else
        RegTest = vbNullString
    End If

    For Each REMatche In REMatches
        Debug.Print REMatche.Value
    Next

    Set REMatches = Nothing

End Function

Function ShowControlName()

    Dim cmbMso As Office.CommandBar
    Dim OffCtr As Office.CommandBarControl
    Dim sTxt As String

    For Each cmbMso In Application.CommandBars

        If (Len(LTrim$(cmbMso.name)) > 0) Then

            sTxt = sTxt & cmbMso.NameLocal & vbTab & cmbMso.ID & vbTab & "aaa" & vbNewLine

            For Each OffCtr In cmbMso.Controls
                sTxt = sTxt & OffCtr.Caption & vbTab & OffCtr.ID & vbTab & OffCtr.Type & vbNewLine
            Next
        End If
    Next

'   .FindControl(Type:=msoControlPopup, Tag:="Graphics")

    ADOFileWrite CurrentProject.Path & "\CommandBars.csv", sTxt

End Function


'[a-zA-Z]+
Public Sub ProcedureDeTest()

End Sub
Sub CreateShortcutMenuWithGroups()
    Dim cmbRightClick As Office.CommandBar
 
 ' Create the shortcut menu.
    Set cmbRightClick = CommandBars.Add("cmdFormFiltering", msoBarPopup, False, True)
     
    With cmbRightClick
        ' Add the Find command.
        .Controls.Add msoControlButton, 141, , , True
         
        ' Start a new grouping and add the Sort Ascending command.
        .Controls.Add(msoControlButton, 210, , , True).BeginGroup = True
         
        ' Add the Sort Descending command.
        .Controls.Add msoControlButton, 211, , , True
         
        ' Start a new grouping and add the Remove Filer/Sort command.
        .Controls.Add(msoControlButton, 605, , , True).BeginGroup = True
         
        ' Add the Filter by Selection command.
        .Controls.Add msoControlButton, 640, , , True
         
        ' Add the Filter Excluding Selection command.
        .Controls.Add msoControlButton, 3017, , , True
         
        ' Add the Between... command.
        .Controls.Add msoControlButton, 10062, , , True
    End With
 
Set cmbRightClick = Nothing
End Sub



Private Function ResetCustomBar(BarName As String) As Office.CommandBar
    On Error Resume Next
    'Delete bar if it exists
    CommandBars(BarName).Delete
    On Error GoTo 0
    
    Set ResetCustomBar = CommandBars.Add(BarName, msoBarPopup, False)
    
End Function

Sub BuildStatusUpdateCmdBar()
    Dim Bar As Office.CommandBar
    Set Bar = ResetCustomBar("ppStatusUpdateCmdBar")
    
    With Bar.Controls.Add(msoControlButton)
        .Caption = "Not Started"
        .OnAction = "=barSetTaskStatus(0)"
    End With
    With Bar.Controls.Add(msoControlButton)
        .Caption = "In Progress"
        .OnAction = "=barSetTaskStatus(1)"
    End With
    With Bar.Controls.Add(msoControlButton)
        .Caption = "Complete"
        .OnAction = "=barSetTaskStatus(2)"
    End With
    With Bar.Controls.Add(msoControlButton)
        .Caption = "N/A"
        .OnAction = "=barSetTaskStatus(3)"
    End With
    
    Debug.Print "Command bar "; Bar.name; " updated"

End Sub

Public Function barSetTaskStatus()
    Dim btnChangeStatus As Access.CommandButton
'    Set btnChangeStatus = Screen.ActiveControl
'
'    Dim TaskSF As Form_TaskSF
'    Set TaskSF = btnChangeStatus.Parent
'
'    Dim TaskID As Long
'    TaskID = TaskSF.TaskID
'
'    SetTaskStatus TaskID, luStatusID
'    TaskSF.RecordsetClone.Requery   'https://nolongerset.com/requery-a-form-in-place/
    'MsgBox "Set Task Status to " & luStatusID & " on TaskID:" & TaskID
End Function
