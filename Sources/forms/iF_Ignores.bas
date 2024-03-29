﻿Version =20
VersionRequired =20
PublishOption =1
Begin Form
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    DefaultView =0
    ScrollBars =0
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =8163
    DatasheetFontHeight =11
    ItemSuffix =17
    Left =3960
    Top =948
    Right =14052
    Bottom =11136
    DatasheetGridlinesColor =15132391
    RecSrcDt = Begin
        0xc605179cabdde540
    End
    Caption ="Sélection des objets à masquer."
    OnOpen ="[Event Procedure]"
    OnClose ="[Event Procedure]"
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
        Begin Section
            CanGrow = NotDefault
            Height =10204
            Name ="Détail"
            AlternateBackColor =15921906
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin CommandButton
                    Cancel = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    Width =392
                    Height =170
                    TabIndex =1
                    ForeColor =4210752
                    Name ="cmdFerme"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638
                    BackStyle =0

                    LayoutCachedWidth =392
                    LayoutCachedHeight =170
                    UseTheme =0
                    Gradient =0
                    BackColor =14461583
                    BorderColor =14461583
                    HoverColor =15189940
                    PressedColor =9917743
                    HoverForeColor =4210752
                    PressedForeColor =4210752
                    WebImagePaddingLeft =3
                    WebImagePaddingTop =3
                    WebImagePaddingRight =2
                    WebImagePaddingBottom =2
                    Overlaps =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =215
                    DecimalPlaces =0
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =6179
                    Top =566
                    Width =1749
                    Height =330
                    BorderColor =5855577
                    ColumnInfo ="\"\";\"\";\"\";\"\";\"10\";\"40\""
                    Name ="zlObjetTypes"
                    RowSourceType ="Table/Query"
                    RowSource ="RL_ObjetTypes"
                    ColumnWidths ="0;1701"
                    AfterUpdate ="=FiltreSF()"
                    OnMouseDown ="=OuvreZl()"
                    GridlineColor =10921638
                    AllowValueListEdits =0
                    InheritValueList =0

                    ShowOnlyRowSourceValues =255
                    LayoutCachedLeft =6179
                    LayoutCachedTop =566
                    LayoutCachedWidth =7928
                    LayoutCachedHeight =896
                    BackThemeColorIndex =3
                    BackShade =90.0
                    BorderShade =35.0
                    ForeThemeColorIndex =0
                    ForeTint =70.0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            Left =6179
                            Top =226
                            Width =1752
                            Height =348
                            Name ="lbl_zlObjetTypes"
                            Caption ="Objet types"
                            GridlineColor =10921638
                            LayoutCachedLeft =6179
                            LayoutCachedTop =226
                            LayoutCachedWidth =7931
                            LayoutCachedHeight =574
                            BackThemeColorIndex =3
                            BackShade =70.0
                            BorderThemeColorIndex =1
                            BorderTint =100.0
                            BorderShade =35.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Subform
                    OverlapFlags =85
                    Left =340
                    Top =1077
                    Width =7632
                    Height =9000
                    TabIndex =2
                    BorderColor =10921638
                    Name ="sfObjets"
                    SourceObject ="Form.iF_IgnoresSF"
                    LinkChildFields ="IDApp"
                    LinkMasterFields ="txtIDApp"
                    GridlineColor =10921638

                    LayoutCachedLeft =340
                    LayoutCachedTop =1077
                    LayoutCachedWidth =7972
                    LayoutCachedHeight =10077
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =340
                    Top =566
                    Width =4866
                    Height =315
                    TabIndex =3
                    BorderColor =10921638
                    Name ="txtBase"
                    ControlTipText ="Liste des applications déjà enregistrées,"
                    GridlineColor =10921638

                    LayoutCachedLeft =340
                    LayoutCachedTop =566
                    LayoutCachedWidth =5206
                    LayoutCachedHeight =881
                    BackThemeColorIndex =7
                    BackTint =20.0
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            OverlapFlags =93
                            TextAlign =2
                            TextFontFamily =49
                            Left =340
                            Top =226
                            Width =4872
                            Height =345
                            FontWeight =500
                            BorderColor =8355711
                            ForeColor =5066061
                            Name ="lbl_zlBase"
                            Caption ="Base"
                            FontName ="Consolas"
                            GridlineColor =10921638
                            LayoutCachedLeft =340
                            LayoutCachedTop =226
                            LayoutCachedWidth =5212
                            LayoutCachedHeight =571
                            ThemeFontIndex =-1
                            BackThemeColorIndex =7
                            BackTint =50.0
                            ForeTint =70.0
                        End
                    End
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5269
                    Top =566
                    Width =849
                    Height =300
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtIDApp"
                    GridlineColor =10921638
                    ShowDatePicker =0

                    LayoutCachedLeft =5269
                    LayoutCachedTop =566
                    LayoutCachedWidth =6118
                    LayoutCachedHeight =866
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
    If IsNull(Me.OpenArgs()) Then
        Cancel = True
        DoCmd.Close
        Exit Sub
    End If

    Dim frmArgs() As String
    
    frmArgs = Split(Me.OpenArgs(), ";")
    Me.txtIDApp = frmArgs(0)
    Me.txtBase = frmArgs(1)
    Me.zlObjetTypes = 0

End Sub

Private Sub Form_Close()
    Forms.Item("F_Main").UpdateIgnorer
End Sub

Private Sub cmdFerme_Click()
    DoCmd.Close
End Sub

' ----------------------------------------------------------------
'// Ouvre les zl sur OnGotFocus (=OuvreZl()).
' ----------------------------------------------------------------
Private Function OuvreZl() As Boolean
    Me.ActiveControl.Dropdown
End Function

Private Function FiltreSF() As Boolean
    Dim sFiltreT As String

    sFiltreT = IIf(IsNull(Me.zlObjetTypes), vbNullString, "[IDType]=" & Me.zlObjetTypes)

    Me.sfObjets.Form.Filter = sFiltreT
    Me.sfObjets.Form.FilterOn = True

End Function
