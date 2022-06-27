Operation =1
Option =0
Begin InputTables
    Name ="Order Details Extended"
End
Begin OutputColumns
    Alias ="OrderID"
    Expression ="[Order Details Extended].[Order ID]"
    Alias ="Price Total"
    Expression ="Sum([Order Details Extended].[Extended Price])"
End
Begin Groups
    Expression ="[Order Details Extended].[Order ID]"
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
        dbText "Name" ="Price Total"
        dbText "Format" ="#,##0.00 €;-#,##0.00 €"
        dbByte "DecimalPlaces" ="2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OrderID"
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
    Bottom =392
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =34
        Top =14
        Right =372
        Bottom =216
        Top =0
        Name ="Order Details Extended"
        Name =""
    End
End
