SELECT T_App.AppGuid, T_App.AppNom
FROM T_App
GROUP BY T_App.AppGuid, T_App.AppNom
ORDER BY T_App.AppNom;
