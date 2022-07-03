Operation =1
Option =0
Where ="(((T_TradTexte.DefLangue)=True) AND ((T_TradTexte.Trad_ID) Like (\"Achat.*\")))"
Begin InputTables
    Name ="T_TradTexte"
End
Begin OutputColumns
    Expression ="T_TradTexte.*"
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
        dbText "Name" ="T_TradTexte.Trad_ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_TradTexte.DefLangue"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_TradTexte.PropNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_TradTexte.DateMaJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_TradTexte.LangueCode"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_TradTexte.PropTexte"
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
    Bottom =418
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =248
        Bottom =183
        Top =0
        Name ="T_TradTexte"
        Name =""
    End
End
