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
    Width =10266
    DatasheetFontHeight =11
    ItemSuffix =10
    Left =7500
    Top =3270
    Right =17760
    Bottom =8040
    RecSrcDt = Begin
        0xe8938c255ad8e540
    End
    RecordSource ="T_ObjetControles"
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
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Width =1704
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_ControlParentName"
                    Caption ="Control Parent"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =1704
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =4251
                    Width =1080
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_Control_ID"
                    Caption ="Control"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =4251
                    LayoutCachedWidth =5331
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =2494
                    Width =1080
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_Type"
                    Caption ="Type"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2494
                    LayoutCachedWidth =3574
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
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2478
                    Width =1776
                    Height =315
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ControlType"
                    ControlSource ="ControlType"
                    GridlineColor =10921638

                    LayoutCachedLeft =2478
                    LayoutCachedWidth =4254
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =247
                    IMESentenceMode =3
                    Width =2484
                    Height =315
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ControlParentName"
                    ControlSource ="ControlParentName"
                    GridlineColor =10921638

                    LayoutCachedWidth =2484
                    LayoutCachedHeight =315
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =255
                    IMESentenceMode =3
                    Left =4251
                    Width =6015
                    Height =315
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Control_ID"
                    ControlSource ="Control_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =4251
                    LayoutCachedWidth =10266
                    LayoutCachedHeight =315
                    BackThemeColorIndex =9
                    BackTint =60.0
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =5669
                    Width =1590
                    Height =315
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ObjetParent_ID"
                    ControlSource ="ObjetParent_ID"
                    GridlineColor =10921638

                    LayoutCachedLeft =5669
                    LayoutCachedWidth =7259
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
