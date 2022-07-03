Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
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
    Width =18328
    DatasheetFontHeight =11
    ItemSuffix =32
    Top =285
    Right =17625
    Bottom =10785
    DatasheetGridlinesColor =15132391
    RecSrcDt = Begin
        0x5c7a48f85bd8e540
    End
    Caption ="Analyse/extraction des textes des bases"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
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
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =850
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
            BorderThemeColorIndex =0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Image
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
        End
        Begin BoundObjectFrame
            AddColon = NotDefault
            SizeMode =3
            SpecialEffect =2
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
            BackThemeColorIndex =1
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
        Begin ComboBox
            AddColon = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
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
            Height =10771
            Name ="Détail"
            AlternateBackColor =15921906
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ListBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =566
                    Top =2210
                    Width =5672
                    Height =8325
                    TabIndex =8
                    ForeColor =4210752
                    BorderColor =10921638
                    Name ="lstObjets"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;737;4822"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =2210
                    LayoutCachedWidth =6238
                    LayoutCachedHeight =10535
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =56
                            Top =2210
                            Width =375
                            Height =8385
                            FontSize =12
                            BackColor =4138256
                            BorderColor =8355711
                            ForeColor =16777215
                            Name ="lbl_lstObjetsInfo"
                            Caption ="Objets"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =56
                            LayoutCachedTop =2210
                            LayoutCachedWidth =431
                            LayoutCachedHeight =10595
                            ThemeFontIndex =-1
                            BackThemeColorIndex =-1
                            BackShade =50.0
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =85
                    Left =7029
                    Top =7823
                    Width =10560
                    Height =2655
                    TabIndex =11
                    BorderColor =10921638
                    Name ="SF_ControleTxt"
                    SourceObject ="Form.SF_MainTxtTexte"
                    LinkChildFields ="Trad_ID"
                    LinkMasterFields ="txt_SFControlID"
                    GridlineColor =10921638

                    LayoutCachedLeft =7029
                    LayoutCachedTop =7823
                    LayoutCachedWidth =17589
                    LayoutCachedHeight =10478
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =6462
                            Top =7823
                            Width =375
                            Height =2655
                            FontSize =12
                            BorderColor =8355711
                            ForeColor =16777215
                            Name ="F_ObjetControlesÉtiquette"
                            Caption ="Propriétés"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =6462
                            LayoutCachedTop =7823
                            LayoutCachedWidth =6837
                            LayoutCachedHeight =10478
                            ThemeFontIndex =-1
                            BackThemeColorIndex =4
                            BackShade =75.0
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =85
                    Left =7029
                    Top =2153
                    Width =10530
                    Height =5040
                    TabIndex =9
                    BorderColor =10921638
                    Name ="SF_Controles"
                    SourceObject ="Form.SF_MainTxtObjControles"
                    LinkChildFields ="ObjetParent_ID"
                    LinkMasterFields ="lstObjets"
                    GridlineColor =10921638

                    LayoutCachedLeft =7029
                    LayoutCachedTop =2153
                    LayoutCachedWidth =17559
                    LayoutCachedHeight =7193
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =6462
                            Top =2153
                            Width =375
                            Height =5040
                            FontSize =12
                            BorderColor =8355711
                            Name ="F_ObjetControles1Étiquette"
                            Caption ="Contrôles"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =6462
                            LayoutCachedTop =2153
                            LayoutCachedWidth =6837
                            LayoutCachedHeight =7193
                            ThemeFontIndex =-1
                            BackThemeColorIndex =9
                            BackTint =60.0
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7029
                    Top =7369
                    Width =8781
                    Height =315
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txt_SFControlID"
                    ControlSource ="=[SF_Controles].Form!Control_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =7029
                    LayoutCachedTop =7369
                    LayoutCachedWidth =15810
                    LayoutCachedHeight =7684
                End
                Begin Rectangle
                    SpecialEffect =0
                    BackStyle =1
                    OverlapFlags =93
                    Left =56
                    Top =113
                    Width =10655
                    Height =906
                    BackColor =15921906
                    BorderColor =10921638
                    Name ="boxBdD"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =113
                    LayoutCachedWidth =10711
                    LayoutCachedHeight =1019
                    BackShade =95.0
                End
                Begin TextBox
                    Locked = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =223
                    IMESentenceMode =3
                    Left =2854
                    Top =226
                    Width =7461
                    Height =315
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtBdd"
                    GridlineColor =10921638

                    LayoutCachedLeft =2854
                    LayoutCachedTop =226
                    LayoutCachedWidth =10315
                    LayoutCachedHeight =541
                    BackThemeColorIndex =7
                    BackTint =20.0
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =223
                    Left =10372
                    Top =252
                    Width =345
                    Height =285
                    TabIndex =1
                    ForeColor =4210752
                    Name ="cmbSelectBdd"
                    Caption =",,,"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Sélection de la base..."
                    GridlineColor =10921638

                    LayoutCachedLeft =10372
                    LayoutCachedTop =252
                    LayoutCachedWidth =10717
                    LayoutCachedHeight =537
                    UseTheme =0
                    Gradient =0
                    BackColor =14461583
                    BorderWidth =1
                    BorderColor =14461583
                    HoverColor =15189940
                    PressedColor =9917743
                    HoverForeColor =4210752
                    PressedForeColor =4210752
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                    Overlaps =1
                End
                Begin CommandButton
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =215
                    Left =10372
                    Top =192
                    Width =330
                    Height =330
                    TabIndex =2
                    ForeColor =4210752
                    Name ="cmdCloseBd"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Fermeture la base."
                    GridlineColor =10921638
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000082c2ea0982c2ea4b82c2ea90 ,
                        0x82c2eade00000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000082c2ea2182c2ea7582c2eab782c2eaf982c2eaff82c2eaff ,
                        0x82c2eaff00000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffa500000000000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffc000000000b17d4a90b17d4affb17d4af0b17d4a36 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffedffffff30b17d4a87b17d4affb17d4af0b17d4a3600000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaffffffffffd7ecf8ff82c2eaff ,
                        0x82c2eaffffffff30b17d4a81b17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4aff82c2eaff82c2eaff82c2eaffdceef9ffc4e2f5ff82c2eaff ,
                        0x82c2eaffffffff27b17d4a7eb17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4aff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffe4ffffff27b17d4a84b17d4affb17d4af0b17d4a3900000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffbd00000000b17d4a8db17d4affb17d4af0b17d4a39 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffa500000000000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaffffffffffffffffffffffffff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2eaff82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff ,
                        0x82c2eaff82c2eaff82c2eaff82c2eaff82c2eaff000000000000000000000000 ,
                        0x000000000000000082c2ea2182c2ea6f82c2eab782c2eaf982c2eaff82c2eaff ,
                        0x82c2eaff00000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000082c2ea0982c2ea4e82c2ea96 ,
                        0x82c2eae400000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =10372
                    LayoutCachedTop =192
                    LayoutCachedWidth =10702
                    LayoutCachedHeight =522
                    UseTheme =0
                    Gradient =0
                    BackColor =6567968
                    BackTint =100.0
                    BackShade =50.0
                    BorderColor =14461583
                    HoverColor =15189940
                    PressedColor =9917743
                    HoverForeColor =4210752
                    PressedForeColor =4210752
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                    Overlaps =1
                End
                Begin CommandButton
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =247
                    Left =9982
                    Top =207
                    Width =330
                    Height =330
                    TabIndex =3
                    ForeColor =4210752
                    Name ="cmbOuvreBase"
                    ControlTipText ="Ouvrir la base"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000000000002114881021148870211488bf ,
                        0x211488ef211488ff211488ff211488ff211488ff211488ff211488ef211488bf ,
                        0x2114887021148810000000000000000000000000211488ef211488ff211488ff ,
                        0x211488ff211488ff211488ff211488ff211488ff211488ff211488ff211488ff ,
                        0x211488ff211488ef000000000000000000000000100a44ff100a44ff100a44ff ,
                        0x100a44ff100a44ff100a44ff100a44ff190f66ff211488ff211488ff211488ff ,
                        0x211488ff211488ff3120afef3120afff3120afff3120afff3120afff3120afff ,
                        0x3120afff3120afff3120afff2f1fa8ff100a44ff211488ff211488ff211488ff ,
                        0x211488ff211488ff3120afff3120afff3120afff3120afff3120afff3120afff ,
                        0x3120afff3120afff3120afff3120afff181057ff3120afff301fadff2d1da5ff ,
                        0x281999ff22158aff3120afff3120afffe5e3f5ffbfb9e6ff3120afff3120afff ,
                        0xbfb9e6ffe5e3f5ff3120afff3120afff181057ff3120afff3120afff3120afff ,
                        0x3120afff301fadff3120afff3120afff9890d7ffffffffffccc7ebffccc7ebff ,
                        0xffffffff9890d7ff3120afff3120afff181057ff3120afff3120afff3120afff ,
                        0x3120afff3120afff3120afff3120afff4b3cb9ffffffffffccc7ebffccc7ebff ,
                        0xffffffff4b3cb9ff3120afff3120afff181057ff3120afff3120afff3120afff ,
                        0x3120afff3120afff3120afff3120afff3120afffccc7ebffbfb9e6ffbfb9e6ff ,
                        0xd8d5f0ff3120afff3120afff3120afff302764ff604fc9ff5d4cc7ff5443c3ff ,
                        0x4635baff3423b1ff3120afff3120afff3120afff7e74cdffffffffffffffffff ,
                        0x7e74cdff3120afff3120afff3120afff302764ff604fc9ff604fc9ff604fc9ff ,
                        0x604fc9ff5d4cc7ff3120afff3120afff3120afff3e2eb4ffffffffffffffffff ,
                        0x3e2eb4ff3120afff3120afff3120afff302764ff604fc9ff604fc9ff604fc9ff ,
                        0x604fc9ff604fc9ff3120afff3120afff3120afff3120afff3120afff3120afff ,
                        0x3120afff3120afff3120afff3120afff332a6aff604fc9ff604fc9ff604fc9ff ,
                        0x604fc9ff604fc9ff3120afef3120afff3120afff3120afff3120afff3120afff ,
                        0x3120afff3120afff3120afff3726b2ff9580e0ff9580e0ff927ddfff8874daff ,
                        0x7764d3ff6352caff000000000000000000000000927ddfff9580e0ff9580e0ff ,
                        0x9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff ,
                        0x9580e0ff927ddfff0000000000000000000000009580e0ef9580e0ff9580e0ff ,
                        0x9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff ,
                        0x9580e0ff9580e0ef0000000000000000000000009580e0109580e0709580e0bf ,
                        0x9580e0ef9580e0ff9580e0ff9580e0ff9580e0ff9580e0ff9580e0ef9580e0bf ,
                        0x9580e0709580e010
                    End

                    LayoutCachedLeft =9982
                    LayoutCachedTop =207
                    LayoutCachedWidth =10312
                    LayoutCachedHeight =537
                    UseTheme =0
                    BackColor =14461583
                    BorderColor =14461583
                    HoverColor =15189940
                    PressedColor =9917743
                    HoverForeColor =4210752
                    PressedForeColor =4210752
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                    Overlaps =1
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =215
                    TextAlign =3
                    Left =173
                    Top =226
                    Width =2565
                    Height =315
                    FontSize =12
                    BackColor =5855577
                    BorderColor =8355711
                    Name ="lbl_txtBdd"
                    Caption ="Base de données :"
                    FontName ="Arial"
                    GridlineColor =10921638
                    LayoutCachedLeft =173
                    LayoutCachedTop =226
                    LayoutCachedWidth =2738
                    LayoutCachedHeight =541
                    ThemeFontIndex =-1
                    BackThemeColorIndex =-1
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =2835
                    Top =623
                    Width =7881
                    Height =315
                    TabIndex =4
                    BackColor =15921906
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtBddSauve"
                    GridlineColor =10921638

                    LayoutCachedLeft =2835
                    LayoutCachedTop =623
                    LayoutCachedWidth =10716
                    LayoutCachedHeight =938
                    BackShade =95.0
                    Begin
                        Begin Label
                            OverlapFlags =215
                            TextAlign =3
                            Left =170
                            Top =623
                            Width =2550
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_txtBddSauve"
                            Caption ="Sauvegarde :"
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =623
                            LayoutCachedWidth =2720
                            LayoutCachedHeight =938
                        End
                    End
                End
                Begin Image
                    Visible = NotDefault
                    Left =11451
                    Top =737
                    Width =480
                    Height =480
                    BorderColor =10921638
                    Name ="img_NoLangue"
                    Picture ="0000.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d4948445200000020000000200806000000737a7a ,
                        0xf400000006624b4744000000000000f943bb7f0000000970485973000049d200 ,
                        0x0049d201a8458af8000000097670416700000020000000200087fa9c9d000007 ,
                        0xc24944415458c39596696c5d4719869f9939eb5deceb35899d267652a709266d ,
                        0x43d234559b14212a2a04a2b420a1941f2021b5954095f8878444d58a8a3f2c15 ,
                        0x5255442504aa0021ba48dda074a36d6844a8d36677e2d8499a38b6e3f55edfe5 ,
                        0xdc73ce0c3fceb57bbd5c17461a1de9ccf2bef37edfbcf309d6683fbd037ab6b6 ,
                        0x73ffef27c52fef961deb3774ee6c6d6bba3d93f6f678aed56729d52a04ca185d ,
                        0xac86d1a54aa57a2c9f9f3f343939fb9fa3470b235ffdcae67064649ceffdb5d2 ,
                        0x1043341a787c3f3cf0f07e9e7ef2dd5cefd60dfbbbbb3bbfd1d1d6746bb36777 ,
                        0xbb8a948591d218c00082184c68a896a2786a6ebe747ae2daf48b57ae4cbdf4e3 ,
                        0x67f2c38f1ff4cdc13f96ff7702bfba5b313418cb5db764fb7bb76e7c605357fb ,
                        0x3ded19a7cb8d4321a210b4c618b374230108094a112b8b52ace72766f3872f5d ,
                        0xb9f6e4e0b9f1d7aeebce15fff1fa144f8d2cc552cbc11fbb1d06068cfcc25dad ,
                        0x776edfd1fbe8b6cd9df77538b4d841491045b00c78493306b4464411ae144e53 ,
                        0x26b5259df5f778bed2434313a7efbbb73d78ea8d5263020ff781d6a83b0ee43e ,
                        0xbf6347cfcffabadbf667e2c0a21a244aff3f4d6b541c93f69cd674d6dfedfa56 ,
                        0xf8c1c0f4f17b763ac18ba7c2d5091c9edacfc89b53376edfbef9d1be8d1d77a4 ,
                        0xc2b23451b4f29498446e6983b412fd8d4eba5816551de3db56ca4d393b5066e2 ,
                        0xd091a9136d79f4b968590efce4364879b275d7ee9ec76fdcb6e9bb3942c78421 ,
                        0xcb9bf05b106d5b912d5b10d90d607998a88c99bd841e3b8699b99010599669c6 ,
                        0x568c16e68f1d1f1c7df0e06fa60e976b9a2e2ad01e23f6ee6afef28ebe4d3f5c ,
                        0xe75bcd548395b24a0babff5eac5b1f44f51e4076dd8cecfc0c72dd4e54f7e790 ,
                        0x9ddb31c5494c7e94e53193061c57b5c5e8a8bfa9f8af5706e30a8004e8066eeb ,
                        0x179d5debdbbed9d9ecaf13ab8103088968ea4a4e2e6d4c50c0048504cc492337 ,
                        0xecc2baf97e4453d70a158c36b846589db9f497366fcaed5e920305e0e0deccbe ,
                        0xbeaddd0f75f8760b51b83a01a990ddbbc07288075f459f79097df908c24923b2 ,
                        0x5d49fc2d0f337e02337b71453e88648b4c398caeb6570befbd77d9c416c0d73a ,
                        0xb1722de95b72696f838ca3c6096f347af86de2c15731d323100709887290eb77 ,
                        0x82e58172c049b39ac518038e147673cade77434fba9dc3852b16c067afc3cfa4 ,
                        0xbd7edf961e7144c3a623f4d56380ae0108b0fc5a48ac644e54c154e65870c815 ,
                        0x221af05dd5d3dc646f04ae48805c4e647dd7dee808b1b6d124e7a86d6cc07250 ,
                        0xd77f11d5775742c018f4d871ccd450c3d5c280a764ce77ad2e000bc07684af94 ,
                        0xc84a6156586cc3266d54ef9d58bbbf932800e8899344efff1a3d7a146c0f61a7 ,
                        0xc17213cfa8e3af048ea5646e918094420a509f7efa5a20e300b1ae1f75f3b711 ,
                        0xcdd725e0e32709df7884f8cccba043102a01f77308bf152cbf665806306201db ,
                        0x0288225d8de3a8a28d4609b1ba0a4663a20a54f2502da2fabf8e6cbf3e190b0a ,
                        0x44879f243efd52020e60624c585acc09916a4378392046c7511c6b535e24502a ,
                        0x9b621004935158c6c6fe24798c011d62aa4508f298200f5190587014a0c74f02 ,
                        0x12337b017dfef5644cac244eb588092b98d234c271a95a997210ea894502e393 ,
                        0xcc174bd5e14a694e7b2696463aa03544654c5884b00c719d37e890e8a33f130f ,
                        0xbd55cbfc327af6d21ad545a208c13cc6827294199f2f45971709bc709660df9e ,
                        0xea402188e69ae3a916130449b62c161ccb53592137ed43f51c0004a6308a39f2 ,
                        0x5b4c616c4d12420842db37f9923931365119859a15efedc0cccc940626e7f550 ,
                        0xe4a6100b2f5b234b9216aae700d6be87b0f63d88bae95be0b77c7a02db1645e1 ,
                        0x15a60be13bc706cbf94502cf5e85e9996868f45ae96f33c60f70dd4fdfacce66 ,
                        0xc58229adbd80d8cf3219c80f47c7e6dfdede865e2400d0d74979fc5af1b98f67 ,
                        0xe2e381df8c90728dcd4cf210152730c56b98d214e8686d78d7634e66e6ae4c56 ,
                        0xfe72ee62e1fc8f8e24ff179fe3674fc316134f669b89bc6c666fce97191136a8 ,
                        0x668dc1e42fa3cfbf497cf205e2b3afc0d4b94faee07270dba6946e0f876779ee ,
                        0xd4d9992776ad8bf2cf1c4fc6acfa89dd5d22ba3a5678de73ad2d5e4ff6075d19 ,
                        0x9d95f3732b7dc1c498f153c4e3a7ea156e00ee1064daccc579f5eec8e59927be ,
                        0xff6265ac7e7c4949f6c605786d98f28e6c70c64899729b9a6ec8a46c5fc54925 ,
                        0xbc2ca44bfb2a3922bc14c5745b3434a70e7d3834fbc8cf9f2ffc7b62d963bbbc ,
                        0x2a1680f3cf8b842608ce2a61aa563add9b6e4a37b90a21b44e6ec85ab11602e9 ,
                        0x38c4991c932a377fec6afcf7d73f9afec5632f17073eaed625d12a040460032e ,
                        0xe09dba467cf442705687c1c5502847a4b3ad763aed5aae23a452482110422645 ,
                        0x8ab2108e83f15254fd66a6ace6f2e08c75e6edd3f37f7afaada9dffde1837038 ,
                        0xd04b026548def425e229c001bc1a091770057837ad67c3816dde9e9d9b52b7f6 ,
                        0x74b8dbdb33aa23eb0acf5146092036987224aa73159d1f9d8d2f9c1dad0c1c1a ,
                        0x2cbeffce703834175000aa4005086adf2a10527b95169aac29b08440addb80d7 ,
                        0xe6d1bcad53aeefedb0bb3ab3aa33e3a9b414a820329599623cfdf14c7475702c ,
                        0x1abd3863a66328d640aa35e0a08e440044abe5aeaa0b835b5364818053fb5ab5 ,
                        0x7916a0445263e8da8671ed1bd59db29e40b50edc34ba3cb28ec8f2be00ae6af3 ,
                        0xead7eb5aaf2711d691086bff9678fc5afe29ebc8580dc0ebd79b0624169459f5 ,
                        0x65fb2f6f51830767c996bb0000002574455874646174653a6372656174650032 ,
                        0x3031302d30312d31315430393a30303a34372d30373a303009a3647d00000025 ,
                        0x74455874646174653a6d6f6469667900323031302d30312d31315430393a3030 ,
                        0x3a34372d30373a303078fedcc100000033744558744c6963656e736500687474 ,
                        0x703a2f2f6372656174697665636f6d6d6f6e732e6f72672f6c6963656e736573 ,
                        0x2f62792f332e302f56f7fa1c0000001974455874536f66747761726500777777 ,
                        0x2e696e6b73636170652e6f72679bee3c1a0000001a74455874536f7572636500 ,
                        0x54616e676f206861726d2d6f6e2d69636f6e73053102b20000004a7445587453 ,
                        0x6f757263655f55524c00687474703a2f2f676e6f6d652d6c6f6f6b2e6f72672f ,
                        0x636f6e74656e742f73686f772e7068702f54616e676f2b6d696e653f636f6e74 ,
                        0x656e743d37363331368eda75390000000049454e44ae426082
                    End

                    LayoutCachedLeft =11451
                    LayoutCachedTop =737
                    LayoutCachedWidth =11931
                    LayoutCachedHeight =1217
                    TabIndex =13
                End
                Begin CommandButton
                    Enabled = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =566
                    Top =1870
                    Width =330
                    Height =330
                    TabIndex =7
                    ForeColor =4210752
                    Name ="cmdActuLstObjets"
                    Caption ="Commande18"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Lance l'analyse des objets de la base de données,"
                    Picture ="ic_Actulise.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x6100000006624b4744000000000000f943bb7f0000000970485973000001bb00 ,
                        0x0001bb013aece3e200000009767041670000001000000010005cc6adc3000003 ,
                        0x234944415438cb6d93cf6b5c551cc5cff7be7bdfaf4966924e52934e429b0c6d ,
                        0x63d038a1b4360aa1f5078516c73fa0145adcba5170e9aaa21b05dd891bc19d0b ,
                        0x090e281a8ba2d4422a464d4a82da368969d274ec247999ce9bf7de7df77ddd18 ,
                        0x18c1b3fe70369f738899d119aa52190217ad2eebb991d2c864b1ab2856365796 ,
                        0xea5bf56b30f8986b7cfb5f6e0880a4fd02aa9200e1b5e268f1ad0b272fb8a5fe ,
                        0x1206fb0661090b4110e0cefd3b98b931136daf6d5f45869f0aa5fc67711047c4 ,
                        0xcca02a09e1d07753a74f4f9d9d7c5e095be0ff6212831b0bd7f56febbfd29517 ,
                        0x5e911f7cfa3e240090c0eb95b127a64e8e3dad823000858446a3818dfb1b2026 ,
                        0x9487cbf07a3c00c0c4d18a9a28579031438020a94ac7fb077aae1e3d32ae1abb ,
                        0x0d98d460fe9779fcb9f2071ca3e0d91eaecffd80de5211a74e9c426fbe1760c0 ,
                        0x620b820424112e950a434e2b6aa115b5b0786b117fd73739e7aa244cf4b538d3 ,
                        0xc617eadc6ed4b0675767697a7c1a2ebba0846011413abe3acb06b4bdbb8dbd60 ,
                        0x0f1bf7d6e1fbaabdd78e9fe21adfa62a4dc2c28bfc24d163870fa2299b683f6a ,
                        0x23d8094019582a475422a3910601ea0febb08c402bd1dfecebeaf2dc3e95179e ,
                        0xeaf5903e88b116dc45f34113dcca9046e62bf22faa246b590a12d08e86d28424 ,
                        0x31b366263bd7b10d174041c122109b8cd81866cd9f735324b1b9893045a42298 ,
                        0xa2018f028e6b4d53958e77183c24883ea109ea33954caa614b77e79d0800649a ,
                        0x645fbab67a060752421f90756728e695434be267f1327d0122726c79be30ecce ,
                        0xa543d99958d36a544837ad65b145576893f0121ef75c358f11b8c9400a5fd9c8 ,
                        0x39368ad2876e18b640f006641a52fa57a4d3c530499675335b6bffaebf6e7fa4 ,
                        0x5705d778b91de937fd1da55da9e0d912394741fa84dc319bac0941497fa672be ,
                        0x5dee72ecf182ed8fc50be68d682b3d0200fb9b7dafb1157edb73d78d7b840757 ,
                        0x29508eb07730c2cea13676072334fb63e4a5536edf4ace84bbc91280ef01a0f3 ,
                        0x4c04e0d5ee03ee3bdea8f44a6379111d4bd12a26b0ee093c9c6bb1b99985e123 ,
                        0xfd368077b9c6c97f0a3a941d067019c0b396a013cca08c7901c08f003ee41aaf ,
                        0x77f2ff0051726b1e6def87da00000025744558746372656174652d6461746500 ,
                        0x323030392d31312d31355431373a30323a33342d30373a3030b6e78e12000000 ,
                        0x2574455874646174653a63726561746500323031302d30322d32305432333a32 ,
                        0x363a31382d30373a303067ec3d410000002574455874646174653a6d6f646966 ,
                        0x7900323031302d30312d31315430393a32343a33372d30373a303023bccc6300 ,
                        0x000067744558744c6963656e736500687474703a2f2f6372656174697665636f ,
                        0x6d6d6f6e732e6f72672f6c6963656e7365732f62792d73612f332e302f206f72 ,
                        0x20687474703a2f2f6372656174697665636f6d6d6f6e732e6f72672f6c696365 ,
                        0x6e7365732f4c47504c2f322e312f5b8f3c6300000025744558746d6f64696679 ,
                        0x2d6461746500323030392d30332d31395431303a35323a35302d30363a3030d9 ,
                        0x1ff6b20000001974455874536f667477617265007777772e696e6b7363617065 ,
                        0x2e6f72679bee3c1a0000001374455874536f75726365004f787967656e204963 ,
                        0x6f6e73ec18aee80000002774455874536f757263655f55524c00687474703a2f ,
                        0x2f7777772e6f787967656e2d69636f6e732e6f72672fef37aacb000000004945 ,
                        0x4e44ae426082
                    End

                    LayoutCachedLeft =566
                    LayoutCachedTop =1870
                    LayoutCachedWidth =896
                    LayoutCachedHeight =2200
                    UseTheme =0
                    BackColor =14461583
                    BorderColor =14461583
                    HoverColor =15189940
                    PressedColor =9917743
                    HoverForeColor =4210752
                    PressedForeColor =4210752
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                    Overlaps =1
                End
                Begin ComboBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =2085
                    Left =2271
                    Top =1870
                    Width =3966
                    Height =315
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"\";\"10\";\"100\""
                    Name ="zlBases"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Apps"
                    ColumnWidths ="2085"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Liste des applications déjà enregistrées,"
                    GridlineColor =10921638

                    LayoutCachedLeft =2271
                    LayoutCachedTop =1870
                    LayoutCachedWidth =6237
                    LayoutCachedHeight =2185
                    BackThemeColorIndex =7
                    BackTint =20.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =1360
                            Top =1870
                            Width =780
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_zlApps"
                            Caption ="Bases :"
                            GridlineColor =10921638
                            LayoutCachedLeft =1360
                            LayoutCachedTop =1870
                            LayoutCachedWidth =2140
                            LayoutCachedHeight =2185
                        End
                    End
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    OverlapFlags =85
                    Left =2268
                    Top =1133
                    Width =4830
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    Name ="lbl_InfoScan2"
                    Caption =" "
                    GridlineColor =10921638
                    LayoutCachedLeft =2268
                    LayoutCachedTop =1133
                    LayoutCachedWidth =7098
                    LayoutCachedHeight =1448
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =340
                    Top =1133
                    Width =1815
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =2366701
                    Name ="lbl_InfoScan1"
                    Caption ="Analyse en cours :"
                    GridlineColor =10921638
                    LayoutCachedLeft =340
                    LayoutCachedTop =1133
                    LayoutCachedWidth =2155
                    LayoutCachedHeight =1448
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2250
                    Left =10941
                    Top =396
                    Width =3231
                    Height =315
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"0000\";\"\";\"\";\"10\";\"100\""
                    Name ="zlLangues"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Langues"
                    ColumnWidths ="0;2250"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Db Click pour ajouter une langue..."
                    GridlineColor =10921638

                    LayoutCachedLeft =10941
                    LayoutCachedTop =396
                    LayoutCachedWidth =14172
                    LayoutCachedHeight =711
                    BackThemeColorIndex =4
                    BackTint =20.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =10942
                            Top =56
                            Width =2970
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_zlLangues"
                            Caption ="Langue d'origine de la base:"
                            GridlineColor =10921638
                            LayoutCachedLeft =10942
                            LayoutCachedTop =56
                            LayoutCachedWidth =13912
                            LayoutCachedHeight =371
                        End
                    End
                End
                Begin Image
                    PictureType =1
                    Left =10941
                    Top =737
                    Width =480
                    Height =480
                    BorderColor =10921638
                    Name ="img_Langue"
                    GridlineColor =10921638

                    LayoutCachedLeft =10941
                    LayoutCachedTop =737
                    LayoutCachedWidth =11421
                    LayoutCachedHeight =1217
                    TabIndex =12
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =85
                    TextFontCharSet =2
                    TextFontFamily =18
                    Left =2268
                    Top =1474
                    Width =255
                    Height =300
                    FontSize =8
                    FontWeight =700
                    BorderColor =8355711
                    Name ="lbl_InfoScan3"
                    Caption ="a"
                    FontName ="Webdings"
                    GridlineColor =10921638
                    LayoutCachedLeft =2268
                    LayoutCachedTop =1474
                    LayoutCachedWidth =2523
                    LayoutCachedHeight =1774
                    ThemeFontIndex =-1
                    BackThemeColorIndex =7
                    BackTint =20.0
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                End
            End
        End
    End
