Operation =1
Option =0
Begin InputTables
    Name ="T_Objets"
End
Begin OutputColumns
    Expression ="T_Objets.Objet_ID"
    Expression ="T_Objets.ObjetType"
    Expression ="T_Objets.ObjetNom"
    Expression ="T_Objets.Ignorer"
    Expression ="T_Objets.IDApp"
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
dbByte "PublishToWeb" ="1"
Begin
    Begin
        dbText "Name" ="T_Objets.IDApp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.Ignorer"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.ObjetType"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.ObjetNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.Objet_ID"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1491
    Bottom =1150
    Left =-1
    Top =-1
    Right =1463
    Bottom =570
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =60
        Top =15
        Right =291
        Bottom =248
        Top =0
        Name ="T_Objets"
        Name =""
    End
End
