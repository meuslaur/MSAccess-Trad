Attribute VB_Name = "A_TestTbl"
Option Compare Database
Option Explicit

Public Sub rrr()
    Dim sSql As String
        sSql = "SELECT  MsysObjects.id, MsysObjects.Type, MsysObjects.Name " & _
           "FROM MsysObjects " & _
           "WHERE (((MsysObjects.Type) = " & ObjetForm & " Or (MsysObjects.Type) = " & ObjetReport & " Or (MsysObjects.Type) = " & TableLocale & " Or (MsysObjects.Type) = " & TableLinked & ") " & _
           "AND ((MsysObjects.Name) Not Like '~*' And (MsysObjects.Name) Not Like 'MSys*')  AND ((MsysObjects.Flags)>=0)) " & _
           "ORDER BY MsysObjects.Type, MsysObjects.Name;"

End Sub
