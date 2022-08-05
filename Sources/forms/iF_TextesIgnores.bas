Version =20
VersionRequired =20
PublishOption =1
Begin Form
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    DefaultView =0
    ScrollBars =0
    BorderStyle =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11338
    DatasheetFontHeight =11
    Left =1992
    Top =528
    Right =13332
    Bottom =11856
    Filter ="[ID]='{43FE1D94-4294-486F-A6EC-25EAADB8D3CB}'"
    RecSrcDt = Begin
        0x4f224c0d4cdde540
    End
    RecordSource ="iT_TextesIgnores"
    Caption ="Textes ignorés."
    OnOpen ="[Event Procedure]"
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
        Begin Section
            Height =11338
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =566
                    Top =850
                    Width =10209
                    Height =10272
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txt_Texte"
                    ControlSource ="Texte"
                    GridlineColor =10921638
                    TextFormat =1

                    LayoutCachedLeft =566
                    LayoutCachedTop =850
                    LayoutCachedWidth =10775
                    LayoutCachedHeight =11122
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2085
                    Left =566
                    Top =453
                    Width =3630
                    Height =300
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"\";\"\";\"\";\"10\";\"200\""
                    Name ="zlBases"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Apps"
                    ColumnWidths ="0;2089"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Applications enregistrées."
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =566
                    LayoutCachedTop =453
                    LayoutCachedWidth =4196
                    LayoutCachedHeight =753
                    BackThemeColorIndex =7
                    BackTint =20.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            TextFontFamily =49
                            Left =566
                            Top =170
                            Width =3636
                            Height =300
                            FontWeight =500
                            BorderColor =8355711
                            ForeColor =5066061
                            Name ="lbl_zlBases"
                            Caption ="Base"
                            FontName ="Consolas"
                            GridlineColor =10921638
                            LayoutCachedLeft =566
                            LayoutCachedTop =170
                            LayoutCachedWidth =4202
                            LayoutCachedHeight =470
                            ThemeFontIndex =-1
                            BackThemeColorIndex =7
                            BackTint =50.0
                            ForeTint =70.0
                        End
                    End
                End
                Begin Label
                    Visible = NotDefault
                    FontItalic = NotDefault
                    OverlapFlags =247
                    TextAlign =2
                    Left =4251
                    Top =5102
                    Width =2892
                    Height =324
                    FontSize =12
                    FontWeight =700
                    BorderColor =8355711
                    Name ="lblInfo"
                    Caption ="Aucun texte ignorés"
                    GridlineColor =10921638
                    LayoutCachedLeft =4251
                    LayoutCachedTop =5102
                    LayoutCachedWidth =7143
                    LayoutCachedHeight =5426
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7086
                    Top =113
                    Width =3633
                    Height =444
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texte12"
                    ControlSource ="Texte"
                    GridlineColor =10921638

                    LayoutCachedLeft =7086
                    LayoutCachedTop =113
                    LayoutCachedWidth =10719
                    LayoutCachedHeight =557
                End
                Begin Image
                    Visible = NotDefault
                    SizeMode =0
                    Left =5272
                    Top =5556
                    Width =768
                    Height =768
                    BorderColor =10921638
                    Name ="imgTxtVide"
                    Picture ="ic_AucuneDonnees.png"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d4948445200000040000000400806000000aa6971 ,
                        0xde00000006624b4744000000000000f943bb7f0000000970485973000049d200 ,
                        0x0049d201a8458af80000000976704167000000400000004000eaf3f86000000e ,
                        0x6c4944415478dad55b6b6c1cd775feeeccec8bbbdc5d8ae252946859b4a8072d ,
                        0xcba6149bb54958b2251bfae18760d98e6203554a02760bc4495a0471dd4712b4 ,
                        0x860bb3f19f142ed2d882e1a489d1c4419b3811921a0c9cc6926ac9122b510fd2 ,
                        0xa44899cba796227797cbdd9de7bdfd3133e470f635bba4a4f60083c5cede7be7 ,
                        0x9cef9c7b5e7397472e71006a00ac03500d4001a0a238110061000dc61ccd98f7 ,
                        0x7f9e88edbb0060238026006ee35e1cc0008044813538001b003403f01af7e601 ,
                        0x0c0298b9d5029622de267c13802d3c219e96f5eb0320846424c90b5dab290062 ,
                        0x1ee11b01b400f035472255551e8f309fcdbaa15b510640fa26c9c239b8080096 ,
                        0x0f0053f8cd00f8af3dfae81ddffbe217bbf6ae5dbbe6a3a1a19194aaba0084a0 ,
                        0x6b56b43cb011c07600ae67eebdb7fead2347be7c70e3c6e6b3c3c357a64591dd ,
                        0x2410aa01dc06e076e896d850e48a00a80220c3d8a2bc5df8afeedfdff4ca8103 ,
                        0x2f36a6d3f73526935bef0985e48fa6a7ed20c856e10fedde1de97efae9aecd8c ,
                        0x3d547ffdfa962f8442ae4f676707af89226e2008c410ea2e00eb010401044a5c ,
                        0x41006b0d9eb20032c4107c0b00fea5871f6e7ae5c0811723c9e44e363a0a681a ,
                        0x144a17fe2b16fbe90ba74f1f9bcc6665e8be60d640dd7d68d7ae48f7d34f77dd ,
                        0xae28ed6c6484832c43634c3e1f8ffffacf3efdf467e7138934f4ed730e407215 ,
                        0x01a805700f00bfdfef27bb76edf26edab4c9c3f33c616c99958310025555d9c8 ,
                        0xc88874fefc793193c93043917d04c0c300aa9e6f6bdbd07df0e0572289c4dd74 ,
                        0x74144c55750f4908144a17fe3033f3d317cf9c3936298ab2b9f053adad91eea7 ,
                        0x9eeada28cbed6c789863b2bc3847634cfe9fb9b95f1e3e75eadf0ce086007cb6 ,
                        0x4ac27300ee06705b6d6d2df7da6baf6dd8bf7fbfafaaaa4a826d8f9bc4186389 ,
                        0x4482befffefbe937de7823994ea7298071018007006baca909f852a93a756404 ,
                        0x4c960142ac4f0b7484c387ffa5b5157f7aeedcb12951949ebae79efad70f1eec ,
                        0x6acc66dbd52b573848d2b23900dc3582b02e2c08c2a4be655cc8e3842a240ff4 ,
                        0xb0cb9e79e699f0934f3ec9fb7cbe11555515bbf6ad56d0d0d0409e7df659774f ,
                        0x4f0f77e2c4090aa08e87e118ce8d8fc79baaabe7eef078b6f292e4a79a0646e9 ,
                        0xe2c501ee0d1ecfd6bb0201c9178964bef3c4135fbe2d9b6dd70607399acd2e8e ,
                        0x83fec926b3d9ded707077fd83333330b800218c3ea6d812ae85bd0f5fcf3cf07 ,
                        0x77efde9d501425cb18238c3114ba28a570b95cb4b7b797ebebeba3007801c015 ,
                        0x0077a62529f0d50f3f3c41f7edc3137e7fa72f958ad8d1e48140472874787730 ,
                        0xb82f3c3777bb323aca318be6892e299b96a4de7f181e3efaaf131363c6ed6bc6 ,
                        0xb55a6435359552aa504a49c949069f5eafd71c4b040031e3cb8eac2cfbbffed1 ,
                        0x4727d8debd78dcebedf4a65211e482501d4824aad56412a0d4fe0c3625cbbdaf ,
                        0x5fbd7af4c7535356e1fb0148ab08c022514a17355c8aacd66092607c2e812049 ,
                        0xfe3ffffdef4fb0071fc4633e5fa737958a304a17d13356b2c2ba4cf8ee68f4e8 ,
                        0x4fa6a7adc25f821e066f183905c00a981d00130402e0ceac2cfbffe2e38f4fd0 ,
                        0x8e0e3ce6f3fd892799ac2fc5c3b4a2f4fee3f8f8d1f762b128742f7d0dc0e59b ,
                        0x213ca51434d71a0b026025cef6fba2b96665997dfde38f8f7fe276ff07adad95 ,
                        0xa9aa4253949c8b2a0a929234f1fd89891f59849f3584bf2969b015846257b12d ,
                        0x6012815e047100d881e6e6c8d6a6a6bbb89919419998d0f7fcf2500702c04569 ,
                        0x788fcfb7f397823036adaa8ab1aeab0c1904007ee8c554216766f8584876beed ,
                        0x665d0ca8620058737be1f1eddb237fbf6f5f57433cde2e0f0c2cf3f676e281c0 ,
                        0x1f79bd5f7aa3a1817c636aead835550d424f512fa270156952187a2a5e6bf053 ,
                        0xca9bab0608ae424215a3423e605961f3f8b66d91bf7be8a1ae757373ede2c58b ,
                        0x1c15c51cae988d531e08b4b9dd87bf1b89e09bb1d8b16baa1a7200428d31260c ,
                        0x80793c1ee2f57ab90263a1aa2acb64323c63ccb3a4d4a518ef84ec400939c26f ,
                        0xdd1af9cedebd5df5b3b3edd9be3e8e8946f1676a9f3146018533fb054bf7c111 ,
                        0x12b8cfe53adcbd660dfe7276f6d8354d0b01d8013d12d8417001b80340d8eff7 ,
                        0x9323478ed4eed9b3271808043814c8162549a2172e5c48bffbeebbf1d1d1d1c5 ,
                        0x86cb4a2da001c05600aec7b66c897cfbc107bbea6766dab37d7d1ccd66972539 ,
                        0x00d8b4a69dbd02f4de170a3de949a7d7319b5fe081c07d8270f8f57018af2412 ,
                        0xc7ae695a0d803b01f40158b0f0520dddecd90b2fbc50f7d24b2f857d3edf8ca6 ,
                        0x695231615a5b5b05b7dbed7df5d55755512fb9cb8a02f92c603300cffe4d9bd6 ,
                        0x7eaba3a32b128bb567cf9fe7a8b8d4fb3033bc1863bddf5b5838fa2b4599e86e ,
                        0x68987b94e7bb5cb3b37933c67b79fef06b8100fbc6fcfcb124633500ea6d0054 ,
                        0x011042a110bf67cf1eafcbe51a9b9f9f2f1932799e476b6bab10894448341a65 ,
                        0xabe103fc00d8ae8686484d32d992edede5b44c6679e203b06b94f6be99cdbefd ,
                        0xef92340e80fcf5a54b27594b0bf687425daed9d9c8b208616c872642ee6ee0b8 ,
                        0x9ea4a6a9007c585e0cf10088c7e3213ccf8bb22c4b8cb192e92ca5143e9f8f06 ,
                        0x0281a50c6c053e8083de18e07e78e1c29513d1e8cf659e9f6746cca77aac6753 ,
                        0xb2dcfb4f998c293c0068a22cb3bfe9ef3fd9e3f1bc23854231aa69d064195451 ,
                        0x40551573b23cf8f36cf6fd014d4b1b426790676f33c698a669345facce57cc98 ,
                        0x634c05d9ef97baecdb85835e0c49330b0bcacbfdfdbf3d1d0cbea756579b20b0 ,
                        0x6945e97d5314dffe852c8f1b1a8c41776a0ba22cb3bffdecb393bff3f9de91c2 ,
                        0xe118d334688a82394519fcb124bdf57d49ea37e6cc01982ea6153b83a51219ab ,
                        0x269dccb5ae61b78049e85d5fe97a26a3fed5c8c87f7e1a0abd27fbfdf169553d ,
                        0xfbcfb2fcf62f54d514de4c6fa3c6675a9465f6ada1a193bfabaa7a470c87a7e3 ,
                        0x9a36f813597eeb078a3260ac3f871229b1532de613c2fa9b530bb0fb000ac014 ,
                        0x70dbf54c06df8e463ffce36070ec2210fb0da55336e1cdf476b1801265d9ffea ,
                        0xc8c87f8fd5d5cd5de7b8cccf14e5738be62fa2441fa090668b8165a5722b422b ,
                        0x99891083deb000806dd3e934f96e3a7dce10229ff0269920dcb920cb81372726 ,
                        0xfa0dad0bd0e3fe67c61c6bc6c9a0bf38c911a21c47660a524e224408295a0d32 ,
                        0xe896a0424f50fc06a331e87ea29009c7a027456dd0df2609d09ba019e8213647 ,
                        0x560314f7e283cb0865f9c69513064b154314ba4f88438fd3aac16cb157630143 ,
                        0x70cd9847a1bf3bf000a82bc60b2cd9b4690184148f84764b5929784281b159e3 ,
                        0x2a456e00db00ace3384edbb16387bc73e7ce2a8fc7e32dc450229150cf9e3d9b ,
                        0x191b1bcb49659d08c2715cce38a7dba7d416a884d6426faaa2b3b3b3b6b3b3b3 ,
                        0x2e1c0e4b00d47c82104220cb32bb74e992b7bbbb3b7ef1e245d90e40292a1405 ,
                        0x56db029c10815ecdf19b376f763ff7dc73356bd6ac194fa5520bc598218460fb ,
                        0xf6edc2238f3cc25dbe7c799131a75a342dc02ed8adb000b37982c6c64697cfe7 ,
                        0x4b2593c90527fb9831a6d6d7d7732e972b274697eb03acf71c3cb7a4132c1700 ,
                        0x0200822040555559100447e6480801c771cb06398de5761f508effb8113ea06c ,
                        0x26ccf1957af27c1670ab7c405ea19c304208c91957a90f28c77fdc300b3019a9 ,
                        0x54139544817c5ba0dce7ae3a00f652b5d038bb053875828cb1a251a09413cc07 ,
                        0x82bd2bec839e0297eace2ad0b33dceae05a7054dbe2de0646e311f50491e6102 ,
                        0xe001b0097a7fd08bdc172639ebc0d69fbf551660f501955a80077a47b8110071 ,
                        0xb95cc4eff773c516cb64325492246b2599b327cb61c25ecf3bd1e04a7c889504 ,
                        0x43f0f58410b26fdfbeea43870eadadababe30d2de7a0c01863333333ca071f7c ,
                        0x10efe9e949534a999d891b6d01f610ba520bd800806f6d6df5bdfcf2cbeb2391 ,
                        0x482293c9a44cc1f251636323a9a9a911a2d1283f303040cd85f33dc009138534 ,
                        0x5b4883ab6d017e0078e08107fcc160303e3939691e642806270b06835c737333 ,
                        0x3f3030409c0a6e17c22e40395a5cc95cbb05f000e0f7fbb96c366b1632a55622 ,
                        0x005055559563fe952442e5f8003399c92754a516602ec2344d639522b9922860 ,
                        0x9d5f491eb0521f9083e24ab339a73ec0ea37caf50195f25d34152e27a72ea4c1 ,
                        0x4ab780d39ade8c029536451d5980135a89275e4963b3580471cab79504fb8fe5 ,
                        0x3416ecdfcb39a753693657280c3ae5bbe01628b7b1b0120b28b4059c36440af5 ,
                        0x129cf26da5bc3ea092d6d2cdb6804af9be2116b0d23ca010a8f968a52db162e5 ,
                        0x70c53ec03ad709add402f22542e55880957200f8ffe0032a9deb280cde0a1f60 ,
                        0x5db392b9abe203ac8b57125357a316a8a4b15949066ba58a7c40be8556ea032a ,
                        0x05be12be57a516b032b21a51a0dc34bc923a221ff8e609112e1e8f2b8aa2b072 ,
                        0x6a7a51140900cccfcf6ba228d27298902489638c698aa2209d4ed35028e4183c ,
                        0x51148924e97f3f48a5529aa6698ee7aaaa8a8585051369cac138f870ead4a9f4 ,
                        0xf0f0f0621b8c1052f49a9c9c244343431400ae5ebdaa9c397346d6348d949a47 ,
                        0x08412a95e22e5fbe0c4551904aa5e8f1e3c7b3c964d2d15c5555c9c0c000178f ,
                        0xc719009c3c79323d3a3a4a4bf16c5a4b341ae53efffc7313ad0c817e4ab49910 ,
                        0xc26dd9b285bbfffefb49381ca685f613630ca9548a3b7dfa34fafbfb35e3af2a ,
                        0xacaeae8eebe8e8e01a1b1b29cff305d5214912e9efef27a74e9da2e6494f9fcf ,
                        0x47dadadab8969616e6f1780aced5348d8c8f8f73c78f1fa7d7af5fa70008c771 ,
                        0xaca5a5856f6b6b4375757551be138904f7c9279fb0a1a121ca18a300ae10e86d ,
                        0xf01dd05be2c4e57281e77914234dd3a0280ab074fecf0dc0c5f33c044128ea8c ,
                        0x28a55014c53459f338aa97100297cb058e2bdc91678c415555689a06e8ef2664 ,
                        0xe827592ae17b0ac02593d32ae8e782eaa1b7c94bb953663c3c066014fa39818d ,
                        0xd0fb8ba5de299887a41200ae1af79aa09f18e71d3cdb3c6314857e24e776e887 ,
                        0x34dc0ef996a01ffa1a81b1054ce2a1ff353688a5fff8155a44817e102a09fdfc ,
                        0x1031840fa3f88b156611208ea53f52790c104d000b3ddb3c7f9430d660d01d79 ,
                        0x08fae16b277ccf1b7c6b00f0bfc8fd9007c7b5cd0e0000002574455874637265 ,
                        0x6174652d6461746500323030392d31322d30395430373a33363a31342d30373a ,
                        0x30307a1630400000002574455874646174653a63726561746500323031302d30 ,
                        0x322d31335431373a35363a33302d30373a3030f997c1e3000000257445587464 ,
                        0x6174653a6d6f6469667900323031302d30312d31315430393a31363a31362d30 ,
                        0x373a30305af9769600000034744558744c6963656e736500687474703a2f2f63 ,
                        0x72656174697665636f6d6d6f6e732e6f72672f6c6963656e7365732f47504c2f ,
                        0x322e302f6c6a06a800000025744558746d6f646966792d646174650032303039 ,
                        0x2d31322d30395430373a33363a31342d30373a303025a7467400000019744558 ,
                        0x74536f667477617265007777772e696e6b73636170652e6f72679bee3c1a0000 ,
                        0x001374455874536f7572636500474e4f4d452d436f6c6f7273aa9944e2000000 ,
                        0x3174455874536f757263655f55524c00687474703a2f2f636f64652e676f6f67 ,
                        0x6c652e636f6d2f702f676e6f6d652d636f6c6f72732f501db5eb000000004945 ,
                        0x4e44ae426082
                    End

                    LayoutCachedLeft =5272
                    LayoutCachedTop =5556
                    LayoutCachedWidth =6040
                    LayoutCachedHeight =6324
                    TabIndex =3
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
Option Compare Database
Option Explicit

Private Sub Form_Open(Cancel As Integer)
    If (IsNull(Me.OpenArgs)) Then Exit Sub

    Me.zlBases = Me.OpenArgs()
    zlBases_AfterUpdate

End Sub

Private Sub zlBases_AfterUpdate()

    Me.Filter = "[ID]='" & Me.zlBases & "'"
    Me.FilterOn = True
    Me.txt_Texte.ControlSource = "Texte"
    Me.Texte12.ControlSource = "Texte"

    Me.lblInfo.Visible = IsNull(Me.txt_Texte)
    Me.imgTxtVide.Visible = IsNull(Me.txt_Texte)
    Me.txt_Texte.Enabled = Not (IsNull(Me.txt_Texte))

End Sub
