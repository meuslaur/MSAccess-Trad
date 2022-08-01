SELECT T_PropTextes.Prop_ID, T_PropTextes.PropNom, T_PropTextes.PropTexte, T_PropTextes.DateMaJ, T_PropTextes.IDControl, IIf(ModPropTexte=True,"=",Null) AS Modif, IIf(Scanner=False,"=",Null) AS Scan, IIf(Nouveau=True,"=",Null) AS Nouv
FROM T_PropTextes;
