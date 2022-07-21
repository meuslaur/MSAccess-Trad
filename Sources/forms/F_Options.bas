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
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =7370
    DatasheetFontHeight =11
    ItemSuffix =2
    Left =5475
    Top =1485
    Right =12585
    Bottom =8880
    RecSrcDt = Begin
        0x27cfbbe40fdbe540
    End
    Caption ="F_Options"
    DatasheetFontName ="Calibri"
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
        Begin FormHeader
            Height =1134
            Name ="EntêteFormulaire"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =3
            BackShade =25.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =2834
                    Top =340
                    Width =1710
                    Height =435
                    FontSize =16
                    BorderColor =8355711
                    ForeColor =13421772
                    Name ="Étiquette0"
                    Caption ="Options"
                    GridlineColor =10921638
                    LayoutCachedLeft =2834
                    LayoutCachedTop =340
                    LayoutCachedWidth =4544
                    LayoutCachedHeight =775
                    ForeTint =20.0
                End
            End
        End
        Begin Section
            Height =5952
            Name ="Détail"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin CommandButton
                    OverlapFlags =85
                    Left =2494
                    Top =1247
                    Width =1986
                    Height =576
                    ForeColor =4210752
                    Name ="cmdSupDateOld"
                    Caption ="Commande1"
                    ControlTipText ="Dernier enregistrement"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =8
                        Begin
                            Action ="GoToRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="3"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cmdSupDateOld\" xmlns=\"http://schemas.microsoft.com/office/"
                                "accessservices/2009/11/application\"><Statements><Action Name=\"GoToRecord\"><Ar"
                                "gument Name=\"Record\">Last</Argu"
                        End
                        Begin
                            Comment ="_AXL:ment></Action></Statements></UserInterfaceMacro>"
                        End
                    End

                    LayoutCachedLeft =2494
                    LayoutCachedTop =1247
                    LayoutCachedWidth =4480
                    LayoutCachedHeight =1823
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
            End
        End
        Begin FormFooter
            Height =566
            Name ="PiedFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =3
            BackShade =25.0
        End
    End
End
