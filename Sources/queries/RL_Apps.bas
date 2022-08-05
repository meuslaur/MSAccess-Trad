Operation =1
Option =0
Begin InputTables
    Name ="T_App"
End
Begin OutputColumns
    Expression ="T_App.[App_ID]"
    Expression ="T_App.AppNom"
End
Begin OrderBy
    Expression ="T_App.AppNom"
    Flag =0
End
Begin Groups
    Expression ="T_App.[App_ID]"
    GroupLevel =0
    Expression ="T_App.AppNom"
    GroupLevel =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbByte "PublishToWeb" ="1"
Begin
    Begin
        dbText "Name" ="T_App.AppNom"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1705
    Bottom =826
    Left =-1
    Top =-1
    Right =1677
    Bottom =329
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =325
        Top =15
        Right =505
        Bottom =195
        Top =0
        Name ="T_App"
        Name =""
    End
End
