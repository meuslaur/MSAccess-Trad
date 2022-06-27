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
    Width =11778
    DatasheetFontHeight =11
    ItemSuffix =9
    Top =600
    Right =24870
    Bottom =12135
    RecSrcDt = Begin
        0xe8938c255ad8e540
    End
    RecordSource ="T_ObjetControles"
    Caption ="T_ObjetControles"
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
                    Width =3705
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="ObjetParent_ID_Étiquette"
                    Caption ="Parent"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =3705
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =3968
                    Width =1659
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="ControlParentName_Étiquette"
                    Caption ="Control Parent"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =3968
                    LayoutCachedWidth =5627
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =7710
                    Width =1080
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Control_ID_Étiquette"
                    Caption ="Control"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =7710
                    LayoutCachedWidth =8790
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            Height =315
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =5782
                    Width =1881
                    Height =315
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ControlType"
                    ControlSource ="ControlType"
                    GridlineColor =10921638

                    LayoutCachedLeft =5782
                    LayoutCachedWidth =7663
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =7653
                    Width =4125
                    Height =315
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Control_ID"
                    ControlSource ="Control_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =7653
                    LayoutCachedWidth =11778
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =3975
                    Height =315
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ObjetParent_ID"
                    ControlSource ="ObjetParent_ID"
                    GridlineColor =10921638

                    LayoutCachedWidth =3975
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =3968
                    Width =1704
                    Height =315
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ControlParentName"
                    ControlSource ="ControlParentName"
                    GridlineColor =10921638

                    LayoutCachedLeft =3968
                    LayoutCachedWidth =5672
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
