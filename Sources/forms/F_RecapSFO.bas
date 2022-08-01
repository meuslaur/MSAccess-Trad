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
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10204
    DatasheetFontHeight =11
    ItemSuffix =9
    Left =-135
    Top =375
    Right =7710
    Bottom =3840
    RecSrcDt = Begin
        0x79c80a4a8ddce540
    End
    RecordSource ="SELECT T_Objets.ObjetType, T_Objets.ObjetNom, IIf(Scanner=False,\"=\",Null) AS S"
        "can, IIf(Nouveau=True,\"=\",Null) AS Nouv FROM T_Objets WHERE (((T_Objets.Scanne"
        "r)=False)) Or (((T_Objets.Nouveau)=True) And ((T_Objets.[IDApp])='BaseTemp - Cop"
        "ie')); "
    Caption ="F_RecapO"
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
                    Width =180
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtScan"
                    Caption ="S"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =180
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =340
                    Width =225
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_txtNouv"
                    Caption ="N"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =340
                    LayoutCachedWidth =565
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
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =737
                    Width =1695
                    Height =340
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ObjetType"
                    ControlSource ="ObjetType"
                    GridlineColor =10921638

                    LayoutCachedLeft =737
                    LayoutCachedWidth =2432
                    LayoutCachedHeight =340
                End
                Begin TextBox
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =2439
                    Width =7761
                    Height =340
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ObjetNom"
                    ControlSource ="ObjetNom"
                    GridlineColor =10921638

                    LayoutCachedLeft =2439
                    LayoutCachedWidth =10200
                    LayoutCachedHeight =340
                    BackThemeColorIndex =4
                    BackTint =40.0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =85
                    TextFontCharSet =2
                    TextAlign =2
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Width =284
                    Height =340
                    TabIndex =2
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
                    OverlapFlags =85
                    TextFontCharSet =2
                    TextAlign =2
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =340
                    Width =284
                    Height =340
                    TabIndex =3
                    BorderColor =10921638
                    Name ="txtModif"
                    ControlSource ="Nouv"
                    FontName ="Webdings"
                    GridlineColor =10921638

                    LayoutCachedLeft =340
                    LayoutCachedWidth =624
                    LayoutCachedHeight =340
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
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
