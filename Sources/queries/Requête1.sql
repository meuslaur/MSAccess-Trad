SELECT T_Objets.Objet_ID, [ObjetType] & [ObjetNom] AS Objet, T_Objets.ObjetCaption
FROM T_Objets
ORDER BY [ObjetType] & [ObjetNom];
