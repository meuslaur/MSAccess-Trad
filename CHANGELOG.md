#Changelog
## V 0.49 2022/08/08
- Procédure de sauvegarde avant de lancer le scan de la base.
- Ajout du form `F_Ignores` permettant d'ignorés certains objets (par la suite pour ses enfants aussi)
- Ajoute Scan des tables (loin d'être fini en cours de dev).
- Correction de bugs (très moches).
- a suivre...

## V 0.48 2022/05/04
- Modifications filtres sur les texte Caption.
- Ajoute info sur tous les textes ingorés.
* Correction de bugs.

## V 0.45 2022/07/28
- Correction de bugs.

## V 0.45 2022/07/26
C_TradScanText.
- Ajout function `CheckPropApp()`, `CheckGuidApp()`, `CheckAppExiste()`, `UpdateTableApp()`, `GetGuid()`
- Ajout propriétés `AppGuid` 
- Ajout constante `TAG_GUIDD`, `TAG_GUIDF`
- Ajout élément Guid dans Type `TObjet` et `TControl`.
- Création Type `TApp`.

MD_Utils
- Ajout fonctions `CreateGuid`.

MD_BDProp
- Création du module.
- Ajout des fonctions `DBPropTextCreate`, `DBPropTextDelete`, `DBPropTextSet`, `DBPropTextGet`, `DBPropsExport`, `DBPropTextExist`

F_Main
- Modification fonction `ReScannerApp`.

Base
- Ajout table `T_App`.
- Ajout champ `ObjetGuid` T_Objets.
- Ajout champ `ControlGuid` T_Controls.
- Modification champ NomApp en `AppGuid` T_Objets.

## V 0.43 2022/07/23
- Modification du form F_Main, réorganisation des listes (bases, types, objets).
- F_Recap, ajoute de filtres (Scan, Modif, Nouveau).
- Correction de bugs mineurs.

## V 0.42-1 2022/07/22
- Modification du form F_Recap, ajout de ses SF.

## V 0.42 2022/07/21
- Ajoute variable m_DateMaJ dans C_TradTexte pour utiliser toujours la même valeur pour le champ DateMaJ lors du scan.
- Controle des valeurs texte, ne stock pas si vide et nouveau, vérifie si changement et si pas nouveau control.
- Correction de bugs.
- Optimisation du code.
- Ajoute de champs permetant de controler les états des enregistrements.

## V 0.40 2022/07/17
- Ajout possibilité de modifier ou d'ajouter une langue dans la liste des langues du form F_TradTxt.
- Ignore les prop de moins de 2 caractères lors du scan (UpdateRstControl).
- Fermeture auto de la base et de l'app après le scan.
- Modification entête du form F_Main.
- Vérification si la base existe déjà dans la table T_Objets, lors de la sélection d'une base dans la boite fichiers.
- Replacement recodset par une querydef temp.
- Correction bug text contenant des apostrophes.
- Modification interface du form F_Main.

## V 0.35 2022/07/03
- Ajoute objets label dans l'appel de ScanObjetApp(C_TradTexte) pour affichage de l'avancement du scan.
- Création du formulaire d'ajout de langues dans la table T_Langues.
- Suppréssion de la possibilité d'aboir des images 16*16, les images doivent être en 32*32.
- Modification code Barre avancement, déplace le code dans Classe.

## V 0.30 2022/06/30

- Remplace le module MD_Dev par la classe C_TradTexte.
- Modification du code pour utilisation de la nouvelle classe.
- Contrôle/vérification plus poussé de la langue dans le code.
- Synchronisation de la liste des langues avec l'app sélectionée.
- Correction devers bug mineurs.

## V 0.25 2022/06/30

- Ajoute label dans le form F_MainTxt pour info avancement du scan des objets de l'application.
- Création de la sub SuppDonneesApp qui supprime toutes les données liées à une app, en cas d'erreur lors du scan.
- Ajoute s'une zone de liste pour le choix de la langue, la langue de d'Access peut être différente des texte de la base.
- - Affiche l'image de la langue suivant la valeur dde la zl_Langues, si la langue n'est pas dans la table T_Langues, affiche LangueCode 0000.

## V 0.2 2022/06/29
- Upload des fichiers v 0.2
- Création tables pour traduction des formulaires.
- Création tables pour traduction des états.
