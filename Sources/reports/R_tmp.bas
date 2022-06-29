Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    AllowDesignChanges = NotDefault
    TabularFamily =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    PicturePages =1
    DatasheetGridlinesBehavior =3
    GridX =24
    GridY =24
    Width =14405
    DatasheetFontHeight =10
    ItemSuffix =49
    Tag ="TabularWithPageHeader~Extensions=GroupByFirstLetter,Landscape"
    RecSrcDt = Begin
        0xaef05555580ae340
    End
    RecordSource ="Customers Extended"
    DatasheetFontName ="Arial"
    FilterOnLoad =0
    DatasheetBackColor12 =-2147483643
    FitToPage =255
    DisplayOnSharePointSite =1
    DatasheetGridlinesColor12 =-2147483632
    DatasheetForeColor12 =-2147483640
    Begin
        Begin Label
            BackStyle =0
            TextFontCharSet =178
            FontSize =9
            BorderColor =12371399
            ForeColor =1462991
            FontName ="Arial"
            GridlineColor =14870503
        End
        Begin Rectangle
            BorderLineStyle =0
            BackColor =14870503
            BorderColor =14870503
            GridlineColor =14870503
        End
        Begin Line
            OldBorderStyle =0
            BorderLineStyle =0
            BorderColor =12371399
            GridlineColor =14870503
        End
        Begin Image
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            BackColor =14870503
            BorderColor =14870503
            GridlineColor =14870503
        End
        Begin CommandButton
            TextFontCharSet =178
            FontSize =9
            FontWeight =400
            ForeColor =1769599
            FontName ="Arial"
            GridlineColor =14870503
            BorderLineStyle =0
        End
        Begin OptionButton
            OldBorderStyle =0
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderColor =12371399
            GridlineColor =14870503
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            GridlineColor =14870503
        End
        Begin OptionGroup
            OldBorderStyle =0
            BorderLineStyle =0
            BorderColor =12371399
        End
        Begin BoundObjectFrame
            AddColon = NotDefault
            OldBorderStyle =0
            BorderLineStyle =0
            BackStyle =0
            BorderColor =12371399
            GridlineColor =14870503
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            OldBorderStyle =0
            TextFontCharSet =178
            TextAlign =1
            BorderLineStyle =0
            BackStyle =0
            FontSize =9
            BorderColor =12371399
            FontName ="Arial"
            AsianLineBreak =255
            GridlineColor =14870503
            ShowDatePicker =0
        End
        Begin ListBox
            AddColon = NotDefault
            TextFontCharSet =178
            OldBorderStyle =0
            BorderLineStyle =0
            FontSize =9
            BorderColor =12371399
            FontName ="Arial"
            GridlineColor =14870503
        End
        Begin ComboBox
            AddColon = NotDefault
            OldBorderStyle =0
            TextFontCharSet =178
            BorderLineStyle =0
            BackStyle =0
            FontSize =9
            BorderColor =12371399
            FontName ="Arial"
            GridlineColor =14870503
        End
        Begin Subform
            AddColon = NotDefault
            BorderLineStyle =0
            BorderColor =12371399
            GridlineColor =14870503
        End
        Begin UnboundObjectFrame
            BackStyle =0
            BorderColor =12371399
            GridlineColor =14870503
        End
        Begin CustomControl
            OldBorderStyle =1
            BorderColor =12371399
            GridlineColor =14870503
        End
        Begin ToggleButton
            TextFontCharSet =178
            FontSize =9
            FontWeight =400
            ForeColor =1769599
            FontName ="Arial"
            GridlineColor =14870503
            BorderLineStyle =0
        End
        Begin Tab
            TextFontCharSet =178
            BackStyle =0
            FontSize =9
            FontName ="Arial"
            BorderLineStyle =0
        End
        Begin Attachment
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            PictureSizeMode =3
            Width =4800
            Height =3840
            BorderColor =12371399
            GridlineColor =14870503
            LabelX =-1800
            AddColon =0
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            KeepTogether =2
            GroupOn =1
            ControlSource ="File As"
        End
        Begin BreakLevel
            ControlSource ="File As"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =840
            Name ="ReportHeader"
            AutoHeight =255
            Begin
                Begin Label
                    TextFontCharSet =0
                    TextFontFamily =0
                    Width =7200
                    Height =540
                    FontSize =20
                    ForeColor =1769599
                    Name ="Auto_Title0"
                    Caption ="Customer Address Book"
                    FontName ="Trebuchet"
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineColor =0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TextAlign =0
                    IMESentenceMode =3
                    Left =9420
                    Width =3600
                    Height =225
                    FontSize =8
                    ForeColor =1769599
                    Name ="txtDate"
                    ControlSource ="=Date()"
                    Format ="Long Date"
                    Tag ="Date"
                    GridlineColor =0

                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    TextAlign =0
                    IMESentenceMode =3
                    Left =13080
                    Width =1320
                    Height =225
                    FontSize =8
                    TabIndex =1
                    ForeColor =1769599
                    Name ="txtTime"
                    ControlSource ="=Time()"
                    Format ="Long Time"
                    Tag ="Time"
                    GridlineColor =0

                End
                Begin TextBox
                    Enabled = NotDefault
                    TextAlign =0
                    IMESentenceMode =3
                    Top =540
                    Width =10800
                    Height =225
                    FontSize =8
                    TabIndex =2
                    ForeColor =1769599
                    Name ="txtReportFilter"
                    ControlSource ="=IIf([Report].[Filter]<>\"\" And [Report].[FilterOn],Replace(\"Filtered to show:"
                        " |\",\"|\",[Report].[Filter]))"
                    Tag ="ReportFilter"
                    GridlineColor =0

                End
            End
        End
        Begin PageHeader
            Height =285
            Name ="PageHeaderSection"
            AutoHeight =1
            Begin
                Begin Label
                    BackStyle =1
                    Left =780
                    Width =2637
                    Height =285
                    FontWeight =700
                    BackColor =12371399
                    ForeColor =16251385
                    Name ="Contact Name_Label"
                    Caption ="Contact Name"
                    Tag =";RegenerateCaption;;DoNotResize;"
                    EventProcPrefix ="Contact_Name_Label"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleLeft =1
                    GridlineStyleRight =1
                    GridlineColor =16777215
                    LayoutCachedLeft =780
                    LayoutCachedWidth =3417
                    LayoutCachedHeight =285
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin Label
                    BackStyle =1
                    Left =3420
                    Width =3225
                    Height =285
                    FontWeight =700
                    BackColor =12371399
                    ForeColor =16251385
                    Name ="Address_Label"
                    Caption ="Address"
                    Tag =";RegenerateCaption;;DoNotResize;"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleLeft =1
                    GridlineStyleRight =1
                    GridlineColor =16777215
                    LayoutCachedLeft =3420
                    LayoutCachedWidth =6645
                    LayoutCachedHeight =285
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin Label
                    BackStyle =1
                    Left =6645
                    Width =2205
                    Height =285
                    FontWeight =700
                    BackColor =12371399
                    ForeColor =16251385
                    Name ="City_Label"
                    Caption ="City"
                    Tag =";RegenerateCaption;;DoNotResize;"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleLeft =1
                    GridlineStyleRight =1
                    GridlineColor =16777215
                    LayoutCachedLeft =6645
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =285
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin Label
                    BackStyle =1
                    Left =8850
                    Width =1410
                    Height =285
                    FontWeight =700
                    BackColor =12371399
                    ForeColor =16251385
                    Name ="State/Province_Label"
                    Caption ="State/Province"
                    Tag =";RegenerateCaption;;DoNotResize;"
                    EventProcPrefix ="State_Province_Label"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleLeft =1
                    GridlineStyleRight =1
                    GridlineColor =16777215
                    LayoutCachedLeft =8850
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =285
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin Label
                    BackStyle =1
                    Left =10260
                    Width =1620
                    Height =285
                    FontWeight =700
                    BackColor =12371399
                    ForeColor =16251385
                    Name ="ZIP/Postal Code_Label"
                    Caption ="Zip/Postal Code"
                    Tag =";RegenerateCaption;;DoNotResize;"
                    EventProcPrefix ="ZIP_Postal_Code_Label"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleLeft =1
                    GridlineStyleRight =1
                    GridlineColor =16777215
                    LayoutCachedLeft =10260
                    LayoutCachedWidth =11880
                    LayoutCachedHeight =285
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin Label
                    BackStyle =1
                    Left =11880
                    Width =2445
                    Height =285
                    FontWeight =700
                    BackColor =12371399
                    ForeColor =16251385
                    Name ="Country/Region_Label"
                    Caption ="Country/Region"
                    Tag =";DoNotResize;;RegenerateCaption;"
                    EventProcPrefix ="Country_Region_Label"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleLeft =1
                    GridlineStyleRight =1
                    GridlineColor =16777215
                    LayoutCachedLeft =11880
                    LayoutCachedWidth =14325
                    LayoutCachedHeight =285
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    GroupTable =5
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =600
            Name ="GroupHeader3"
            AutoHeight =255
            AlternateBackColor =16777215
            Begin
                Begin TextBox
                    HideDuplicates = NotDefault
                    TextAlign =0
                    IMESentenceMode =3
                    Left =60
                    Top =60
                    Width =720
                    Height =510
                    ColumnWidth =1695
                    FontSize =20
                    FontWeight =700
                    ForeColor =1462991
                    Name ="AccessIntervalControl"
                    ControlSource ="=UCase(Left(Nz([File As]),1))"
                    Tag ="FirstLetter~FieldName=File As~ReplacementText= "
                    GridlineColor =0

                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            Height =345
            Name ="Detail"
            AutoHeight =255
            AlternateBackColor =16777215
            Begin
                Begin TextBox
                    TextAlign =0
                    IMESentenceMode =3
                    Left =780
                    Top =30
                    Width =2637
                    Height =285
                    ColumnWidth =1395
                    Name ="Contact Name"
                    ControlSource ="Contact Name"
                    Tag ="HyperlinkToDetails~FormName=Customer Details~SourceID=ID"
                    EventProcPrefix ="Contact_Name"
                    SmartTags ="\"urn:schemas-microsoft-com:office:smarttags#PersonName\""
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleBottom =1
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Condition ="IsNull([ID])"
                            Action ="Beep"
                        End
                        Begin
                            Condition ="Not IsNull([ID])"
                            Action ="OpenForm"
                            Argument ="Customer Details"
                            Argument ="0"
                            Argument =""
                            Argument ="=\"[ID]=\" & [ID]"
                            Argument ="-1"
                            Argument ="3"
                        End
                        Begin
                            Condition ="..."
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Condition ="..."
                            Action ="Requery"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Contact Name\" xmlns=\"http://schemas.microsoft.com/office/a"
                                "ccessservices/2009/11/application\"><Statements><ConditionalBlock><If><Condition"
                                ">IsNull([ID])</Condition><Sta"
                        End
                        Begin
                            Comment ="_AXL:tements><Action Name=\"Beep\"/></Statements></If></ConditionalBlock><Condit"
                                "ionalBlock><If><Condition>Not IsNull([ID])</Condition><Statements><Action Name=\""
                                "OpenForm\"><Argument Name=\"FormName\">Customer Details</Argument><Argument Name"
                                "=\"WhereCondition\">"
                        End
                        Begin
                            Comment ="_AXL:=\"[ID]=\" &amp; [ID]</Argument><Argument Name=\"WindowMode\">Dialog</Argum"
                                "ent></Action><Action Name=\"OnError\"/><Action Name=\"Requery\"/></Statements></"
                                "If></ConditionalBlock></Statements></UserInterfaceMacro>"
                        End
                    End

                    LayoutCachedLeft =780
                    LayoutCachedTop =30
                    LayoutCachedWidth =3417
                    LayoutCachedHeight =315
                    DisplayAsHyperlink =2
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin TextBox
                    CanGrow = NotDefault
                    TextAlign =0
                    IMESentenceMode =3
                    Left =3420
                    Top =30
                    Width =3225
                    Height =285
                    TabIndex =1
                    Name ="Address"
                    ControlSource ="Address"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleBottom =1
                    TextFormat =1

                    LayoutCachedLeft =3420
                    LayoutCachedTop =30
                    LayoutCachedWidth =6645
                    LayoutCachedHeight =315
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin TextBox
                    TextAlign =0
                    IMESentenceMode =3
                    Left =6645
                    Top =30
                    Width =2205
                    Height =285
                    TabIndex =2
                    Name ="City"
                    ControlSource ="City"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleBottom =1

                    LayoutCachedLeft =6645
                    LayoutCachedTop =30
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =315
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin TextBox
                    TextAlign =0
                    IMESentenceMode =3
                    Left =8850
                    Top =30
                    Width =1410
                    Height =285
                    TabIndex =3
                    Name ="State/Province"
                    ControlSource ="State/Province"
                    EventProcPrefix ="State_Province"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleBottom =1

                    LayoutCachedLeft =8850
                    LayoutCachedTop =30
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =315
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin TextBox
                    TextAlign =0
                    IMESentenceMode =3
                    Left =10260
                    Top =30
                    Width =1620
                    Height =285
                    TabIndex =4
                    Name ="ZIP/Postal Code"
                    ControlSource ="ZIP/Postal Code"
                    EventProcPrefix ="ZIP_Postal_Code"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleBottom =1

                    LayoutCachedLeft =10260
                    LayoutCachedTop =30
                    LayoutCachedWidth =11880
                    LayoutCachedHeight =315
                    RowStart =1
                    RowEnd =1
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin TextBox
                    TextAlign =0
                    IMESentenceMode =3
                    Left =11880
                    Top =30
                    Width =2445
                    Height =285
                    TabIndex =6
                    Name ="Country/Region"
                    ControlSource ="Country/Region"
                    EventProcPrefix ="Country_Region"
                    GroupTable =5
                    LeftPadding =0
                    TopPadding =0
                    RightPadding =0
                    BottomPadding =0
                    GridlineStyleBottom =1

                    LayoutCachedLeft =11880
                    LayoutCachedTop =30
                    LayoutCachedWidth =14325
                    LayoutCachedHeight =315
                    RowStart =1
                    RowEnd =1
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    GroupTable =5
                End
                Begin TextBox
                    Visible = NotDefault
                    TextAlign =0
                    IMESentenceMode =3
                    Left =13920
                    Top =30
                    Width =420
                    Height =255
                    TabIndex =5
                    Name ="ID"
                    ControlSource ="ID"

                End
            End
        End
        Begin PageFooter
            Height =645
            Name ="PageFooterSection"
            AutoHeight =255
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4320
                    Top =300
                    Width =5760
                    Height =225
                    FontSize =8
                    ForeColor =12371399
                    Name ="txtPages"
                    ControlSource ="=\"Page \" & [Page] & \" of \" & [Pages]"
                    Tag ="PageOfPages"
                    GridlineColor =0

                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =0
            Name ="ReportFooter"
            AutoHeight =1
        End
    End
End
