Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowEdits = NotDefault
    ScrollBars =2
    ViewsAllowed =1
    BorderStyle =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11338
    DatasheetFontHeight =11
    ItemSuffix =14
    Left =1932
    Top =756
    Right =12900
    Bottom =4716
    RecSrcDt = Begin
        0xe6bed64291dbe540
    End
    RecordSource ="R_F_MainSFControles"
    Caption ="Controles"
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
            BackThemeColorIndex =0
            BackTint =75.0
            Begin
                Begin Label
                    OverlapFlags =85
                    Left =680
                    Width =1704
                    Height =315
                    BorderColor =8355711
                    Name ="lbl_ControlParentName"
                    Caption ="Control Parent"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =680
                    LayoutCachedWidth =2384
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =3
                    ForeTint =100.0
                    ForeShade =90.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =5896
                    Width =1080
                    Height =315
                    BorderColor =8355711
                    Name ="lbl_txtControlNom"
                    Caption ="Control"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =5896
                    LayoutCachedWidth =6976
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =3
                    ForeTint =100.0
                    ForeShade =90.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =4081
                    Width =1080
                    Height =315
                    BorderColor =8355711
                    Name ="lbl_Type"
                    Caption ="Type"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =4081
                    LayoutCachedWidth =5161
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
                    Name ="lbl_Nouv"
                    Caption ="N"
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
            Height =315
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =4081
                    Width =1776
                    Height =315
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtControlType"
                    ControlSource ="ControlType"
                    GridlineColor =10921638

                    LayoutCachedLeft =4081
                    LayoutCachedWidth =5857
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =566
                    Width =3534
                    Height =315
                    ColumnWidth =3000
                    TabIndex =1
                    BackColor =13611711
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtControlParentName"
                    ControlSource ="ControlParentName"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedWidth =4100
                    LayoutCachedHeight =315
                    BackThemeColorIndex =-1
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =5854
                    Width =5475
                    Height =315
                    ColumnWidth =3000
                    TabIndex =3
                    LeftMargin =57
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtControlNom"
                    ControlSource ="ControlNom"
                    GridlineColor =10921638

                    LayoutCachedLeft =5854
                    LayoutCachedWidth =11329
                    LayoutCachedHeight =315
                    BackThemeColorIndex =9
                    BackTint =30.0
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =7272
                    Width =1590
                    Height =315
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ObjetParentGuid"
                    ControlSource ="ObjetParentGuid"
                    GridlineColor =10921638

                    LayoutCachedLeft =7272
                    LayoutCachedWidth =8862
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
                    TabIndex =4
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
                    OverlapFlags =247
                    TextFontCharSet =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =283
                    Width =291
                    Height =315
                    TabIndex =5
                    BorderColor =10921638
                    Name ="Nouv"
                    ControlSource ="Nouv"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =283
                    LayoutCachedWidth =574
                    LayoutCachedHeight =315
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =9030
                    Width =1116
                    Height =315
                    ColumnWidth =8010
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ControlGuid"
                    ControlSource ="ControlGuid"
                    GridlineColor =10921638

                    LayoutCachedLeft =9030
                    LayoutCachedWidth =10146
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
