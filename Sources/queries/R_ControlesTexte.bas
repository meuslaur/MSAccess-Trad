Operation =1
Option =0
Where ="(((T_TradTexte.DefLangue)=True))"
Begin InputTables
    Name ="T_Langues"
    Name ="T_ObjetControles"
    Name ="T_TradTexte"
End
Begin OutputColumns
    Expression ="T_TradTexte.Trad_ID"
    Expression ="T_ObjetControles.ControlNom"
    Expression ="T_TradTexte.PropNom"
    Expression ="T_TradTexte.PropTexte"
    Expression ="T_TradTexte.LangueCode"
    Expression ="T_Langues.LangueNom"
    Expression ="T_TradTexte.DateMaJ"
    Expression ="T_Langues.CodeImage"
    Expression ="T_ObjetControles.ObjetParent_ID"
End
Begin Joins
    LeftTable ="T_Langues"
    RightTable ="T_TradTexte"
    Expression ="T_Langues.LangueCode = T_TradTexte.LangueCode"
    Flag =1
    LeftTable ="T_ObjetControles"
    RightTable ="T_TradTexte"
    Expression ="T_ObjetControles.Control_ID = T_TradTexte.Trad_ID"
    Flag =1
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
        dbText "Name" ="T_ObjetControles.ControlNom"
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
    Begin
        dbText "Name" ="T_TradTexte.PropNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_TradTexte.DateMaJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Langues.LangueNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Langues.CodeImage"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetControles.ObjetParent_ID"
        dbInteger "ColumnWidth" ="3150"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1278
    Bottom =846
    Left =-1
    Top =-1
    Right =1254
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
    Begin
        Left =680
        Top =73
        Right =824
        Bottom =217
        Top =0
        Name ="T_ObjetControles"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =590
        Bottom =189
        Top =0
        Name ="T_TradTexte"
        Name =""
    End
End
