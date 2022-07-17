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
    ScrollBars =0
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10545
    DatasheetFontHeight =11
    ItemSuffix =14
    Left =11115
    Top =8475
    Right =21405
    Bottom =10860
    RecSrcDt = Begin
        0x42a2cf4a73d8e540
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
                    OverlapFlags =85
                    TextAlign =1
                    Width =1710
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_PropNom"
                    Caption ="Propriété"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =1710
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =2097
                    Width =3363
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_PropTexte"
                    Caption ="Texte"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2097
                    LayoutCachedWidth =5460
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =585
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Width =2085
                    Height =315
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    Name ="PropNom"
                    ControlSource ="PropNom"
                    GridlineColor =10921638

                    LayoutCachedWidth =2085
                    LayoutCachedHeight =315
                    BackThemeColorIndex =5
                    BackTint =60.0
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2097
                    Width =8448
                    Height =585
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropTexte"
                    ControlSource ="PropTexte"
                    GridlineColor =10921638

                    LayoutCachedLeft =2097
                    LayoutCachedWidth =10545
                    LayoutCachedHeight =585
                End
                Begin TextBox
                    Visible = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =4421
                    Width =636
                    Height =315
                    ColumnWidth =1530
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="LangueCode"
                    ControlSource ="LangueCode"
                    GridlineColor =10921638

                    LayoutCachedLeft =4421
                    LayoutCachedWidth =5057
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =3344
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

                    LayoutCachedLeft =3344
                    LayoutCachedWidth =4367
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =5214
                    Width =1611
                    Height =315
                    ColumnWidth =3150
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ObjetParent_ID"
                    ControlSource ="ObjetParent_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =5214
                    LayoutCachedWidth =6825
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Visible = NotDefault
                    EnterKeyBehavior = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =7085
                    Width =918
                    Height =315
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Trad_ID"
                    ControlSource ="Trad_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =7085
                    LayoutCachedWidth =8003
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
