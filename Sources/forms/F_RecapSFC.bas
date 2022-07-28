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
    Width =10219
    DatasheetFontHeight =11
    ItemSuffix =15
    Left =852
    Top =3804
    Right =11556
    Bottom =7116
    RecSrcDt = Begin
        0x6a44f48478dbe540
    End
    Caption ="F_RecapC"
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
                    Left =283
                    Width =225
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtNouv"
                    Caption ="N"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =283
                    LayoutCachedWidth =508
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            Height =340
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2437
                    Width =7782
                    Height =340
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ControlNom"
                    ControlSource ="ControlNom"
                    GridlineColor =10921638

                    LayoutCachedLeft =2437
                    LayoutCachedWidth =10219
                    LayoutCachedHeight =340
                    BackThemeColorIndex =9
                    BackTint =30.0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextFontCharSet =2
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Width =284
                    Height =340
                    BorderColor =10921638
                    ForeColor =2366701
                    Name ="txtScan"
                    ControlSource ="Scan"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedWidth =284
                    LayoutCachedHeight =340
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
                    OverlapFlags =87
                    TextFontCharSet =2
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =283
                    Width =284
                    Height =340
                    TabIndex =1
                    BorderColor =10921638
                    Name ="txtNouv"
                    ControlSource ="Nouv"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =283
                    LayoutCachedWidth =567
                    LayoutCachedHeight =340
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin TextBox
                    TabStop = NotDefault
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =623
                    Width =1809
                    Height =340
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ControlType"
                    ControlSource ="ControlType"
                    GridlineColor =10921638

                    LayoutCachedLeft =623
                    LayoutCachedWidth =2432
                    LayoutCachedHeight =340
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =4535
                    Width =801
                    Height =300
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Scanner"
                    ControlSource ="Scanner"
                    GridlineColor =10921638

                    LayoutCachedLeft =4535
                    LayoutCachedWidth =5336
                    LayoutCachedHeight =300
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =5612
                    Width =801
                    Height =300
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Nouveau"
                    ControlSource ="Nouveau"
                    GridlineColor =10921638

                    LayoutCachedLeft =5612
                    LayoutCachedWidth =6413
                    LayoutCachedHeight =300
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