End
CodeBehindForm
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'@Folder("Form")
' ------------------------------------------------------
' Name     : Form_F_Trad
' ------------------------------------------------------
' Kind     : Document VBA
' Purpose  : Formulaire principal
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 27/06/2022 - 11:00
' DateMod  :
' Requi    :
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private C_ObjetAcc  As C_ObjetsAccess
    Private C_Trad      As C_TradScanText
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&     EVENTS        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
Private Sub Form_Load()

    Set C_Trad = New C_TradScanText         '// Initialisation des classes.
    Set C_ObjetAcc = C_Trad.GetClsObjAcc()  '// Récupère la classe initialisée.
    RazForm                                 '// RaZ des contrôles...

End Sub

Private Sub Form_Close()
    On Error GoTo ERR_Form_Close

    Screen.MousePointer = 11    '// Hourglass.

    '// Déclenche class_Terminate()
    Set C_Trad = Nothing
    Set C_ObjetAcc = Nothing

SORTIE_Form_Close:
    DoCmd.Echo True
    Screen.MousePointer = 0
    Exit Sub

ERR_Form_Close:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  CSord.Form_F_CreateForm.Form_Close, ligne " & Erl & "."
    Resume SORTIE_Form_Close
End Sub

Private Sub cmbSelectBdd_Click()
    On Error GoTo ERR_cmbSelectBdd

    Dim bRep     As Boolean
    Dim sBaseSel As String
    Dim vTmp     As Variant  '// Pour Split de sBackup.
    Dim sRep     As String

    '// Séléction de la base à utiliser.
    sBaseSel = OuvreBoite("MS Access", "*.accdb", , , FD_TypeFilePicker)
    If (sBaseSel = vbNullString) Then Exit Sub

    DoCmd.Echo False
    Screen.MousePointer = 11            '// Hourglass.

    '// Création Access.Application, si pas déjà fait.
    bRep = InitAppEtBase(sBaseSel)

    If (bRep) Then
        RazForm True
        Me.txtBdd = sBaseSel
        
        '// Détermine le nonm du fichier de la prochaine sauvegarde...
        sRep = GetBackupFileName(sBaseSel)

        vTmp = Split(sRep, ";")             '// NOTE retourne folder;backup;base
        Me.txtBddSauve = vTmp(0) & vTmp(1)  '// folder + backup.
    Else
        RazForm                             '// Problème détecter, RaZ et on sort.
    End If

