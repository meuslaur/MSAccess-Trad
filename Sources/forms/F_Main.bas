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
    Cycle =1
    GridY =10
    Width =18425
    DatasheetFontHeight =11
    ItemSuffix =81
    Left =3480
    Top =225
    Right =21645
    Bottom =11415
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
        Begin OptionButton
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
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
        Begin ToggleButton
            Width =283
            Height =283
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =2
            Bevel =1
            BackColor =-1
            BackThemeColorIndex =4
            BackTint =60.0
            OldBorderStyle =0
            BorderLineStyle =0
            BorderColor =-1
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =1
        End
        Begin FormHeader
            Height =858
            BackColor =3684411
            Name ="EntêteFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =3
            BackShade =25.0
            Begin
                Begin TextBox
                    Locked = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2551
                    Top =226
                    Width =7776
                    Height =315
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtBdd"
                    GridlineColor =10921638

                    LayoutCachedLeft =2551
                    LayoutCachedTop =226
                    LayoutCachedWidth =10327
                    LayoutCachedHeight =541
                    BackThemeColorIndex =7
                    BackTint =20.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =93
                            TextAlign =3
                            Left =113
                            Top =226
                            Width =2310
                            Height =330
                            FontSize =12
                            BackColor =5855577
                            BorderColor =8355711
                            ForeColor =15066597
                            Name ="lbl_txtBdd"
                            Caption ="Ouvrir une base  :"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =113
                            LayoutCachedTop =226
                            LayoutCachedWidth =2423
                            LayoutCachedHeight =556
                            ThemeFontIndex =-1
                            BackThemeColorIndex =-1
                            ForeTint =10.0
                        End
                    End
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =10374
                    Top =226
                    Width =331
                    Height =331
                    TabIndex =1
                    ForeColor =4210752
                    Name ="cmbSelectBdd"
                    Caption ="..."
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Sélection de la base..."
                    GridlineColor =10921638

                    LayoutCachedLeft =10374
                    LayoutCachedTop =226
                    LayoutCachedWidth =10705
                    LayoutCachedHeight =557
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
                    OverlapFlags =223
                    Left =10374
                    Top =226
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

                    LayoutCachedLeft =10374
                    LayoutCachedTop =226
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =556
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
                Begin ComboBox
                    TabStop = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2250
                    Left =13334
                    Top =226
                    Width =3231
                    Height =315
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"0000\";\"\";\"\";\"10\";\"100\""
                    Name ="zlLangues"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Langues"
                    ColumnWidths ="0;2250"
                    AfterUpdate ="[Event Procedure]"
                    OnDblClick ="[Event Procedure]"
                    OnNotInList ="[Event Procedure]"
                    ControlTipText ="Db Click pour Afficher la langue...\015\012Ou saisissez une valeur pour ajouter "
                        "une langue,"
                    GridlineColor =10921638

                    LayoutCachedLeft =13334
                    LayoutCachedTop =226
                    LayoutCachedWidth =16565
                    LayoutCachedHeight =541
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =3
                            Left =10941
                            Top =226
                            Width =2325
                            Height =315
                            BorderColor =8355711
                            ForeColor =13421772
                            Name ="lbl_zlLangues"
                            Caption ="Langue de la base:"
                            GridlineColor =10921638
                            LayoutCachedLeft =10941
                            LayoutCachedTop =226
                            LayoutCachedWidth =13266
                            LayoutCachedHeight =541
                            ForeTint =20.0
                        End
                    End
                End
                Begin Image
                    Visible = NotDefault
                    Left =16894
                    Top =283
                    Width =405
                    Height =330
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

                    LayoutCachedLeft =16894
                    LayoutCachedTop =283
                    LayoutCachedWidth =17299
                    LayoutCachedHeight =613
                    TabIndex =6
                End
                Begin Image
                    PictureType =1
                    Left =16667
                    Top =170
                    Width =480
                    Height =480
                    BorderColor =10921638
                    Name ="img_Langue"
                    GridlineColor =10921638

                    LayoutCachedLeft =16667
                    LayoutCachedTop =170
                    LayoutCachedWidth =17147
                    LayoutCachedHeight =650
                    TabIndex =5
                End
                Begin CommandButton
                    Enabled = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =93
                    Left =17347
                    Top =113
                    Width =570
                    Height =570
                    TabIndex =4
                    ForeColor =4210752
                    Name ="cmdLanceScan"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Lance l'analyse des objets de la base de données,"
                    Picture ="ic_Actulise.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d4948445200000020000000200806000000737a7a ,
                        0xf400000006624b4744000000000000f943bb7f00000009704859730000037600 ,
                        0x000376017dd582cc000000097670416700000020000000200087fa9c9d000008 ,
                        0x354944415458c3ad977b8c1d551dc7bfbf73cebce7bef7dea5bb6d7797b6b42e ,
                        0xad9ab43455a0602a0ac6776311831ad2562a44e40f0535240dc144838f442324 ,
                        0x25a5e21f906a23421afe80045bd3541a6c1408340458d8ddbeb6fbb8afbd7367 ,
                        0xeecc9c73fce3b65d963e117fc92f33993973be9ff33bbf39bf73486b8d8f6204 ,
                        0x228dffbd13ba5c007a90049af85cc92edd36941fba6669716965456545ae27db ,
                        0x83a3b5a3c1bb33ef4e8f54475e19a98e3cd9b01b7bf5761dff5f00e86ef2e1e0 ,
                        0xa75cf2bb6f5e7e736ef5d06af495fbe03a2e1cdb41aa5254832aa61a5398a9ce ,
                        0x607c621ccfbdf15c2be5e94ee4b15d6fd7cd0ff679c3ee1b16ae5fb4fe8a87ae ,
                        0x7de8f04501c4cfe80e4af8c3df58b5a967fdaaf5e8f00e12955c14d860067447 ,
                        0x63ef4b7bf18f91fd356da807e4aff5a367dfff823f74ebf0371f68a1557be62b ,
                        0xcf16cf0b400f12b3eafcd125a565777eebfadbc16c06a9e5879b5b1026a627f0 ,
                        0xeccbcf60b2737267c795dfb749fc7c45f9eafbb7acdd8a1f1dbc17e13d0989f3 ,
                        0x7c48ee29e3f9b5439ffaec67d66e40a84320fc50da672de7e7b079c316fcebc8 ,
                        0xa12dfb8ffe7dc3f2de15435f1efe1a1a5103360c10e8dc1cc86eb377aeec5db5 ,
                        0xf9c6eb6e4247762e2a60731b499a4031857322491f68d789615a16c234846338 ,
                        0xd871e47798aeb6e647207f97f7bd05bc6ff3359ffc341a41e31c41460cb5e91a ,
                        0x46c64630393d89f18971482951ce97512c15d157e9c3e2c1c5703d77de771122 ,
                        0x0040d06e771f48c064bccb7986bc723779c98c3dfec59b36160dcf3c575c331c ,
                        0xfecf61bcfae6ab73cfc04044ddfce00038e0780ed6ad5987c18583f33bd0736e ,
                        0x3213cf9fdc83d14a752e0294b80f2f5d705551098da813cd1fc16c84170fbe88 ,
                        0x66d00403c18e05584c204d1134b496dc493d8db898223442ec7b631f06eb8358 ,
                        0xf3b13530b8d11556387b95a90407c78d658001006d22aeaaf84edfe062b4a336 ,
                        0xc2283ceb5110e185032fa0193461934036b563bf643d9259e8ac6eee8b9ce6fe ,
                        0xc8cd5ee92ecf14acdf67a7ac8e2939900746c3511c1a3d849042840811ea10a1 ,
                        0x0c11a621823480c13966df0204002c5e58f88279caf563c4c0fb06cf19c7eb6f ,
                        0xbc8e200ce090818c658db9bde2daf71eab1d7f7f848effa9f616801f0e6c2bed ,
                        0x10473b2fd5fac3accc2b1c53c7506814d09fedef3654ddf9274930a89b030200 ,
                        0xa88d5b9d7c166134ff7fab57eb183b3106ae19b2a695d8157bed7b7f989abcd0 ,
                        0x5f216be9f6c49759b94c01003c78d09e4648e15c1e48806202758068c1d55d80 ,
                        0xa4ad5651499c33f763c7c60000ae322072fc97a317115fb031f3588b279b822d ,
                        0x1d388e837ed68fa22e8242421445400ce858a3516fa0365943de5788b3c16980 ,
                        0x96ec490b29c2702e024484d9f62c20002e09caa0dd17125f77dff215cce15b83 ,
                        0xfb02140b251493222820345b4d4001c16c80e654138d530d2000a84df0787e6a ,
                        0x706cb40b2063998f558cb433b7dca6490a694a90095088e464b5fee68500323e ,
                        0x5fd4a38b516b5b64273cc0240f341834718038117190300965d303b301e6b3e3 ,
                        0xb152b7eedbaebbeb40e116a7a57286478281330e128454a468c8066001b9513b ,
                        0x6d2c8a6cbde3f20b42e50e1f937f6c5db29d00002574a3dd0cbc54a8ee82e2a2 ,
                        0x7bf5003880f6b4e849fc55005eb91cf1f2261beda3caf6ae3315b398641629b2 ,
                        0x80fadf427d21801953b1be9414e09c0638e30e40654075d466003fb81c803421 ,
                        0xc75ecacbb3c3714735d30435246c96497ba3481d6e281290d5a7ba300c00b489 ,
                        0xd70cc5e78b7beff3250069dad6ff93e2924b87bec0588356d3302d141e5fc07b ,
                        0x59595f8562f27199e9ac946e7d20b2789699b9bb2c9a03b0e593863e0d607747 ,
                        0x7dc60dce101b12de722e74981c58b83dd37b21f1dead45a62793dbf3d7d86b74 ,
                        0x8196199c0d1a9cf51b9cf572837ae0a2e0658d4cdc926e6c310d9c2e4604a2cc ,
                        0xe78d2616933f9b8f011f800f08c6607006c1391c438035189c19536a536dd58a ,
                        0x3de37f62a6863d406ba0e026cdf47a36453f2eae74d2da6034952a752a956a3a ,
                        0x91b29a28554ba56c245235cb0db7551feb4c464f2493677340436b23c3775542 ,
                        0xff9ed9de18b001ce08823308c6617006460c4689217785c9674f7476f5487b57 ,
                        0xf39f9536f540f5a4c2af7a61a7b4ce69b4cca4612991e352f98c64960819a4f0 ,
                        0xa1b52788bbba8e86b6d5e8bc24048094a9fb1bf5e8db65720bd3a20dce183863 ,
                        0x109cc1e41ca66030384787a570074c240ca80c7b2eb4461b297a946749a58a96 ,
                        0x12822bc5194945d4ad7f5a432bad756feaeb77ead54057747046979db9d17fd1 ,
                        0x51e0c4f7f151861cd9e0c4e64d81c1394cd1754b70685ba36a8598f142b4fd04 ,
                        0xa19f40ba5a0893152dc14b26e76583f31e83f392e0acd86f660b278e34b3dad7 ,
                        0x07f4afe6b64ff376447a8fde491b69cdb263a53b67ae6c030cdd28b039088373 ,
                        0x248e44622ba49682e40a20801481270c4687c18878ce04870694d25ae659468d ,
                        0xbf5cd5814a1ed78fe87905e79c4da9feabde465fa78161a7727334902061aa0b ,
                        0x70da535b217625624722b114a4711a401244cca079b7cc5a52e48462b260f9e9 ,
                        0xe8bf6baada8afeac9fd0631fd463388fe9a7f52d47de99fc0d8d40f78b0c3823 ,
                        0x70462041482c85c452881d898e9722caa40833093a7e8ad84d11db5d30cb15a8 ,
                        0x1f0dbdb70f4ee78f1d6feec5109e3e9fd6450f26741b7dd5cd9abf65050c5db7 ,
                        0x7600534680b69f20caa488fc14919722762534d31031831508b88189a5a70a38 ,
                        0x7ea08937df9ede0fe0bbfa293d7e418d4b1ecd3691010377798e79ffd54bca0b ,
                        0x46440dfc4a82ecd558b4380b6d01af1d3f05f11e031b03865505af1e9e38a1a0 ,
                        0xefd5bbf51e5cc22eff704a44d888d550f81234d680d0e7db467f184b2e959a00 ,
                        0x3001e010801750c641bd43a797d5ef473d9e7f54fb2ff333ccf53b73de020000 ,
                        0x0025744558746372656174652d6461746500323030392d31312d31355431373a ,
                        0x30323a33372d30373a3030870f948f0000002574455874646174653a63726561 ,
                        0x746500323031302d30322d32305432333a32363a31382d30373a303067ec3d41 ,
                        0x0000002574455874646174653a6d6f6469667900323031302d30312d31315430 ,
                        0x393a33303a31332d30373a30305db390b700000067744558744c6963656e7365 ,
                        0x00687474703a2f2f6372656174697665636f6d6d6f6e732e6f72672f6c696365 ,
                        0x6e7365732f62792d73612f332e302f206f7220687474703a2f2f637265617469 ,
                        0x7665636f6d6d6f6e732e6f72672f6c6963656e7365732f4c47504c2f322e312f ,
                        0x5b8f3c6300000025744558746d6f646966792d6461746500323030392d30332d ,
                        0x31395431303a35323a34382d30363a3030265ab84b0000001974455874536f66 ,
                        0x7477617265007777772e696e6b73636170652e6f72679bee3c1a000000137445 ,
                        0x5874536f75726365004f787967656e2049636f6e73ec18aee800000027744558 ,
                        0x74536f757263655f55524c00687474703a2f2f7777772e6f787967656e2d6963 ,
                        0x6f6e732e6f72672fef37aacb0000000049454e44ae426082
                    End

                    LayoutCachedLeft =17347
                    LayoutCachedTop =113
                    LayoutCachedWidth =17917
                    LayoutCachedHeight =683
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
                Begin Rectangle
                    Visible = NotDefault
                    SpecialEffect =0
                    BackStyle =1
                    OldBorderStyle =0
                    OverlapFlags =255
                    Left =56
                    Width =17978
                    Height =858
                    BorderColor =10921638
                    Name ="boxCache"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedWidth =18034
                    LayoutCachedHeight =858
                    BackThemeColorIndex =3
                    BackShade =25.0
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =247
                    TextAlign =3
                    Left =396
                    Top =113
                    Width =1935
                    Height =315
                    BorderColor =8355711
                    ForeColor =13421772
                    Name ="lbl_InfoScan1"
                    Caption ="Analyse :"
                    GridlineColor =10921638
                    LayoutCachedLeft =396
                    LayoutCachedTop =113
                    LayoutCachedWidth =2331
                    LayoutCachedHeight =428
                    ForeTint =20.0
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =247
                    Left =2437
                    Top =113
                    Width =11175
                    Height =285
                    FontSize =10
                    BorderColor =8355711
                    ForeColor =16777215
                    Name ="lbl_InfoScan2"
                    FontName ="Verdana"
                    GridlineColor =10921638
                    LayoutCachedLeft =2437
                    LayoutCachedTop =113
                    LayoutCachedWidth =13612
                    LayoutCachedHeight =398
                    ThemeFontIndex =-1
                    ForeTint =0.0
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    OldBorderStyle =1
                    OverlapFlags =247
                    TextFontCharSet =2
                    TextFontFamily =18
                    Left =2444
                    Top =454
                    Width =255
                    Height =300
                    FontSize =8
                    FontWeight =700
                    BorderColor =8355711
                    Name ="lbl_InfoScan3"
                    Caption ="a"
                    FontName ="Webdings"
                    GridlineColor =10921638
                    LayoutCachedLeft =2444
                    LayoutCachedTop =454
                    LayoutCachedWidth =2699
                    LayoutCachedHeight =754
                    ThemeFontIndex =-1
                    BackThemeColorIndex =7
                    BackTint =20.0
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =10601
            Name ="Détail"
            AlternateBackColor =15921906
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ListBox
                    OverlapFlags =119
                    IMESentenceMode =3
                    ColumnCount =3
                    Left =13039
                    Top =510
                    Width =5163
                    Height =4305
                    ColumnOrder =0
                    TabIndex =4
                    ForeColor =4210752
                    BorderColor =5855577
                    Name ="lstObjets"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;0;5103"
                    AfterUpdate ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =13039
                    LayoutCachedTop =510
                    LayoutCachedWidth =18202
                    LayoutCachedHeight =4815
                    BackThemeColorIndex =4
                    BackTint =40.0
                    BorderShade =35.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            Left =13039
                            Top =170
                            Width =5160
                            Height =345
                            FontSize =12
                            ForeColor =5066061
                            Name ="lbl_lstObjets"
                            Caption ="Objets"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =13039
                            LayoutCachedTop =170
                            LayoutCachedWidth =18199
                            LayoutCachedHeight =515
                            ThemeFontIndex =-1
                            BackThemeColorIndex =4
                            BackTint =60.0
                            BorderThemeColorIndex =1
                            BorderTint =100.0
                            BorderShade =35.0
                            ForeTint =70.0
                            GridlineThemeColorIndex =-1
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =85
                    Left =737
                    Top =7540
                    Width =11610
                    Height =2655
                    TabIndex =7
                    BorderColor =10921638
                    Name ="SF_Textes"
                    SourceObject ="Form.F_MainSFTextes"
                    LinkChildFields ="Trad_ID"
                    LinkMasterFields ="txt_SFControlID"
                    GridlineColor =10921638

                    LayoutCachedLeft =737
                    LayoutCachedTop =7540
                    LayoutCachedWidth =12347
                    LayoutCachedHeight =10195
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =170
                            Top =7540
                            Width =375
                            Height =2655
                            FontSize =12
                            BorderColor =8355711
                            Name ="F_ObjetControlesÉtiquette"
                            Caption ="Propriétés"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =7540
                            LayoutCachedWidth =545
                            LayoutCachedHeight =10195
                            ThemeFontIndex =-1
                            BackThemeColorIndex =5
                            BackTint =60.0
                            BorderThemeColorIndex =-1
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                            GridlineThemeColorIndex =-1
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =85
                    Left =737
                    Top =1928
                    Width =11610
                    Height =5040
                    TabIndex =5
                    BorderColor =10921638
                    Name ="SF_Controles"
                    SourceObject ="Form.F_MainSFControles"
                    LinkChildFields ="ObjetParent_ID"
                    LinkMasterFields ="lstObjets"
                    GridlineColor =10921638

                    LayoutCachedLeft =737
                    LayoutCachedTop =1928
                    LayoutCachedWidth =12347
                    LayoutCachedHeight =6968
                    Begin
                        Begin Label
                            Vertical = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =2
                            Left =170
                            Top =1928
                            Width =375
                            Height =5040
                            FontSize =12
                            BorderColor =8355711
                            Name ="F_ObjetControles1Étiquette"
                            Caption ="Contrôles"
                            FontName ="Arial"
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =1928
                            LayoutCachedWidth =545
                            LayoutCachedHeight =6968
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
                    Visible = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    DecimalPlaces =0
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3231
                    Top =7143
                    Width =4251
                    Height =315
                    ColumnOrder =1
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txt_SFControlID"
                    ControlSource ="=[SF_Controles].[Form]![Control_ID]"
                    GridlineColor =10921638

                    LayoutCachedLeft =3231
                    LayoutCachedTop =7143
                    LayoutCachedWidth =7482
                    LayoutCachedHeight =7458
                End
                Begin TextBox
                    Visible = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =9978
                    Top =7145
                    Width =1356
                    Height =315
                    ColumnOrder =2
                    TabIndex =8
                    BackColor =15921906
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtBddSauve"
                    GridlineColor =10921638

                    LayoutCachedLeft =9978
                    LayoutCachedTop =7145
                    LayoutCachedWidth =11334
                    LayoutCachedHeight =7460
                    BackShade =95.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =7994
                            Top =7145
                            Width =1860
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_txtBddSauve"
                            Caption ="Sauvegarde :"
                            GridlineColor =10921638
                            LayoutCachedLeft =7994
                            LayoutCachedTop =7145
                            LayoutCachedWidth =9854
                            LayoutCachedHeight =7460
                        End
                    End
                End
                Begin Line
                    OverlapFlags =93
                    Left =4914
                    Top =742
                    Width =2805
                    Name ="LineBaseTypes"
                    GridlineColor =10921638
                    LayoutCachedLeft =4914
                    LayoutCachedTop =742
                    LayoutCachedWidth =7719
                    LayoutCachedHeight =742
                End
                Begin Image
                    Left =7651
                    Top =623
                    Width =240
                    Height =240
                    BorderColor =10921638
                    Name ="imgFDroite1"
                    Picture ="ic_FlecheDroite.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x610000000467414d410000afc837058ae900000006624b4744000000000000f9 ,
                        0x43bb7f000000097048597300000048000000480046c96b3e0000000976704167 ,
                        0x0000001000000010005cc6adc30000022d4944415438cba5934f48146118c67f ,
                        0xdfccecceeecc8eebaa0d6359e9a2649821529252d04d2408ba74890eddec9f87 ,
                        0x40a82ee1b5434511a61b1e2a3c55d4c910a28b64204404750895a012945c5773 ,
                        0x9d717667be0ea590590abef0c27bfaf1f0bccf23a4946c65b49523da9219ad76 ,
                        0xac43dfa71727e7e68a97b053cfd12d9051d00d4858a0c44135c13490992400ca ,
                        0x0a4097347577b591b9d19e4ed7553c23e7df25086dc4ff15ac02420959a9d0d0 ,
                        0xb693fb373b387962cf3965397c49208f6f0ae011c98e8ccef0ea43c8676972b6 ,
                        0xf320d72f1fd8e754184f28c8db8432be1e40ac98285a1fb5e2abb76a1b77b5b4 ,
                        0xb5efa7a4cca27907a4a44bdfe36f0c8fe5df87ba719e7862848481ec4fae011c ,
                        0x1e0411b3f0942ba6537631dd549b309c4a1aab04c7f686bcfb98e3ced31fb9ec ,
                        0xa2d64779a2476692ee3a00fdd7c6ad6654bdd7b42b5a347b379619e1cc11a84b ,
                        0x16b8f722cfeb09e58d1c2869fde38dd8f510f27bc582650857d754e63dc97c01 ,
                        0xfa47a0a341256ec55022acfaa1adf1c4a4105e701ca3bba9c12e1f77cb595a14 ,
                        0xa4b7498acb3e83c345cff794014cf5eadf0029eb85a4b7a63675b4b2a68ab759 ,
                        0x1d57c2f6544076c66736174c8452ed222a8600b98e0265a8b4caae2eda958c4d ,
                        0x2924625012f1f9fa6519cf571fa2695d84e408ff1165118d394b6a296e5ea134 ,
                        0x1e50f45ca6a6834929b41e34f160c32e484d4751144ce1b330ebe2f90ca2aad7 ,
                        0x80f14d2551a8faa7c075999bcd4f7b3ea7d1d45308c6d9a0ac62ab75fe09ccc0 ,
                        0xd098256667c000000025744558746372656174652d6461746500323030392d31 ,
                        0x312d31355431363a30383a34312d30373a303024aee1e0000000257445587464 ,
                        0x6174653a63726561746500323031302d30322d32305432333a32363a31352d30 ,
                        0x373a3030063b5c810000002574455874646174653a6d6f646966790032303130 ,
                        0x2d30312d31315430393a31383a33392d30373a3030f05d31b100000035744558 ,
                        0x744c6963656e736500687474703a2f2f6372656174697665636f6d6d6f6e732e ,
                        0x6f72672f6c6963656e7365732f4c47504c2f322e312f3bc1b418000000257445 ,
                        0x58746d6f646966792d6461746500323030392d31312d31355431363a30383a34 ,
                        0x312d30373a30307b1f97d40000001974455874536f6674776172650041646f62 ,
                        0x6520496d616765526561647971c9653c0000000d74455874536f75726365004e ,
                        0x75766f6c61ac4f35f10000003474455874536f757263655f55524c0068747470 ,
                        0x3a2f2f7777772e69636f6e2d6b696e672e636f6d2f70726f6a656374732f6e75 ,
                        0x766f6c612f763db4520000000049454e44ae426082
                    End

                    LayoutCachedLeft =7651
                    LayoutCachedTop =623
                    LayoutCachedWidth =7891
                    LayoutCachedHeight =863
                    TabIndex =10
                End
                Begin CommandButton
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =735
                    Top =1560
                    Width =975
                    Height =330
                    TabIndex =1
                    ForeColor =4210752
                    Name ="cmdAfficheInfo"
                    Caption =" Info"
                    OnClick ="[Event Procedure]"
                    Picture ="ic_Aide.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x6100000006624b4744000000000000f943bb7f000000097048597300000b1300 ,
                        0x000b1301009a9c1800000009767041670000001000000010005cc6adc3000002 ,
                        0xf94944415438cb6593cb6b9c6514c67fef65be4c663293cb64a663c624a498b4 ,
                        0x915034501a94d2228a141762a9086ebcac05372e15d78a0bff02bb100cdec085 ,
                        0x1b15b1246dbca0ad42ad99d4a44dc98dce64ee97cc37dff71e176924c60367f7 ,
                        0x3cbf730e9c47f1ff1a323632d33798396f6303534ed041bb76b75dbdbf10f89d ,
                        0x1b4011080fc4ea90d100934323c7df489f9cbb94187b6c58e2695ddf0b099b25 ,
                        0xf1b76f556bab3f7d53df5cf9d089bb01f847018f66271fff60fceccbcf78a3b3 ,
                        0xd627821f0ab5764037142c21bab8ec2abf7ef6fb6e7ee94d11f91108cd03737a ,
                        0x7874eadd89a75ebf68c7cf58df698c8644d4628da2e58704a291be8c4a0ce7b2 ,
                        0xd4b71e6e9777ae02650b9888d733979d3977d11b9b357ba190497abcffd23483 ,
                        0xf1084e845fd6aabcfd459efa5e80a4a6546ae6e973adc2fa8576adf49106fa93 ,
                        0x99b1e7fa1f3993ec8a45447876264d27745c5ebcc7d2ed32e7a753bc783a8b52 ,
                        0xa09422363edb933836f13c306c81647c68645627b2ca778208fc7dbfc9fccf9b ,
                        0x941b5d32c91ece9e48911b8a62b5c268858da788a7c74e70fbb7010b446d2c31 ,
                        0xe84c0fce09a10857964b844e48273dde796112a315d7ef56d16a1fa0adc58bf7 ,
                        0xf76945bf06101786ce399c8008382738275c3afd1033b9240bf95dbebd592462 ,
                        0xf601462b940b9d08be069a9d467913bf8113f94f0fc4227c77b3c05bf3b7fe35 ,
                        0x1aadb0e2e3377677051a1a28370b1bd73ac53b210a8250f003210821bfd3e08f ,
                        0x7bd507b783d1608d426adb52dfb9731d2868a0512b6c7c5dfa6b6143da55da5d ,
                        0x871fee6ff0cadc08af3e913b345d13555d2acb8b95caf6daa740f5e091aa7ebd ,
                        0x24d1dede2723a9e39100831398cec529363a5cc957f08c266e1d9dd5abddf5a5 ,
                        0x2f2f37abbb9f00b50380dfedb456fdf206bdda3f151fc8449517e3877c85c595 ,
                        0x0ab108c4820aadfcf7edf56b9fcf97b6d6de03368e660120edc51217fa73275f ,
                        0xebcb4d9ff206b271638c72cd62bbb1b9bc525afff3e356adf415b07590c8a300 ,
                        0x000f38668c9df07a63a3a06c77afb51504dd55601b681f16ff03d141689ccdfb ,
                        0x012a0000001d74455874436f6d6d656e74004372656174656420776974682054 ,
                        0x68652047494d50ef64256e00000025744558746372656174652d646174650032 ,
                        0x3030392d31312d31375432303a30363a35352d30373a303059a62abb00000025 ,
                        0x74455874646174653a63726561746500323031302d30312d31315431343a3239 ,
                        0x3a35392d30373a3030eb6c0cbd0000002574455874646174653a6d6f64696679 ,
                        0x00323031302d30312d31315431343a32393a35392d30373a30309a31b4010000 ,
                        0x0034744558744c6963656e736500687474703a2f2f6372656174697665636f6d ,
                        0x6d6f6e732e6f72672f6c6963656e7365732f47504c2f322e302f6c6a06a80000 ,
                        0x0025744558746d6f646966792d6461746500323030392d31312d31375432303a ,
                        0x30363a35352d30373a303006175c8f0000001874455874536f7572636500496e ,
                        0x7472696775652049636f6e20536574ae27a13f0000004674455874536f757263 ,
                        0x655f55524c00687474703a2f2f73696d706c65696e6e6f766174696f6e2e6e65 ,
                        0x742f696e6465782e7068703f706167653d323226736f757263653d322669643d ,
                        0x329541f9c60000000049454e44ae426082
                    End

                    LayoutCachedLeft =735
                    LayoutCachedTop =1560
                    LayoutCachedWidth =1710
                    LayoutCachedHeight =1890
                    PictureCaptionArrangement =5
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
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    ListWidth =2085
                    Left =1081
                    Top =638
                    Width =3861
                    Height =300
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"\";\"10\";\"100\""
                    Name ="zlBases"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Apps"
                    ColumnWidths ="2085"
                    AfterUpdate ="[Event Procedure]"
                    OnGotFocus ="=OuvreZl()"
                    ControlTipText ="Liste des applications déjà enregistrées,"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1081
                    LayoutCachedTop =638
                    LayoutCachedWidth =4942
                    LayoutCachedHeight =938
                    BackThemeColorIndex =7
                    BackTint =20.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            TextFontFamily =49
                            Left =1081
                            Top =283
                            Width =3855
                            Height =360
                            FontWeight =500
                            BorderColor =8355711
                            ForeColor =5066061
                            Name ="lbl_zlBases"
                            Caption ="Bases"
                            FontName ="Consolas"
                            GridlineColor =10921638
                            LayoutCachedLeft =1081
                            LayoutCachedTop =283
                            LayoutCachedWidth =4936
                            LayoutCachedHeight =643
                            ThemeFontIndex =-1
                            BackThemeColorIndex =7
                            BackTint =50.0
                            ForeTint =70.0
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2493
                    Top =1020
                    Width =2046
                    Height =315
                    BorderColor =10921638
                    ForeColor =8355711
                    Name ="txtDateScan"
                    Format ="General Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =2493
                    LayoutCachedTop =1020
                    LayoutCachedWidth =4539
                    LayoutCachedHeight =1335
                    ForeTint =50.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =1077
                            Top =1020
                            Width =1305
                            Height =315
                            BorderColor =8355711
                            ForeColor =10066329
                            Name ="lbl_txtDateScan"
                            Caption ="Scan du :"
                            GridlineColor =10921638
                            LayoutCachedLeft =1077
                            LayoutCachedTop =1020
                            LayoutCachedWidth =2382
                            LayoutCachedHeight =1335
                            ForeTint =40.0
                        End
                    End
                End
                Begin CommandButton
                    Enabled = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    Left =4620
                    Top =1020
                    Width =330
                    Height =330
                    TabIndex =9
                    ForeColor =4210752
                    Name ="cmdVoirRecap"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Affiche la récap du dernier scan,,,"
                    Picture ="ic_cmdRecap.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x6100000006624b4744000000000000f943bb7f000000097048597300000b1300 ,
                        0x000b1301009a9c1800000009767041670000001000000010005cc6adc3000002 ,
                        0xde4944415438cb6593cb6b5c7514c73fbfc7dc645ec9cce4d1b4691212d21825 ,
                        0x548d8b068b444417ddb82882d09ddd0982fb6e5c0b2efc0f5c088a8a20e24650 ,
                        0x84be74a15684b649216d53279962e69179e566eedc7b4e174924c40367f73d9f ,
                        0x2fe765f87f949c4f2de58ae3affb4c6141141b87adc761f3dfeb71d4bb035481 ,
                        0xe4486c8e153ae05ce9ccdc07638b2befe4a75f1ad5ec986def2724ddba46957b ,
                        0xcdd6c66f3fb6b71e7c2a2a7780e824e08589732f7f32f3da95b782a9651f9122 ,
                        0x16a5bd9fb0df173c09b6ba26bbbf7ffd576dfdf687aafa2b90b8c3e2b1d1a985 ,
                        0x8f66dfb87ad9cf5cf0915814e595d96156174b3ca985b47a82e6c64d7e747282 ,
                        0xf6f6d9b0f1f426d0b0804b05032b134bab9783e965d717455431185e9c1ae2da ,
                        0xdb0b9c1a1e000555d0910533b2f4e66a7aa87409483ba0583c3df7fed98befbe ,
                        0x1aa7c74da2200ab1283bad1ebfdcab72b7dca1170bce8077964c7ec84795fba9 ,
                        0x6ebdf2930586b2a533cb363f6112515414116524177061bec8ca7c91522e852a ,
                        0x586b70d6e0b32364c7a69f030a1618f4997c51dc00224aa20719c5c2fc7886ab ,
                        0xab33143229ac017708b0de13648773d630ec0154924444100efa14857a27e249 ,
                        0x6dffbf15590bfe10e02c18494495c802dd5ea7b145d441f46080aa4a2c4a2c72 ,
                        0x702cc7dc9d35788d883ab59a42c7028dee4ef956affa28c1409c2851ac006407 ,
                        0x3c0085b4277007cede19b455d1f6d3477f023b16e8b476ca3fd4ef5f2f6bd824 ,
                        0xec0bbd5828e50200beffa3c2e9c220d9018fb58641d36777edc6ee6ee5e15740 ,
                        0xf3e8909a51bbae83e9f4c5d4c85c2a369e3012fefea7c58df53a8fab21b12859 ,
                        0x2ff4366ef6376f7ffb59b759fb02681d01a27e6f6f236a9449dbe87cb6303ea8 ,
                        0xa934510282e28c90899becadff1c6edefae6cbfaf6c38f81f2c95f00180b32f9 ,
                        0x4bc3938befe5269f3f1f1426b2ce3923dd6ad8d95a7b50dfbcfbf95eabfe1db0 ,
                        0x7df4912701000170ca393f1ba43353607c7f7f6f3b8efb1b4005088f8b9f01eb ,
                        0x425e23dd7157870000001d74455874436f6d6d656e7400437265617465642077 ,
                        0x697468205468652047494d50ef64256e00000025744558746372656174652d64 ,
                        0x61746500323030392d31312d31375432303a30363a35352d30373a303059a62a ,
                        0xbb0000002574455874646174653a63726561746500323031302d30322d313754 ,
                        0x31353a34393a33382d30373a30304e90f2050000002574455874646174653a6d ,
                        0x6f6469667900323031302d30312d31315431343a32393a35392d30373a30309a ,
                        0x31b40100000034744558744c6963656e736500687474703a2f2f637265617469 ,
                        0x7665636f6d6d6f6e732e6f72672f6c6963656e7365732f47504c2f322e302f6c ,
                        0x6a06a800000025744558746d6f646966792d6461746500323030392d31312d31 ,
                        0x375432303a30363a35352d30373a303006175c8f0000001874455874536f7572 ,
                        0x636500496e7472696775652049636f6e20536574ae27a13f0000004674455874 ,
                        0x536f757263655f55524c00687474703a2f2f73696d706c65696e6e6f76617469 ,
                        0x6f6e2e6e65742f696e6465782e7068703f706167653d323226736f757263653d ,
                        0x322669643d329541f9c60000000049454e44ae426082
                    End

                    LayoutCachedLeft =4620
                    LayoutCachedTop =1020
                    LayoutCachedWidth =4950
                    LayoutCachedHeight =1350
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
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =119
                    DecimalPlaces =0
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =7880
                    Top =959
                    Width =1761
                    Height =330
                    TabIndex =3
                    BoundColumn =-1
                    BorderColor =5855577
                    Name ="zlObjetTypes"
                    RowSourceType ="Value List"
                    RowSource ="0;Tous;1;Form;2;Report"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="[Event Procedure]"
                    DefaultValue ="0"
                    OnGotFocus ="=OuvreZl()"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =7880
                    LayoutCachedTop =959
                    LayoutCachedWidth =9641
                    LayoutCachedHeight =1289
                    BackThemeColorIndex =3
                    BackShade =90.0
                    BorderShade =35.0
                    ForeThemeColorIndex =0
                    ForeTint =70.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            OverlapFlags =127
                            TextAlign =2
                            Left =7869
                            Top =623
                            Width =1770
                            Height =330
                            ForeColor =5066061
                            Name ="lbl_zlObjetTypes"
                            Caption ="Types"
                            GridlineColor =10921638
                            LayoutCachedLeft =7869
                            LayoutCachedTop =623
                            LayoutCachedWidth =9639
                            LayoutCachedHeight =953
                            BackThemeColorIndex =3
                            BackShade =75.0
                            BorderThemeColorIndex =1
                            BorderTint =100.0
                            BorderShade =35.0
                            ForeTint =70.0
                        End
                    End
                End
                Begin Line
                    OverlapFlags =93
                    Left =8728
                    Top =345
                    Width =4020
                    Name ="LineTypesObj2"
                    GridlineColor =10921638
                    LayoutCachedLeft =8728
                    LayoutCachedTop =345
                    LayoutCachedWidth =12748
                    LayoutCachedHeight =345
                End
                Begin Image
                    Left =12755
                    Top =226
                    Width =240
                    Height =240
                    BorderColor =10921638
                    Name ="imgFDroite2"
                    Picture ="ic_FlecheDroite.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x610000000467414d410000afc837058ae900000006624b4744000000000000f9 ,
                        0x43bb7f000000097048597300000048000000480046c96b3e0000000976704167 ,
                        0x0000001000000010005cc6adc30000022d4944415438cba5934f48146118c67f ,
                        0xdfccecceeecc8eebaa0d6359e9a2649821529252d04d2408ba74890eddec9f87 ,
                        0x40a82ee1b5434511a61b1e2a3c55d4c910a28b64204404750895a012945c5773 ,
                        0x9d717667be0ea590590abef0c27bfaf1f0bccf23a4946c65b49523da9219ad76 ,
                        0xac43dfa71727e7e68a97b053cfd12d9051d00d4858a0c44135c13490992400ca ,
                        0x0a4097347577b591b9d19e4ed7553c23e7df25086dc4ff15ac02420959a9d0d0 ,
                        0xb693fb373b387962cf3965397c49208f6f0ae011c98e8ccef0ea43c8676972b6 ,
                        0xf320d72f1fd8e754184f28c8db8432be1e40ac98285a1fb5e2abb76a1b77b5b4 ,
                        0xb5efa7a4cca27907a4a44bdfe36f0c8fe5df87ba719e7862848481ec4fae011c ,
                        0x1e0411b3f0942ba6537631dd549b309c4a1aab04c7f686bcfb98e3ced31fb9ec ,
                        0xa2d64779a2476692ee3a00fdd7c6ad6654bdd7b42b5a347b379619e1cc11a84b ,
                        0x16b8f722cfeb09e58d1c2869fde38dd8f510f27bc582650857d754e63dc97c01 ,
                        0xfa47a0a341256ec55022acfaa1adf1c4a4105e701ca3bba9c12e1f77cb595a14 ,
                        0xa4b7498acb3e83c345cff794014cf5eadf0029eb85a4b7a63675b4b2a68ab759 ,
                        0x1d57c2f6544076c66736174c8452ed222a8600b98e0265a8b4caae2eda958c4d ,
                        0x2924625012f1f9fa6519cf571fa2695d84e408ff1165118d394b6a296e5ea134 ,
                        0x1e50f45ca6a6834929b41e34f160c32e484d4751144ce1b330ebe2f90ca2aad7 ,
                        0x80f14d2551a8faa7c075999bcd4f7b3ea7d1d45308c6d9a0ac62ab75fe09ccc0 ,
                        0xd098256667c000000025744558746372656174652d6461746500323030392d31 ,
                        0x312d31355431363a30383a34312d30373a303024aee1e0000000257445587464 ,
                        0x6174653a63726561746500323031302d30322d32305432333a32363a31352d30 ,
                        0x373a3030063b5c810000002574455874646174653a6d6f646966790032303130 ,
                        0x2d30312d31315430393a31383a33392d30373a3030f05d31b100000035744558 ,
                        0x744c6963656e736500687474703a2f2f6372656174697665636f6d6d6f6e732e ,
                        0x6f72672f6c6963656e7365732f4c47504c2f322e312f3bc1b418000000257445 ,
                        0x58746d6f646966792d6461746500323030392d31312d31355431363a30383a34 ,
                        0x312d30373a30307b1f97d40000001974455874536f6674776172650041646f62 ,
                        0x6520496d616765526561647971c9653c0000000d74455874536f75726365004e ,
                        0x75766f6c61ac4f35f10000003474455874536f757263655f55524c0068747470 ,
                        0x3a2f2f7777772e69636f6e2d6b696e672e636f6d2f70726f6a656374732f6e75 ,
                        0x766f6c612f763db4520000000049454e44ae426082
                    End

                    LayoutCachedLeft =12755
                    LayoutCachedTop =226
                    LayoutCachedWidth =12995
                    LayoutCachedHeight =466
                    TabIndex =11
                End
                Begin Line
                    LineSlant = NotDefault
                    OverlapFlags =119
                    Left =8730
                    Top =346
                    Width =0
                    Height =277
                    Name ="LineTypesObj1"
                    GridlineColor =10921638
                    LayoutCachedLeft =8730
                    LayoutCachedTop =346
                    LayoutCachedWidth =8730
                    LayoutCachedHeight =623
                End
                Begin Image
                    Left =12359
                    Top =3741
                    Width =240
                    Height =240
                    BorderColor =10921638
                    Name ="imgFGauche1"
                    Picture ="ic_FlecheGauche.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x610000000467414d410000afc837058ae900000006624b4744000000000000f9 ,
                        0x43bb7f000000097048597300000048000000480046c96b3e0000000976704167 ,
                        0x0000001000000010005cc6adc3000002404944415438cba5924b48546118869f ,
                        0xff9f337366e6d84cea4c65d09025628410a65dac50a908da84bb08da44058a20 ,
                        0x162ddcba10da649b0aa168d1a6166d82a2eb220831f256d8c5442d75129dd1d1 ,
                        0x9971eee7fc2d440415917ae1836ff1f27c7cbcaf504af13fd2961751d109a92c ,
                        0xe81ad86d90c88200743b5816449267bd7ea3c35fe429fd1dcaf466ba2e5602c8 ,
                        0x8df9024cab8048f276a038ff59e7cdd3a5add76a70daf4fdcb8e8d01a6754626 ,
                        0x32efeacfed6b7e70a7de76a06e37734a62da1c6b5f58392ac0520eb266bbdfe7 ,
                        0x6ebade78543f525bc6e8a264f8abc5878f61d2680beb03848054ee10d9dcbd93 ,
                        0xb57b2a1a1baa89bb0b79fa0da2e128dd6f0719fa1eeac5a5df580fe0229169f5 ,
                        0x16b81b9a5aaa7d5575e5bcfca9d13f6691981c63ac6f28199f4ddec56bb4a1c9 ,
                        0xe85a40ce7c7db8a6e478c3d56ac6ad429a9f40643e891ae9213613eec7a635e2 ,
                        0xb2778362695601a4102e97c7c9fb499d572330350732adf04a81c770a6a2a67b ,
                        0x01a7016e037463e5ebe52289839d6e629976bb7fdbe5c0b14ac35154cc4458e2 ,
                        0xd72dcaec41be0cfe990f86d52d3cde0e9c465c3d0aac8a5191c0656fc96633f5 ,
                        0xa35dfd43a1810176180922a6e4536217818af2ad2565be36897a81a5cad7ef81 ,
                        0x42a1d9de28875e159e0cdd9fe8f9acf2d261108abe293719df5ef2776e3f8194 ,
                        0xcf372e921031a4bc924e9917823f7e0d5bb341f2dd3966e282185b100ea77f73 ,
                        0x4d14e2b1928e5373d3b187f3c169f2641a4d13289b93cd01961ce368daa554d2 ,
                        0x3a1f092d0673992cc26e1f5b93c2bfea2f8dc5e2c3dcdef5c900000025744558 ,
                        0x746372656174652d6461746500323030392d31312d31355431363a30383a3431 ,
                        0x2d30373a303024aee1e00000002574455874646174653a637265617465003230 ,
                        0x31302d30322d32305432333a32363a31352d30373a3030063b5c810000002574 ,
                        0x455874646174653a6d6f6469667900323031302d30312d31315430393a31383a ,
                        0x33392d30373a3030f05d31b100000035744558744c6963656e73650068747470 ,
                        0x3a2f2f6372656174697665636f6d6d6f6e732e6f72672f6c6963656e7365732f ,
                        0x4c47504c2f322e312f3bc1b41800000025744558746d6f646966792d64617465 ,
                        0x00323030392d31312d31355431363a30383a34312d30373a30307b1f97d40000 ,
                        0x001974455874536f6674776172650041646f626520496d616765526561647971 ,
                        0xc9653c0000000d74455874536f75726365004e75766f6c61ac4f35f100000034 ,
                        0x74455874536f757263655f55524c00687474703a2f2f7777772e69636f6e2d6b ,
                        0x696e672e636f6d2f70726f6a656374732f6e75766f6c612f763db45200000000 ,
                        0x49454e44ae426082
                    End

                    LayoutCachedLeft =12359
                    LayoutCachedTop =3741
                    LayoutCachedWidth =12599
                    LayoutCachedHeight =3981
                    TabIndex =12
                End
                Begin Line
                    OverlapFlags =127
                    Left =12585
                    Top =3855
                    Width =454
                    Name ="LineObjCtr"
                    GridlineColor =10921638
                    LayoutCachedLeft =12585
                    LayoutCachedTop =3855
                    LayoutCachedWidth =13039
                    LayoutCachedHeight =3855
                End
                Begin Image
                    Left =11730
                    Top =7290
                    Width =240
                    Height =240
                    BorderColor =10921638
                    Name ="imgFBas1"
                    Picture ="ic_FlecheBas.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x610000000467414d410000afc837058ae900000006624b4744000000000000f9 ,
                        0x43bb7f000000097048597300000048000000480046c96b3e0000000976704167 ,
                        0x0000001000000010005cc6adc30000023c4944415438cbc593cd4b546114c67f ,
                        0xef7befdceb7cf95ddacc485aa652a1d320266d8ce84fc895db7053b988242222 ,
                        0xa45d6dda98445264e12217452d5c4881104cb44bdc248d4660ea4c33ce87f365 ,
                        0xf7deb785a422b672d181b339f0fce09ce7394229c5414a1e480de80066cf93a8 ,
                        0x07c2968282ada51c8ff7128619c571a02a0802b09d0e949cd6cd8a46a5bb7034 ,
                        0x63c1996cedd2018e05fcbdf787cf51d224d3d1b5c0b389af0f71898be8460e04 ,
                        0xd88e57b39db1b6d38166e5af23bd214824d29ddb2bc457f34b5e29e9ef0d3178 ,
                        0xf90ce1ee500f39750b770d080179eb6ae444f5f9ee4813787c6ca261db626d1b ,
                        0x904a96ae0fde8bb2b092c7e392f40f84a93aecbf46d98a6039ad75f515c3ed91 ,
                        0x66e65624f15f16eb6beba0d48d9d23d6fadec416738fee8cce5351561c095472 ,
                        0xf6429b0f25c634d4f8c970b06ea9e8653909d95416e5389348ede50e40d7a0c6 ,
                        0x3d3235f373fef5fb65821e68690fd170f4504f657d759faa69e47b0272990256 ,
                        0xb1b488a6df05b5cb46c706a1e2cad46f3f781eb3e2ab059a6a052d9dc70976b4 ,
                        0xb0bc2e48a52dcab91c68da08f06dcb9abf00c30b86070ce36d32638f8dbefa41 ,
                        0xa0d2c1e731d8b04d92594531930378819013080952db05a80a41650378fce037 ,
                        0x6f7efa92999bfd9ca2eb2824b290cf16c1fe1d436a43fb2751d9a01c500a8428 ,
                        0x62e857a66692696bb3cca9808d9dcd9790720848ff03a076da7140971f0b25f5 ,
                        0xf8dd6c86427603e02988e9fda22c94528881d8de3108e106f38370996e25451f ,
                        0x82cc5eb11aafdd02fcd76ffc035eede5e276e52a9b0000002574455874637265 ,
                        0x6174652d6461746500323030392d31312d31355431363a30383a34312d30373a ,
                        0x303024aee1e00000002574455874646174653a63726561746500323031302d30 ,
                        0x322d32305432333a32363a31352d30373a3030063b5c81000000257445587464 ,
                        0x6174653a6d6f6469667900323031302d30312d31315430393a31383a33392d30 ,
                        0x373a3030f05d31b100000035744558744c6963656e736500687474703a2f2f63 ,
                        0x72656174697665636f6d6d6f6e732e6f72672f6c6963656e7365732f4c47504c ,
                        0x2f322e312f3bc1b41800000025744558746d6f646966792d6461746500323030 ,
                        0x392d31312d31355431363a30383a34312d30373a30307b1f97d4000000197445 ,
                        0x5874536f6674776172650041646f626520496d616765526561647971c9653c00 ,
                        0x00000d74455874536f75726365004e75766f6c61ac4f35f10000003474455874 ,
                        0x536f757263655f55524c00687474703a2f2f7777772e69636f6e2d6b696e672e ,
                        0x636f6d2f70726f6a656374732f6e75766f6c612f763db4520000000049454e44 ,
                        0xae426082
                    End

                    LayoutCachedLeft =11730
                    LayoutCachedTop =7290
                    LayoutCachedWidth =11970
                    LayoutCachedHeight =7530
                    TabIndex =13
                End
                Begin Line
                    LineSlant = NotDefault
                    OverlapFlags =85
                    Left =11850
                    Top =6990
                    Width =0
                    Height =283
                    Name ="LineCtrProp"
                    GridlineColor =10921638
                    LayoutCachedLeft =11850
                    LayoutCachedTop =6990
                    LayoutCachedWidth =11850
                    LayoutCachedHeight =7273
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="PiedFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
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
' DateMod  : 23/07/2022 - 09:40
' Requi    :
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private ObjetAcc    As C_ObjetsAccess
    Private ScanTxt     As C_TradScanText

    Private m_AjoutLangue As Boolean    '// Indique a la liste des langues qu'une nouvelle langue à été saisie dans le form F_Langues.
    Private m_BaseExiste  As Boolean    '// Indique que la base sélectionnée (boite fichier) est déjà dans la table.
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::

