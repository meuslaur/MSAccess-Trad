INSERT INTO [Copie de T_Objets] ( Objet_ID, ObjetNom, ObjetType, IDApp, IDApp, Scanner, Nouveau )
SELECT [~TO].Objet_ID, [~TO].ObjetNom, [~TO].ObjetType, [~TO].IDApp, [~TO].IDApp, True AS Expr1, True AS Expr2
FROM [~TO]
WHERE ((([~TO].Up)=True));
