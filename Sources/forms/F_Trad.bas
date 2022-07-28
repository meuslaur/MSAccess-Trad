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
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =13152
    DatasheetFontHeight =11
    ItemSuffix =7
    Left =792
    Top =1152
    Right =18372
    Bottom =9792
    RecSrcDt = Begin
        0xda02cc18f2d8e540
    End
    Caption ="F_MainTrad"
    DatasheetFontName ="Calibri"
    OnLoad ="[Event Procedure]"
    AllowDatasheetView =0
    FilterOnLoad =0
    OrderByOnLoad =0
    OrderByOnLoad =0
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
        Begin FormHeader
            Height =1020
            Name ="EntêteFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin ComboBox
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =2085
                    Left =1700
                    Top =453
                    Width =3396
                    Height =315
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"\";\"10\";\"100\""
                    Name ="zlApps"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Apps"
                    ColumnWidths ="2086"
                    AfterUpdate ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =1700
                    LayoutCachedTop =453
                    LayoutCachedWidth =5096
                    LayoutCachedHeight =768
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =340
                            Top =453
                            Width =1230
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_zlApps"
                            Caption ="Applications"
                            GridlineColor =10921638
                            LayoutCachedLeft =340
                            LayoutCachedTop =453
                            LayoutCachedWidth =1570
                            LayoutCachedHeight =768
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2250
                    Left =8900
                    Top =453
                    Width =3576
                    Height =315
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"0000\";\"\";\"\";\"10\";\"100\""
                    Name ="zlLangues"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Langues"
                    ColumnWidths ="0;2250"
                    AfterUpdate ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =8900
                    LayoutCachedTop =453
                    LayoutCachedWidth =12476
                    LayoutCachedHeight =768
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =6689
                            Top =453
                            Width =2085
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="lbl_zlLangues"
                            Caption ="Langue de traduction:"
                            GridlineColor =10921638
                            LayoutCachedLeft =6689
                            LayoutCachedTop =453
                            LayoutCachedWidth =8774
                            LayoutCachedHeight =768
                        End
                    End
                End
                Begin Image
                    PictureType =1
                    Left =5159
                    Top =396
                    Width =480
                    Height =480
                    BorderColor =10921638
                    Name ="img_Langue"
                    GridlineColor =10921638

                    LayoutCachedLeft =5159
                    LayoutCachedTop =396
                    LayoutCachedWidth =5639
                    LayoutCachedHeight =876
                    TabIndex =2
                End
                Begin Image
                    Visible = NotDefault
                    Left =5725
                    Top =396
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

                    LayoutCachedLeft =5725
                    LayoutCachedTop =396
                    LayoutCachedWidth =6205
                    LayoutCachedHeight =876
                    TabIndex =3
                End
                Begin Image
                    PictureType =1
                    Left =12585
                    Top =396
                    Width =480
                    Height =480
                    BorderColor =10921638
                    Name ="imgLangTrad"
                    GridlineColor =10921638

                    LayoutCachedLeft =12585
                    LayoutCachedTop =396
                    LayoutCachedWidth =13065
                    LayoutCachedHeight =876
                    TabIndex =4
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =6803
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Subform
                    OverlapFlags =85
                    Left =170
                    Top =850
                    Width =7635
                    Height =4875
                    BorderColor =10921638
                    Name ="SF_TradOrg"
                    SourceObject ="Form.F_TradSFOrg"
                    GridlineColor =10921638

                    LayoutCachedLeft =170
                    LayoutCachedTop =850
                    LayoutCachedWidth =7805
                    LayoutCachedHeight =5725
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =226
                    Top =453
                    Width =7071
                    Height =315
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texte5"
                    ControlSource ="=[SF_TradOrg].[Form]![Trad_ID]"
                    GridlineColor =10921638

                    LayoutCachedLeft =226
                    LayoutCachedTop =453
                    LayoutCachedWidth =7297
                    LayoutCachedHeight =768
                End
            End
        End
        Begin FormFooter
            Height =566
            Name ="PiedFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
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
' Name     : Form_F_Main
' ------------------------------------------------------
' Kind     : Document VBA
' Purpose  : Formulaire pouor la traduction des textes.
' Author   : Laurent
' Sujet    :
' Objectif :
' Date     : 02/07/2022 - 07:24
' DateMod  : 05/07/2022 - 06:11
' Requi    : Classe : C_TradScanText
' ------------------------------------------------------
Option Compare Database
Option Explicit

'//::::::::::::::::::::::::::::::::::    VARIABLES      ::::::::::::::::::::::::::::::::::
    Private ScanTxt As C_TradScanText
'//:::::::::::::::::::::::::::::::::: END VARIABLES ::::::::::::::::::::::::::::::::::::::


'//==================================       PROP        ==================================
'//====================================== END PROP =======================================

'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ PUBLIC SUB/FUNC   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END PUB. SUB/FUNC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&     EVENTS        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

Private Sub Form_Load()
    Set ScanTxt = New C_TradScanText    '// Initialisation des classes.
End Sub

'// Màj du sf des texte de la langue d'origine.
Private Sub zlApps_AfterUpdate()
    Dim sSql As String

    sSql = "SELECT T_TradTexte.* FROM T_TradTexte " & _
           "WHERE (((T_TradTexte.DefLangue)=True) AND ((T_TradTexte.Trad_ID) Like ('" & Me.zlApps & "*')));"
    Me.SF_TradOrg.Form.RecordSource = sSql

    Me.img_Langue.Picture = AfficheFlag(Me.SF_TradOrg.Form![LangueCode].Value)   '// MàJ de l'image du drapeau....

End Sub

Private Sub zlLangues_AfterUpdate()
    Me.imgLangTrad.Picture = AfficheFlag(Me.zlLangues)  '// MàJ de l'image du drapeau....
End Sub

'//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& END EVENTS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

'// ################################ PRIVATE SUB/FUNC ####################################
Private Function AfficheFlag(IDLang As Long) As String
'// Retourne l'image de la langue,
    Dim sImg As String

    ScanTxt.IDLangApp = IDLang
    sImg = ScanTxt.LangueExtraireFlag()     '// Obtenir l'image du drapeau correspondant a la langue...

    AfficheFlag = IIf(sImg = vbNullString, Me.img_NoLangue.Picture, sImg)

End Function
'// ################################# END PRIV. SUB/FUNC #################################
