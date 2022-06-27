Operation =1
Option =0
Begin InputTables
    Name ="T_Objets"
End
Begin OutputColumns
    Expression ="T_Objets.Objet_ID"
    Expression ="T_Objets.ObjetType"
    Expression ="T_Objets.ObjetNom"
End
Begin OrderBy
    Expression ="T_Objets.ObjetType"
    Flag =0
    Expression ="T_Objets.ObjetNom"
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
Begin
    Begin
        dbText "Name" ="T_Objets.ObjetNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.Objet_ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.ObjetType"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1683
    Bottom =846
    Left =-1
    Top =-1
    Right =1659
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
        Name ="T_Objets"
        Name =""
    End
End
