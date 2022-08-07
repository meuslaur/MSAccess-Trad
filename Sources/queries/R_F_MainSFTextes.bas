Operation =1
Option =0
Begin InputTables
    Name ="T_ObjetChildTextes"
End
Begin OutputColumns
    Expression ="[T_ObjetChildTextes].Prop_ID"
    Expression ="[T_ObjetChildTextes].PropNom"
    Expression ="[T_ObjetChildTextes].PropTexte"
    Expression ="[T_ObjetChildTextes].DateMaJ"
    Expression ="[T_ObjetChildTextes].IDChild"
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
dbByte "PublishToWeb" ="1"
Begin
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
    Begin
        dbText "Name" ="T_PropTextes.Prop_ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_PropTextes.PropTexte"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_PropTextes.PropNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_PropTextes.DateMaJ"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-9
    Top =-38
    Right =1295
    Bottom =1158
    Left =-1
    Top =-1
    Right =1266
    Bottom =181
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =60
        Top =15
        Right =240
        Bottom =195
        Top =0
        Name ="T_PropTextes"
        Name =""
    End
End
