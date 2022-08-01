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
    Left =2256
    Top =912
    Right =12708
    Bottom =4812
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
                    Left =57
                    Width =180
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtScan"
                    Caption ="S"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =57
                    LayoutCachedWidth =237
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =284
                    Width =270
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtModif"
                    Caption ="M"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =284
                    LayoutCachedWidth =554
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    Left =1020
                    Width =960
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_PropNom"
                    Caption ="Propriété"
                    GridlineColor =10921638
                    LayoutCachedLeft =1020
                    LayoutCachedWidth =1980
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    Left =2551
                    Width =690
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_PropTexte"
                    Caption ="Valeur"
                    GridlineColor =10921638
                    LayoutCachedLeft =2551
                    LayoutCachedWidth =3241
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =624
                    Width =225
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtNouv"
                    Caption ="N"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =624
                    LayoutCachedWidth =849
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            Height =564
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
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
                    Top =113
                    Width =284
                    Height =345
                    BorderColor =10921638
                    ForeColor =2366701
                    Name ="txtScan"
                    ControlSource ="Scan"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedTop =113
                    LayoutCachedWidth =284
                    LayoutCachedHeight =458
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
                    Left =284
                    Top =113
                    Width =284
                    Height =345
                    TabIndex =1
                    BorderColor =10921638
                    Name ="txtModif"
                    ControlSource ="Modif"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =284
                    LayoutCachedTop =113
                    LayoutCachedWidth =568
                    LayoutCachedHeight =458
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
                    Left =567
                    Top =113
                    Width =284
                    Height =345
                    TabIndex =2
                    BorderColor =10921638
                    Name ="txtNouv"
                    ControlSource ="Nouv"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =567
                    LayoutCachedTop =113
                    LayoutCachedWidth =851
                    LayoutCachedHeight =458
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =963
                    Width =1533
                    Height =345
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropNom"
                    ControlSource ="PropNom"
                    GridlineColor =10921638

                    LayoutCachedLeft =963
                    LayoutCachedWidth =2496
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
                    Left =2494
                    Width =7710
                    Height =564
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropTexte"
                    ControlSource ="PropTexte"
                    GridlineColor =10921638

                    LayoutCachedLeft =2494
                    LayoutCachedWidth =10204
                    LayoutCachedHeight =564
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
