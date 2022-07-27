SELECT T_TradTexte.CtrParentGuid, T_TradTexte.PropNom, T_TradTexte.PropTexte, T_TradTexte.DateMaJ, IIf([ModifTxt]=True,"=",Null) AS Modif, IIf(Scanner=False,"=",Null) AS Scan, IIf(Nouveau=True,"=",Null) AS Nouv, T_TradTexte.CtrParentGuid
FROM T_TradTexte
WHERE (((T_TradTexte.DefLangue)=True));