'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&     EVENTS        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
Private Sub Form_Load()

    Set ScanTxt = New C_TradScanText                '// Initialisation des classes.
    Set ObjetAcc = ScanTxt.GetInstanceObjetAcc()    '// Récupère la classe initialisée.

    m_AjoutLangue = False
    Me.txtBdd.SetFocus
    Me.txtBdd = "Sélectionnez une base..."

End Sub

Private Sub Form_Close()
    On Error GoTo ERR_Form_Close

    DoCmd.Hourglass True

    '// Déclanche class_Terminate() fermerure base et application.
    Set ScanTxt = Nothing
    Set ObjetAcc = Nothing

SORTIE_Form_Close:
    DoCmd.Echo True
    DoCmd.Hourglass False
    Exit Sub

ERR_Form_Close:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  CSord.Form_F_CreateForm.Form_Close, ligne " & Erl & "."
    Resume SORTIE_Form_Close
End Sub

Private Sub cmbSelectBdd_Click()
    On Error GoTo ERR_cmbSelectBdd

    Dim bRep        As Boolean
    Dim sBaseSel    As String
    Dim sBase       As String
'#    Dim vTmp     As Variant  '// Pour Split de sBackup.
'#    Dim sRep     As String

    '// Sélection de la base à utiliser.
    sBaseSel = OuvreBoite("MS Access", "*.accdb", , , FD_TypeFilePicker)
    If (sBaseSel = vbNullString) Then Exit Sub

    sBase = FSOGetBaseName(sBaseSel)
    If (ReScannerApp(sBase) = False) Then Exit Sub  '// Demande confirmation si la base existe déjà dans la table des objets...

    DoCmd.Hourglass True
    DoCmd.Echo False

    bRep = InitAppEtBase(sBaseSel)                  '// Création Access.Application, ouverture de la base....
    DoEvents

    If (bRep) Then

        RazForm True
        Me.txtBdd = sBaseSel