SORTIE_cmbSelectBdd:
    Screen.MousePointer = 0
    DoCmd.Echo True
    Exit Sub

ERR_cmbSelectBdd:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TriSurFormContinu.Form_F_CreateForm.cmbSelectBdd_Click, ligne " & Erl & "."
    Resume SORTIE_cmbSelectBdd
End Sub

Private Sub cmdCloseBd_Click()

    Screen.MousePointer = 11    '// Hourglass.
    '// Ferme la base en cours, réinitialise les champs par défaut...
    C_ObjetAcc.CloseMsBase
    RazForm
    Screen.MousePointer = 0
    Me.txtBdd = "Sélectionnez un base..."

End Sub

'// MàJ de la liste des objets...
Private Sub cmdActuLstObjets_Click()

    '// Vérifier si une langue d'origine défini.
    If (IsNull(Me.zlLangues)) Then
        MsgBox "Sélectionnez la langue d'origine de la base" & vbCrLf & "Avant de lancer l'analyse, merci.", vbInformation, "Choisir une langue"
        Me.zlLangues.SetFocus
        Me.zlLangues.Dropdown
        Exit Sub
    End If

    Dim bRep As Boolean

    Me.txtBdd.SetFocus
    Me.cmdActuLstObjets.Enabled = False
    Me.lbl_InfoScan1.Visible = True
    Me.lbl_InfoScan2.Visible = True
    Me.lbl_InfoScan3.Visible = True

    C_Trad.InitialiseBarre Me.lbl_InfoScan2, Me.lbl_InfoScan3

    bRep = C_Trad.ScanObjetsApp(FormType, ReportType) ', , Me.lbl_InfoScan2, Me.lbl_InfoScan3) '// Lance le scan les objets de la base sélectionnée....

    Me.lbl_InfoScan1.Visible = False
    Me.lbl_InfoScan2.Visible = False
    Me.lbl_InfoScan3.Visible = False

    If bRep = False Then Exit Sub

    Me.zlBases = C_ObjetAcc.BaseOuverteNom()
    zlBases_AfterUpdate     '// MàJ des données...

