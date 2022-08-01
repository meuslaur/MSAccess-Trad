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
    AllowDesignChanges = NotDefault
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7370
    DatasheetFontHeight =11
    ItemSuffix =13
    Left =1392
    Top =3972
    Right =10212
    Bottom =8580
    RecSrcDt = Begin
        0xde9d4071d0dce540
    End
    Caption ="Requête1"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
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
            Height =315
            Name ="EntêteFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =2267
                    Width =3363
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_PropTexte"
                    Caption ="Texte"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2267
                    LayoutCachedWidth =5630
                    LayoutCachedHeight =315
                End
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
            End
        End
        Begin Section
            Height =1140
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =226
                    Top =793
                    Width =963
                    Height =285
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Prop_ID"
                    ControlSource ="Prop_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =226
                    LayoutCachedTop =793
                    LayoutCachedWidth =1189
                    LayoutCachedHeight =1078
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =2265
                    Height =285
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropNom"
                    ControlSource ="PropNom"
                    GridlineColor =10921638

                    LayoutCachedWidth =2265
                    LayoutCachedHeight =285
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =2267
                    Width =5103
                    Height =1140
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropTexte"
                    ControlSource ="PropTexte"
                    GridlineColor =10921638

                    LayoutCachedLeft =2267
                    LayoutCachedWidth =7370
                    LayoutCachedHeight =1140
                End
                Begin TextBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =56
                    Top =396
                    Width =2208
                    Height =330
                    ColumnWidth =2940
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DateMaJ"
                    ControlSource ="DateMaJ"
                    Format ="General Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =56
                    LayoutCachedTop =396
                    LayoutCachedWidth =2264
                    LayoutCachedHeight =726
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
