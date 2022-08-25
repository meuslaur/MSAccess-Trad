Operation =1
Option =0
Begin InputTables
    Name ="T_Objets"
    Name ="T_ObjetTypes"
End
Begin OutputColumns
    Expression ="T_Objets.Objet_ID"
    Expression ="T_ObjetTypes.TypeNom"
    Expression ="T_Objets.ObjetNom"
    Expression ="T_Objets.Ignorer"
    Expression ="T_Objets.IDApp"
    Expression ="T_Objets.IDType"
End
Begin Joins
    LeftTable ="T_ObjetTypes"
    RightTable ="T_Objets"
    Expression ="T_ObjetTypes.Type_ID = T_Objets.IDType"
    Flag =1
    LeftTable ="T_ObjetTypes"
    RightTable ="T_Objets"
    Expression ="T_ObjetTypes.Type_ID = T_Objets.IDType"
    Flag =1
End
Begin OrderBy
    Expression ="T_ObjetTypes.TypeNom"
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
        dbText "Name" ="T_Objets.ObjetNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.Objet_ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetTypes.TypeNom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_ObjetTypes.Type_ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.IDType"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="T_Objets.Type_ID"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-9
    Top =-38
    Right =1228
    Bottom =1158
    Left =-1
    Top =-1
    Right =1199
    Bottom =507
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
    Begin
        Left =351
        Top =15
        Right =531
        Bottom =195
        Top =0
        Name ="T_ObjetTypes"
        Name =""
    End
End