'#        sRep = GetBackupFileName(sBaseSel)  '// Détermine le nonm du fichier de la prochaine sauvegarde...
'#
'#        vTmp = Split(sRep, ";")             '// NOTE retourne folder;backup;base
'#        Me.txtBddSauve = vTmp(0) & vTmp(1)  '// folder + backup.

       If m_BaseExiste Then

            Me.zlLangues = ScanTxt.LangueGetIDLangBase(sBase)   '// Extraire la langue d'origine de la base...
            Me.zlBases = ObjetAcc.BaseOuverteNom
            zlBases_AfterUpdate
        Else
            Me.zlLangues.SetFocus
            Me.zlLangues.Dropdown
            Me.cmdVoirRecap.Enabled = False
        End If
    End If

SORTIE_cmbSelectBdd:
    DoCmd.Echo True
    DoCmd.Hourglass False
    Exit Sub

ERR_cmbSelectBdd:
    MsgBox "Erreur " & Err.Number & vbCrLf & _
            " (" & Err.Description & ")" & vbCrLf & _
            "Dans  TriSurFormContinu.Form_F_CreateForm.cmbSelectBdd_Click, ligne " & Erl & "."
    Resume SORTIE_cmbSelectBdd
End Sub

Private Sub cmdCloseBd_Click()

    DoCmd.Hourglass True
    
    ObjetAcc.CloseMsBase    '// Ferme la base en cours, réinitialise les champs par défaut...

    m_BaseExiste = False
    RazForm
    Me.txtBdd = "Sélectionnez un base..."
    DoCmd.Hourglass False

