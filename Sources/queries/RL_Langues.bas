Operation =1
Option =0
Begin InputTables
    Name ="T_Langues"
End
Begin OutputColumns
    Expression ="T_Langues.LangueCode"
    Expression ="T_Langues.LangueNom"
    Expression ="T_Langues.CodeImage"
End
Begin OrderBy
    Expression ="T_Langues.LangueNom"
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
        dbText "Name" ="T_Langues.LangueNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Langues.LangueCode"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Langues.CodeImage"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-10
    Top =-33
    Right =1288
    Bottom =856
    Left =-1
    Top =-1
    Right =1266
    Bottom =401
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="T_Langues"
        Name =""
    End
End
