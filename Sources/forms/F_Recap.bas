Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowEdits = NotDefault
    DefaultView =0
    ScrollBars =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =13833
    DatasheetFontHeight =11
    ItemSuffix =7
    Left =3180
    Top =975
    Right =15555
    Bottom =11280
    RecSrcDt = Begin
        0x2562231676dbe540
    End
    Caption ="F_Recap"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    AllowLayoutView =0
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =60.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            BorderThemeColorIndex =1
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            BorderShade =65.0
            ShowPageHeaderAndPageFooter =1
        End
        Begin FormHeader
            Height =446
            Name ="EntêteFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =3
            BackShade =25.0
            Begin
                Begin Label
                    OverlapFlags =85
                    Left =113
                    Top =56
                    Width =5265
                    Height =390
                    FontSize =14
                    BorderColor =8355711
                    ForeColor =13421772
                    Name ="lblTitre"
                    Caption ="Récapitulatif des changements après le Scan :"
                    GridlineColor =10921638
                    LayoutCachedLeft =113
                    LayoutCachedTop =56
                    LayoutCachedWidth =5378
                    LayoutCachedHeight =446
                    ForeTint =20.0
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =9864
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Subform
                    OverlapFlags =85
                    Left =566
                    Top =170
                    Width =10470
                    Height =2040
                    BorderColor =10921638
                    Name ="sfO"
                    SourceObject ="Form.F_RecapO"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =170
                    LayoutCachedWidth =11036
                    LayoutCachedHeight =2210
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =113
                            Top =170
                            Width =375
                            Height =2040
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_sfO"
                            Caption ="Objets"
                            GridlineColor =10921638
                            LayoutCachedLeft =113
                            LayoutCachedTop =170
                            LayoutCachedWidth =488
                            LayoutCachedHeight =2210
                            BackThemeColorIndex =4
                            BackTint =40.0
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =85
                    Left =566
                    Top =2437
                    Width =10470
                    Height =3075
                    TabIndex =1
                    BorderColor =10921638
                    Name ="sfC"
                    SourceObject ="Form.F_RecapC"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =2437
                    LayoutCachedWidth =11036
                    LayoutCachedHeight =5512
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =113
                            Top =2437
                            Width =375
                            Height =3075
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_sfC"
                            Caption ="Contrôles"
                            GridlineColor =10921638
                            LayoutCachedLeft =113
                            LayoutCachedTop =2437
                            LayoutCachedWidth =488
                            LayoutCachedHeight =5512
                            BackThemeColorIndex =9
                            BackTint =30.0
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =85
                    Left =566
                    Top =5725
                    Width =10470
                    Height =3915
                    TabIndex =2
                    BorderColor =10921638
                    Name ="sfT"
                    SourceObject ="Form.F_RecapT"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =5725
                    LayoutCachedWidth =11036
                    LayoutCachedHeight =9640
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =113
                            Top =5725
                            Width =375
                            Height =3915
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_sfT"
                            Caption ="Propriétés :"
                            GridlineColor =10921638
                            LayoutCachedLeft =113
                            LayoutCachedTop =5725
                            LayoutCachedWidth =488
                            LayoutCachedHeight =9640
                            BackThemeColorIndex =5
                            BackTint =60.0
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="PiedFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub Form_Open(Cancel As Integer)
    If IsNull(Me.OpenArgs) Then
        Cancel = True
        DoCmd.Close
        Exit Sub
    End If

    Dim sSql As String
    
    sSql = "SELECT T_Objets.ObjetType, T_Objets.ObjetNom, " & _
           "IIf(Scanner=False,""="",Null) AS Scan, IIf(Nouveau=True,""="",Null) AS Nouv " & _
           "FROM T_Objets " & _
           "WHERE (((T_Objets.Scanner)=False)) OR (((T_Objets.Nouveau)=True) " & _
           "AND ((T_Objets.ObjetApp)='" & Me.OpenArgs & "'));"

    Me.sfO.Form.RecordSource = sSql

    sSql = "SELECT T_ObjetControles.Control_ID, IIf(Scanner=False,""="",Null) AS Scan, " & _
           "IIf(Nouveau=True,""="",Null) AS Nouv " & _
           "FROM T_ObjetControles " & _
           "WHERE (((T_ObjetControles.Control_ID) Like ('" & Me.OpenArgs & ".*')) " & _
           "AND ((T_ObjetControles.Scanner)=False)) OR (((T_ObjetControles.Nouveau)=True));"

    Me.sfC.Form.RecordSource = sSql

    sSql = "SELECT T_TradTexte.Trad_ID, T_TradTexte.PropNom, T_TradTexte.PropTexte, " & _
           "IIf(Scanner=False,""="",Null) AS Scan, " & _
           "IIf(ModPropTexte=True,""="",Null) AS Modif, " & _
           "IIf(Nouveau=True,""="",Null) AS Nouv " & _
           "FROM T_TradTexte " & _
           "WHERE (((T_TradTexte.Trad_ID) Like ('" & Me.OpenArgs & ".*')) " & _
           "AND ((T_TradTexte.Scanner) = False)) Or (((T_TradTexte.ModPropTexte) = True)) " & _
           "Or (((T_TradTexte.Nouveau) = True));" ' " &
           '"ORDER BY T_TradTexte.Scanner DESC;"

    Me.sfT.Form.RecordSource = sSql

End Sub
