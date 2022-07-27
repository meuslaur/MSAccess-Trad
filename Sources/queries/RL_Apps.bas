Operation =1
Option =0
Begin InputTables
    Name ="T_App"
End
Begin OutputColumns
    Expression ="T_App.AppGuid"
    Expression ="T_App.AppNom"
End
Begin OrderBy
    Expression ="T_App.AppNom"
    Flag =0
End
Begin Groups
    Expression ="T_App.AppGuid"
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
Begin
    Begin
        dbText "Name" ="T_App.AppNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_App.AppGuid"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1614
    Bottom =854
    Left =-1
    Top =-1
    Right =830
    Bottom =333
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =258
        Top =12
        Right =402
        Bottom =156
        Top =0
        Name ="T_App"
        Name =""
    End
End