End Sub

Private Sub zlLangues_NotInList(NewData As String, Response As Integer)
    Dim lRep As Long

    lRep = MsgBox("Ajouter cette nouvelle langue ?", vbQuestion + vbYesNo, "Nouvelle langue")
    If lRep = vbNo Then
        Response = acDataErrContinue
        Me.zlLangues.Undo
        Exit Sub
    End If

    '// Ajout d'une langue...
    DoCmd.OpenForm "F_Langues", acNormal, , , acFormAdd, acDialog, NewData
    If m_AjoutLangue Then
        Response = acDataErrAdded
    Else
        Response = acDataErrContinue
        Me.zlLangues.Undo
    End If

    m_AjoutLangue = False

End Sub

Private Sub zlLangues_AfterUpdate()
    MaJLangue   '// Affiche le drapeau...
End Sub

'// Ouvre le formulaire de la langue.
Private Sub zlLangues_DblClick(Cancel As Integer)
    If (IsNull(Me.zlLangues)) Then Exit Sub
    DoCmd.OpenForm "F_Langues", acNormal, , , acFormEdit, acDialog, Me.zlLangues
End Sub

'// Scan la base sélectionnée...
'----------------------------------------------------------------
' Procedure Nom   : cmdLanceScan_Click
' ----------------------------------------------------------------
' Sujet           : Lance le scan de la base sélectionnée.
' Procedure Kind  : Sub
' Procedure Access: Private
' Objectif        :
' Note            : InitialiseLabels, ScanObjetsApp, ferme la base et l'app.
'
' Author  : Laurent
' Date    : 11/07/2022 - 17:46
' DateMod :
' ----------------------------------------------------------------
Private Sub cmdLanceScan_Click()

    '// Vérifier si une langue d'origine défini.
    If (IsNull(Me.zlLangues)) Then
        MsgBox "Sélectionnez la langue d'origine de la base" & vbCrLf & "Avant de lancer l'analyse, merci.", vbInformation, "Choisir une langue"
        Me.zlLangues.SetFocus
        Me.zlLangues.Dropdown
        Exit Sub
    End If

    Dim bRep As Boolean

    DoCmd.Hourglass True
    ScanActif True      '// Affiche les contrôles d'avancement du scan...

    ScanTxt.InitialiseLabelsInfo Me.lbl_InfoScan2, Me.lbl_InfoScan3 '// Initialise les labels texte et d'avancement...

    bRep = ScanTxt.ScanObjetsApp(T_FormType, T_ReportType)          '// Lance le scan les objets de la base sélectionnée.... 'TODO: Voir le cas ou aucun objets trouvé.

    Me.lbl_InfoScan2.Caption = "Fermeture de la base et de l'application...."
    ObjetAcc.CloseMsBase True       '// Femeture base et app...

    ScanActif False     '// Masque les contrôles d'avancement du scan...

    DoCmd.Hourglass False

    If bRep Then
        Me.zlBases.Requery
        Me.zlBases = ObjetAcc.BaseOuverteNom()  '// Extraire le nom de la base.
        zlBases_AfterUpdate                     '// MàJ des données...
        DoCmd.OpenForm "F_Recap", , , , , acDialog, Me.zlBases
    End If

