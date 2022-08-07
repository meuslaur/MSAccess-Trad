SELECT [T_ObjetChildTextes].Prop_ID, [T_ObjetChildTextes].PropNom, [T_ObjetChildTextes].PropTexte, [T_ObjetChildTextes].DateMaJ, [T_ObjetChildTextes].IDChild, IIf(ModPropTexte=True,"=",Null) AS Modif, IIf(Scanner=False,"=",Null) AS Scan, IIf(Nouveau=True,"=",Null) AS Nouv
FROM T_ObjetChildTextes;
