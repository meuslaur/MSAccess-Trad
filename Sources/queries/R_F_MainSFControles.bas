Operation =1
Option =0
Begin InputTables
    Name ="T_ObjetControles"
End
Begin OutputColumns
    Alias ="Scan"
    Expression ="IIf(Scanner=False,\"=\",Null)"
    Alias ="Nouv"
    Expression ="IIf(Nouveau=True,\"=\",Null)"
    Expression ="T_ObjetControles.ControlParentName"
    Expression ="T_ObjetControles.ControlType"
    Expression ="T_ObjetControles.ControlNom"
    Expression ="T_ObjetControles.Control_ID"
    Expression ="T_ObjetControles.IDObjet"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "PublishToWeb" ="1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="Scan"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nouv"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetControles.ControlNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetControles.ControlParentName"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetControles.ControlType"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetControles.Control_ID"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =85
    Top =143
    Right =1619
    Bottom =949
    Left =-1
    Top =-1
    Right =1506
    Bottom =363
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =280
        Bottom =211
        Top =0
        Name ="T_ObjetControles"
        Name =""
    End
End
