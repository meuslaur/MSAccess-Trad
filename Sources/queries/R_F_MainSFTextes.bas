Operation =1
Option =0
Where ="(((T_TradTexte.DefLangue)=True))"
Begin InputTables
    Name ="T_TradTexte"
End
Begin OutputColumns
    Expression ="T_TradTexte.Trad_ID"
    Expression ="T_TradTexte.PropNom"
    Expression ="T_TradTexte.PropTexte"
    Expression ="T_TradTexte.DateMaJ"
    Alias ="Modif"
    Expression ="IIf(ModPropTexte=True,\"=\",Null)"
    Alias ="Scan"
    Expression ="IIf(Scanner=False,\"=\",Null)"
    Alias ="Nouv"
    Expression ="IIf(Nouveau=True,\"=\",Null)"
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
        dbText "Name" ="T_TradTexte.PropTexte"
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
        dbText "Name" ="Scan"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Modif"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nouv"
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
    Right =1681
    Bottom =265
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =432
        Top =12
        Right =600
        Bottom =241
        Top =0
        Name ="T_TradTexte"
        Name =""
    End
End
