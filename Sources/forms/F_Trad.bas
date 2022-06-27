Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    DefaultView =0
    ScrollBars =0
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =13802
    DatasheetFontHeight =11
    ItemSuffix =4
    Top =600
    Right =13350
    Bottom =8865
    RecSrcDt = Begin
        0x5c7a48f85bd8e540
    End
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
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =0
            ForeTint =75.0
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
        Begin Section
            CanGrow = NotDefault
            Height =6859
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =510
                    Top =453
                    Width =2835
                    ForeColor =4210752
                    BorderColor =10921638
                    Name ="lst_Objets"
                    RowSourceType ="Table/Query"
                    RowSource ="R_ObjetsListe"
                    ColumnWidths ="0;567;2268"
                    GridlineColor =10921638

                    LayoutCachedLeft =510
                    LayoutCachedTop =453
                    LayoutCachedWidth =3345
                    LayoutCachedHeight =1870
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =510
                            Width =1125
                            Height =320
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="ObjetNom_Étiquette"
                            Caption ="ObjetNom"
                            GridlineColor =10921638
                            LayoutCachedLeft =510
                            LayoutCachedWidth =1635
                            LayoutCachedHeight =320
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =215
                    Left =453
                    Top =2437
                    Width =8205
                    Height =4095
                    TabIndex =1
                    BorderColor =10921638
                    Name ="F_ObjetControles"
                    SourceObject ="Form.F_TradTexte"
                    LinkChildFields ="ObjetParent_ID"
                    LinkMasterFields ="lst_Objets"
                    GridlineColor =10921638

                    LayoutCachedLeft =453
                    LayoutCachedTop =2437
                    LayoutCachedWidth =8658
                    LayoutCachedHeight =6532
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =453
                            Top =2211
                            Width =1710
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="F_ObjetControlesÉtiquette"
                            Caption ="Controles"
                            GridlineColor =10921638
                            LayoutCachedLeft =453
                            LayoutCachedTop =2211
                            LayoutCachedWidth =2163
                            LayoutCachedHeight =2526
                        End
                    End
                End
            End
        End
    End
End