End Sub

'// Affiche la récap du dernier scan de la base selectionnée.
Private Sub cmdVoirRecap_Click()
    If (IsNull(Me.zlBases)) Then
        Me.zlBases.SetFocus
        Me.cmdVoirRecap.Enabled = False
        Exit Sub
    End If

    DoCmd.OpenForm "F_Recap", , , , , acDialog, Me.zlBases & ";" & Me.txtDateScan
End Sub

'// Actualise la liste des objets suivant la base sélectionné.
Private Sub zlBases_AfterUpdate()

    If (IsNull(Me.zlBases)) Then Exit Sub

    Dim sSql  As String
    Dim vDate As Variant

    DoCmd.Echo False

    Me.zlObjetTypes = 0

    MaJListeObjets      '// Charge la liste des objets suivant l'app en cours...

    vDate = DMax("[DateMaJ]", "T_TradTexte", "[Trad_ID] Like('" & Me.zlBases & "*')")
    Me.txtDateScan = vDate

    Me.zlLangues = ScanTxt.LangueGetIDLangBase(Me.zlBases)  '// Extraire la langue d'origine de la base...
    MaJLangue False                                         '// Affiche le drapeau, vérouille la zl...

    MajLabelsInfo
    Me.cmdVoirRecap.Enabled = True

    DoCmd.Echo True

