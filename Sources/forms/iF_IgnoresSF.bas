Version =20
VersionRequired =20
PublishOption =1
Begin Form
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    FilterOn = NotDefault
    ScrollBars =2
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7370
    DatasheetFontHeight =11
    ItemSuffix =11
    Left =10032
    Top =3216
    Right =17400
    Bottom =11952
    Filter ="[IDType]=-32768"
    RecSrcDt = Begin
        0xb79d0573d7dfe540
    End
    RecordSource ="R_F_IgnoresSf"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
    FilterOnLoad =255
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
            Height =300
            Name ="EntêteFormulaire"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Width =1128
                    Height =300
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_ObjetType"
                    Caption ="Type"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =1128
                    LayoutCachedHeight =300
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    Left =1757
                    Width =2052
                    Height =300
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_ObjetNom"
                    Caption ="Nom"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =1757
                    LayoutCachedWidth =3809
                    LayoutCachedHeight =300
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Left =6462
                    Width =900
                    Height =300
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lbl_Ignorer"
                    Caption ="Masquer"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =6462
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =300
                End
            End
        End
        Begin Section
            Height =300
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Locked = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Width =1704
                    Height =300
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtTypeNom"
                    ControlSource ="TypeNom"
                    GridlineColor =10921638
                    ShowDatePicker =0

                    LayoutCachedWidth =1704
                    LayoutCachedHeight =300
                    BackThemeColorIndex =3
                    BackShade =90.0
                End
                Begin TextBox
                    Locked = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =1700
                    Width =5100
                    Height =300
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtObjetNom"
                    ControlSource ="ObjetNom"
                    GridlineColor =10921638
                    ShowDatePicker =0

                    LayoutCachedLeft =1700
                    LayoutCachedWidth =6800
                    LayoutCachedHeight =300
                    BackThemeColorIndex =4
                    BackTint =40.0
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6973
                    Top =56
                    TabIndex =4
                    BorderColor =10921638
                    Name ="chkIgnorer"
                    ControlSource ="Ignorer"
                    GridlineColor =10921638

                    LayoutCachedLeft =6973
                    LayoutCachedTop =56
                    LayoutCachedWidth =7233
                    LayoutCachedHeight =296
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    EnterKeyBehavior = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =4365
                    Width =954
                    Height =300
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtObjet_ID"
                    ControlSource ="Objet_ID"
                    GridlineColor =10921638
                    ShowDatePicker =0

                    LayoutCachedLeft =4365
                    LayoutCachedWidth =5319
                    LayoutCachedHeight =300
                End
                Begin TextBox
                    Visible = NotDefault
                    TabStop = NotDefault
                    AllowAutoCorrect = NotDefault
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =5612
                    Width =1023
                    Height =300
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtIDApp"
                    ControlSource ="IDApp"
                    GridlineColor =10921638
                    ShowDatePicker =0

                    LayoutCachedLeft =5612
                    LayoutCachedWidth =6635
                    LayoutCachedHeight =300
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
CodeBehindForm
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'@Folder("Form")
Option Compare Database
Option Explicit

Private Sub Form_Open(Cancel As Integer)

    On Error Resume Next
    '// Empeche l'ouverture indépendante.
    If (Me.Parent.Name = vbNullString) Then
        If Err.Number = 2452 Then
            Cancel = True
            DoCmd.Close
        End If
    End If
End Sub
