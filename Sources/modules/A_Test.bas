Attribute VB_Name = "A_Test"
'@IgnoreModule
'@Folder("Test")
Option Compare Database
Option Explicit

Private temps As Collection

Private Type tempst
    Debut As Currency
    fin As Currency
    temp As Currency
End Type
Dim tbltemps() As tempst

Public Sub testTemps()

    
End Sub
Sub testCBenchmark()
    Dim bm As New cBenchmark
    Dim i As Long
bm.TrackByName "Initialisations"

    bm.Sleep 0.05    'wait 50 milliseconds/simulating code running
bm.TrackByName "Slept"
'
'    For i = 1 To 1000000
'        i = i * 1
'    Next i
'bm.TrackByName "Finished loop"
'
'    bm.Sleep 0.05    'wait 50 milliseconds/simulating code running
'bm.TrackByName "Slept"

'    Application.Wait Now + TimeValue("0:00:01")
'bm.TrackByName "Waited"
End Sub
