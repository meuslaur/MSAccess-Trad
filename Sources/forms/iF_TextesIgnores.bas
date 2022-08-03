Version =20
VersionRequired =20
Begin Form
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    NavigationButtons = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =12812
    DatasheetFontHeight =11
    ItemSuffix =12
    Left =2304
    Top =720
    Right =16308
    Bottom =11604
    RecSrcDt = Begin
        0xc3ccc79417dde540
    End
    RecordSource ="iT_TextesIgnores"
    Caption ="Textes ignorés par les filtres lors du dernier scan"
    OnOpen ="[Event Procedure]"
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
            Height =11346
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =566
                    Top =793
                    Width =11901
                    Height =10272
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txt_Texte"
                    ControlSource ="Texte"
                    GridlineColor =10921638
                    TextFormat =1

                    LayoutCachedLeft =566
                    LayoutCachedTop =793
                    LayoutCachedWidth =12467
                    LayoutCachedHeight =11065
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2085
                    Left =566
                    Top =396
                    Width =3618
                    Height =300
                    BorderColor =10921638
                    ForeColor =3484194
                    ColumnInfo ="\"\";\"\";\"\";\"\";\"10\";\"200\""
                    Name ="zlBases"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_Apps"
                    ColumnWidths ="0;2088"
                    AfterUpdate ="[Event Procedure]"
                    ControlTipText ="Liste des applications déjà enregistrées,"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =566
                    LayoutCachedTop =396
                    LayoutCachedWidth =4184
                    LayoutCachedHeight =696
                    BackThemeColorIndex =7
                    BackTint =20.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            OverlapFlags =85
                            TextFontFamily =49
                            Left =566
                            Top =56
                            Width =1128
                            Height =300
                            FontWeight =500
                            BorderColor =8355711
                            ForeColor =5066061
                            Name ="lbl_zlBases"
                            Caption ="Base :"
                            FontName ="Consolas"
                            GridlineColor =10921638
                            LayoutCachedLeft =566
                            LayoutCachedTop =56
                            LayoutCachedWidth =1694
                            LayoutCachedHeight =356
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
                    OverlapFlags =85
                    Left =4422
                    Top =396
                    Width =1848
                    Height =300
                    BorderColor =8355711
                    Name ="lblInfo"
                    Caption ="Aucun texte ignorés"
                    GridlineColor =10921638
                    LayoutCachedLeft =4422
                    LayoutCachedTop =396
                    LayoutCachedWidth =6270
                    LayoutCachedHeight =696
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =75.0
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
'@IgnoreModule
'@Folder("Test")
Option Compare Database
Option Explicit

Private Sub Form_Open(Cancel As Integer)
    If (IsNull(Me.OpenArgs)) Then Exit Sub
    
    Me.zlBases = Me.OpenArgs()
    zlBases_AfterUpdate

End Sub

Private Sub zlBases_AfterUpdate()
    Me.txt_Texte.ControlSource = "Texte"
    Me.Filter = "[ID]='" & Me.zlBases & "'"
    Me.FilterOn = True
    Me.lblInfo.Visible = IsNull(Me.txt_Texte)
End Sub
