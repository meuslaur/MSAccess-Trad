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
    Left =1905
    Top =735
    Right =17895
    Bottom =7200
    RecSrcDt = Begin
        0xe694bb396cdbe540
    End
    RecordSource ="R_SF_MainTextes"
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
            BackThemeColorIndex =0
            BackTint =75.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =622
                    Width =1080
                    Height =315
                    BorderColor =8355711
                    Name ="lbl_PropNom"
                    Caption ="Propriété"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =622
                    LayoutCachedWidth =1702
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =3
                    ForeTint =100.0
                    ForeShade =90.0
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =2720
                    Width =738
                    Height =315
                    BorderColor =8355711
                    Name ="lbl_PropTexte"
                    Caption ="Texte"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2720
                    LayoutCachedWidth =3458
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =3
                    ForeTint =100.0
                    ForeShade =90.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =56
                    Width =180
                    Height =315
                    BorderColor =8355711
                    Name ="lbl_Scan"
                    Caption ="S"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedWidth =236
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =3
                    ForeTint =100.0
                    ForeShade =90.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =340
                    Width =225
                    Height =315
                    BorderColor =8355711
                    Name ="lbl_Modif"
                    Caption ="M"
                    GridlineColor =10921638
                    LayoutCachedLeft =340
                    LayoutCachedWidth =565
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =3
                    ForeTint =100.0
                    ForeShade =90.0
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
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =566
                    Width =2085
                    Height =315
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    Name ="PropNom"
                    ControlSource ="PropNom"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedWidth =2651
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
                    Left =2663
                    Width =7878
                    Height =585
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PropTexte"
                    ControlSource ="PropTexte"
                    GridlineColor =10921638

                    LayoutCachedLeft =2663
                    LayoutCachedWidth =10541
                    LayoutCachedHeight =585
                End
                Begin TextBox
                    Visible = NotDefault
                    EnterKeyBehavior = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =5497
                    Width =918
                    Height =315
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Trad_ID"
                    ControlSource ="Trad_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =5497
                    LayoutCachedWidth =6415
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextFontCharSet =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Width =291
                    Height =315
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =2366701
                    Name ="Scan"
                    ControlSource ="Scan"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedWidth =291
                    LayoutCachedHeight =315
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =87
                    TextFontCharSet =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =283
                    Width =291
                    Height =315
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =15709952
                    Name ="Nouv"
                    ControlSource ="Modif"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =283
                    LayoutCachedWidth =574
                    LayoutCachedHeight =315
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
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
