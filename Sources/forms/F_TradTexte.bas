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
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7929
    DatasheetFontHeight =11
    ItemSuffix =14
    Left =1485
    Top =165
    Right =14100
    Bottom =11490
    RecSrcDt = Begin
        0xa16d84b75bd8e540
    End
    RecordSource ="R_ControlesTexte"
    Caption ="T_TradTexte"
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
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =319
            Name ="EntêteFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =93
                    TextAlign =1
                    Width =1710
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="PropNom_Étiquette"
                    Caption ="PropNom"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =1710
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =215
                    TextAlign =1
                    Left =1701
                    Width =3363
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="PropTexte_Étiquette"
                    Caption ="PropTexte"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =1701
                    LayoutCachedWidth =5064
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =315
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =1710
                    Height =315
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropNom"
                    ControlSource ="PropNom"
                    GridlineColor =10921638

                    LayoutCachedWidth =1710
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =1701
                    Width =6228
                    Height =315
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropTexte"
                    ControlSource ="PropTexte"
                    GridlineColor =10921638

                    LayoutCachedLeft =1701
                    LayoutCachedWidth =7929
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =3968
                    Width =636
                    Height =315
                    ColumnWidth =1530
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="LangueCode"
                    ControlSource ="LangueCode"
                    GridlineColor =10921638

                    LayoutCachedLeft =3968
                    LayoutCachedWidth =4604
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =2948
                    Width =1023
                    Height =315
                    ColumnWidth =2940
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DateMaJ"
                    ControlSource ="DateMaJ"
                    Format ="General Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =2948
                    LayoutCachedWidth =3971
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    EnterKeyBehavior = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =454
                    Width =918
                    Height =315
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Trad_ID"
                    ControlSource ="Trad_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =454
                    LayoutCachedWidth =1372
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =4988
                    Height =315
                    ColumnWidth =3150
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ObjetParent_ID"
                    ControlSource ="ObjetParent_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =4988
                    LayoutCachedWidth =6689
                    LayoutCachedHeight =315
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="PiedFormulaire"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
