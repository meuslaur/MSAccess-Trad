SELECT T_TradTexte.Trad_ID, T_TradTexte.PropNom, T_TradTexte.PropTexte, T_TradTexte.DateMaJ, iif(ModPropTexte=true,"=",null) AS Modif, iif(Scanner=false,"=",null) AS Scan
FROM T_TradTexte
WHERE (((T_TradTexte.DefLangue)=True));
