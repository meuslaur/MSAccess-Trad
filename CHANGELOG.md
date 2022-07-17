#Changelog

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
