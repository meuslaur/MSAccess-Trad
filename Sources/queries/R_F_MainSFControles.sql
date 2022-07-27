SELECT IIf(Scanner=False,"=",Null) AS Scan, IIf(Nouveau=True,"=",Null) AS Nouv, T_ObjetControles.ControlParentName, T_ObjetControles.ControlType, T_ObjetControles.ControlNom, T_ObjetControles.ControlGuid, T_ObjetControles.ObjetParentGuid
FROM T_ObjetControles;
