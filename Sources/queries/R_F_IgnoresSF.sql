SELECT T_Objets.Objet_ID, T_ObjetTypes.TypeNom, T_Objets.ObjetNom, T_Objets.Ignorer, T_Objets.IDApp, T_Objets.IDType
FROM T_ObjetTypes INNER JOIN T_Objets ON (T_ObjetTypes.Type_ID = T_Objets.IDType) AND (T_ObjetTypes.Type_ID = T_Objets.IDType)
ORDER BY T_ObjetTypes.TypeNom, T_Objets.ObjetNom;