End Sub

Private Sub zlBases_AfterUpdate()
    If (IsNull(Me.zlBases)) Then Exit Sub

    Dim sSql As String

    sSql = "SELECT T_Objets.Objet_ID, T_Objets.ObjetType, T_Objets.ObjetNom, T_Objets.ObjetApp " & _
           "FROM T_Objets " & _
           "WHERE (((T_Objets.ObjetApp) = '" & Me.zlBases & "')) " & _
           "ORDER BY T_Objets.ObjetType, T_Objets.ObjetNom;"

    Me.lstObjets = Null
    Me.lstObjets.RowSource = sSql
    Me.lstObjets.Requery

    Me.zlLangues = C_Trad.LangueGetIDLangBase(Me.zlBases)   '// Extraire la langue d'origine de la base...
    MaJLangue False                                         '// Affiche le drapeau, vérouille la zl...

End Sub

Private Sub zlLangues_AfterUpdate()
    MaJLangue   '// Affiche le drapeau...
End Sub

'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& END EVENTS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

'// ################################ PRIVATE SUB/FUNC ####################################

Private Function InitAppEtBase(sBase As String) As Boolean
    Dim bRep As Boolean

    If (C_ObjetAcc Is Nothing) Then Exit Function

    '// Création Access.Application, si pas déjà fait.
    If (C_ObjetAcc.MsAppIsUp = False) Then
        bRep = C_ObjetAcc.OpenMsApp()
        If (bRep = False) Then Exit Function
    End If

    If (C_ObjetAcc.MsBaseIsOpen = False) Then
        bRep = C_ObjetAcc.OpenMsBase(sBase)     '// Ouverture de la base.
    End If

    '// Problème détecter, on ferme tout, RaZ et on sort.
    If (bRep = False) Then C_ObjetAcc.CloseMsBase True

    InitAppEtBase = bRep

