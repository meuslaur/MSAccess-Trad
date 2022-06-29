Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11914
    DatasheetFontHeight =11
    ItemSuffix =37
    Top =600
    Right =18795
    Bottom =11880
    RecSrcDt = Begin
        0xfdd069cc4ed8e540
    End
    RecordSource ="Customers"
    Caption ="Customers"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =0
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
        Begin Attachment
            BackStyle =0
            BorderLineStyle =0
            PictureSizeMode =3
            Width =1701
            Height =1701
            LabelX =-1701
            AddColon =0
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
                    Width =1653
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Company_Étiquette"
                    Caption ="Company"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =1653
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =1710
                    Width =1653
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Last Name_Étiquette"
                    Caption ="Last Name"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Last_Name_Étiquette"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =1710
                    LayoutCachedWidth =3363
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =3420
                    Width =1653
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="First Name_Étiquette"
                    Caption ="First Name"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="First_Name_Étiquette"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =3420
                    LayoutCachedWidth =5073
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =5159
                    Width =1653
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Job Title_Étiquette"
                    Caption ="Job Title"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Job_Title_Étiquette"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =5159
                    LayoutCachedWidth =6812
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =6859
                    Width =1653
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="City_Étiquette"
                    Caption ="City"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =6859
                    LayoutCachedWidth =8512
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =8569
                    Width =1653
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="State/Province_Étiquette"
                    Caption ="State/Province"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="State_Province_Étiquette"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =8569
                    LayoutCachedWidth =10222
                    LayoutCachedHeight =315
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =10261
                    Width =1653
                    Height =315
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Country/Region_Étiquette"
                    Caption ="Country/Region"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Country_Region_Étiquette"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =10261
                    LayoutCachedWidth =11914
                    LayoutCachedHeight =315
                End
            End
        End
        Begin Section
            Height =330
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    Width =1653
                    Height =330
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Company"
                    ControlSource ="Company"
                    GridlineColor =10921638

                    LayoutCachedWidth =1653
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    OverlapFlags =85
                    Left =1710
                    Width =1653
                    Height =330
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Last Name"
                    ControlSource ="Last Name"
                    EventProcPrefix ="Last_Name"
                    GridlineColor =10921638

                    LayoutCachedLeft =1710
                    LayoutCachedWidth =3363
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    OverlapFlags =85
                    Left =3420
                    Width =1653
                    Height =330
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="First Name"
                    ControlSource ="First Name"
                    EventProcPrefix ="First_Name"
                    GridlineColor =10921638

                    LayoutCachedLeft =3420
                    LayoutCachedWidth =5073
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    OverlapFlags =85
                    Left =5159
                    Width =1653
                    Height =330
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Job Title"
                    ControlSource ="Job Title"
                    EventProcPrefix ="Job_Title"
                    GridlineColor =10921638

                    LayoutCachedLeft =5159
                    LayoutCachedWidth =6812
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    OverlapFlags =85
                    Left =6859
                    Width =1653
                    Height =330
                    ColumnWidth =3000
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="City"
                    ControlSource ="City"
                    GridlineColor =10921638

                    LayoutCachedLeft =6859
                    LayoutCachedWidth =8512
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    OverlapFlags =85
                    Left =8569
                    Width =1653
                    Height =330
                    ColumnWidth =3000
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="State/Province"
                    ControlSource ="State/Province"
                    EventProcPrefix ="State_Province"
                    GridlineColor =10921638

                    LayoutCachedLeft =8569
                    LayoutCachedWidth =10222
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    OverlapFlags =85
                    Left =10261
                    Width =1653
                    Height =330
                    ColumnWidth =3000
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Country/Region"
                    ControlSource ="Country/Region"
                    EventProcPrefix ="Country_Region"
                    GridlineColor =10921638

                    LayoutCachedLeft =10261
                    LayoutCachedWidth =11914
                    LayoutCachedHeight =330
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
