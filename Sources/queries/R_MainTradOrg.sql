SELECT T_TradTexte.*
FROM T_TradTexte
WHERE (((T_TradTexte.DefLangue)=True) AND ((T_TradTexte.Trad_ID) Like ("Achat.*")));
