SELECT T_TradTexte.Trad_ID, T_TradTexte.PropNom, T_TradTexte.PropTexte, T_TradTexte.DateMaJ, IIf(ModPropTexte=True,"=",Null) AS Modif, IIf(Scanner=False,"=",Null) AS Scan, IIf(Nouveau=True,"=",Null) AS Nouv
FROM T_TradTexte
WHERE (((T_TradTexte.DefLangue)=True));
