Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    ShortcutMenu = NotDefault
    NavigationButtons = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowEdits = NotDefault
    DefaultView =0
    ScrollBars =0
    BorderStyle =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =6236
    DatasheetFontHeight =11
    ItemSuffix =5
    Left =1560
    Top =1812
    Right =7800
    Bottom =4188
    RecSrcDt = Begin
        0x7cc519de8adbe540
    End
    Caption ="F_RecapInfo"
    DatasheetFontName ="Calibri"
    OnKeyUp ="[Event Procedure]"
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
        Begin Section
            Height =2381
            Name ="Détail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    OverlapFlags =85
                    TextFontCharSet =2
                    TextAlign =2
                    TextFontFamily =18
                    Left =56
                    Top =113
                    Width =284
                    Height =340
                    ForeColor =2366701
                    Name ="lblBulleScan"
                    Caption ="="
                    FontName ="Webdings"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =113
                    LayoutCachedWidth =340
                    LayoutCachedHeight =453
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    TextFontCharSet =2
                    TextAlign =2
                    TextFontFamily =18
                    Left =56
                    Top =1587
                    Width =284
                    Height =340
                    Name ="lblBulleModif"
                    Caption ="="
                    FontName ="Webdings"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =1587
                    LayoutCachedWidth =340
                    LayoutCachedHeight =1927
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeThemeColorIndex =8
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin Label
                    OverlapFlags =85
                    TextFontCharSet =2
                    TextFontFamily =18
                    Left =56
                    Top =850
                    Width =284
                    Height =345
                    Name ="lblBulleNouv"
                    Caption ="="
                    FontName ="Webdings"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =850
                    LayoutCachedWidth =340
                    LayoutCachedHeight =1195
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =1
                    BorderTint =100.0
                    BorderShade =65.0
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin Label
                    OverlapFlags =85
                    Left =397
                    Top =113
                    Width =5670
                    Height =570
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lblBulleScanInfo"
                    Caption ="(S) - (Objet,Contrôle ou Propriéré)\015\012Indique  non vue lors du scan (Suppri"
                        "mé ou à été renommé)."
                    GridlineColor =10921638
                    LayoutCachedLeft =397
                    LayoutCachedTop =113
                    LayoutCachedWidth =6067
                    LayoutCachedHeight =683
                End
                Begin Label
                    OverlapFlags =85
                    Left =397
                    Top =850
                    Width =4485
                    Height =570
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lblBulleNouvInfo"
                    Caption ="(N) - (Objet,Contrôle ou Propriéré)\015\012Indique nouveau (Ajouté ou à été reno"
                        "mmé)."
                    GridlineColor =10921638
                    LayoutCachedLeft =397
                    LayoutCachedTop =850
                    LayoutCachedWidth =4882
                    LayoutCachedHeight =1420
                End
                Begin Label
                    OverlapFlags =85
                    Left =397
                    Top =1587
                    Width =5280
                    Height =675
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="lblBulleModifInfo"
                    Caption ="(M) - (Propriété)\015\012Indique que le texte de la propriété à été modifié."
                    GridlineColor =10921638
                    LayoutCachedLeft =397
                    LayoutCachedTop =1587
                    LayoutCachedWidth =5677
                    LayoutCachedHeight =2262
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

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    If (KeyCode = vbKeyEscape) Then DoCmd.Close
End Sub