End Sub

Private Sub zlObjetTypes_AfterUpdate()
    DoCmd.Echo False
    MaJListeObjets Me.zlObjetTypes.Column(0)
    DoCmd.Echo True
End Sub

Private Sub lstObjets_AfterUpdate()
    MajLabelsInfo
End Sub

Private Sub cmdAfficheInfo_Click()
    DoCmd.OpenForm "F_InfoRecap" ', , , , , , Me.zlBases & ";" & Me.txtDateScan
End Sub

'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& END EVENTS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

'// ################################ PRIVATE SUB/FUNC ####################################

'----------------------------------------------------------------
' Procedure Nom   : ReScannerApp
' ----------------------------------------------------------------
' Sujet           : Vérifier si la base choisi dans la boite fichier existe déjà dans la table
' Procedure Kind  : Function
' Procedure Access: Private
'
'=== Paramètres ===
' BaseSelect (String): Fichier Base choisi
'==================
'
' Return Boolean : True si non trouvé ou si trouvé et si l'utilisateur veux quand même continuer.
'
' Author  : Laurent
' Date    : 11/07/2022 - 17:27
' DateMod : 20/07/2022 - 17:59
' ----------------------------------------------------------------
Private Function ReScannerApp(BaseSelect As String) As Boolean
    Dim vRes  As Variant
    Dim sMsg  As String
    Dim lRep  As Long

    '// On vérifie si la base est dans la table.
    vRes = DLookup("[Objet_ID]", "T_Objets", "[ObjetApp]='" & BaseSelect & "'")

    m_BaseExiste = (Not IsNull(vRes))
    If (m_BaseExiste = False) Then ReScannerApp = True: Exit Function   '// Existe pas, on sort.

    ScanTxt.ReScannerApp = False
    sMsg = "La base '" & BaseSelect & "' est déjà enregistrée dans la table T_Objets." & vbCrLf & _
           "Les données concernant cette base vont être mise à jour." & vbCrLf & _
           "Voulez-vous continuer ?"
    lRep = MsgBox(sMsg, vbExclamation + vbYesNo + vbDefaultButton2, "Base déjà enregistrée")

    '// Informe la classe que la base vas être re scannée.
    If (lRep = vbYes) Then
        ReScannerApp = True
        ScanTxt.ReScannerApp = True
    End If

