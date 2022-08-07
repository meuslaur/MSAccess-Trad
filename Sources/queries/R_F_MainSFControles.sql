SELECT IIf(Scanner=False,"=",Null) AS Scan, IIf(Nouveau=True,"=",Null) AS Nouv, T_ObjetChilds.ControlParentName, T_ObjetChilds.ChildType, T_ObjetChilds.ChildNom, T_ObjetChilds.Child_ID, T_ObjetChilds.IDObjet
FROM T_ObjetChilds;
