SELECT T_TradTexte.Trad_ID, T_ObjetControles.ControlNom, T_TradTexte.PropNom, T_TradTexte.PropTexte, T_TradTexte.LangueCode, T_Langues.LangueNom, T_TradTexte.DateMaJ, T_Langues.CodeImage, T_ObjetControles.ObjetParent_ID
FROM T_ObjetControles INNER JOIN (T_Langues INNER JOIN T_TradTexte ON T_Langues.LangueCode = T_TradTexte.LangueCode) ON T_ObjetControles.Control_ID = T_TradTexte.Trad_ID
WHERE (((T_TradTexte.DefLangue)=True));