End Function

Private Function InitAppEtBase(sBase As String) As Boolean
    Dim bRep As Boolean

    If (ObjetAcc Is Nothing) Then Exit Function

    '// Création Access.Application, si pas déjà fait.
    If (ObjetAcc.MsAppIsUp = False) Then
        bRep = ObjetAcc.OpenMsApp()
        If (bRep = False) Then Exit Function
    End If

    If (ObjetAcc.MsBaseIsOpen = False) Then
        bRep = ObjetAcc.OpenMsBase(sBase)       '// Ouverture de la base.
    End If

    '// Problème détecter, on ferme tout, RaZ et on sort.
    If (bRep = False) Then ObjetAcc.CloseMsBase True

    InitAppEtBase = bRep

End Function

Private Sub MaJListeObjets(Optional TypeObj As Long = 0)

    Dim sSql As String
    Dim sFlt As String

    sSql = "SELECT T_Objets.Objet_ID, T_Objets.ObjetType, T_Objets.ObjetNom " & _
           "FROM T_Objets " & _
           "WHERE (((T_Objets.ObjetApp) = '" & Me.zlBases & "') "

    Select Case TypeObj
        Case 0
        Case 1
            sFlt = " AND ((T_Objets.ObjetType) = 'Form') "
        Case 2
            sFlt = " AND ((T_Objets.ObjetType) = 'Report') "
    End Select

    sSql = sSql & sFlt
    sSql = sSql & ") ORDER BY T_Objets.ObjetType, T_Objets.ObjetNom;"

    Me.lstObjets = Null
    Me.lstObjets.RowSource = sSql
    Me.lstObjets.Requery
    Me.lbl_lstObjets.Caption = IIf(Me.zlObjetTypes = 0, "Objets", Me.zlObjetTypes.Column(1))

