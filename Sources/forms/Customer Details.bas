Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    ViewsAllowed =1
    TabularCharSet =204
    PictureSizeMode =1
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridX =24
    GridY =24
    Width =12180
    DatasheetFontHeight =11
    ItemSuffix =255
    Left =-18023
    Top =-20078
    Right =-18023
    Bottom =-20078
    DatasheetGridlinesColor =-1
    Tag ="EditDetails~Extensions=OnLoad_DefaultFirstAndLastName~FirstName=First Name~LastN"
        "ame=Last Name"
    Filter ="[ID]=23"
    RecSrcDt = Begin
        0x8a7f3b1a580ae340
    End
    RecordSource ="Customers Extended"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
    OnLoadEmMacro = Begin
        Version =196611
        ColumnsShown =14
        Begin
            Condition ="IsNull([OpenArgs])"
            Action ="StopMacro"
        End
        Begin
            Action ="GoToRecord"
            Argument ="-1"
            Argument =""
            Argument ="5"
        End
        Begin
            Condition ="Not [CurrentProject].[IsTrusted]"
            Action ="StopMacro"
        End
        Begin
            Action ="SetTempVar"
            Argument ="NewData"
            Argument ="Mid(Nz([OpenArgs]),InStr(Nz([OpenArgs]),\"=\")+1)"
        End
        Begin
            Action ="SetTempVar"
            Argument ="Space"
            Argument ="InStrRev([TempVars]![NewData],\" \")"
        End
        Begin
            Action ="OnError"
            Argument ="0"
        End
        Begin
            Condition ="[TempVars]![Space]=0 And [TempVars]![NewData]<>\"\""
            Action ="SetValue"
            Argument ="[Last Name]"
            Argument ="[TempVars]![NewData]"
        End
        Begin
            Condition ="[TempVars]![Space]>0"
            Action ="SetValue"
            Argument ="[First Name]"
            Argument ="Left([TempVars]![NewData],[TempVars]![Space]-1)"
        End
        Begin
            Condition ="..."
            Action ="SetValue"
            Argument ="[Last Name]"
            Argument ="Mid([TempVars]![NewData],[TempVars]![Space]+1)"
        End
        Begin
            Action ="RemoveTempVar"
            Argument ="NewData"
        End
        Begin
            Action ="RemoveTempVar"
            Argument ="Space"
        End
    End
    ShowPageMargins =0
    DatasheetAlternateBackColor =-2147483610
    ImageData = Begin
        0x89504e470d0a1a0a0000000d49484452000003290000004808020000007d482d ,
        0x5f0000000467414d410000afc837058ae90000001974455874536f6674776172 ,
        0x650041646f626520496d616765526561647971c9653c00001ac64944415478da ,
        0x84964956c3300c402ba64eb0e0041db74d390787e60ca46cdbb49c015ae8285c ,
        0xcb76245b0eacfadf9725c53872e0edf5f969faf2bd7c6ff93f835f1641227114 ,
        0xfc98ac4d2d00c792d9b9419048bfcd128e64b70cfb09ee086dbafe64be5d9596 ,
        0x80a30bb6083c15b38f8dc1bdc97c172c5cf187055bbb085b278209ab3267fb69 ,
        0x30abdb9d8a425d5bd75be8b236806cc582c7358244b2bf95cccc9aec484b084e ,
        0x7a0b7a2abe16b454fbb5124cc9dac6b2608b0b3a18160b42bf56a06e7d93ed51 ,
        0xb15f2fc2c61286261f46c5c1a329c631b6168f129d0597f9a059888209c794ca ,
        0xf575cf328344b2a7bac946cbd642c00db3c3f989e1ddb038092bf06e7445c804 ,
        0x13c616dc23c8603078666b6f13bc7c2a1632c1ce42269543b0383b6f3ec2c6de ,
        0x0c67178f2dc24f868304a3e0cd07d6854266b4566f12b1e911507bc09bc13f7b ,
        0x653716f9b63b40b1ed98f99709bb16f6983f1bd696fca8d031c3e400d3c939a6 ,
        0x67129b2c260798da3478a894d70ad5d72abcdda8d87bed0dc52833a26af9dc40 ,
        0x8986cd08facd4fa49ca55216a3d15786078ca6687ba48c5cd42630613df95158 ,
        0x6c612733bd315c22ab4c2a7fa7a076e384b5282f2f4a8c3532bb0c5d2977e836 ,
        0xb9254393bdb17287d67652ec64a12ba272b3a3f6cdf01d7d152c9b82b7ae2e8a ,
        0xcf0f5babe73f5dfe0420b60c720004612048d478505fa1ff7f8ceff1503d21c1 ,
        0x6ea554cb71122e40bb3bddad56996915e0227a1887b978d5e12c7b1878083b4e ,
        0x1bffb57f23339de5b8420f434b12f0ea3a20f1e2b50b41a6c034221f38025b72 ,
        0xc083b32501497318226e624fecdf3cec23a454bc022b5e179242bc02102faf1b ,
        0x45f16afc8351bc2a8670300c70ab859563c414501af172c3ac172c9da22aaf56 ,
        0x85fb9f42a4ae720a20263a36bc2e8c36bc067bc38bd8e6d17f9a66fb016978b1 ,
        0x0f5cc3eb17d98d27ca1a5ebf410324ff07aadafe4f7a538309bfac3c41a3b0b6 ,
        0x9630da52ff612dadff0c1084abe1f51f9b5178bcf0ff3f5ed921d5f082a71c56 ,
        0xd4e131ba25e041daf052a4b0e1750957d147bb22173c0e87b7e1452d2e8975d9 ,
        0xb701aa7fe9d0f002028000621a560d2f95c1d2f0fa3ac41b5e9c03d4c1c22814 ,
        0xe8d7f0a2fa00d8ff41dff0227b988a0e235ef89b29247191da34ffd11a5efff1 ,
        0x0c8011e2626b78fd8758f49f7a435cb0292f028a296c4bfda664c46b1037bcfe ,
        0x532f3b93518c0c89861741ee4035bcbe53af0e1d2c0360a86d158000621a560d ,
        0x2f9a0d800d54037ca01a5edf8759c34b89de0d2f2a8e78fda752bdf59f1a0d2f ,
        0x4a86b830650762620ecbcce35f121b5effe9d5f022924bbbc631a90d2f6a7524 ,
        0x5806e58817db0035bcd807474f98cc4ae4ff4036bc06f3cc23400076cdd80660 ,
        0x18048252a474d97faf4ce051ce7d141cc0c458967b3a9ad3dd1f0dd242e0b014 ,
        0xf0baa2c18b5d1eb3c1abb12d93b6f67f0bb0f553e3736b1facb8501de39e7c11 ,
        0x6ccbcc028cf76ac937ff156d3db483d7edc65ff7f7b38cd739c7366024784902 ,
        0x0ca607af54e33500bce8288f550076cdd8060010048216eebf226bd890b7d568 ,
        0x14904289251370b9bfdfda5f0d5e880b5e1ae3b51160254e6b0f67c5e5bb3c92 ,
        0x5e90e06879b4282e92401bd22cf9e206ad46f0620178c1045e5ec6ab3ba1775a ,
        0x649c29d7ad7d76032fc468ed8bbeb57fd2789d3d2f446fedab001a5d6b3f0c46 ,
        0xbc2e0c70c3ebff50586bff7f00967cd16300ecde002cf9a216f73fbd967c611b ,
        0x5bd2c5b5f4fe3f524beb3f129781dc8617d95ce24e9718c818247f00ec3fa503 ,
        0x60f4cfa1ff8969780d89b5f68af46a78e1dce4f87fd08e78d16dad3d40008dae ,
        0xb5a7b4e1f57f982ef9a26e17ea3f7506c086c892af7b837be6f1ff6058f2f59f ,
        0x81dc255f049b38781a6da87aff136c8711e212d5f022b85e9ebc461b5a48923d ,
        0xb7488586d77f7acf3c9296251546d026c7ffc365ad3d4d5b5aff0764000cb5ad ,
        0x021040f4586bfff9f6e85a7bfa0c806139227518cd3c82ca26783546e192af1f ,
        0xc434bcc096116c2d51a558075a35504bbe58147469b3a86b709ef2857650c57f ,
        0x721b5eff693ae245b59947da6c72841c3031204bbe8039857edb9015740936bc ,
        0xfe933bf3883e11797798aeb5a778d9cc709d79040820e85afb4fa4cc3c0e8fb5 ,
        0xf6836de69173e4adb52771c9d7705e6b3f80c7abfea6f510d77fc28a99493c05 ,
        0xfe0f654733fcc73200f69fe886d77fe40354ff93eb0582bb07087a015f2cfca7 ,
        0x795b992a0d2f32f6f08ec04d8e3f471b5ef41a0fa35bc30bc800082052d6daff ,
        0x1fe0b5f6ff876fc38b8a235e1c236fad3d092b5b29385e956a435c0337f3c842 ,
        0x7ac3eb3fde4a7d308f78115c2ec68465cf23bc1df61f63884b17759a92a8e324 ,
        0x0836bc0676c40b852b4fe926c7ffb44fc0ac343ec7eb3f55661e49dafd3332d6 ,
        0xdaff1f1df1c268ab00041095d7daffa7fd00d8a06f78fd67a0ea696f236dc46b ,
        0x00cfb51fb46bedc9a8d5fe0fbeb5f6e42df9226edf22697ad146ad701bf51feb ,
        0x1d414ca8ad524a1a5e4c14e8c53c5d826e114ad34d8e44a6f6617aa1d0e03a5e ,
        0xf53fadd6da53b3e145dc92eb0bc49b4c9326c47ff4b60a40000dbbb5f67786d5 ,
        0x88d7e8f1aa48a5cfff2177bcea7f721a5e17e9b18086e27afa3ff546cbc83e8c ,
        0x9498c13322479efe10337b08ddf348dc86000a1a5e8487f448395d82a82bb487 ,
        0xc0b9f6babf69338835c8d6daff1f3e235e43f342a16f74d9e408e40204d0203d ,
        0xd71e52720d9e255fd8a3e7ff00cf3c7ea3d25a7b8ed1255f43fa78d5ff94b7c3 ,
        0x2e9257f552ccbd4895d943664aef79c432a6056f6911d32ca3ee542341ffc242 ,
        0x7260eee244bfc9f13fbd53ece0bdc971d89d6b8fb55ef84fa5861791139134ac ,
        0x6195066c9323900b10404ca436bc0670adfde8295f837ce6919d7a03ddec0334 ,
        0xf348b592fa3fcdd7dad36d008c8a4bbe708d9651e3ae46bc738bff29b588ea0d ,
        0xaf3f543aa88c3aa74bfc27d9a8217385f6bdd10b85a860d4e82647aa0f800104 ,
        0xd0303fd71ed8451b260daf3ba34bbe68def01ad801b0ffa48f1ffca76ca9324d ,
        0x977cfd26f7cc74521b4fc45fce4dd2001879f75e53def0a2f43cd5fbd4b9249b ,
        0x0e3739927351a9c2e826c7e1bec9f1ce306978418687f1cc3c0204d0c09f6bff ,
        0x7fc08f57fd4f58f1ffe132e2f58df8db4f0974a1f4a833c4f59f3ac7abfe1fb8 ,
        0x86d77fcaca71dadda8cd32a04bbef034adfe603b5d8c7a27a652a77944ea4546 ,
        0xc40fad51a9e1f59ff2655be4c520f1235e94f60d68b6c9919546338fffe977a1 ,
        0x10bb22b52619fe136e7811d199c7391139d446bcb8a8d4666020b4e40b208046 ,
        0xd7da13cba54ed4fe1f5d6b3fdc8e571daa376a93b2e4eb37e5173b3210be6190 ,
        0x7a27a652730518e5bb29a935d548f87409f2a683e549ba405d97f84d8e8368e6 ,
        0x910c2eb6bc8f59505065c4ebffffc1b8c9916168adb5ff4faf861765538d702e ,
        0x40000dd2b5f6b8b8785a5a5c546a78fd1f5df24546c3eb3f311dac21bfd69eba ,
        0x435cd4bc515b6160f63c3293258bebb0893f745cb6051900a364153f6412938a ,
        0x976413732206da602189e14c822c31ad7032531d393739d26393e3ff1172a1d0 ,
        0x5d3a5e28f49f0a95d7609879fc4fa5b5f6ff919a2e000134bad69e564bbefe8f ,
        0xbcb5f6c3fe78d54138003698977c91c2d5fd43f11ec0ff442fbdc79c2e247e22 ,
        0x92ec461bfed334886fc3917107142db8c82987ea738b437a93e3ffe1b2c97118 ,
        0xacb5ff3a88d7da0304109dd7da8f90e355a9c9fd4f5462bd309c1a5ec364ad3d ,
        0xe91bacfe93332440c5255fba240c62c95374bfd06fdcc74d51383ef48782a328 ,
        0xe0ed30f898162697cc312d8a672dff131c88fa4fd6c15da4dc3e44d2e912543f ,
        0xe69e9c9b1cef8daeb51f840daf0b041b5eff07cd8817ed661e0102889cb5f6ff ,
        0x0773c34b85b4b614551a5eff478f571d3d5e95f6235eff07e569abffa9369a42 ,
        0xeccc2391cd9481bad99a166bbc901a5ed439898d79509ea7ca32586f72a4e3b9 ,
        0xf683a8e1f59ff24a64504e357252a9e1f59fb2255f000134bad69e582e7d86b8 ,
        0xa832f3f81fce1db20dafff387b81941573ff899a32a0e9a22efc9bb3286a3cd1 ,
        0xf262472cdcff4429c6b54eff3f05f73c927e57e3e06d781139964660a3a23c59 ,
        0x4dabffa444378e861769b387f706fe2647560aee79a4709323190dafff4377c4 ,
        0x4b09a33ea2ace1f59f2e0360745b6b0f1080ba6bcb0110846186c473e805bcff ,
        0x393c0cc41f53bf1743464789f849c227ecd1765d6a81b8e6917ce57f308ffeea ,
        0xa800a6da630dec7e923299bdeac24bbe2e9e7944259e9ae0bb1faac0cd64080c ,
        0x957c19877123dc4100e2a2ad0aaa29ff54318f376f462f3f2651e105d7c87eeb ,
        0xb35e6bdd3e84d5529c71f6907bb1600130412f3466c81121e651d8cdf6175e10 ,
        0x01604534e4d87619df338faf5ae51140e4acb52763000c764790c1e8b9f6640f ,
        0x930eb6b5f6040f8621b650f88f5d164fc38b4d71d8dea84def255f8ae83bd768 ,
        0xb1349b94461b09338f34bd339181f6675e50d8f022bc028cc6e7a952f70a6dfc ,
        0x5c78580ddeb5f6e4964818a519e186d7ffff1415b970eef77b17f0ca8e9e6b4f ,
        0xc3013080001a626bedff0fb686d71d3a36bcc8dbaf4bb3e355c9e0fea7ce0018 ,
        0x39c51ce2f0557a36bcc8aa30c81f30f84fd9d8033def17a2c6cc2303712775d1 ,
        0x7900ec3ff51a5e0cc46c62b84f6ed38ac4694aaca74b9076e42fde7e05314691 ,
        0x96071546d626475aed88fc4fd1b409c9b515dd5a5a77e8d8f0fa8fa5ad021040 ,
        0x88b5f6ff896978dd2662888bc6338f03b5e46b008fd91d1a6bedefd2ef7855ea ,
        0x70077ac48bd0922fd24ff952a4e0bc2558e5fa1fdbc813d9d35864cd4b9230f3 ,
        0x48fc51f54cd43bd794c2432ec83a049fd8482118cee41eeb7511b3e145c33489 ,
        0xe05ea4eedc2279dce1b3c9f13f75661e4747bc2819f1820080001abc6bed61d3 ,
        0x94942ef982ef8bc6172effe9d80e531a3de56b604ef9a269c3eb3f05b2640c80 ,
        0x91341ef69f96c7ab92bad808f3987b0a671e891f0083378f98a8bd9a9ef8a135 ,
        0xb20ec1ff8f730e97e271475acc3cfea74096f211afffb43c1e79e46c72a44eef ,
        0x9d6e0daf3b83eb42212c174963b4550002889c73ed478f571d944bbef4461b5e ,
        0x4471ff93bee40b6da9d9802ef9fa4fc1b40e4ea31e5070bfd00312660f499979 ,
        0x24f69e4706b24ebdff4fee59ac68738b7f687efb10090d2f82635ae4ed96403f ,
        0xd60b2e4bbd7db82c037a85367ad7089692a87b93e368c30b9e9ea97fa110dd1a ,
        0x5ed418f182700102884e6bed91b838577151def0fa4fa550fb42a58617275d8f ,
        0x571d560d2f1adea8ad8477b3d2a05ff2451e97c060c37fca06c0089d98ca40e6 ,
        0x8ec8ff24b787fe937c57e31fa476189eb6145c96bc461ba9b70f913ad5485ac3 ,
        0x8bacd13244daa078d916554e9720c0fd4fe556da806c72fc3fa025f090b9c991 ,
        0x06f52fad2f140232000270776e3700823014f5c344d63071ff150f1300d25baa ,
        0x7408ca497b1f1973ed9f8d375eadec8959f0c2e5cd9838cc6066beee88466d52 ,
        0x4bbe907fb5f7e085a3818e3e96718eda78dc6b1f91494baceeee1f5ecdd15c8a ,
        0x024c8df55a902ec1ff4c8e4c4ea423cae4c877e0559c245fa4937c5501c444f7 ,
        0x86d77f86c1b4d6fe0b958e57e51cb8994702f392a434ad486d78c12723e83bf3 ,
        0x3848d7dad36dc917b18358149d6baf4bbb7d8b24ea256de93dd9036034d9f3f8 ,
        0x9f4e0d2f12829dc4461b758ef5a2c6ed43039507d9076ead3d4d87b8882cbd91 ,
        0x2b82ff541af122e6b4d5813ac09cc8b6d47f8a671e010268889d6b3f7abc2a55 ,
        0x661eff93385b4fc54d34ec5458f2f59fd60daf41bee48bf2891bca97de937c9e ,
        0x2a7ebd04662dc9bc6e88a44bb2a9cb25fbbe6d5a34bc2819c21cd863bde07981 ,
        0xa6b778e1394b995e6bedff53b8c9f13b8d36392a126e69fda7d254e377ea4d13 ,
        0xa172f506e1264720172080c85c6b4ff5255fd41f001b966bedef8cac255ff4d9 ,
        0xe438b04bbefe1318f1fa4f7c4545de0e325cf70b113c6ce23f69b387c4ee97c4 ,
        0x310546f2d27be4293f92d65a51c825bbc147bba9460aeedbd6a5c2b15e644e53 ,
        0x5270ba048dafd046bf0fe33ff547bc46e226c7ff035cc3d279ad3d4000d17fad ,
        0x3d5d967c0dd7e355c9e0fea7340b0de05afbffa437bcfe0fb553be707129aac6 ,
        0xee51e17e21061a9f988a45f63f5e59d297de630e44d16e2212d2c2237ba919d9 ,
        0x0d2f66721b5e0c241edb46feb15eff295a01363caed0fe31226f7224aff2a247 ,
        0x4bebff005f280464000410e1b5f69fa8d4f0e256a64ec3ebff30385ef53f8d8e ,
        0x57c5b17d97b21c45c661f4e42cedbc4bf292afffa47737d986ce92afff642ddb ,
        0x62214b96bcc326a83ff3485816b1f49eeca3ea218d30aab4c32837ea3ff10d2f ,
        0xe29bb0c47199493d4ff50181d6122d8ef522e97409566a5fa14d52c38be86d8c ,
        0x481dc5ff24dfe448c65210f2da70b4d9e4f89f26a77cfda7722b8d0e0d2f2000 ,
        0x08c099952d370c8340d1f4ffbf3866ab4ae23452dce62583391696c393c937c6 ,
        0x8764a9a6d88874cd74a4c420c826d2322071d9fb427e862eb9a315c6c3866446 ,
        0x3d2e108c75bc481d9b85ebdf3c9cc952c6dd777e29103c2eb95026055f2a9234 ,
        0x6629e312207feadc0aec2e7c6383cd33d2eebb401ac908e09188a9630713ed2c ,
        0x408976545d98f9a321102b069d73a19d822fb91eddda5db03144c69a13876c96 ,
        0x70690d63ab975133490833092d1f36ce9e766da8175907d86947cdc4d9370269 ,
        0x45516c2a86b93220c5b52d4bda065ea34c65e40b36c049fbeaa26bbfb0b12cbe ,
        0x1aaeb8471e776ac9f668192f2dd4b7c88a46565a40e7ee62eb82177f9f302ecf ,
        0x1df0765da088fb517c4776fe2dfe15d78b735370676356c9d214d7326f9c27a7 ,
        0x12e520c86ccc76db65588b9c0669b71ae16e4097ae9876dd386ee5cdd111ce77 ,
        0x339c85fba1a8807ce8f205d4aa50e9e8e06cdcf2f5db6adb360d97332aa84d28 ,
        0xb4965ebe7be3f2d5e648474c7fe38263f96774945a1c42a599788282a31a076e ,
        0x3fb81c1fe209ed7812fc4700eace2405401886a2bc85780d11ef7f253d872b87 ,
        0x3a62526d0c0ee026446bad2686ff7f5bfb3c472f2eb2ffa1a67291dbbaf22217 ,
        0xc9623e2902c31930c39d9ab4928f83b7fe8126ac35296171a52673c58b766db3 ,
        0x76436c19edbee58219a0210ad8e087d944f7ee5a96c4daa1f0ba88cd301eb297 ,
        0xa91fc1247ef24fccf008bbbdcc1970cae4c191cc7ee4b3427e29a71c37f724f3 ,
        0x51f69ce9cbc11a388d1c74c981635a5182c4ac2265a4afcabcea68e67f76652f ,
        0xdcc9c7ea05b93d87e2a4134064ee73c4c565247d2e72d05ef5f88d4ac74f5031 ,
        0x5990d1f0622432dd933baacc883727030b7d145946f20b0546469236453252e1 ,
        0xe6474662cb625a2c3161a4f61231fc0d2fc46a74c641d1f0c22efb1011292ce0 ,
        0x993bc6a1d9d2c2c36544f33e6a431359f15fd24cbe8ca5e1c54862dac0945522 ,
        0x316d50695d17ed321d513ba019292855c86a78018b6bf29b56ca688d27031a2e ,
        0xf3ba479dfa88848a8f7100661b19c9688761b44600027073c63800823014f50f ,
        0x3a780c3d80deff181ec6cdc4c1600a02f66335ea688813943e5ed31af4397e77 ,
        0xfc045c0c71f44a0ab0c3919a6c28cd7f16b075f40c78b5ff1d7ceffe6556dde5 ,
        0x0b25788924d7a4b34b12ad70922152b64c100f1e06afca0ebc9007af72f22817 ,
        0x518b506bf2f3560eab83550b01b6ed02353342b5fbb822cfb02b5bce0d8b134b ,
        0x29ae3060bb41d3d8188ffdce6ba88c28ae520e7bc9a54a57420258e40b32f68a ,
        0xab1f67b52589667694282e68fa1c57019839771b0061188872450ab6006500f6 ,
        0x5f838928a840fe44f6c5505f9426b2f27cfe64e71c79e0850af0420857cb9bf1 ,
        0x1170bc9c84e34c3a5e78a910c26f30b09150c5c35a33fe5dcb285d03c61baa0a ,
        0x7e450a782d33c10b3cf092d5fd015e8d0d5e31b412b1ece70658db0ee18d06e0 ,
        0xc95191a968c336c012b1f0e560a395dd751a78ad09d5b9b9c7137205ad60a998 ,
        0xfe4b72164cc41042a2914b003191746d364ec58c5814533ee2c5488b99471acc ,
        0xe692d15a27639a929194a946a2b88cf4bd718882f5613fefd3fde07b4694d216 ,
        0xd764047af71ab67485b4ce379ccb486685015f3143e9a815252bc068d7f0425a ,
        0x00c74a83312dda8d96516500ec2f71036044873323facc23a58d27a2b8044d66 ,
        0x2437f13390bd5c0c9ae9183165f10f6f53af1dc648fccc2323050b36485decc1 ,
        0x39c82e73a4730d4b9f13560102b007c7040000200083b47fd3a5b08517b0d500 ,
        0x00f0e204e0e60a721886411896f6ff47ec0193f6427a583335c336f4ba5b8300 ,
        0x139ba09e78bc5fcf7fba0fe0cfe73ff432a3388278ef075c6d22ea930e7b18f3 ,
        0x233eeb6c51401d4ac20904bba140468f026709c916b4664e234842e1540b942a ,
        0x60b229026fa34056df408073ae349216a908b438b24f2c2e9cdca4790404a61a ,
        0x450c5ab404433427263324e868804de5d86b20c8cb721a8dc614a9c4bd5ccc67 ,
        0x483f9c61faaee37f5bb7a0162f94550e6447438dfa7ea6b75c32d63506cdc284 ,
        0x2df104d75fdca1a4c40d5249654c729c26d572496b29d491fa2a601a0b932929 ,
        0x41bf9a09ae72d21be13432aa1d028869b4f9390a46c1281805a360148c825140 ,
        0x37001040a36daf51300a46c1281805a360148c02fa0180001a6d7b0d41c038ea ,
        0xb7a1ea33c6611f738c23300b328e1c8f931f628cc40627caa43c2e6d485284d7 ,
        0x3410e5865180676dc988f0389d3d0b1040a36daf51300a46c1281805a360148c ,
        0x02fa0180001a6d7b8d8251300a46c1281805a36014d00f0004d068db6b148c82 ,
        0x514021601cf5ec2820350cb1ce19e2ddc38c690cbe694746c6d1f81a4df383d7 ,
        0xb3000134daf61a05a360148c8251300a46c128a01f0008a0d1b6d7281805a360 ,
        0x148c8251300a4601fd0040008db6bd46c1281805a360148c8251300ae8070002 ,
        0x68b4ed350a46c1281805a360148c8251403f001040a36daf51300a680518477d ,
        0x38e43d38ba527b205213f1c13ebaa27e345f0ccd920d208046db5ea360148c82 ,
        0x51300a46c1281805f403000134daf61a05a360148c8251300a46c128a01f0008 ,
        0xa0d1b6d75001c3768c9771745a6734398e7a6db0791f235732625cbcc288e52a ,
        0x16461c799c940026b54020ac9e98c94c463426237e1124e34613cca8d7c80000 ,
        0x0134daf61a05a360148c8251300a46c128a01f0008a0d1b6d7281805a360148c ,
        0x8251300a4601fd0040008db6bd46c1281805a360148c8251300ae807000268b4 ,
        0xed350a46012dc0e82a88519f0d01df0ed4090d984743305239f690af74a47712 ,
        0x621c81e98971d46fa40180001a6d7b8d8251300a46c1281805a36014d00f0004 ,
        0xd068db6b148c8251300a46c1281805a3807e00208058869367460f2b1805a360 ,
        0x148c02aca5e3d02dc4d18ea1f9ffff3f165d9882833416fe8fa6c55100040001 ,
        0x343aee350a46c1281805a360148c8251403f001040a36daf51300a46c1281805 ,
        0xa360148c02fa0180001a6d7b8d8251300a46c1281805a36014d00f0004d068db ,
        0x6b148c8251300a46c1281805a3807e002080182f7b738d86c2281805a360148c ,
        0x8251300a46017d0040008d8e7b8d8251300a46c1281805a36014d00f00041800 ,
        0x40375d8c2bb8ec970000000049454e44ae426082
    End
    PictureSizeMode =4
    DatasheetGridlinesColor12 =-1
    Begin
        Begin Label
            BackStyle =0
            TextFontCharSet =238
            FontSize =9
            BorderColor =12632256
            ForeColor =1462991
            FontName ="Arial"
        End
        Begin Rectangle
            BackStyle =0
            BorderLineStyle =0
            BorderColor =12632256
        End
        Begin Line
            BorderLineStyle =0
            BorderColor =12632256
        End
        Begin Image
            BackStyle =0
            BorderLineStyle =0
            BorderColor =12632256
        End
        Begin CommandButton
            AddColon = NotDefault
            TextFontCharSet =238
            FontSize =9
            FontWeight =400
            ForeColor =1462991
            FontName ="Arial"
            BorderLineStyle =0
        End
        Begin OptionButton
            AddColon = NotDefault
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderColor =12632256
        End
        Begin CheckBox
            AddColon = NotDefault
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            BackStyle =1
            BorderLineStyle =0
            BorderColor =12632256
        End
        Begin BoundObjectFrame
            BorderLineStyle =0
            BorderColor =12632256
        End
        Begin TextBox
            FELineBreak = NotDefault
            BorderLineStyle =0
            FontSize =11
            BorderColor =12632256
            FontName ="Calibri"
            AsianLineBreak =255
        End
        Begin ListBox
            BorderLineStyle =0
            FontSize =11
            BorderColor =12632256
            FontName ="Calibri"
        End
        Begin ComboBox
            BorderLineStyle =0
            FontSize =11
            BorderColor =12632256
            FontName ="Calibri"
        End
        Begin Subform
            BorderLineStyle =0
            BorderColor =12632256
        End
        Begin UnboundObjectFrame
            OldBorderStyle =1
            BorderColor =12632256
        End
        Begin CustomControl
            OldBorderStyle =1
            BorderColor =12632256
        End
        Begin ToggleButton
            AddColon = NotDefault
            TextFontCharSet =238
            FontSize =9
            FontWeight =400
            ForeColor =1462991
            FontName ="Arial"
            BorderLineStyle =0
        End
        Begin Tab
            FontSize =11
            FontName ="Calibri"
            BorderLineStyle =0
        End
        Begin Attachment
            BorderLineStyle =0
            BorderColor =12632256
        End
        Begin FormHeader
            Height =1095
            BackColor =12371399
            Name ="FormHeader"
            AutoHeight =255
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1236
                    Top =60
                    Width =7410
                    Height =465
                    FontSize =18
                    TabIndex =6
                    BorderColor =16251385
                    ForeColor =16777215
                    Name ="Auto_Title0"
                    ControlSource ="=Nz([Contact Name],\"Untitled\")"
                    FontName ="Trebuchet"
                    Tag ="ReplaceNull~FieldName=Contact Name~ReplacementText=Untitled"
                    HorizontalAnchor =2

                End
                Begin Image
                    OldBorderStyle =0
                    Left =300
                    Top =60
                    Width =810
                    Height =630
                    BorderColor =14870503
                    Name ="Auto_Logo0"
                    Picture ="logo_assets.png"
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000230000001b0806000000f6f036 ,
                        0x990000000467414d410000afc837058ae90000001974455874536f6674776172 ,
                        0x650041646f626520496d616765526561647971c9653c00000a6c4944415478da ,
                        0x62fcffff3fc360010001c442acc2f96b4e33b0b0b231b07033333072fc656062 ,
                        0xf9cbf097f33390666062fb2a642acccfe12ac0c7ecf7fb3793ba001733ebbf3f ,
                        0x2c4cf75ffcfcfee93bcb2556368ec32cec6fcffc63fab2efd70fd64f4c4c7f19 ,
                        0xbebffbcef0edc35f867f5fb919feff6304db0110402c647be33f23c3ffff4c06 ,
                        0x0c1c9f1a38f83fba08f3f27333fde760f8f94788e1c56776067d710e06361656 ,
                        0xf60b0fbedafdf9fdd5eeef9fff0c4292ace73efe6598f8f70fe3220606460c23 ,
                        0x010288892c87fc6362f8cff5b59859e2f1615efecffe7f7f88713f7c25c1f0f6 ,
                        0x1b0fc33f5606864f7f19197e3331333c7cff87e117d33f0656ce7f0cbfff7233 ,
                        0x7c7bc76dc4c2c0b99099e5cfba7fffff89a13b08208048760ce33f66863fec9f ,
                        0x5afe49dceb6164fecac3f49b83e1f74f79063e4e060629de5f0c3f7e733100dd ,
                        0xc070fcd9778637c0e06713126260e0126060e364650085cedfef0c0c6c02af03 ,
                        0x05e43eac071a27cd809464010288e86802e961646066f8cdfea9e2a7d88d6a7e ,
                        0xa0a7fefd6463e0e560609091f8c020c2fd9f819b8593819fed1fc39ff7dc0c5f ,
                        0xb87918d8fefd6760fcf69b81e1d74fa06206869f5f41deffc7c00134895ffaaf ,
                        0xd5f7b78c0bdedd640c041afe05144800014474c83002e16f869ff6bf656fd7f3 ,
                        0x08001d07f4252b0b1303cf1f7506712e0e062e1666862fbfc5185e7ee3651062 ,
                        0x6764e0646604ebf9ffe71fd8234cacccc094cec3f0eb0b2b03d3571186f737c4 ,
                        0x18bebee2706160f85dcac4fc9f018401023052c6480082400ccc7120cc38e253 ,
                        0xfc9d8dcfb5b3a25311ee84f103f64991c926ff6baa6eb8e77d939882b6c4b539 ,
                        0x0333c278805890f284f3b120eb213e803b0e2ae8436972f40b31f48141c305a3 ,
                        0x0c47053e96554c5ed464bc0288a9bebf9bc3dadb438c47424c98919151829189 ,
                        0x49121bbe78ee50e88fbf6f9cfefcfdcdf0e5db4f864fdffe0113e71f86ef8c3f ,
                        0x181e01b3e7fd5f420c5f39b8181839d918fe71b03300d330c3dfbf40c7005df2 ,
                        0x0fe890ff60fc0fe8206686c757f9197eff6164d0b3fdc0206bf48a8355f45dd6 ,
                        0xefff3f1800028865f982453cf9f905b33b6aeb757efff9f313476261f8fdfbbf ,
                        0xf8d1c7a7984594991898bf3033b000cb9a6fbf98181e7f91039637fc0c8282ec ,
                        0x408731307cf8f387e1e7dfffe068fc078ca27f4036286880ee00b31981b9ecdf ,
                        0x770e0676def70c2c6cdf183879be3008c9f2393f7fcf2e0b10402cb7af5ce350 ,
                        0x949757b4b5b054c29b9b813ebbbce40ac39b5d5f1998be01c39af337c36b96af ,
                        0x0cff99ce3330735e616001c7c17f066660e848691b3208f30b027d004ccc40cc ,
                        0x047204309440a1f30f483302439491e91bc3a7af9f19802c0636de7f722c9cbf ,
                        0xf401028805c406460f33c8c2cfc094ffeec377865fbffe30fcff0f71002854b8 ,
                        0x3858190405d8194a62b3301d094a4e40657f8004270b23c396a3c7191ebdfb0c ,
                        0x2cad7918fefcfc077610c32fa0037e031d02cc587f7f011dccfa9b8187f73bc3 ,
                        0x5f50680173d7afffdf591979be99010410286bff676284143efb8fdf0406fd97 ,
                        0x3ff252426f4159e10f30a841e9e3e683577c4e663a1cb2927c0c4f5fbc0715be ,
                        0xe0b4000a89bfa0440a34951d5855888b8930fcfcf98be1e5f3470cbcbce24003 ,
                        0x80a10274cc7f20fe07a281fcbf3f8151c60cac06fe03a39b911d18009f183e03 ,
                        0xf5fc6163e20408201668be8596f0fffe3a98a9ff97101644f6fc2f11c1fb4fbe ,
                        0xfffca3f217e8fb779fbe83430c14ff7f4134d0c1bf81160901b5483082d2ca5f ,
                        0x86df5f7e32fcff0e2cf9fe4242e5dfafbf400701b93f8025f1cf3f407d4c0c2f ,
                        0x3e7e05e6bcf70c5f80b1f0e52f0bc8a18c0001b82a9b15004120088f29995078 ,
                        0xe8e0fbbf5bc7a0887eccac6d4d4fdd17e69b619651bfae5253abd47a979d0352 ,
                        0x4a6f5b338c53f8c47b6b38ca5c464601956fa97831cf24cafac2df100c231894 ,
                        0x4a2209e83a785c633a20cc8b42e83c9e5d436d0e71d5e11540288ef9f9fb0f38 ,
                        0xee312a30464670e0fd01fafafdd71f0cffff42b2eadfbf0ce068fa034c0f3c3c ,
                        0x6c0cc24240715002fd09940085cc1f488205a593bf40b1bf3f4169112807ac52 ,
                        0xfe3d90656092f9c3c0f4968f81f537b0caf8ffeb064000a138e617d0f50c98d5 ,
                        0x292808fe82131b0324313382a2e73f24d7ff0567db7f0cccc0dcf4fbf75f7088 ,
                        0xfdfbfa078c194151090c893fbf40d1f9179cdc1919ff81ab847fbf8025f17d65 ,
                        0xa008500f07d35386df1c27000208c531c074c1f4e8e5fbdf427cbcf780410f4e ,
                        0xd7c0da95e1d18b77326cac5c6003bf7dfd0534f03fd811b0c20c5401b2031d09 ,
                        0x6ea8014bd2bf8caf187e7d0455446c905218e86c46c6bfe06865045a0eac6d81 ,
                        0x591be24b16766046fecb7488e91ff32d80006281176c40a02e27c674fcec7db6 ,
                        0x8b579e2831333331b000cbf4bfc0b800e62a16036d5ea0014c0c52e282e092f4 ,
                        0xf73f68e90a8a06201b1402bf40b905e8989f220f8185e20f604266048733b8e0 ,
                        0x003a8689f13fc4218c90f00715802c6c2cff7eff609ac7c8f29f0120008d658c ,
                        0x02200c43d1b6d8581044444717272727afec2dbc9652ad569f15d750c82bf93f ,
                        0x3f09e63f3da7b15343df687f9c59403f6273146c18df4e285ac2170b02e25c81 ,
                        0x2b3c75ff392baa0424774c020ebcdf5a16615dc1404607517a2d8160ad4162f8 ,
                        0xa401441c57c095cf5497b7ff2380e0d1048ad16f3f7f036b571606766005c8c5 ,
                        0xc3c570efce8d0fdf7e7cffabaaaa2dfcf5eb4fa043fe8243ebccd9e30c622262 ,
                        0x0c7c82a2c0c4fb1b1c427f40a1032a4fa0e9e91beb0760c90c6c9602ab0dce5f ,
                        0xe20ceccf048121c1026aa68233043b27c86af6bbafef9caffcf5fd3d38940002 ,
                        0x8809e84420cd040e49417e6e063e3e6e067e5e1e0651606b69efe183af3d7d3c ,
                        0xd770b032fe13151566101014649093916098377fd1abdd3bf730282b4933080b ,
                        0x0a3108011b5022c2402c2ac4c0c3cd05ac1a58804d4e60b3939d8d818b518c81 ,
                        0xe7b33a031b1727b03e6263e0e06167e016e206561bdcef5edc3d93fae1f1d9a7 ,
                        0xdfdf3d64f8f6e61e034000b100abcf9fb3e7cc5d7de8f011936fdfbfb182cb55 ,
                        0x20c10a4c343f7ffd7c2f292cb66bc9ea155fefdfb9ab03cae51c9c9c8c4c7fbf ,
                        0x5f6162e1b19c3777a9d99b572f806d0960b8b2fe013be2ddd7570cfc4a020cdc ,
                        0x7c4047317332b07d960436157818987881e9839d9d811558a37ffffcf5d5d3cb ,
                        0x87eb3e3dbffd808995431668ee5b50fe0108205052e206625e201607621e4472 ,
                        0x06836fececec57c5a5a4381eddbfaf05e4b3828a1b207ededad6f9e3dd873f93 ,
                        0xd93984fdd8f919d97f0bbe04b675810e00b6f878258021cba1cac0f24904a814 ,
                        0x18429cdc0cacc00618300affbc7ffae8f8b3cbc767fcfaf2f60123a845052c1e ,
                        0x818a803e62780d10408cc4f69b5a5b5bd185b8fffdfba3c6cac6e7c52d20eecb ,
                        0x24f0479b5d908387938f9f818b4d0468051f302d01bb35c0caf3d79fef1fbfbe ,
                        0x7f73fbe3d3bb07bebd7b760e582e7d06e6cc1f40333e00f17b904340f5344000 ,
                        0xb150d0e7fa0aac02aefef9fde5c5c7575ff633be66d16766e5d461657b27c5c4 ,
                        0xf488fb3fd33fb0af8159ffe3af1f9feffefbf5fd21b05cf9c0c4ccfc05e890f7 ,
                        0x50877c04e22fa0f21614230001c4426127f0172323d3736099010ce67f67fffe ,
                        0xfec2f5e7f7675e6874b340a3fc37a801c0c8ccfc0b98264051f2036af96f680b ,
                        0x040e00020c009d8782760de261800000000049454e44ae426082
                    End

                    TabIndex =7
                End
                Begin ComboBox
                    ColumnHeads = NotDefault
                    LimitToList = NotDefault
                    OverlapFlags =85
                    AccessKey =71
                    IMESentenceMode =3
                    ColumnCount =4
                    ListWidth =9000
                    Left =1020
                    Top =690
                    Height =360
                    FontSize =10
                    TabIndex =2
                    BorderColor =16251385
                    ColumnInfo ="\"\";\"\";\"\";\"\";\"\";\"\";\"\";\"\";\"10\";\"100\""
                    Name ="cboGoToContact"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [ID], [Company], [Contact Name], [E-mail Address] FROM [Customers Extende"
                        "d] WHERE [ID]<>Nz(Form![ID],0) ORDER BY [Company]; "
                    ColumnWidths ="0;2880;2880;2880"
                    Tag ="GoToRecord~TableOrQueryName=[Customers Extended]~SourceID=ID~Column1=Company~Col"
                        "umn2=Contact Name~Column3=E-mail Address"
                    UnicodeAccessKey =71
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =8
                    AfterUpdateEmMacro = Begin
                        Version =196611
                        ColumnsShown =14
                        Begin
                            Condition ="IsNull([Screen].[ActiveControl])"
                            Action ="StopMacro"
                        End
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Condition ="[Form].[Dirty]"
                            Action ="RunCommand"
                            Argument ="97"
                        End
                        Begin
                            Condition ="[MacroError].[Number]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Condition ="..."
                            Action ="StopMacro"
                        End
                        Begin
                            Action ="OnError"
                            Argument ="2"
                        End
                        Begin
                            Action ="SetTempVar"
                            Argument ="ActiveControlValue"
                            Argument ="[Screen].[ActiveControl]"
                        End
                        Begin
                            Condition ="[CurrentProject].[IsTrusted]"
                            Action ="SetValue"
                            Argument ="[Screen].[ActiveControl]"
                            Argument ="Null"
                        End
                        Begin
                            Condition ="[Form].[FilterOn]"
                            Action ="RunCommand"
                            Argument ="144"
                        End
                        Begin
                            Action ="SearchForRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="2"
                            Argument ="=\"[ID]=\" & [TempVars]![ActiveControlValue]"
                        End
                        Begin
                            Action ="RemoveTempVar"
                            Argument ="ActiveControlValue"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cboGoToContact\" xmlns=\"http://schemas.microsoft.com/office"
                                "/accessservices/2009/11/application\"><Statements><ConditionalBlock><If><Conditi"
                                "on>IsNull([Screen].[ActiveCon"
                        End
                        Begin
                            Comment ="_AXL:trol])</Condition><Statements><Action Name=\"StopMacro\"/></Statements></If"
                                "></ConditionalBlock><Action Name=\"OnError\"/><ConditionalBlock><If><Condition>["
                                "Form].[Dirty]</Condition><Statements><Action Name=\"SaveRecord\"/></Statements><"
                                "/If></ConditionalBl"
                        End
                        Begin
                            Comment ="_AXL:ock><ConditionalBlock><If><Condition>[MacroError].[Number]&lt;&gt;0</Condit"
                                "ion><Statements><Action Name=\"MessageBox\"><Argument Name=\"Message\">=[MacroEr"
                                "ror].[Description]</Argument></Action><Action Name=\"StopMacro\"/></Statements><"
                                "/If></ConditionalBl"
                        End
                        Begin
                            Comment ="_AXL:ock><Action Name=\"OnError\"><Argument Name=\"Goto\">Fail</Argument></Actio"
                                "n><Action Name=\"SetTempVar\"><Argument Name=\"Name\">ActiveControlValue</Argume"
                                "nt><Argument Name=\"Expression\">[Screen].[ActiveControl]</Argument></Action><Co"
                                "nditionalBlock><If><Con"
                        End
                        Begin
                            Comment ="_AXL:dition>[CurrentProject].[IsTrusted]</Condition><Statements><Action Name=\"S"
                                "etValue\"><Argument Name=\"Item\">[Screen].[ActiveControl]</Argument><Argument N"
                                "ame=\"Expression\">Null</Argument></Action></Statements></If></ConditionalBlock>"
                                "<ConditionalBlock><"
                        End
                        Begin
                            Comment ="_AXL:If><Condition>[Form].[FilterOn]</Condition><Statements><Action Name=\"RunMe"
                                "nuCommand\"><Argument Name=\"Command\">RemoveFilterSort</Argument></Action></Sta"
                                "tements></If></ConditionalBlock><Action Name=\"SearchForRecord\"><Argument Name="
                                "\"WhereCondition\">=\""
                        End
                        Begin
                            Comment ="_AXL:[ID]=\" &amp; [TempVars]![ActiveControlValue]</Argument></Action><Action Na"
                                "me=\"RemoveTempVar\"><Argument Name=\"Name\">ActiveControlValue</Argument></Acti"
                                "on></Statements></UserInterfaceMacro>"
                        End
                    End
                    OnGotFocusEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Condition ="[Screen].[ActiveForm].[Name]=[Form].[Name]"
                            Action ="Requery"
                            Argument ="=[Screen].[ActiveControl].[Name]"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cboGoToContact\" xmlns=\"http://schemas.microsoft.com/office"
                                "/accessservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Con"
                                "ditionalBlock><If><Condition>[S"
                        End
                        Begin
                            Comment ="_AXL:creen].[ActiveForm].[Name]=[Form].[Name]</Condition><Statements><Action Nam"
                                "e=\"Requery\"><Argument Name=\"ControlName\">=[Screen].[ActiveControl].[Name]</A"
                                "rgument></Action></Statements></If></ConditionalBlock></Statements></UserInterfa"
                                "ceMacro>"
                        End
                    End
                    AllowValueListEdits =1
                    InheritValueList =1

                    LayoutCachedLeft =1020
                    LayoutCachedTop =690
                    LayoutCachedWidth =2460
                    LayoutCachedHeight =1050
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    GroupTable =3
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontCharSet =0
                            TextFontFamily =0
                            Left =300
                            Top =690
                            Width =660
                            Height =360
                            LeftMargin =45
                            TopMargin =45
                            RightMargin =45
                            BottomMargin =45
                            BorderColor =16251385
                            ForeColor =16777215
                            Name ="cboGoToContact_Label"
                            Caption ="&Go to"
                            FontName ="Trebuchet"
                            GroupTable =3
                            TopPadding =0
                            BottomPadding =8
                            LayoutCachedLeft =300
                            LayoutCachedTop =690
                            LayoutCachedWidth =960
                            LayoutCachedHeight =1050
                            LayoutGroup =2
                            GroupTable =3
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    AccessKey =69
                    TextFontCharSet =0
                    TextFontFamily =0
                    Left =2535
                    Top =690
                    Width =1875
                    FontSize =8
                    TabIndex =1
                    ForeColor =16777215
                    Name ="cmdEmailCustomer"
                    Caption ="&E-mail Customer"
                    FontName ="Trebuchet"
                    Tag ="SendEmailForContact~ToContactNameField=E-mail Address"
                    EventProcPrefix ="cmdEmail_Contact"
                    UnicodeAccessKey =69
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =8
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Action ="SendObject"
                            Argument ="-1"
                            Argument =""
                            Argument =""
                            Argument ="=[E-mail Address] & IIf(Nz([E-mail Address])<>\"\",\" [\" & [E-mail Address] & \""
                                "]\")"
                            Argument =""
                            Argument =""
                            Argument =""
                            Argument =""
                            Argument ="-1"
                        End
                        Begin
                            Condition ="[MacroError].[Number]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cmdEmailCustomer\" xmlns=\"http://schemas.microsoft.com/offi"
                                "ce/accessservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><A"
                                "ction Name=\"EMailDatabaseObject"
                        End
                        Begin
                            Comment ="_AXL:\"><Argument Name=\"To\">=[E-mail Address] &amp; IIf(Nz([E-mail Address])&l"
                                "t;&gt;\"\",\" [\" &amp; [E-mail Address] &amp; \"]\")</Argument></Action><Condit"
                                "ionalBlock><If><Condition>[MacroError].[Number]&lt;&gt;0</Condition><Statements>"
                                "<Action Name=\"MessageB"
                        End
                        Begin
                            Comment ="_AXL:ox\"><Argument Name=\"Message\">=[MacroError].[Description]</Argument></Act"
                                "ion></Statements></If></ConditionalBlock></Statements></UserInterfaceMacro>"
                        End
                    End
                    BackStyle =0

                    CursorOnHover =1
                    LayoutCachedLeft =2535
                    LayoutCachedTop =690
                    LayoutCachedWidth =4410
                    LayoutCachedHeight =1050
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    GroupTable =3
                    WebImagePaddingLeft =2
                    WebImagePaddingRight =2
                End
                Begin CommandButton
                    OverlapFlags =85
                    AccessKey =79
                    TextFontCharSet =0
                    TextFontFamily =0
                    Left =4485
                    Top =690
                    Width =2025
                    FontSize =8
                    TabIndex =3
                    ForeColor =16777215
                    Name ="cmdCreateOutlookContact"
                    Caption ="Create &Outlook Contact"
                    FontName ="Trebuchet"
                    Tag ="CreateOutlookContact"
                    UnicodeAccessKey =79
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =8
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =9
                        Begin
                            Action ="OnError"
                            Argument ="1"
                            Argument ="Beep"
                        End
                        Begin
                            Action ="RunCommand"
                            Argument ="584"
                        End
                        Begin
                            MacroName ="Beep"
                            Action ="Beep"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cmdCreateOutlookContact\" xmlns=\"http://schemas.microsoft.c"
                                "om/office/accessservices/2009/11/application\"><Statements><Action Name=\"OnErro"
                                "r\"><Argument Name=\"Goto\">Macro"
                        End
                        Begin
                            Comment ="_AXL: Name</Argument><Argument Name=\"MacroName\">Beep</Argument></Action><Actio"
                                "n Name=\"RunMenuCommand\"><Argument Name=\"Command\">SaveAsOutlookContact</Argum"
                                "ent></Action></Statements><Sub Name=\"Beep\"><Statements><Action Name=\"Beep\"/>"
                                "</Statements></Sub></Us"
                        End
                        Begin
                            Comment ="_AXL:erInterfaceMacro>"
                        End
                    End
                    BackStyle =0

                    CursorOnHover =1
                    LayoutCachedLeft =4485
                    LayoutCachedTop =690
                    LayoutCachedWidth =6510
                    LayoutCachedHeight =1050
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =3
                    WebImagePaddingLeft =2
                    WebImagePaddingRight =2
                End
                Begin CommandButton
                    OverlapFlags =85
                    AccessKey =83
                    TextFontCharSet =0
                    TextFontFamily =0
                    Left =6585
                    Top =690
                    Width =1260
                    FontSize =8
                    TabIndex =4
                    ForeColor =16777215
                    Name ="cmdSaveandNew"
                    Caption ="&Save and New"
                    FontName ="Trebuchet"
                    Tag ="SaveAndNew~DefaultControl=Company"
                    UnicodeAccessKey =83
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =8
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Condition ="[Form].[Dirty]"
                            Action ="RunCommand"
                            Argument ="97"
                        End
                        Begin
                            Condition ="[MacroError].[Number]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Condition ="..."
                            Action ="StopMacro"
                        End
                        Begin
                            Action ="OnError"
                            Argument ="2"
                        End
                        Begin
                            Action ="GoToRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="5"
                        End
                        Begin
                            Action ="GoToControl"
                            Argument ="Company"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cmdSaveandNew\" xmlns=\"http://schemas.microsoft.com/office/"
                                "accessservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Cond"
                                "itionalBlock><If><Condition>[Fo"
                        End
                        Begin
                            Comment ="_AXL:rm].[Dirty]</Condition><Statements><Action Name=\"SaveRecord\"/></Statement"
                                "s></If></ConditionalBlock><ConditionalBlock><If><Condition>[MacroError].[Number]"
                                "&lt;&gt;0</Condition><Statements><Action Name=\"MessageBox\"><Argument Name=\"Me"
                                "ssage\">=[MacroErro"
                        End
                        Begin
                            Comment ="_AXL:r].[Description]</Argument></Action><Action Name=\"StopMacro\"/></Statement"
                                "s></If></ConditionalBlock><Action Name=\"OnError\"><Argument Name=\"Goto\">Fail<"
                                "/Argument></Action><Action Name=\"GoToRecord\"><Argument Name=\"Record\">New</Ar"
                                "gument></Action><Action"
                        End
                        Begin
                            Comment ="_AXL: Name=\"GoToControl\"><Argument Name=\"ControlName\">Company</Argument></Ac"
                                "tion></Statements></UserInterfaceMacro>"
                        End
                    End
                    BackStyle =0

                    CursorOnHover =1
                    LayoutCachedLeft =6585
                    LayoutCachedTop =690
                    LayoutCachedWidth =7845
                    LayoutCachedHeight =1050
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =2
                    GroupTable =3
                    WebImagePaddingLeft =2
                    WebImagePaddingRight =2
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontFamily =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =9300
                    Top =60
                    Width =2820
                    Height =315
                    FontWeight =700
                    BorderColor =16251385
                    ForeColor =16777215
                    Name ="txtDuplicatesWarning"
                    ControlSource ="=IIf(DCount(\"*\",\"[Customers Extended]\",\"[ID]<>\" & Nz([ID],0) & \" And [Con"
                        "tact Name] = '\" & Replace(Nz([Contact Name]),\"'\",\"''\") & \"'\")>0,\"Possibl"
                        "e Duplicate\",\"\")"
                    FontName ="Trebuchet"
                    Tag ="DuplicatesWarning~TableOrQueryName=[Customers Extended]~FieldName=Contact Name~I"
                        "D=ID"
                    HorizontalAnchor =1

                End
                Begin CommandButton
                    OverlapFlags =85
                    AccessKey =67
                    TextFontCharSet =0
                    TextFontFamily =0
                    Left =11040
                    Top =691
                    Width =555
                    Height =330
                    FontSize =8
                    TabIndex =5
                    ForeColor =16777215
                    Name ="cmdClose"
                    Caption ="&Close"
                    FontName ="Trebuchet"
                    Tag ="Close"
                    UnicodeAccessKey =67
                    HorizontalAnchor =1
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =8
                        Begin
                            Action ="Close"
                            Argument ="-1"
                            Argument =""
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cmdClose\" xmlns=\"http://schemas.microsoft.com/office/acces"
                                "sservices/2009/11/application\"><Statements><Action Name=\"CloseWindow\"/></Stat"
                                "ements></UserInterfaceMacro>"
                        End
                    End
                    BackStyle =0

                    CursorOnHover =1
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =8100
            BackColor =14870503
            Name ="Detail"
            AlternateBackColor =14870503
            Begin
                Begin Tab
                    OverlapFlags =85
                    TextFontCharSet =186
                    BackStyle =0
                    Left =225
                    Top =240
                    Width =11700
                    Height =7725
                    FontSize =10
                    Name ="tabContacts"
                    FontName ="Segoe UI"
                    HorizontalAnchor =2
                    VerticalAnchor =2

                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =360
                            Top =705
                            Width =11430
                            Height =7132
                            Name ="General_Page"
                            Caption ="General"
                            WebImagePaddingLeft =2
                            WebImagePaddingTop =2
                            WebImagePaddingRight =2
                            WebImagePaddingBottom =2
                            Begin
                                Begin TextBox
                                    OverlapFlags =215
                                    Left =2085
                                    Top =840
                                    Width =3495
                                    Height =315
                                    Name ="Company"
                                    ControlSource ="Company"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =31

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =840
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =1155
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =840
                                            Width =1605
                                            Height =315
                                            Name ="Company_Label"
                                            Caption ="Company"
                                            Tag =";RegenerateCaption;"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =31
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =840
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =1155
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    Left =2085
                                    Top =1920
                                    Width =3495
                                    Height =315
                                    TabIndex =1
                                    Name ="First Name"
                                    ControlSource ="First Name"
                                    EventProcPrefix ="First_Name"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =31

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =1920
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =2235
                                    RowStart =2
                                    RowEnd =2
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =1920
                                            Width =1605
                                            Height =315
                                            Name ="First Name_Label"
                                            Caption ="First Name"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="First_Name_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =31
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =1920
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =2235
                                            RowStart =2
                                            RowEnd =2
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    Left =2085
                                    Top =2295
                                    Width =3495
                                    Height =315
                                    TabIndex =2
                                    Name ="Last Name"
                                    ControlSource ="Last Name"
                                    EventProcPrefix ="Last_Name"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =31

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =2295
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =2610
                                    RowStart =3
                                    RowEnd =3
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =2295
                                            Width =1605
                                            Height =315
                                            Name ="Last Name_Label"
                                            Caption ="Last Name"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="Last_Name_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =31
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =2295
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =2610
                                            RowStart =3
                                            RowEnd =3
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    Left =2085
                                    Top =2670
                                    Width =3495
                                    Height =315
                                    TabIndex =3
                                    Name ="Job Title"
                                    ControlSource ="Job Title"
                                    EventProcPrefix ="Job_Title"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =368

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =2670
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =2985
                                    RowStart =4
                                    RowEnd =4
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =2670
                                            Width =1605
                                            Height =315
                                            Name ="Job Title_Label"
                                            Caption ="Job Title"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="Job_Title_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =368
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =2670
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =2985
                                            RowStart =4
                                            RowEnd =4
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    IMEMode =2
                                    Left =2085
                                    Top =3765
                                    Width =3495
                                    Height =315
                                    TabIndex =4
                                    Name ="Business Phone"
                                    ControlSource ="Business Phone"
                                    EventProcPrefix ="Business_Phone"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =22
                                    RightPadding =37

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =3765
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =4080
                                    RowStart =6
                                    RowEnd =6
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =3765
                                            Width =1605
                                            Height =315
                                            Name ="Business Phone_Label"
                                            Caption ="Business Phone"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="Business_Phone_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =22
                                            RightPadding =29
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =3765
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =4080
                                            RowStart =6
                                            RowEnd =6
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    IMEMode =2
                                    Left =2085
                                    Top =4140
                                    Width =3495
                                    Height =315
                                    TabIndex =5
                                    Name ="Mobile Phone"
                                    ControlSource ="Mobile Phone"
                                    EventProcPrefix ="Mobile_Phone"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =22
                                    RightPadding =37

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =4140
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =4455
                                    RowStart =7
                                    RowEnd =7
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =4140
                                            Width =1605
                                            Height =315
                                            Name ="Mobile Phone_Label"
                                            Caption ="Mobile Phone"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="Mobile_Phone_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =22
                                            RightPadding =29
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =4140
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =4455
                                            RowStart =7
                                            RowEnd =7
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    IMEMode =2
                                    Left =2085
                                    Top =4515
                                    Width =3495
                                    Height =315
                                    TabIndex =6
                                    Name ="Fax Number"
                                    ControlSource ="Fax Number"
                                    EventProcPrefix ="Fax_Number"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =22
                                    RightPadding =37
                                    BottomPadding =368

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =4515
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =4830
                                    RowStart =8
                                    RowEnd =8
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =4515
                                            Width =1605
                                            Height =315
                                            Name ="Fax Number_Label"
                                            Caption ="Fax Number"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="Fax_Number_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =22
                                            RightPadding =29
                                            BottomPadding =368
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =4515
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =4830
                                            RowStart =8
                                            RowEnd =8
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    ScrollBars =2
                                    OverlapFlags =215
                                    Left =2085
                                    Top =5610
                                    Width =3495
                                    Height =645
                                    TabIndex =7
                                    Name ="Address"
                                    ControlSource ="Address"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =14
                                    RightPadding =37
                                    BottomPadding =8

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =5610
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =6255
                                    RowStart =10
                                    RowEnd =10
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =5610
                                            Width =1605
                                            Height =645
                                            Name ="Address_Label"
                                            Caption ="Street"
                                            Tag ="AddNoResizeTag;DoNotResize;"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =14
                                            RightPadding =29
                                            BottomPadding =8
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =5610
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =6255
                                            RowStart =10
                                            RowEnd =10
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    Left =2085
                                    Top =6300
                                    Width =3495
                                    Height =315
                                    TabIndex =8
                                    Name ="City"
                                    ControlSource ="City"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =8

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =6300
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =6615
                                    RowStart =11
                                    RowEnd =11
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =6300
                                            Width =1605
                                            Height =315
                                            Name ="City_Label"
                                            Caption ="City"
                                            Tag =";RegenerateCaption;"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =8
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =6300
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =6615
                                            RowStart =11
                                            RowEnd =11
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    Left =2085
                                    Top =6660
                                    Width =3495
                                    Height =315
                                    TabIndex =9
                                    Name ="State/Province"
                                    ControlSource ="State/Province"
                                    EventProcPrefix ="State_Province"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =8

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =6660
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =6975
                                    RowStart =12
                                    RowEnd =12
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =6660
                                            Width =1605
                                            Height =315
                                            Name ="State/Province_Label"
                                            Caption ="State/Province"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="State_Province_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =8
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =6660
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =6975
                                            RowStart =12
                                            RowEnd =12
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    IMEMode =2
                                    Left =2085
                                    Top =7020
                                    Width =3495
                                    Height =315
                                    TabIndex =10
                                    Name ="ZIP/Postal Code"
                                    ControlSource ="ZIP/Postal Code"
                                    EventProcPrefix ="ZIP_Postal_Code"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =8

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =7020
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =7335
                                    RowStart =13
                                    RowEnd =13
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =7020
                                            Width =1605
                                            Height =315
                                            Name ="ZIP/Postal Code_Label"
                                            Caption ="Zip/Postal Code"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="ZIP_Postal_Code_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =8
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =7020
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =7335
                                            RowStart =13
                                            RowEnd =13
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    Left =2085
                                    Top =7380
                                    Width =3495
                                    Height =315
                                    TabIndex =11
                                    Name ="Country/Region"
                                    ControlSource ="Country/Region"
                                    EventProcPrefix ="Country_Region"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =23
                                    RightPadding =37
                                    BottomPadding =8

                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =7380
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =7695
                                    RowStart =14
                                    RowEnd =14
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =420
                                            Top =7380
                                            Width =1605
                                            Height =315
                                            Name ="Country/Region_Label"
                                            Caption ="Country/Region"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="Country_Region_Label"
                                            GroupTable =4
                                            LeftPadding =29
                                            TopPadding =23
                                            RightPadding =29
                                            BottomPadding =8
                                            LayoutCachedLeft =420
                                            LayoutCachedTop =7380
                                            LayoutCachedWidth =2025
                                            LayoutCachedHeight =7695
                                            RowStart =14
                                            RowEnd =14
                                            LayoutGroup =3
                                            GroupTable =4
                                        End
                                    End
                                End
                                Begin Attachment
                                    PictureSizeMode =3
                                    Left =5880
                                    Top =840
                                    Width =1245
                                    Height =1800
                                    Name ="Attachments"
                                    ControlSource ="Attachments"
                                    ImageData = Begin
                                        0x89504e470d0a1a0a0000000d49484452000000480000005e08020000000f00c5 ,
                                        0x960000000467414d410000afc837058ae90000001974455874536f6674776172 ,
                                        0x650041646f626520496d616765526561647971c9653c00001b9d4944415478da ,
                                        0x7c8fd10980400c435fd4f11dc12d5ccf33a69c1c826209a14ddf47bbacdb0e32 ,
                                        0x33a513356898484c8ac9ae3c3e51b232c6c354a94024f511fb5ef0487fc24fe6 ,
                                        0x0d8f726707d08face4a8fbd33b8f70092016202e48f4662017fc47a1d0adc7c6 ,
                                        0x4152f31f9b513089ff0415238cff8f2c01e4cc5ab61d20809818280003e92bac ,
                                        0x3c98179918ff030410131d7c85532f0321efe2f1c77f0c0d4811c7ccc8001040 ,
                                        0x4c74f0d57f62dd8acd54947486db57e8e02f40002eca2507401804a24ce3015d ,
                                        0xbbf5449ec04b783a1ba130fdc68645a165d226ccdb7e85eb7ea48203d0ba212d ,
                                        0x9268b8d8821342439b60e88307328d6e5c5e481e9eab068ed05a1b273a3bb012 ,
                                        0xa24fa2ad1fa4082660a8c9077ed11058cbe7b18ffb6fce4500b1607a363fd187 ,
                                        0xc2a8fb8f85c09eefd142ff3f8e54f91fc55c2c85c6dc651b90adf8f9f3174000 ,
                                        0x51bff0f88f3f1311e72b6ca50d7ac24456f2f7ef3f64f1ef3f7f010410130d7d ,
                                        0x85d58bff71662d7cf9ea3f2ecd50e6afdf7f90157ffdf60320809830cc6424dd ,
                                        0x73c4fa0a4f66ff8f878db70084a5bddfc88abffffc091040181e636424d647ff ,
                                        0x097898a8ba8898ac85d75710fd3f7efe423608587800041013f9899081c40283 ,
                                        0x81920283402afdf1f327b2f9bffffc010820263a14180c9415180c380a0c9428 ,
                                        0xfaf5133913006b05800062a2438181237511ca66d8b216560dff4151f41b5982 ,
                                        0x999111208098284c886416180413e17f22b21612ef0fcc63b0b622034000b150 ,
                                        0x98b508141840f4ef37a837f1ffffaf1f6ffffefbcdc8c8ccc6260024fefefbc3 ,
                                        0xccc2853f4a09662d38fdefdf3f6427000b40800042f7182305590bb599fdefcf ,
                                        0xef8f7f7ebefff1e5e1afefef7efffcf8f7cf4fa067fefef90b6e12b1b3b0f371 ,
                                        0xf1cab3720a73f2c83131b33332b1e0ac8b09f80ad23063422db8fe0304100b5a ,
                                        0x4f8e114f939550220433fefdf9fee8f78fe7bfbfbdfcf3e7dbdfdf7f80f9f8ef ,
                                        0xdf5fff7efffaf7ef3790f5ffefefbf40cffdfbf8eff3f3f72f2e03dd0cf4241b ,
                                        0xa720179f9ca0980127bf0223a8bf8b337d60f515c37f486312d945ff01028885 ,
                                        0x9a59ebff9f1f1fcffdf9f11ae801603a6762e46060fe0d4c7e0c7f99c08d5f46 ,
                                        0x48571bdcf0058afc03c5d2bfbf7f7f7ffff2e3f387d7779edcdec327a422266f ,
                                        0x2728aacdc8c289bd2efe8fbd9585d28c06130001c442948f88a98bfffffefafa ,
                                        0x1030bb303172fe6702c6cacf7f4047fffff3ffdfdfffffff813bedc09cf60fda ,
                                        0x07f88fd6fd6764626206e6b40f6f6ebd7d798d8d534052d14746d51e31fe8025 ,
                                        0xfbe1ab2e81c904208098f077f588ad8bfffffdf4623f30c93132b0fefffbefef ,
                                        0xef9fa074084c81a084f7fbdfbf3fffa0e03f08ff07a37fff61d90398e5801e03 ,
                                        0x22266616665616965fdfde5f3a367ddb92a68fef5fe12930d0930d2a17208058 ,
                                        0x08b7d908d7c5ff3fbe3efee7e7273676e1bfbf7efefdfbe3cf9feffffeff06c6 ,
                                        0x15d08f4002187d10bf81a20e1469a028626666fcff8fe9f7bfbf7ffe0035fdfa ,
                                        0x096c140121107dfbfdf5fbcfd7af3e3d7b7e5bc72a844f500c67d6c2a8f6919d ,
                                        0x0510402ce4fb0ac6f9f1edd5871717f904958025c49fdf5ffffcf90af406b8a3 ,
                                        0xf917981a8165c6bfff7fc05dd4ffc032f1f72f6043fccf8f6fdfbf7efefae5f3 ,
                                        0xb72f9fbffef806f415d053bf416aff8252eecf5f7f5ebefd1490502eaba88da7 ,
                                        0xc0c0db6a63040820167809ff9fac0203580a5e3931475a5a81e1efff5fbf3efd ,
                                        0xfcf5f1efbf9fe08eee7f0658d6faf9fdfbfb37efdfbc7ef3fddbf71fc086f7f7 ,
                                        0x5f20df0113e93f90c7ff82621194ffff83db427ffffd077a96834fc8c62594d8 ,
                                        0xea12dba01d4000b1a0545dff496ebcbf7c72f6e3ebdb72f21abf7f7ffff9e3e3 ,
                                        0x8f9f1f80610e2e0c1880ad818f1f3e7e78fbeedd9b779f3f7d0126b97f60cf82 ,
                                        0x1228387280027fc0f104ae5d1921a3095fbe7c67e6e4af685bc6c2ca817d980d ,
                                        0xc36ba01041f704234000b1e0ef0e11ac8bef5fdfcecd2df417987afefcfcf6ed ,
                                        0xc3efdf5f414d35662660627b74ffc1bbb7ef817e000db8fe078d8cfc06a6c53f ,
                                        0x7f80a99295958d9d9d85898515e8a53f7ffe0133d8972fdfbefdf8fde5eb0f26 ,
                                        0x568eecc23e016129ec05060303d6b6d87f8cac0610402cd8b31331753103c397 ,
                                        0x8f8fbe7db82f22a2f8e2f12d560ef6bfffbf017317b0947bf1f4f5cbe72f7efd ,
                                        0x04e62e60fc007b477f7f0333d6dfbf1c1cec8a520ad2c2d2ecac1cc0b2109825 ,
                                        0xbf7efbfe0d84bebd62fd70fbeb531159b5829ae9bcfca2a05612688c88117fd6 ,
                                        0xc2957d80510f10402c0ca4fb0aceb975613507272f30dd7dfaf4e2ebcbafc0c2 ,
                                        0x9a8d8df5eb976f2f9e039b1dc0720058fd820a7f266666515151295129197119 ,
                                        0x216e4160eefafefdfb8f1f3ffe32fe636166e66065fdc7cecec5c2a6ad611c9a ,
                                        0xdbc9c1c5036b0311e1abffa8f186240d10402c907c4e54cb1635d2fffcfefefa ,
                                        0xf1053171b9dfc052fae7f7cf9f3e024b36f0e0393327b700b048002648763656 ,
                                        0x2141115929454921097606d65fdfbf03a3e837b06d05cc832c2c6c7f5919d9fe ,
                                        0x815b50ff3939d818f904e0be22aabb875acba37523000288b42615b2deaf9f9f ,
                                        0x835a9eff99be7dfd002caeff800a81ffcc4cccc6da5602fc520ccc4c2c1cecc0 ,
                                        0xac04cc4c40416035f6e3d7afffacff5839191959d85859813dc31f4cffff3182 ,
                                        0x8705fffdffcbc1c6f6f3cf2f46f878e27fbcfd689cdd1c843f010208d3638c44 ,
                                        0x96ac1fdf3d6063e7023af037b06e02151ec08cf45b504858524496899de71fb0 ,
                                        0x02666505a27f4ccce0d2f72f0b785cf51f68c286115837fffdcdc0c2c2fc17a8 ,
                                        0xee2f330b13331b2bcbd7dfc0e6ff3f50794aa02e26d07385948a0001c4424622 ,
                                        0x84083dbe75809585eb37a84e026260d50cf4d83f415e11162656266626263656 ,
                                        0x260e0e90df9899400dbebf7fc003c7ffc185fbdf3fbffe3181daf55000cca52c ,
                                        0x2cac7fbffef8feed3317373ff105c67fdcfd2d8000c26c793012d32ffef6e5cd ,
                                        0x87577779b88580a1f71b98b77e03db85c0e6c63f161676a033807e6166017a90 ,
                                        0x85910d18692ca002ee1703a87df81754903081a6b4a0be828c6f43bd07ea94fe ,
                                        0xc237448aab82fd8f185b834b0204100bee09067cbdfdaf9f5efcfaf1fd2f3b30 ,
                                        0x1e1840d1f5e79fb4882230d439d8b8fefffb87144ac0b28d9981f93fb0130366 ,
                                        0x33823a60a02a8111ee2bb0cf18214d60a46610e10203ff98084000b1e0184421 ,
                                        0x3090f6e6c5750606506c03f3d54f60a9f08f419053889f5b90978b1358cc824a ,
                                        0x2850ad0c6a65fc67fe8b14f9c01ae00fa2af02f610083180bcc5c4c482192584 ,
                                        0x06e710ead166d8000288055bc4101e486361e600667f60cff50fa8ea05b5dc81 ,
                                        0xf52f68080558663080bcc4f80f94f0801e63fc0d1ea305b5a07e83c63ffeff83 ,
                                        0x650946c4642c1831820a11569c598b98b1712441800062c159fae11d72faf1fd ,
                                        0x33a8780366b03fa0aa1884c01e0015dfe05e17d0578c7f400915e825501df3f7 ,
                                        0xcfff3fbf18400d5e70010f6917221bfcff3f0b1b3021f310dbc2c0dea546f000 ,
                                        0x02888581745f01c1a70f4f989858ff830a38609101ea8f7cfbf91d54defd05e3 ,
                                        0x3fbf417dffffc0a6053303a8b8076bfe0bf530744409e637680b8191818b9b97 ,
                                        0x999999a4ac85d557100a208058b0e827628c1adcd96080f804e4c07fff3f7c79 ,
                                        0xf7ebb7d49f3f6cc0860833b05ffe8f9599958de11f0bb001029aa70367b9ff7f ,
                                        0xe05d69588ffa3f44f73f60b3f8cddb17c07002e734a0dabf8c4cccc4642d5c21 ,
                                        0x0010404cf84205f7a416a8b900097db00f81fdfa771fdebefdf80ed4cf020350 ,
                                        0x0a05662a60fa04b6b37e83d07f30fa07f31b24bac091f80f185dccacac9fdfbf ,
                                        0x3cbe6b19bc9b4792affea30a02332c400031113d5d87c20456c0a05134503bea ,
                                        0x3f98cb08acc91ebf7cf40dd88f04d6d8608ffd01f65280fd62a0677efd0292ff ,
                                        0x41edfbbf200cd609d10cc98f9019604616960d8b7b7ffffe81d9192190cdb0c9 ,
                                        0x01041013cea96ebced177e415960cbf72f2ce099404d0796371fdf5cba7de9d3 ,
                                        0x972f3f615efb0589bddfd078047b16d42983e88347dd3f60ddf6efdfef9f3f81 ,
                                        0x1d99ab67f743821c575d8cab0e40530b10404c688e461b3fc539f2cec808aea5 ,
                                        0x407d13f07825033350e4ffffc7af9fbefd08ec6efef9f50be2a9df700688fdfb ,
                                        0x17a864017737c131071914f9f79f8911d8dcfcfcf52b1b07c7a6a593812d2e60 ,
                                        0xd14fe6040d0c00041013a15e3376d3397884fe8093226ce8f83fa81e6204ad1e ,
                                        0xf8f6fd07c42fc87efb096c2bff8144de6fb8af607e0385d3f7af5f3f7ffdccc2 ,
                                        0xcafce8fecde78fef80d7361191b5904639d04401028889a4ac05375d585cf537 ,
                                        0xb04b0fcc3ce0314260370c583b839abbffff7ffbf11d9c0c41d1024a7b60ef80 ,
                                        0xdbfee03cf6074a8218ff20fe02d57def3f7efcf9f737b09e06b6cb9e3fbe4bcc ,
                                        0x8a8effffb1774920c20001c4424c8ec4349d4f50464446fbf5a36becececc034 ,
                                        0xf90f12484cc038fbfde1f3076001c20a2af241c3a3a00613b8fd042d06c1001a ,
                                        0x69bfc1f5de7f4620e7ddc70f7fc123a9c06ef8ab670ff1ce87e19bcefe0f2b24 ,
                                        0x0102888981f13f967293d02c38b081676c17f3fec3c71f3f7f834a3660a10fec ,
                                        0x323330b2b3b2befbf8f6edfbb790140806bf21f1864afe85942e9074f8f5eb97 ,
                                        0x4f5f3e83db98ff599899be7c7a87bfc0c0b99209491c208058b02c58206e165c ,
                                        0x52569b859de7ebd7efc0fe3064c91f308c9819997efcfdf9ecf573617e01607f ,
                                        0x9af91f0ba44b826838fd875480d0421f988481cdad57cf5f7cfdf913527100ed ,
                                        0xe0e0e663405af6c380771112bc9a457336400031e12f03f1cc8203fb285e1115 ,
                                        0xdf806505b00f0dac78c14d25262660678ce9cdc7771f3e7f02f66640c5c72f78 ,
                                        0xd4fd029796bfe1f1062a541919bf7cf9f4e4d5b37f60e3812d68a0a8a8b80c51 ,
                                        0x0506038ec1333000082026b491608cf9187c294143dfc5c63dfecbe74fc01ae8 ,
                                        0xc7cfbf3f7f0113d87f60e2fef1ebe79dc7f77efcfc01acc97efd8117f788a408 ,
                                        0xe1fd6364fef9fddbc3870fbffffd032c7880891032aa2f2aa5404c81c180a72b ,
                                        0xc9c80810402c90e55dff0955d3b8a42cdd12806d8e633b578086a5409d472670 ,
                                        0xc830bdfdf8fef9ab975262e2900e25bce882b40c4191cbc8f4e7e74f4e11d9ff ,
                                        0x2f5efd7ff71aa491e1dfb76f3f2c5d0295348c882930fea375fb510140003141 ,
                                        0x6b8cfff80a473cfd2256562e67dffcd0b42601617160e2fafee3f78f1fa07801 ,
                                        0x55d62f9fbe7afd1a186f904408ea92028bcbdfa00804ba04542db3f31a7867fa ,
                                        0x25d703fb3c40f55fbe7ee7e011f48f2e6204379a415d38e2a7c019d1fbd10001 ,
                                        0xc482392247f2b2194646757d57252dbbddbbe6efddb984fd2f0307303a5898ff ,
                                        0x30fd7ff5f91d307a80d5002b2b2bb0cd05095870e3e337bf98a2655435502f8f ,
                                        0x8024070fffa3c74f6554f4e3f33bb878041860253323e1d602ce85200001c4c2 ,
                                        0x88d14c266345da97af1fce5e3f78e8e6a18f7cec8c7fff4b71722b700bb20113 ,
                                        0xe19fff0c7ffe0363ecdbb76f90a100b8e9bfbf7ffef8e50d1b2b372b0b9ba4bc ,
                                        0xa68953b491ad0f37af103cf018999949ce5a480020805818896c30e3182d0216 ,
                                        0xd6f75e5c5e7770ead7ef1f19d87e73f3700053de17a6bf1c2cec5cff99fe32fd ,
                                        0xfdcb02999e6584b43320c338cccc2c375edd5adf11262fa668a065abe518a0a3 ,
                                        0x6d07cd2bff49c85a70f9ff186be400028885889214e7b2995f7fbeeeb9b2e0c1 ,
                                        0xabcbbc222c2c5f81fddfefc0a40e6a7e004b711626e6ff2ca0dcf2f7cf7f48aa ,
                                        0x02761d99fec307391881f5052beb8b778f36ef9f0fcca8ca2737c94aa97bda45 ,
                                        0x7071f132322246441888f0155629800062c130e13f9159ebc5875b876fadfafc ,
                                        0xe3153f3f37780a8291e12f68be0868decfdf7f3f32fee1676203fb011c13a0a8 ,
                                        0xfaf71fa9f7cef48f958d99e3ffbf9fc0f2e7dfbf1f371e9ebbfbecf2f5fbc71d ,
                                        0x2d02b555ccf9784498808d6ab46611ee74859938010288056dec0aba669740a3 ,
                                        0x91e1c9fbab3b2fcfe060e51412e20556623fbfff05960effb9d8c16d62c63f5f ,
                                        0xbfbffdff438e85871956ce33822603a1337c206f823cf6979991ed3fe35f06c8 ,
                                        0xd213d0c0c1bf8f5f5eed3db3e8e2fdbd4e46110a927a1cec3ca4662d38000820 ,
                                        0x1606fc6bde31f3daffff971eefb8f6eca010af081b1bf3d71fdf7efef8076cb9 ,
                                        0x32fd07b576fffffd0f6e13ff7ffff3f737a6bf7ce0486304ad9306a54370b712 ,
                                        0x5c30fe07cd4fb0fcfdfd978119d8c0620655a6e0bcc70a2c30983e7d7bb5ebf4 ,
                                        0x5c35191b1d797b192925828990015bd10810402c241518405f5d7dbaf7dab303 ,
                                        0x5cec7cacccacbf7e7fffff17d86260012d6e00cfd3b17130403a325f814525c3 ,
                                        0x5f415072628034f0c1ad44a8c78091c30c1a8404a617666660f719a88c191830 ,
                                        0x4cc06867660135867efcfe7eebf189efdfbefdfde72e2fa342d85718de000820 ,
                                        0x96ffff717778300a8c476f2f5c78bc9d9f53848599edcf9f9fff418d43a67fa0 ,
                                        0xec05696f30b1b2b18057713000dbfcafbfff90640096e62ca0ce36a846065668 ,
                                        0x4c90414550e317d8326462fefb8f09e82bf004c57f663616a076160e66481fe7 ,
                                        0xe79f1f2fdedfbb7eff140b33ab94a43cf17105010001c48273992346d67af3e5 ,
                                        0xc1f1bbabf83884d959387ffffd092c28206d2548f9005eba016e3db1839dfef7 ,
                                        0xeffbdfdf5ffdfb2ecbc8c3082a2899e09d4aa0e29f7fc133b14051602266008d ,
                                        0xa802238a8d83998d9d95850164c81f701fe0ebaf8f8f5e5fe7e514e5e1e6e3e3 ,
                                        0x15241457285e00082016228bc11fbf3eeebf3e8f83859383950b54f6fdff0b1f ,
                                        0xebfc8fd208017a8f99959d95f32f305afebffbf6471a544e82e72698403d6cc8 ,
                                        0x28246810e11f032707c7bf9f3f81951a6876869d859d9319585082132f030b13 ,
                                        0xe35f5019fbe7ebaff7779e9ce760e35257d6e7e6e2c1ea95ffd862122080302b ,
                                        0x6846ac2d8c53f7d7031b111c6c02c050fef3f707a489f217bc9c0dcd63c0f4c6 ,
                                        0x02cc381c6c3c0c8cbf19fffef8c9caf90f586e80068cc123e0a07d5ca0d1f0af ,
                                        0xbf787918ff32fd00f98b1de8252666d0d427b89d08ee653342aa8e7f3f3e7d7f ,
                                        0x76efc9450e766e4d555dc81e0962c6420102087d82e33fb616c6d3f7d79f7db8 ,
                                        0xc1c32ec0ccc40ada75019a69668034d23146e1e1f1c6c4cec1f283e1df530156 ,
                                        0x3529f35f5fbefefafaedf71ff03024130bb034fcfbfb81902423cbb7bf8ccc7f ,
                                        0x9958c05d0c66481f1a34dc0f044c4ce00104d0d0c8f7773f1f3d78c5cdc3cf29 ,
                                        0x2da6c2c448d458284000b1e06bd943bdfaeff293ddc02cc0c6c2014cfec04e3d ,
                                        0x78dd067841002816fee35a1b038c3a767696cfbf5ffde462e01751fdfee50bd0 ,
                                        0xb90cd0a932c637efde8b0afe67e1fdfe97e927305d831023249c40eb0cfefe66 ,
                                        0xfa03ddf4021662f8f6f2c3cd7f77be025bd292c24ac4acd00108201602b9f03f ,
                                        0xc3afbfdfde7e7ecccdc1cf08eec68356ea812dc7155db0b92ff8f0d1bf97afae ,
                                        0x896b2ab1b3b201cb03d07418a853c9cac575e73ff34f361660f9c9c4c002def8 ,
                                        0xf38ff11f64f0f40fa8e807f5ec40f80f281533fcfaf9f7f3f3b70f1e3cbb0ef5 ,
                                        0x18aaaf3037060204100bbea11f30f7cbcf773f7f7fe7e7120635f7fefd86f414 ,
                                        0xf14717b26f81a9f7f9ab1ba2424a0ab2267ffefe62044fac3073b070707233fc ,
                                        0xfece00ea0230fd07ef8d64600156668cc0e21f982099a08d319073ff01ad0556 ,
                                        0xfaff7efefdf3f7d9ab3b58873d309d0d1040b827256051f6e6d313603a044617 ,
                                        0x7810063418f80734c0f1175229637a0906fec19758029df8ece50dd038db7f60 ,
                                        0xc9c0c4f08f89f90f1ba84f062ef521399611b6fc14d4e106665060f9035a92c4 ,
                                        0x0c4c7bc06213e85dd0acd4ffbf1f3ebf3e7a7ef38bf7f70996f70001c484d9c8 ,
                                        0x405b1dfef4dd4d562636f0503b68d4ec2f68f4f3377cd41ead5d026b5efc8727 ,
                                        0x542000baf1dd8727ef3f3c65626003950fa01571fffffc61000de730324027a2 ,
                                        0xe000bc0010980fc1d3f0a0a14a2666487d018cc6bf7f187e12b72285012080a0 ,
                                        0x0312ffb1ac2a803afccf9f1fe0e6c25fd030cc9f9fbfff408779213327ff30c0 ,
                                        0x7f54008937600d71f3ee41606403ab62d0ae57505b85e9d72f609bf13738a5a1 ,
                                        0xe8fa0759af095a59c0809880078d65b202e3f32f6c8609ff680c4000b1a0672d ,
                                        0x8caedeb79f9fc00310a0816c9087402b7dff42db7c0c289bf520dd6f84fb905c ,
                                        0x0b4c5e6fde3ffcfaed030f9708383a19197efd03ba1b5c068166385037fdc106 ,
                                        0x6d19ff4316d682db284ccce074fa87e137316b870002880557210ff7e6ef3fbf ,
                                        0x4093b1a0bae5c7af3fbf2025076c3c8211dcfc832a666264844c0ea1f90dbc8e ,
                                        0x0d98e47ebefff88c97431c182c3fc00b4dd9b958bfff851484584a1f5019f2ef ,
                                        0x3fc46fa07c0aeade80b2e81ff0041ac1e133800062f98fc5cf8828840c5083ba ,
                                        0x237f7efffa0be4fc02178588f802053e2cb0ff821bf86829113679099aa77eff ,
                                        0xe999a49036b050fcfde3c79fef3fb9f999ff8357cb324266a250a2eb3fbc0d04 ,
                                        0xf21868d50bd0746666d08aba3f8467d91918000288056d4efa3fea8210d0fae3 ,
                                        0x1f3f9840651874bc1d926ffe3332c2b6aba3a7460624bf41fa29d08da80c0c6f ,
                                        0x3f3cfcf9f31b072bdf9f9f7fbffdf82ec8c20a742530fed1923384648498fc1f ,
                                        0x96161821636c40cfb111d3d1040820169c93cde07212b460effb377670b50a9b ,
                                        0xa7fb0f9e4860846c9945f318647d00dc71481e039604ccef3f3dfef0e9998490 ,
                                        0x0064dd00301afefdfaf38ff11f661d0849bde0920db6808719d4e501a60a5626 ,
                                        0x6e623c0610402cd83bcaffa1c5f7bbb76f7ffcfac1c401ec32b1c2a7e9fec1ca ,
                                        0xbaffd0260623bcee07873403036a8284e434506fe5d7b757efef4808eafcfbf3 ,
                                        0xeff7f75f4c2c6cbf7e82a419a0a705fc47ae0c41de03798b193ca901f21e688a ,
                                        0xf7f74f4e1601623c0610402c8ca8bd6e26a48c0c4c7d1f3e7ef8f5ed1f1bd71f ,
                                        0x160656d0da0750058d542062780c393532a0d46c900281e1f3b7d7bf7fff04e6 ,
                                        0x5760cdc1c8c2fdefcfefff8cff50f638236a7970ee62fc076af333b1023b7440 ,
                                        0x337efd6404f5040901a071000184b67416bc0cf73f62ef122b0bebf737ec3c62 ,
                                        0x5f81c50630978366b4fe3310f018464e83b72841abcbbebffffdebc79f1fbfd8 ,
                                        0x58997efcfefaf71fa2d783e13170af05982e98fe32b032b0fc01566abfbebfe7 ,
                                        0xe554e6c6df888300800062411bd16642da4e02ec29717173f3b1c87cfc789e8b ,
                                        0x1318b24c90050cf0d12c34bf610c3d304242075e2f019dfaede7879fbfbf7dfb ,
                                        0xf28d8985f1ebcf4fa09924f4f535a8210124402522136837d38f3f9c0c52dcdc ,
                                        0xfce2828a04230d208058308bcbd9cb370253ddb7efdfbe7efbf6fdfbcf3f7fb8 ,
                                        0x7fbfb3fc076bcec3d4fe036fc36702f7fc98889ecb078107e7773240f6253fe7 ,
                                        0x6260d0c4d1eb812d24c3a8e3e6aedcc2f07f336c6c9f115bcb1ee40080006241 ,
                                        0x734c528c07ae2943cc859f0c0cf85649e23fc9026b0b9da8d12862f64afc6700 ,
                                        0x082026ccc58ce4f90af7a28affc4d4a7d4f415d8130001c4045d0383a791f29f ,
                                        0xd04817a1996b062276a4fe27603cb1e91cae0a208098889952c1b494c6bec2e1 ,
                                        0x01e2fc04010001c4842fd1ffc79604fe13b780079763fe13e35af213217c8213 ,
                                        0x208098f0652d0692b31619050603f5b21632000820260a0b8cff83a6c0406b7a ,
                                        0x000410d3302a3090fdc50810404c44d7451465adff44652d4a0b0c640010404c ,
                                        0x446deca3b82e26627a844a8910b6380220809806a42ea6a9af20e6010410d360 ,
                                        0xc85a54f61558274000b13033fe9fb77cd38f9fc026ef7760ab173cc6f10fbcb4 ,
                                        0x0632650c69a4837669c07a59a079105873850979292836d7fdc771581d218731 ,
                                        0x621fb886cd0721f7df600388906511e0820328001060000b09d7a8d121096200 ,
                                        0x00000049454e44ae426082
                                    End
                                    DefaultPicture ="image_contacts.png"
                                    TabIndex =12

                                End
                                Begin TextBox
                                    OverlapFlags =215
                                    IMEMode =2
                                    Left =8280
                                    Top =840
                                    Width =3450
                                    Height =315
                                    TabIndex =13
                                    Name ="E-mail Address"
                                    ControlSource ="E-mail Address"
                                    Tag ="EmailField"
                                    EventProcPrefix ="E_mail_Address"
                                    SmartTags ="\"urn:schemas-microsoft-com:office:smarttags#PersonName\""
                                    GroupTable =2
                                    TopPadding =23
                                    RightPadding =38
                                    BottomPadding =31
                                    HorizontalAnchor =2
                                    OnDblClickEmMacro = Begin
                                        Version =196611
                                        ColumnsShown =10
                                        Begin
                                            Action ="OnError"
                                            Argument ="0"
                                        End
                                        Begin
                                            Condition ="Not IsNull([Screen].[ActiveControl])"
                                            Action ="SendObject"
                                            Argument ="-1"
                                            Argument =""
                                            Argument =""
                                            Argument ="=[Screen].[ActiveControl]"
                                            Argument =""
                                            Argument =""
                                            Argument =""
                                            Argument =""
                                            Argument ="-1"
                                        End
                                        Begin
                                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                                "nterfaceMacro For=\"E-mail Address\" xmlns=\"http://schemas.microsoft.com/office"
                                                "/accessservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Con"
                                                "ditionalBlock><If><Condition>No"
                                        End
                                        Begin
                                            Comment ="_AXL:t IsNull([Screen].[ActiveControl])</Condition><Statements><Action Name=\"EM"
                                                "ailDatabaseObject\"><Argument Name=\"To\">=[Screen].[ActiveControl]</Argument></"
                                                "Action></Statements></If></ConditionalBlock></Statements></UserInterfaceMacro>"
                                        End
                                    End

                                    LayoutCachedLeft =8280
                                    LayoutCachedTop =840
                                    LayoutCachedWidth =11730
                                    LayoutCachedHeight =1155
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =1
                                    GroupTable =2
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =7215
                                            Top =840
                                            Width =1005
                                            Height =315
                                            Name ="E-mail Address_Label"
                                            Caption ="E-mail "
                                            EventProcPrefix ="E_mail_Address_Label"
                                            GroupTable =2
                                            TopPadding =23
                                            BottomPadding =31
                                            LayoutCachedLeft =7215
                                            LayoutCachedTop =840
                                            LayoutCachedWidth =8220
                                            LayoutCachedHeight =1155
                                            LayoutGroup =1
                                            GroupTable =2
                                        End
                                    End
                                End
                                Begin TextBox
                                    IsHyperlink = NotDefault
                                    OverlapFlags =215
                                    IMEMode =2
                                    Left =8280
                                    Top =1215
                                    Width =3450
                                    Height =330
                                    TabIndex =14
                                    Name ="Web Page"
                                    ControlSource ="Web Page"
                                    Tag ="HyperlinkField"
                                    EventProcPrefix ="Web_Page"
                                    GroupTable =2
                                    TopPadding =23
                                    RightPadding =38
                                    BottomPadding =31
                                    HorizontalAnchor =2

                                    LayoutCachedLeft =8280
                                    LayoutCachedTop =1215
                                    LayoutCachedWidth =11730
                                    LayoutCachedHeight =1545
                                    RowStart =1
                                    RowEnd =1
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =1
                                    GroupTable =2
                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =7215
                                            Top =1215
                                            Width =1005
                                            Height =330
                                            Name ="Web Page_Label"
                                            Caption ="Web Page"
                                            Tag =";RegenerateCaption;"
                                            EventProcPrefix ="Web_Page_Label"
                                            GroupTable =2
                                            TopPadding =23
                                            BottomPadding =31
                                            LayoutCachedLeft =7215
                                            LayoutCachedTop =1215
                                            LayoutCachedWidth =8220
                                            LayoutCachedHeight =1545
                                            RowStart =1
                                            RowEnd =1
                                            LayoutGroup =1
                                            GroupTable =2
                                        End
                                    End
                                End
                                Begin TextBox
                                    EnterKeyBehavior = NotDefault
                                    ScrollBars =2
                                    OverlapFlags =215
                                    Left =5881
                                    Top =3360
                                    Width =5849
                                    Height =4365
                                    TabIndex =15
                                    Name ="Notes"
                                    ControlSource ="Notes"
                                    TextFormat =1
                                    HorizontalAnchor =2
                                    VerticalAnchor =2

                                    Begin
                                        Begin Label
                                            OverlapFlags =215
                                            Left =5881
                                            Top =2940
                                            Width =615
                                            Height =315
                                            Name ="Notes_Label"
                                            Caption ="Notes"
                                            Tag =";RegenerateCaption;"
                                        End
                                    End
                                End
                                Begin Label
                                    Visible = NotDefault
                                    OverlapFlags =215
                                    Left =2085
                                    Top =1545
                                    Width =3495
                                    Height =315
                                    FontWeight =700
                                    Name ="Primary Contact_Label_LayoutLabel"
                                    Caption =" "
                                    Tag =";DoNotResize;"
                                    EventProcPrefix ="Primary_Contact_Label_LayoutLabel"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =360
                                    RightPadding =37
                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =1545
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =1860
                                    RowStart =1
                                    RowEnd =1
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                End
                                Begin Label
                                    OverlapFlags =215
                                    Left =420
                                    Top =1545
                                    Width =1605
                                    Height =315
                                    FontWeight =700
                                    Name ="Primary Contact_Label"
                                    Caption ="Primary Contact"
                                    EventProcPrefix ="Primary_Contact_Label"
                                    GroupTable =4
                                    LeftPadding =29
                                    TopPadding =360
                                    RightPadding =29
                                    LayoutCachedLeft =420
                                    LayoutCachedTop =1545
                                    LayoutCachedWidth =2025
                                    LayoutCachedHeight =1860
                                    RowStart =1
                                    RowEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                End
                                Begin Label
                                    Visible = NotDefault
                                    OverlapFlags =215
                                    Left =2085
                                    Top =3390
                                    Width =3495
                                    Height =315
                                    FontWeight =700
                                    Name ="Phone Numbers_Label_LayoutLabel"
                                    Tag =";DoNotResize;"
                                    EventProcPrefix ="Phone_Numbers_Label_LayoutLabel"
                                    GroupTable =4
                                    LeftPadding =29
                                    RightPadding =37
                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =3390
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =3705
                                    RowStart =5
                                    RowEnd =5
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                End
                                Begin Label
                                    OverlapFlags =215
                                    Left =420
                                    Top =3390
                                    Width =1605
                                    Height =315
                                    FontWeight =700
                                    Name ="Phone Numbers_Label"
                                    Caption ="Phone Numbers"
                                    EventProcPrefix ="Phone_Numbers_Label"
                                    GroupTable =4
                                    LeftPadding =29
                                    RightPadding =29
                                    LayoutCachedLeft =420
                                    LayoutCachedTop =3390
                                    LayoutCachedWidth =2025
                                    LayoutCachedHeight =3705
                                    RowStart =5
                                    RowEnd =5
                                    LayoutGroup =3
                                    GroupTable =4
                                End
                                Begin Label
                                    OverlapFlags =215
                                    Left =2085
                                    Top =5235
                                    Width =3495
                                    Height =330
                                    FontWeight =700
                                    Name ="Address_Label2_LayoutLabel"
                                    Caption =" "
                                    Tag =";DoNotResize;"
                                    GroupTable =4
                                    LeftPadding =29
                                    RightPadding =37
                                    LayoutCachedLeft =2085
                                    LayoutCachedTop =5235
                                    LayoutCachedWidth =5580
                                    LayoutCachedHeight =5565
                                    RowStart =9
                                    RowEnd =9
                                    ColumnStart =1
                                    ColumnEnd =1
                                    LayoutGroup =3
                                    GroupTable =4
                                End
                                Begin Label
                                    OverlapFlags =215
                                    Left =420
                                    Top =5235
                                    Width =1605
                                    Height =330
                                    FontWeight =700
                                    Name ="Address_Label2"
                                    Caption ="Address"
                                    GroupTable =4
                                    LeftPadding =29
                                    RightPadding =29
                                    LayoutCachedLeft =420
                                    LayoutCachedTop =5235
                                    LayoutCachedWidth =2025
                                    LayoutCachedHeight =5565
                                    RowStart =9
                                    RowEnd =9
                                    LayoutGroup =3
                                    GroupTable =4
                                End
                            End
                        End
                        Begin Page
                            OverlapFlags =247
                            Left =360
                            Top =705
                            Width =11430
                            Height =7125
                            Name ="Orders_Page"
                            Caption ="Orders"
                            ImageData = Begin
                                0x00000000
                            End
                            WebImagePaddingLeft =2
                            WebImagePaddingTop =2
                            WebImagePaddingRight =2
                            WebImagePaddingBottom =2
                            Begin
                                Begin Subform
                                    OverlapFlags =247
                                    Left =465
                                    Top =780
                                    Width =9840
                                    Height =6120
                                    Name ="Customer Orders subform"
                                    SourceObject ="Form.Customer Orders Subform"
                                    LinkChildFields ="Customer ID"
                                    LinkMasterFields ="ID"
                                    EventProcPrefix ="Customer_Orders_subform"
                                    HorizontalAnchor =2
                                    VerticalAnchor =2

                                End
                            End
                        End
                    End
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =300
                    Width =660
                    Height =60
                    Name ="cboGoToContact_Label_LayoutLabel"
                    Tag =";DoNotResize;"
                    GroupTable =3
                    TopPadding =0
                    BottomPadding =0
                    LayoutCachedLeft =300
                    LayoutCachedWidth =960
                    LayoutCachedHeight =60
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =2
                    GroupTable =3
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =1020
                    Width =1440
                    Height =60
                    Name ="cboGoToContact_LayoutLabel"
                    Tag =";DoNotResize;"
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =0
                    LayoutCachedLeft =1020
                    LayoutCachedWidth =2460
                    LayoutCachedHeight =60
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =2
                    GroupTable =3
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =2535
                    Width =1875
                    Height =60
                    Name ="cmdEmailCustomer_LayoutLabel"
                    Tag =";DoNotResize;"
                    EventProcPrefix ="cmdEmail_Contact_LayoutLabel"
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =0
                    LayoutCachedLeft =2535
                    LayoutCachedWidth =4410
                    LayoutCachedHeight =60
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =2
                    GroupTable =3
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =4485
                    Width =2025
                    Height =60
                    Name ="cmdCreateOutlookContact_LayoutLabel"
                    Tag =";DoNotResize;"
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =0
                    LayoutCachedLeft =4485
                    LayoutCachedWidth =6510
                    LayoutCachedHeight =60
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =2
                    GroupTable =3
                End
                Begin Label
                    Visible = NotDefault
                    OverlapFlags =85
                    Left =6585
                    Width =1260
                    Height =60
                    Name ="cmdSaveandNew_LayoutLabel"
                    Tag =";DoNotResize;"
                    GroupTable =3
                    TopPadding =0
                    RightPadding =38
                    BottomPadding =0
                    LayoutCachedLeft =6585
                    LayoutCachedWidth =7845
                    LayoutCachedHeight =60
                    RowStart =1
                    RowEnd =1
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =2
                    GroupTable =3
                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =14870503
            Name ="FormFooter"
        End
    End
End