End Function

Private Sub MaJLangue(Optional bEnabledZL As Boolean = True)
'// Affiche l'image de la langue,
'// maj de la zl, et la vérouille si bEnabledZL est à true.
    Dim sImg As String

    C_Trad.IDLangApp = Me.zlLangues
    Me.zlLangues.Enabled = bEnabledZL
    
    sImg = C_Trad.LangueExtraireFlag()  '// Obtenir l'image du drapeau correspondant a la langue...
    Me.img_Langue.Picture = IIf(sImg = vbNullString, Me.img_NoLangue.Picture, sImg)

End Sub
'// Applique les valeurs par défaut.
Private Sub RazForm(Optional bActive As Boolean)

    Me.txtBdd.SetFocus
    Me.txtBdd = "Sélectionnez un base..."
    Me.txtBddSauve = vbNullString
    Me.zlBases = Null
    Me.lstObjets.RowSource = vbNullString
    Me.lstObjets = Null
    Me.zlLangues = Null
    Me.img_Langue.Picture = vbNullString

    Me.cmdCloseBd.Visible = bActive
    Me.cmbSelectBdd.Visible = Not bActive
    Me.cmdActuLstObjets.Enabled = bActive
    Me.zlBases.Enabled = Not bActive
    Me.zlLangues.Enabled = bActive

End Sub
'// ################################# END PRIV. SUB/FUNC #################################