End Sub

Private Sub MaJLangue(Optional bEnabledZL As Boolean = True)
'// Affiche l'image de la langue,
'// maj de la zl, et la vérouille si bEnabledZL est à true.
    Dim sImg As String

    ScanTxt.IDLangApp = Me.zlLangues
    Me.zlLangues.Enabled = bEnabledZL

    sImg = ScanTxt.LangueExtraireFlag()     '// Obtenir l'image du drapeau correspondant a la langue...
    If (sImg = vbNullString) Then
        Me.img_Langue.PictureData = Me.img_NoLangue.PictureData
    Else
        Me.img_Langue.Picture = sImg
    End If

End Sub

Private Sub ScanActif(ScanEncours As Boolean)


    Me.boxCache.Visible = ScanEncours
    Me.lbl_InfoScan1.Visible = ScanEncours
    Me.lbl_InfoScan2.Visible = ScanEncours
    Me.lbl_InfoScan3.Visible = ScanEncours
    
    Me.zlBases.Enabled = Not ScanEncours
    Me.zlObjetTypes.Enabled = Not ScanEncours

    Me.lstObjets.SetFocus
    Me.cmdLanceScan.Enabled = False

    Me.cmdCloseBd.Visible = ScanEncours
    Me.cmbSelectBdd.Visible = Not ScanEncours
    Me.txtBdd = "Sélectionnez une base..."

End Sub

'// Applique les valeurs par défaut.
Private Sub RazForm(Optional bActive As Boolean)

    Me.txtBdd.SetFocus
    Me.txtBdd = "Sélectionnez une base..."

    Me.zlLangues = Null
    Me.zlLangues.Enabled = bActive
    m_AjoutLangue = False
    Me.img_Langue.Picture = vbNullString

    Me.zlBases = Null
    Me.zlBases.Enabled = Not bActive

    Me.zlObjetTypes = 0
    Me.zlObjetTypes.Enabled = Not bActive

    Me.txtBddSauve = vbNullString
    If (m_BaseExiste = False) Then Me.txtDateScan = vbNullString

    Me.lstObjets.RowSource = vbNullString
    Me.lstObjets = Null

    Me.cmdCloseBd.Visible = bActive
    Me.cmbSelectBdd.Visible = Not bActive
    Me.cmdLanceScan.Enabled = bActive

End Sub

Private Sub MajLabelsInfo()
    If (Me.SF_Controles.Form.Recordset.RecordCount > 0) Then Me.SF_Controles.Form.Recordset.MoveFirst
End Sub

Private Function OuvreZl() As Boolean
    Me.ActiveControl.Dropdown
End Function
'// ################################# END PRIV. SUB/FUNC #################################

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Public Sub AddLangue(AjoutNouvLangue As Boolean)
    m_AjoutLangue = AjoutNouvLangue
End Sub
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
