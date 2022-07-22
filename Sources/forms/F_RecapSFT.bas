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
    Width =10204
    DatasheetFontHeight =11
    ItemSuffix =13
    Left =2250
    Top =915
    Right =12450
    Bottom =4560
    RecSrcDt = Begin
        0xb269f48478dbe540
    End
    Caption ="F_RecapT"
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
            Height =315
            Name ="EntêteFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =9354
                    Width =180
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtScan"
                    Caption ="S"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9354
                    LayoutCachedWidth =9534
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =9581
                    Width =270
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtModif"
                    Caption ="M"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9581
                    LayoutCachedWidth =9851
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    Left =56
                    Width =960
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_PropNom"
                    Caption ="Propriété"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedWidth =1016
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    Left =1077
                    Width =690
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_PropTexte"
                    Caption ="Valeur"
                    GridlineColor =10921638
                    LayoutCachedLeft =1077
                    LayoutCachedWidth =1767
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =9921
                    Width =225
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtNouv"
                    Caption ="N"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9921
                    LayoutCachedWidth =10146
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            Height =925
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =1757
                    Width =7365
                    Height =345
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Trad_ID"
                    ControlSource ="Trad_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =1757
                    LayoutCachedWidth =9122
                    LayoutCachedHeight =345
                    BackThemeColorIndex =9
                    BackTint =30.0
                End
                Begin TextBox
                    OverlapFlags =95
                    IMESentenceMode =3
                    Width =1761
                    Height =345
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropNom"
                    ControlSource ="PropNom"
                    GridlineColor =10921638

                    LayoutCachedWidth =1761
                    LayoutCachedHeight =345
                    BackThemeColorIndex =5
                    BackTint =60.0
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    AllowAutoCorrect = NotDefault
                    ScrollBars =2
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =793
                    Top =340
                    Width =7710
                    Height =585
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropTexte"
                    ControlSource ="PropTexte"
                    GridlineColor =10921638

                    LayoutCachedLeft =793
                    LayoutCachedTop =340
                    LayoutCachedWidth =8503
                    LayoutCachedHeight =925
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextFontCharSet =2
                    TextAlign =2
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =9297
                    Top =396
                    Width =284
                    Height =345
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =2366701
                    Name ="txtScan"
                    ControlSource ="Scan"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =9297
                    LayoutCachedTop =396
                    LayoutCachedWidth =9581
                    LayoutCachedHeight =741
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =95
                    TextFontCharSet =2
                    TextAlign =2
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =9581
                    Top =396
                    Width =284
                    Height =345
                    TabIndex =4
                    BorderColor =10921638
                    Name ="txtModif"
                    ControlSource ="Modif"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =9581
                    LayoutCachedTop =396
                    LayoutCachedWidth =9865
                    LayoutCachedHeight =741
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =8
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextFontCharSet =2
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =9864
                    Top =396
                    Width =284
                    Height =345
                    TabIndex =5
                    BorderColor =10921638
                    Name ="txtNouv"
                    ControlSource ="Nouv"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =9864
                    LayoutCachedTop =396
                    LayoutCachedWidth =10148
                    LayoutCachedHeight =741
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
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
