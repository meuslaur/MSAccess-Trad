Operation =1
Option =0
Begin InputTables
    Name ="T_ObjetTypes"
End
Begin OutputColumns
    Expression ="T_ObjetTypes.Type_ID"
    Expression ="T_ObjetTypes.TypeNom"
End
Begin OrderBy
    Expression ="T_ObjetTypes.TypeNom"
    Flag =0
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
        dbText "Name" ="T_ObjetTypes.TypeNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetTypes.Type_ID"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1253
    Bottom =1129
    Left =-1
    Top =-1
    Right =1225
    Bottom =551
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =60
        Top =15
        Right =240
        Bottom =195
        Top =0
        Name ="T_ObjetTypes"
        Name =""
    End
End
