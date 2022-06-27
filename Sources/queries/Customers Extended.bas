Operation =1
Option =0
Begin InputTables
    Name ="Customers"
End
Begin OutputColumns
    Alias ="File As"
    Expression ="IIf(IsNull([Last Name]),IIf(IsNull([First Name]),[Company],[First Name]),IIf(IsN"
        "ull([First Name]),[Last Name],[Last Name] & \", \" & [First Name]))"
    Alias ="Contact Name"
    Expression ="IIf(IsNull([Last Name]),IIf(IsNull([First Name]),[Company],[First Name]),IIf(IsN"
        "ull([First Name]),[Last Name],[First Name] & \" \" & [Last Name]))"
    Expression ="Customers.*"
End
Begin OrderBy
    Expression ="IIf(IsNull([Last Name]),IIf(IsNull([First Name]),[Company],[First Name]),IIf(IsN"
        "ull([First Name]),[Last Name],[Last Name] & \", \" & [First Name]))"
    Flag =0
    Expression ="IIf(IsNull([Last Name]),IIf(IsNull([First Name]),[Company],[First Name]),IIf(IsN"
        "ull([First Name]),[Last Name],[First Name] & \" \" & [Last Name]))"
    Flag =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="Contact Name"
        dbInteger "ColumnOrder" ="1"
        dbInteger "ColumnWidth" ="1695"
        dbBoolean "ColumnHidden" ="0"
        dbMemo "SmartTags" ="\"urn:schemas-microsoft-com:office:smarttags#PersonName\""
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="File As"
        dbInteger "ColumnWidth" ="1695"
        dbInteger "ColumnOrder" ="2"
        dbBoolean "ColumnHidden" ="0"
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
    Right =1689
    Bottom =251
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="Customers"
        Name =""
    End
End
