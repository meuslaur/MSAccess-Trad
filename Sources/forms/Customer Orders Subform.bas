Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ViewsAllowed =2
    TabularCharSet =186
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridX =24
    GridY =24
    Width =14149
    DatasheetFontHeight =11
    ItemSuffix =54
    Left =720
    Top =375
    Right =15150
    Bottom =8835
    DatasheetGridlinesColor =-1
    Tag ="SubForm~Variation=Datasheet"
    RecSrcDt = Begin
        0x2319d51b580ae340
    End
    RecordSource ="Order Summary"
    DatasheetFontName ="Calibri"
    AllowFormView =0
    FilterOnLoad =0
    ShowPageMargins =0
    DatasheetAlternateBackColor =-2147483610
    DatasheetGridlinesColor12 =-1
    Begin
        Begin Label
            BackStyle =0
            TextFontFamily =0
            FontSize =9
            ForeColor =-2147483615
            FontName ="Segoe UI"
        End
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
        End
        Begin Image
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            PictureAlignment =2
        End
        Begin CommandButton
            FontSize =9
            FontWeight =400
            ForeColor =-2147483615
            FontName ="Segoe UI"
            BorderLineStyle =0
        End
        Begin OptionButton
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin CheckBox
            SpecialEffect =2
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
        End
        Begin OptionGroup
            SpecialEffect =3
            BorderLineStyle =0
        End
        Begin BoundObjectFrame
            AddColon = NotDefault
            SpecialEffect =2
            BorderLineStyle =0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            SpecialEffect =2
            TextFontCharSet =186
            BorderLineStyle =0
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
        End
        Begin ListBox
            AddColon = NotDefault
            SpecialEffect =2
            TextFontCharSet =186
            BorderLineStyle =0
            FontSize =11
            BackColor =-2147483643
            FontName ="Calibri"
        End
        Begin ComboBox
            AddColon = NotDefault
            SpecialEffect =2
            TextFontCharSet =186
            BorderLineStyle =0
            FontSize =11
            FontName ="Calibri"
        End
        Begin Subform
            AddColon = NotDefault
            BorderLineStyle =0
            BorderColor =-2147483609
        End
        Begin Chart
            SpecialEffect =2
            OldBorderStyle =1
            Width =4536
            Height =2835
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin UnboundObjectFrame
            SpecialEffect =2
            OldBorderStyle =1
        End
        Begin ToggleButton
            FontSize =9
            FontWeight =400
            ForeColor =-2147483630
            FontName ="Segoe UI"
            BorderLineStyle =0
        End
        Begin Tab
            TextFontFamily =0
            FontSize =9
            FontName ="Segoe UI"
            BorderLineStyle =0
        End
        Begin Page
            Width =1701
            Height =1701
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Attachment
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            PictureSizeMode =3
            Width =4800
            Height =3840
            AddColon =0
        End
        Begin FormHeader
            Height =0
            BackColor =-2147483613
            Name ="FormHeader"
            AutoHeight =1
        End
        Begin Section
            Height =8478
            BackColor =-2147483613
            Name ="Detail"
            Begin
                Begin TextBox
                    FontUnderline = NotDefault
                    OverlapFlags =85
                    TextFontCharSet =162
                    IMESentenceMode =3
                    Left =1680
                    Top =360
                    Width =3480
                    Height =315
                    ColumnWidth =1095
                    ColumnOrder =0
                    BackColor =-2147483643
                    ForeColor =1279872587
                    Name ="Order ID"
                    ControlSource ="Order ID"
                    Tag ="HyperlinkToDetails~FormName=Order Details~SourceID=[Order ID]"
                    EventProcPrefix ="Order_ID"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Condition ="[Form].[Dirty]"
                            Action ="RunCommand"
                            Argument ="97"
                        End
                        Begin
                            Condition ="[MacroError].[Number]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Condition ="..."
                            Action ="StopMacro"
                        End
                        Begin
                            Action ="OnError"
                            Argument ="2"
                        End
                        Begin
                            Action ="OpenForm"
                            Argument ="Order Details"
                            Argument ="0"
                            Argument =""
                            Argument ="=\"[Order ID]=\" & Nz([Order ID],0)"
                            Argument ="-1"
                            Argument ="3"
                        End
                        Begin
                            Condition ="Not IsNull([Order ID])"
                            Action ="SetTempVar"
                            Argument ="CurrentID"
                            Argument ="[Order ID]"
                        End
                        Begin
                            Condition ="IsNull([Order ID])"
                            Action ="SetTempVar"
                            Argument ="CurrentID"
                            Argument ="Nz(DMax(\"[Order ID]\",[Form].[RecordSource]),0)"
                        End
                        Begin
                            Action ="Requery"
                        End
                        Begin
                            Action ="SearchForRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="2"
                            Argument ="=\"[Order ID]=\" & [TempVars]![CurrentID]"
                        End
                        Begin
                            Action ="RemoveTempVar"
                            Argument ="CurrentID"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Order ID\" xmlns=\"http://schemas.microsoft.com/office/acces"
                                "sservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Condition"
                                "alBlock><If><Condition>[Form].["
                        End
                        Begin
                            Comment ="_AXL:Dirty]</Condition><Statements><Action Name=\"SaveRecord\"/></Statements></I"
                                "f></ConditionalBlock><ConditionalBlock><If><Condition>[MacroError].[Number]&lt;&"
                                "gt;0</Condition><Statements><Action Name=\"MessageBox\"><Argument Name=\"Message"
                                "\">=[MacroError].[D"
                        End
                        Begin
                            Comment ="_AXL:escription]</Argument></Action><Action Name=\"StopMacro\"/></Statements></I"
                                "f></ConditionalBlock><Action Name=\"OnError\"><Argument Name=\"Goto\">Fail</Argu"
                                "ment></Action><Action Name=\"OpenForm\"><Argument Name=\"FormName\">Order Detail"
                                "s</Argument><Argument N"
                        End
                        Begin
                            Comment ="_AXL:ame=\"WhereCondition\">=\"[Order ID]=\" &amp; Nz([Order ID],0)</Argument><A"
                                "rgument Name=\"WindowMode\">Dialog</Argument></Action><ConditionalBlock><If><Con"
                                "dition>Not IsNull([Order ID])</Condition><Statements><Action Name=\"SetTempVar\""
                                "><Argument Name=\"Name"
                        End
                        Begin
                            Comment ="_AXL:\">CurrentID</Argument><Argument Name=\"Expression\">[Order ID]</Argument><"
                                "/Action></Statements></If></ConditionalBlock><ConditionalBlock><If><Condition>Is"
                                "Null([Order ID])</Condition><Statements><Action Name=\"SetTempVar\"><Argument Na"
                                "me=\"Name\">CurrentI"
                        End
                        Begin
                            Comment ="_AXL:D</Argument><Argument Name=\"Expression\">Nz(DMax(\"[Order ID]\",[Form].[Re"
                                "cordSource]),0)</Argument></Action></Statements></If></ConditionalBlock><Action "
                                "Name=\"Requery\"/><Action Name=\"SearchForRecord\"><Argument Name=\"WhereConditi"
                                "on\">=\"[Order ID]=\" &am"
                        End
                        Begin
                            Comment ="_AXL:p; [TempVars]![CurrentID]</Argument></Action><Action Name=\"RemoveTempVar\""
                                "><Argument Name=\"Name\">CurrentID</Argument></Action></Statements></UserInterfa"
                                "ceMacro>"
                        End
                    End

                    LayoutCachedLeft =1680
                    LayoutCachedTop =360
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =675
                    DisplayAsHyperlink =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =360
                            Top =360
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Order ID_Label"
                            Caption ="Invoice #"
                            EventProcPrefix ="Order_ID_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =360
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =675
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    Visible = NotDefault
                    ColumnHidden = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =1680
                    Top =750
                    Width =3480
                    Height =315
                    ColumnWidth =690
                    ColumnOrder =1
                    TabIndex =1
                    BackColor =-2147483643
                    ColumnInfo ="\"\";\"\";\"\";\"\";\"10\";\"100\""
                    Name ="Customer ID"
                    ControlSource ="Customer ID"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [ID], [Company] FROM [Customers Extended] ORDER BY [Company]; "
                    ColumnWidths ="0;1440"
                    StatusBarText ="Double-click to go to details"
                    Tag ="DrillToRelated~FormName=Customer Details~DestID=ID"
                    EventProcPrefix ="Customer_ID"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38
                    OnDblClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Condition ="IsNull([Screen].[ActiveControl])"
                            Action ="StopMacro"
                        End
                        Begin
                            Action ="OpenForm"
                            Argument ="Customer Details"
                            Argument ="0"
                            Argument =""
                            Argument ="=\"[ID]=\" & [Screen].[ActiveControl]"
                            Argument ="-1"
                            Argument ="3"
                        End
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Action ="Requery"
                            Argument ="=[Screen].[ActiveControl].[Name]"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Customer ID\" xmlns=\"http://schemas.microsoft.com/office/ac"
                                "cessservices/2009/11/application\"><Statements><ConditionalBlock><If><Condition>"
                                "IsNull([Screen].[ActiveContro"
                        End
                        Begin
                            Comment ="_AXL:l])</Condition><Statements><Action Name=\"StopMacro\"/></Statements></If></"
                                "ConditionalBlock><Action Name=\"OpenForm\"><Argument Name=\"FormName\">Customer "
                                "Details</Argument><Argument Name=\"WhereCondition\">=\"[ID]=\" &amp; [Screen].[A"
                                "ctiveControl]</Argument"
                        End
                        Begin
                            Comment ="_AXL:><Argument Name=\"WindowMode\">Dialog</Argument></Action><Action Name=\"OnE"
                                "rror\"/><Action Name=\"Requery\"><Argument Name=\"ControlName\">=[Screen].[Activ"
                                "eControl].[Name]</Argument></Action></Statements></UserInterfaceMacro>"
                        End
                    End
                    OnGotFocusEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Condition ="[Screen].[ActiveForm].[Name]=[Form].[Name]"
                            Action ="Requery"
                            Argument ="=[Screen].[ActiveControl].[Name]"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Customer ID\" xmlns=\"http://schemas.microsoft.com/office/ac"
                                "cessservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Condit"
                                "ionalBlock><If><Condition>[Scre"
                        End
                        Begin
                            Comment ="_AXL:en].[ActiveForm].[Name]=[Form].[Name]</Condition><Statements><Action Name=\""
                                "Requery\"><Argument Name=\"ControlName\">=[Screen].[ActiveControl].[Name]</Argum"
                                "ent></Action></Statements></If></ConditionalBlock></Statements></UserInterfaceMa"
                                "cro>"
                        End
                    End
                    AllowValueListEdits =1
                    ListItemsEditForm ="Customer Details"
                    InheritValueList =1

                    LayoutCachedLeft =1680
                    LayoutCachedTop =750
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =1065
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =360
                            Top =750
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Customer ID_Label"
                            Caption ="Customer"
                            EventProcPrefix ="Customer_ID_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =750
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =1065
                            RowStart =1
                            RowEnd =1
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    FontUnderline = NotDefault
                    OverlapFlags =85
                    TextFontCharSet =162
                    IMEMode =2
                    IMESentenceMode =3
                    Left =1680
                    Top =1140
                    Width =3480
                    Height =315
                    ColumnWidth =1320
                    ColumnOrder =2
                    TabIndex =2
                    BackColor =-2147483643
                    ForeColor =1279872587
                    Name ="Order Date"
                    ControlSource ="Order Date"
                    Format ="Short Date"
                    Tag ="HyperlinkToDetails~FormName=Order Details~SourceID=[Order ID]"
                    EventProcPrefix ="Order_Date"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Condition ="[Form].[Dirty]"
                            Action ="RunCommand"
                            Argument ="97"
                        End
                        Begin
                            Condition ="[MacroError].[Number]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Condition ="..."
                            Action ="StopMacro"
                        End
                        Begin
                            Action ="OnError"
                            Argument ="2"
                        End
                        Begin
                            Action ="OpenForm"
                            Argument ="Order Details"
                            Argument ="0"
                            Argument =""
                            Argument ="=\"[Order ID]=\" & Nz([Order ID],0)"
                            Argument ="-1"
                            Argument ="3"
                        End
                        Begin
                            Condition ="Not IsNull([Order ID])"
                            Action ="SetTempVar"
                            Argument ="CurrentID"
                            Argument ="[Order ID]"
                        End
                        Begin
                            Condition ="IsNull([Order ID])"
                            Action ="SetTempVar"
                            Argument ="CurrentID"
                            Argument ="Nz(DMax(\"[Order ID]\",[Form].[RecordSource]),0)"
                        End
                        Begin
                            Action ="Requery"
                        End
                        Begin
                            Action ="SearchForRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="2"
                            Argument ="=\"[Order ID]=\" & [TempVars]![CurrentID]"
                        End
                        Begin
                            Action ="RemoveTempVar"
                            Argument ="CurrentID"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Order Date\" xmlns=\"http://schemas.microsoft.com/office/acc"
                                "essservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Conditi"
                                "onalBlock><If><Condition>[Form]"
                        End
                        Begin
                            Comment ="_AXL:.[Dirty]</Condition><Statements><Action Name=\"SaveRecord\"/></Statements><"
                                "/If></ConditionalBlock><ConditionalBlock><If><Condition>[MacroError].[Number]&lt"
                                ";&gt;0</Condition><Statements><Action Name=\"MessageBox\"><Argument Name=\"Messa"
                                "ge\">=[MacroError]."
                        End
                        Begin
                            Comment ="_AXL:[Description]</Argument></Action><Action Name=\"StopMacro\"/></Statements><"
                                "/If></ConditionalBlock><Action Name=\"OnError\"><Argument Name=\"Goto\">Fail</Ar"
                                "gument></Action><Action Name=\"OpenForm\"><Argument Name=\"FormName\">Order Deta"
                                "ils</Argument><Argument"
                        End
                        Begin
                            Comment ="_AXL: Name=\"WhereCondition\">=\"[Order ID]=\" &amp; Nz([Order ID],0)</Argument>"
                                "<Argument Name=\"WindowMode\">Dialog</Argument></Action><ConditionalBlock><If><C"
                                "ondition>Not IsNull([Order ID])</Condition><Statements><Action Name=\"SetTempVar"
                                "\"><Argument Name=\"Na"
                        End
                        Begin
                            Comment ="_AXL:me\">CurrentID</Argument><Argument Name=\"Expression\">[Order ID]</Argument"
                                "></Action></Statements></If></ConditionalBlock><ConditionalBlock><If><Condition>"
                                "IsNull([Order ID])</Condition><Statements><Action Name=\"SetTempVar\"><Argument "
                                "Name=\"Name\">Curren"
                        End
                        Begin
                            Comment ="_AXL:tID</Argument><Argument Name=\"Expression\">Nz(DMax(\"[Order ID]\",[Form].["
                                "RecordSource]),0)</Argument></Action></Statements></If></ConditionalBlock><Actio"
                                "n Name=\"Requery\"/><Action Name=\"SearchForRecord\"><Argument Name=\"WhereCondi"
                                "tion\">=\"[Order ID]=\" &"
                        End
                        Begin
                            Comment ="_AXL:amp; [TempVars]![CurrentID]</Argument></Action><Action Name=\"RemoveTempVar"
                                "\"><Argument Name=\"Name\">CurrentID</Argument></Action></Statements></UserInter"
                                "faceMacro>"
                        End
                    End

                    LayoutCachedLeft =1680
                    LayoutCachedTop =1140
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =1455
                    DisplayAsHyperlink =2
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =360
                            Top =1140
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Order Date_Label"
                            Caption ="Order Date"
                            Tag =";RegenerateCaption;"
                            EventProcPrefix ="Order_Date_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =1140
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =1455
                            RowStart =2
                            RowEnd =2
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMEMode =2
                    IMESentenceMode =3
                    Left =1680
                    Top =1530
                    Width =3480
                    Height =315
                    ColumnWidth =1230
                    ColumnOrder =5
                    TabIndex =3
                    BackColor =-2147483643
                    Name ="Shipped Date"
                    ControlSource ="Shipped Date"
                    Format ="Short Date"
                    EventProcPrefix ="Shipped_Date"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38

                    LayoutCachedLeft =1680
                    LayoutCachedTop =1530
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =1845
                    RowStart =3
                    RowEnd =3
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =360
                            Top =1530
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Shipped Date_Label"
                            Caption ="Shipped"
                            EventProcPrefix ="Shipped_Date_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =1530
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =1845
                            RowStart =3
                            RowEnd =3
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    OverlapFlags =85
                    Left =1680
                    Top =1920
                    Width =3480
                    Height =315
                    ColumnWidth =2580
                    ColumnOrder =3
                    TabIndex =4
                    BackColor =-2147483643
                    Name ="Ship Name"
                    ControlSource ="Ship Name"
                    EventProcPrefix ="Ship_Name"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38

                    LayoutCachedLeft =1680
                    LayoutCachedTop =1920
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =2235
                    RowStart =4
                    RowEnd =4
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =360
                            Top =1920
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Ship Name_Label"
                            Caption ="Ship Name"
                            Tag =";RegenerateCaption;"
                            EventProcPrefix ="Ship_Name_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =1920
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =2235
                            RowStart =4
                            RowEnd =4
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    ColumnHidden = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    Left =1680
                    Top =2310
                    Width =3480
                    Height =855
                    ColumnWidth =2550
                    ColumnOrder =4
                    TabIndex =5
                    BackColor =-2147483643
                    Name ="Ship Address"
                    ControlSource ="Ship Address"
                    EventProcPrefix ="Ship_Address"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38

                    LayoutCachedLeft =1680
                    LayoutCachedTop =2310
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =3165
                    RowStart =5
                    RowEnd =5
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontFamily =34
                            Left =360
                            Top =2310
                            Width =1260
                            Height =855
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Ship Address_Label"
                            Caption ="Ship Address"
                            Tag =";RegenerateCaption;"
                            EventProcPrefix ="Ship_Address_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =2310
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =3165
                            RowStart =5
                            RowEnd =5
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1680
                    Top =3240
                    Width =3480
                    Height =315
                    ColumnWidth =1080
                    ColumnOrder =8
                    TabIndex =6
                    BackColor =-2147483643
                    Name ="Shipping Fee"
                    ControlSource ="Shipping Fee"
                    Format ="#,##0.00 €;-#,##0.00 €"
                    EventProcPrefix ="Shipping_Fee"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38

                    LayoutCachedLeft =1680
                    LayoutCachedTop =3240
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =3555
                    RowStart =6
                    RowEnd =6
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =360
                            Top =3240
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Shipping Fee_Label"
                            Caption ="Shipping"
                            EventProcPrefix ="Shipping_Fee_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =3240
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =3555
                            RowStart =6
                            RowEnd =6
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1680
                    Top =3630
                    Width =3480
                    Height =315
                    ColumnWidth =840
                    ColumnOrder =7
                    TabIndex =7
                    BackColor =-2147483643
                    Name ="Taxes"
                    ControlSource ="Taxes"
                    Format ="#,##0.00 €;-#,##0.00 €"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38

                    LayoutCachedLeft =1680
                    LayoutCachedTop =3630
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =3945
                    RowStart =7
                    RowEnd =7
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =360
                            Top =3630
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Taxes_Label"
                            Caption ="Taxes"
                            Tag =";RegenerateCaption;"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =3630
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =3945
                            RowStart =7
                            RowEnd =7
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    DecimalPlaces =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1680
                    Top =4410
                    Width =3480
                    Height =315
                    ColumnWidth =1140
                    ColumnOrder =6
                    TabIndex =9
                    BackColor =-2147483643
                    Name ="Sub Total"
                    ControlSource ="Sub Total"
                    Format ="#,##0.00 €;-#,##0.00 €"
                    EventProcPrefix ="Sub_Total"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38

                    LayoutCachedLeft =1680
                    LayoutCachedTop =4410
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =4725
                    RowStart =9
                    RowEnd =9
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =360
                            Top =4410
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Sub Total_Label"
                            Caption ="Sub Total"
                            Tag =";RegenerateCaption;"
                            EventProcPrefix ="Sub_Total_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =4410
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =4725
                            RowStart =9
                            RowEnd =9
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1680
                    Top =4020
                    Width =3480
                    Height =315
                    ColumnWidth =1410
                    TabIndex =8
                    BackColor =-2147483643
                    Name ="Order Total"
                    ControlSource ="Order Total"
                    EventProcPrefix ="Order_Total"
                    GroupTable =1
                    RightPadding =38
                    BottomPadding =38

                    LayoutCachedLeft =1680
                    LayoutCachedTop =4020
                    LayoutCachedWidth =5160
                    LayoutCachedHeight =4335
                    RowStart =8
                    RowEnd =8
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =360
                            Top =4020
                            Width =1260
                            Height =315
                            FontSize =10
                            BackColor =-2147483613
                            Name ="Order Total_Label"
                            Caption ="Invoice Total"
                            EventProcPrefix ="Order_Total_Label"
                            GroupTable =1
                            BottomPadding =38
                            LayoutCachedLeft =360
                            LayoutCachedTop =4020
                            LayoutCachedWidth =1620
                            LayoutCachedHeight =4335
                            RowStart =8
                            RowEnd =8
                            LayoutGroup =1
                            GroupTable =1
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =6803
                    Top =330
                    TabIndex =10
                    Name ="Commande26"
                    Caption ="Commande26"

                    LayoutCachedLeft =6803
                    LayoutCachedTop =330
                    LayoutCachedWidth =8243
                    LayoutCachedHeight =690
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
                Begin Tab
                    OverlapFlags =85
                    Left =6803
                    Top =850
                    Width =4402
                    Height =1355
                    TabIndex =11
                    Name ="CtlTab27"

                    LayoutCachedLeft =6803
                    LayoutCachedTop =850
                    LayoutCachedWidth =11205
                    LayoutCachedHeight =2205
                    Begin
                        Begin Page
                            OverlapFlags =87
                            Left =6938
                            Top =1285
                            Width =4125
                            Height =780
                            BorderColor =10921638
                            Name ="Page28"
                            GridlineColor =10921638
                            LayoutCachedLeft =6938
                            LayoutCachedTop =1285
                            LayoutCachedWidth =11063
                            LayoutCachedHeight =2065
                            WebImagePaddingLeft =2
                            WebImagePaddingTop =2
                            WebImagePaddingRight =2
                            WebImagePaddingBottom =2
                        End
                        Begin Page
                            OverlapFlags =215
                            Left =6938
                            Top =1285
                            Width =4125
                            Height =780
                            BorderColor =10921638
                            Name ="Page29"
                            GridlineColor =10921638
                            LayoutCachedLeft =6938
                            LayoutCachedTop =1285
                            LayoutCachedWidth =11063
                            LayoutCachedHeight =2065
                            WebImagePaddingLeft =2
                            WebImagePaddingTop =2
                            WebImagePaddingRight =2
                            WebImagePaddingBottom =2
                        End
                    End
                End
                Begin Label
                    FontUnderline = NotDefault
                    OverlapFlags =85
                    TextFontFamily =34
                    Left =6803
                    Top =2456
                    Width =570
                    Height =285
                    Name ="Étiquette30"
                    Caption ="qwant"
                    HyperlinkAddress ="https://www.qwant.com?l=fr&r=FR&sr=fr"
                    LayoutCachedLeft =6803
                    LayoutCachedTop =2456
                    LayoutCachedWidth =7373
                    LayoutCachedHeight =2741
                    ForeThemeColorIndex =10
                    HyperlinkBinderDescription ="1|https://www.qwant.com|3|l|fr|3|r|FR|3|sr|fr"
                End
                Begin OptionGroup
                    OverlapFlags =85
                    Left =6803
                    Top =3001
                    Width =966
                    Height =1273
                    TabIndex =12
                    Name ="Cadre31"
                    DefaultValue ="1"

                    LayoutCachedLeft =6803
                    LayoutCachedTop =3001
                    LayoutCachedWidth =7769
                    LayoutCachedHeight =4274
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =215
                            Left =6923
                            Top =2881
                            Width =735
                            Height =285
                            BackColor =-2147483613
                            Name ="Étiquette32"
                            Caption ="Cadre31"
                            LayoutCachedLeft =6923
                            LayoutCachedTop =2881
                            LayoutCachedWidth =7658
                            LayoutCachedHeight =3166
                        End
                        Begin OptionButton
                            OverlapFlags =87
                            Left =6989
                            Top =3239
                            OptionValue =1
                            Name ="Option34"

                            LayoutCachedLeft =6989
                            LayoutCachedTop =3239
                            LayoutCachedWidth =7249
                            LayoutCachedHeight =3479
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =7219
                                    Top =3211
                                    Width =165
                                    Height =285
                                    Name ="Étiquette35"
                                    Caption ="1"
                                    LayoutCachedLeft =7219
                                    LayoutCachedTop =3211
                                    LayoutCachedWidth =7384
                                    LayoutCachedHeight =3496
                                End
                            End
                        End
                        Begin OptionButton
                            OverlapFlags =87
                            Left =6989
                            Top =3569
                            OptionValue =2
                            Name ="Option36"

                            LayoutCachedLeft =6989
                            LayoutCachedTop =3569
                            LayoutCachedWidth =7249
                            LayoutCachedHeight =3809
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =7219
                                    Top =3541
                                    Width =165
                                    Height =285
                                    Name ="Étiquette37"
                                    Caption ="2"
                                    LayoutCachedLeft =7219
                                    LayoutCachedTop =3541
                                    LayoutCachedWidth =7384
                                    LayoutCachedHeight =3826
                                End
                            End
                        End
                        Begin OptionButton
                            OverlapFlags =87
                            Left =6989
                            Top =3899
                            OptionValue =3
                            Name ="Option38"

                            LayoutCachedLeft =6989
                            LayoutCachedTop =3899
                            LayoutCachedWidth =7249
                            LayoutCachedHeight =4139
                            Begin
                                Begin Label
                                    OverlapFlags =247
                                    Left =7219
                                    Top =3871
                                    Width =165
                                    Height =285
                                    Name ="Étiquette39"
                                    Caption ="3"
                                    LayoutCachedLeft =7219
                                    LayoutCachedTop =3871
                                    LayoutCachedWidth =7384
                                    LayoutCachedHeight =4156
                                End
                            End
                        End
                    End
                End
                Begin ToggleButton
                    OverlapFlags =85
                    Left =7960
                    Top =2905
                    Width =1245
                    Height =450
                    TabIndex =13
                    Name ="Bascule40"
                    Caption ="bascuml"

                    LayoutCachedLeft =7960
                    LayoutCachedTop =2905
                    LayoutCachedWidth =9205
                    LayoutCachedHeight =3355
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
                End
                Begin ListBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =9259
                    Top =2834
                    TabIndex =14
                    Name ="Liste41"
                    RowSourceType ="Table/Query"

                    LayoutCachedLeft =9259
                    LayoutCachedTop =2834
                    LayoutCachedWidth =10699
                    LayoutCachedHeight =4274
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =9283
                            Top =2551
                            Width =615
                            Height =270
                            Name ="Étiquette42"
                            Caption ="Liste41"
                            LayoutCachedLeft =9283
                            LayoutCachedTop =2551
                            LayoutCachedWidth =9898
                            LayoutCachedHeight =2821
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =10062
                    Top =236
                    TabIndex =15
                    Name ="Cocher43"

                    LayoutCachedLeft =10062
                    LayoutCachedTop =236
                    LayoutCachedWidth =10322
                    LayoutCachedHeight =476
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =10292
                            Top =206
                            Width =825
                            Height =270
                            Name ="Étiquette44"
                            Caption ="Cocher43"
                            LayoutCachedLeft =10292
                            LayoutCachedTop =206
                            LayoutCachedWidth =11117
                            LayoutCachedHeight =476
                        End
                    End
                End
                Begin UnboundObjectFrame
                    OverlapFlags =85
                    Left =6803
                    Top =4535
                    Width =1156
                    Height =811
                    TabIndex =16
                    Name ="IndépendantOLE45"
                    OleData = Begin
                        0x00100000d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                        0xfeff090006000000000000000000000001000000020000000000000000100000 ,
                        0x0400000001000000feffffff0000000003000000ffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000feffffff00000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000052006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff010000000c00030000000000c0000000 ,
                        0x00000046000000000000000000000000204851603383d8010500000080020000 ,
                        0x0000000001004f006c006500310030004e006100740069007600650000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000001a0002010200000003000000ffffffff000000000000000000000000 ,
                        0x00000000000000000000000000000000000000000000000003000000a3010000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000010000004c000000 ,
                        0x0000000003004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000038000000 ,
                        0x00000000fffffffffffffffffefffffffdfffffffeffffff06000000feffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfffffffffeffffff02000000feffffff04000000050000000600000007000000 ,
                        0x0800000009000000feffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff38000000000000000100000000000000000000000000000000000000 ,
                        0x0000000038000000000000000000000000000000000000000000000000000000 ,
                        0x000000000100feff030a0000ffffffff0c00030000000000c000000000000046 ,
                        0x0c0000004f4c45205061636b6167650000000000080000005061636b61676500 ,
                        0xf439b27100000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000009f01000002004175746f72756e2e696e6600443a5c41636365737333 ,
                        0x36355c4175746f72756e2e696e66000000030055000000433a5c55736572735c ,
                        0x6d6f696c6e5c417070446174615c4c6f63616c5c54656d705c7b423241413431 ,
                        0x30462d384339432d343534382d423935342d3833314641394535314431417d5c ,
                        0x4175746f72756e2e696e66001d0000005b6175746f72756e5d0d0a49636f6e3d ,
                        0x69635f4163636573732e69636f5400000043003a005c00550073006500720073 ,
                        0x005c006d006f0069006c006e005c0041007000700044006100740061005c004c ,
                        0x006f00630061006c005c00540065006d0070005c007b00420032004100410034 ,
                        0x003100300046002d0038004300390043002d0034003500340038002d00420039 ,
                        0x00350034002d003800330031004600410039004500350031004400310041007d ,
                        0x005c004100750074006f00720075006e002e0069006e0066000b000000410075 ,
                        0x0074006f00720075006e002e0069006e0066001800000044003a005c00410063 ,
                        0x0063006500730073003300360035005c004100750074006f00720075006e002e ,
                        0x0069006e00660000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    Class ="Package"
                    OLEClass ="Objet d’environnement du Gestionnaire de liaisons"

                    LayoutCachedLeft =6803
                    LayoutCachedTop =4535
                    LayoutCachedWidth =7959
                    LayoutCachedHeight =5346
                End
                Begin Attachment
                    Left =11337
                    Top =2857
                    Width =1830
                    Height =840
                    Name ="PièceJointe46"
                    TabIndex =17

                    LayoutCachedLeft =11337
                    LayoutCachedTop =2857
                    LayoutCachedWidth =13167
                    LayoutCachedHeight =3697
                    Begin
                        Begin Label
                            OverlapFlags =87
                            Left =11314
                            Top =2574
                            Width =1140
                            Height =270
                            Name ="Étiquette47"
                            Caption ="PièceJointe46"
                            LayoutCachedLeft =11314
                            LayoutCachedTop =2574
                            LayoutCachedWidth =12454
                            LayoutCachedHeight =2844
                        End
                    End
                End
                Begin OptionButton
                    OverlapFlags =85
                    Left =7062
                    Top =5905
                    TabIndex =18
                    Name ="Option48"

                    LayoutCachedLeft =7062
                    LayoutCachedTop =5905
                    LayoutCachedWidth =7322
                    LayoutCachedHeight =6145
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =7292
                            Top =5875
                            Width =810
                            Height =270
                            Name ="Étiquette49"
                            Caption ="Option48"
                            LayoutCachedLeft =7292
                            LayoutCachedTop =5875
                            LayoutCachedWidth =8102
                            LayoutCachedHeight =6145
                        End
                    End
                End
                Begin BoundObjectFrame
                    OverlapFlags =87
                    Left =2145
                    Top =5102
                    TabIndex =19
                    Name ="DépendantOLE50"

                    LayoutCachedLeft =2145
                    LayoutCachedTop =5102
                    LayoutCachedWidth =6465
                    LayoutCachedHeight =7982
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =330
                            Top =5102
                            Width =1815
                            Height =270
                            Name ="Étiquette51"
                            Caption ="DépendantOLE50"
                            LayoutCachedLeft =330
                            LayoutCachedTop =5102
                            LayoutCachedWidth =2145
                            LayoutCachedHeight =5372
                        End
                    End
                End
                Begin Image
                    Left =5929
                    Top =4015
                    Width =240
                    Height =240
                    Name ="Image52"
                    Picture ="ic_1DESC.png"
                    ImageData = Begin
                        0x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff ,
                        0x610000000467414d410000afc837058ae900000006624b4744000000000000f9 ,
                        0x43bb7f000000097048597300000048000000480046c96b3e0000000976704167 ,
                        0x0000001000000010005cc6adc30000031a4944415438cb75d26d68956518c0f1 ,
                        0xff733ff7f3ba97b3b9f795e55e38b2d4a6a3b6d6d4cad83ab5fc501412acbe25 ,
                        0x06465fb210173230a29116f42144561458115b2ee9cdb5dec0498154a4135d52 ,
                        0x78b6b3a95bb371d8e99c9de7beef3e48b5d0aecf173f2ef85f963106ebf6b761 ,
                        0x3107f908a40d4283a62956e6bde7fbc2bf34bbd483eb9e44b8201cf043f002cc ,
                        0xe75b105c6f32516b658933bc7bcf3dcded8f76ad966e384414dd7bbdd56b81bc ,
                        0xeaaeab2f1eee7be5bef859ab8eafa76ba9edecba292c2bfb00ad1efb7fc00091 ,
                        0xe9695a53faee8b071235bf5a2b39f2d9ef642ece92092ba9de78f78ac2aaca37 ,
                        0xd17afbb58036f0677e474b5bf55b2fed4f14a76415c74666489f1c990927be4c ,
                        0xd6473364bd526a3a36fa2537561f241fedc2987f015beb671e7e24fec6c040b7 ,
                        0xcc1795f2cdb124e747be4aea6ca67b6131df99fcfec42f65e914690a58b9b983 ,
                        0xaaf8cdfdc2985e00cb184355d761d3bbab1d82906fbf9be393c11fcf64b34bdb ,
                        0x080a4e830415351696048775ed2dad6e793915a1626a7c82ccd09d96658cc16d ,
                        0x3bb4c7c7eecc294b47c624b52df662b917b07d1012a400ad6a90ce5ea41bb7a5 ,
                        0x1446d8c7d5c79b7a2d630c56cb4148e72d6c016160703c88a4448a1db62b7de5 ,
                        0x85af63e91c06405b20c1f58df97433f26a010dae34383e784590892c50af6e4d ,
                        0xd4ef9c570e63c727d711044fe2794ba8c8a01568bdac82530c853128888126c0 ,
                        0x98771edfb67ae71d8916ae543553d6d4f084a5d5fb1813c32b023f067ef17220 ,
                        0x00db8128f284d6834f6f5fd3d37eff0606c604672e80bbaa89dab5f18784c547 ,
                        0xa8a81421c10d9601c64036aaf16cbed8fd54f3031d89750cfe60b8746a9cc2b9 ,
                        0xd3045a216a5671c3da86bb6cdb1a45a9c6fffc01918a57c6fce1fee76edbb4e5 ,
                        0xc138a3e34b9c1d3bc5626a727feef2f4be92f909fc288faca8a5617d7d8b1738 ,
                        0x4368b3e11fa062857fe4b5beb6d6cead759c389761f4e8cf4c9f9bda87ef3e9b ,
                        0x57e2859fc6679fcf4d9d577fcc65890acb695c5f7fab1b381f02572b4452fa87 ,
                        0x8e4e460b43536afa72367731b5d8876d1ff8fb468de84fa6d2f3f695df5e5e48 ,
                        0x856151816d1be138007f0101ed3c911091930000000025744558746372656174 ,
                        0x652d6461746500323030392d31312d31355431363a30383a34312d30373a3030 ,
                        0x24aee1e00000002574455874646174653a63726561746500323031302d30322d ,
                        0x32305432333a32363a31352d30373a3030063b5c810000002574455874646174 ,
                        0x653a6d6f6469667900323031302d30312d31315430393a31383a33392d30373a ,
                        0x3030f05d31b100000035744558744c6963656e736500687474703a2f2f637265 ,
                        0x6174697665636f6d6d6f6e732e6f72672f6c6963656e7365732f4c47504c2f32 ,
                        0x2e312f3bc1b41800000025744558746d6f646966792d6461746500323030392d ,
                        0x31312d31355431363a30383a34312d30373a30307b1f97d40000001974455874 ,
                        0x536f6674776172650041646f626520496d616765526561647971c9653c000000 ,
                        0x0d74455874536f75726365004e75766f6c61ac4f35f10000003474455874536f ,
                        0x757263655f55524c00687474703a2f2f7777772e69636f6e2d6b696e672e636f ,
                        0x6d2f70726f6a656374732f6e75766f6c612f763db4520000000049454e44ae42 ,
                        0x6082
                    End

                    LayoutCachedLeft =5929
                    LayoutCachedTop =4015
                    LayoutCachedWidth =6169
                    LayoutCachedHeight =4255
                    TabIndex =21
                End
                Begin Chart
                    ColumnHeads = NotDefault
                    Enabled = NotDefault
                    Locked = NotDefault
                    SizeMode =1
                    RowSourceTypeInt =2
                    OverlapFlags =85
                    Left =8858
                    Top =5362
                    TabIndex =20
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Graphique"
                    OleData = Begin
                        0x000a0100d0cf11e0a1b11ae1000000000000000000000000000000003e000300 ,
                        0xfeff090006000000000000000000000002000000020000000000000000100000 ,
                        0x0400000001000000feffffff000000000300000080000000ffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff050000000308020000000000c0000000 ,
                        0x00000046000000000000000000000000204851603383d8010600000000110000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000b00000069000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000003c00000014000000 ,
                        0x0000000057006f0072006b0062006f006f006b00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000d000000600d0000 ,
                        0x000000000f000000fdffffffffffffffffffffffffffffffffffffff10000000 ,
                        0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffffff ,
                        0xfeffffff12000000feffffff1300000014000000150000001600000017000000 ,
                        0x11000000190000001a0000001b0000001c0000001d0000001e0000001f000000 ,
                        0x2000000021000000220000002300000024000000250000002600000027000000 ,
                        0x28000000290000002a0000002b0000002c0000002d0000002e0000002f000000 ,
                        0x3000000031000000320000003300000034000000350000003600000037000000 ,
                        0x38000000390000003a0000003b0000003c0000003d0000003e0000003f000000 ,
                        0x40000000feffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff52006f006f007400200045006e007400720079000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000016000500ffffffffffffffff050000000308020000000000c0000000 ,
                        0x00000046000000000000000000000000802f10b43383d80107000000400f0000 ,
                        0x00000000010043006f006d0070004f0062006a00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000120002010200000003000000ffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000100000069000000 ,
                        0x0000000001004f006c0065000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000a000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000003c00000014000000 ,
                        0x0000000057006f0072006b0062006f006f006b00000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000012000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x00000000000000000000000000000000000000000000000008000000b4100000 ,
                        0x00000000ffffffffffffffff05000000fdfffffffefffffffeffffffffffffff ,
                        0x10000000090000000a0000000b0000000c0000000d00000041000000ffffffff ,
                        0xffffffff12000000ffffffff1300000014000000150000001600000083000000 ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffff4200000043000000feffffff450000004600000047000000 ,
                        0x48000000490000004a0000004b0000004c0000004d0000004e0000004f000000 ,
                        0x5000000051000000520000005300000054000000550000005600000057000000 ,
                        0x58000000feffffff5a0000005b0000005c0000005d0000005e0000005f000000 ,
                        0x6000000061000000620000006300000064000000650000006600000067000000 ,
                        0x68000000690000006a0000006b0000006c0000006d0000006e0000006f000000 ,
                        0x7000000071000000720000007300000074000000750000007600000077000000 ,
                        0x78000000790000007a0000007b0000007c0000007d0000007e0000007f000000 ,
                        0x81000000feffffff02000000feffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfffffffffffffffffffffffffffffffffffffffffeffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff03004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000038000000 ,
                        0x0000000002004f006c0065005000720065007300300030003000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000180002010100000004000000ffffffff000000000000000000000000 ,
                        0x00000000000000000000000000000000000000000000000059000000ee7a0000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000ffffffff0e0000000400000001000000ffffffff0000000000000000 ,
                        0x00000000000000002e020000010009000003170100000000e40000000000e400 ,
                        0x000026060f00be01574d46430100000000000100384200000000010000009c01 ,
                        0x0000000000009c010000010000006c0000000000000000000000ffffffffffff ,
                        0xffff0000000000000000511e00007112000020454d46000001009c0100000c00 ,
                        0x0000010000000000000000000000000000008007000038040000090200002501 ,
                        0x000000000000000000000000000028f3070088780400460000002c0000002000 ,
                        0x0000454d462b014001001c000000100000000210c0db01000000600000006000 ,
                        0x0000460000005c00000050000000454d462b224004000c000000000000001e40 ,
                        0x09000c00000000000000244001000c0000000000000030400200100000000400 ,
                        0x00000000803f214007000c00000000000000044000000c000000000000001800 ,
                        0x00000c00000000000000190000000c000000ffffff00140000000c0000000d00 ,
                        0x0000120000000c000000020000002100000008000000220000000c000000ffff ,
                        0xffff460000003400000028000000454d462b2a40000024000000180000000000 ,
                        0x803f00000080000000800000803f0000008000000080460000001c0000001000 ,
                        0x0000454d462b024000000c000000000000000e00000014000000000000001000 ,
                        0x0000140038000000000000000100000000000000000000000000000000000000 ,
                        0x000000003800000000000000000000000000000000000000000000000000e400 ,
                        0x000026060100feff030a0000ffffffff0308020000000000c000000000000046 ,
                        0x1a000000477261706869717565204d6963726f736f6674204772617068000700 ,
                        0x000047426966663500100000004d5347726170682e43686172742e3800f439b2 ,
                        0x7100000000000000000000000000000000008007000038040000090200002501 ,
                        0x000000000000000000000000000028f3070088780400460000002c0000002000 ,
                        0x0000454d462b014001001c000000100000000210c0db01000000600000006000 ,
                        0x0000460000005c00000050000000454d462b224004000c000000000000001e40 ,
                        0x09000c00000000000000244001000c0000000000000030400200100000000400 ,
                        0x00000000803f214007000c00000000000000044000000c000000000000001800 ,
                        0x00000c00000000000000190000000c000000ffffff00140000000c0000000d00 ,
                        0x0000120000000c000000020000002100000008000000220000000c000000ffff ,
                        0xffff460000003400000028000000454d462b2a40000024000000180000000000 ,
                        0x803f00000080000000800000803f0000008000000080460000001c0000001000 ,
                        0x0000454d462b024000000c000000000000000e00000014000000000000001000 ,
                        0x0000140009081000800605006632cd07c10002000608000042000200b0042200 ,
                        0x020000001e043300050017000123002c002300230030005c0020002200ac2022 ,
                        0x003b005c002d0023002c002300230030005c0020002200ac2022001e043d0006 ,
                        0x001c000123002c002300230030005c0020002200ac2022003b005b0052006500 ,
                        0x64005d005c002d0023002c002300230030005c0020002200ac2022001e043f00 ,
                        0x07001d000123002c002300230030002e00300030005c0020002200ac2022003b ,
                        0x005c002d0023002c002300230030002e00300030005c0020002200ac2022001e ,
                        0x044900080022000123002c002300230030002e00300030005c0020002200ac20 ,
                        0x22003b005b005200650064005d005c002d0023002c002300230030002e003000 ,
                        0x30005c0020002200ac2022001e0471002a003600015f002d002a00200023002c ,
                        0x002300230030005c0020002200ac2022005f002d003b005c002d002a00200023 ,
                        0x002c002300230030005c0020002200ac2022005f002d003b005f002d002a0020 ,
                        0x0022002d0022005c0020002200ac2022005f002d003b005f002d0040005f002d ,
                        0x001e046b0029003300015f002d002a00200023002c002300230030005c002000 ,
                        0x5f00ac205f002d003b005c002d002a00200023002c002300230030005c002000 ,
                        0x5f00ac205f002d003b005f002d002a00200022002d0022005c0020005f00ac20 ,
                        0x5f002d003b005f002d0040005f002d001e0481002c003e00015f002d002a0020 ,
                        0x0023002c002300230030002e00300030005c0020002200ac2022005f002d003b ,
                        0x005c002d002a00200023002c002300230030002e00300030005c0020002200ac ,
                        0x2022005f002d003b005f002d002a00200022002d0022003f003f005c00200022 ,
                        0x00ac2022005f002d003b005f002d0040005f002d001e047b002b003b00015f00 ,
                        0x2d002a00200023002c002300230030002e00300030005c0020005f00ac205f00 ,
                        0x2d003b005c002d002a00200023002c002300230030002e00300030005c002000 ,
                        0x5f00ac205f002d003b005f002d002a00200022002d0022003f003f005c002000 ,
                        0x5f00ac205f002d003b005f002d0040005f002d0031001e00a0000100ff7fbc02 ,
                        0x0000000000000701430061006c00690062007200690031001e00a0000100ff7f ,
                        0xbc020000000000000701430061006c00690062007200690031001e00c3000100 ,
                        0xff7fbc020000000000000701430061006c00690062007200690031001e00c800 ,
                        0x0100ff7fbc020000000200000701430061006c00690062007200690031001e00 ,
                        0xa0000100ff7fbc020000000000000701430061006c0069006200720069003100 ,
                        0x1e00a0000100ff7fbc020000000000000701430061006c006900620072006900 ,
                        0x31001e00c8000100ff7fbc020000000000000701430061006c00690062007200 ,
                        0x69003d0012006aff11fec0123e0d000000200023002c00238500080024040000 ,
                        0x000200000a00000009081000800600806632cd07c10002000608000060100a00 ,
                        0x2c109c09c8000000030060100a004a10aa0aa0000100050060100a004a10aa0a ,
                        0xa00000000600ac02020038009200e200380000000000ffffff00ff00000000ff ,
                        0x00000000ff00ffff0000ff00ff0000ffff008000000000800000000080008080 ,
                        0x00008000800000808000c0c0c000808080009999ff0099336600ffffcc00ccff ,
                        0xff0066006600ff8080000066cc00ccccff0000008000ff00ff00ffff000000ff ,
                        0xff008000800080000000008080000000ff0000ccff00ccffff00ccffcc00ffff ,
                        0x990099ccff00ff99cc00cc99ff00ffcc99003366ff0033cccc0099cc0000ffcc ,
                        0x0000ff990000ff66000066669900969696000033660033996600003300003333 ,
                        0x0000993300009933660033339900333333005c100e00030000000000ffffff00 ,
                        0x000000005210040001021000331000008c000400210021002610020007005310 ,
                        0x040000001e005410040000000200551006000000000000010400100000000000 ,
                        0x0000000700436f6d70616e7904000e00000001000000000500546f74616c0400 ,
                        0x1200010000000000000900436f6d70616e79204103000f000100010000000000 ,
                        0x0000000000f03f04001300020000000000000a00436f6d70616e792041410300 ,
                        0x0f0002000100000000000000000000f03f04001200030000000000000900436f ,
                        0x6d70616e79204203000f0003000100000000000000000000f03f040013000400 ,
                        0x00000000000a00436f6d70616e7920424203000f000400010000000000000000 ,
                        0x0000f03f04001200050000000000000900436f6d70616e79204303000f000500 ,
                        0x0100000000000000000000f03f04001300060000000000000a00436f6d70616e ,
                        0x7920434303000f0006000100000000000000000000f03f040012000700000000 ,
                        0x00000900436f6d70616e79204403000f0007000100000000000000000000f03f ,
                        0x04001200080000000000000900436f6d70616e79204503000f00080001000000 ,
                        0x00000000000000f03f04001200090000000000000900436f6d70616e79204603 ,
                        0x000f0009000100000000000000000000f03f040012000a000000000000090043 ,
                        0x6f6d70616e79204703000f000a000100000000000000000000f03f040012000b ,
                        0x0000000000000900436f6d70616e79204803000f000b00010000000000000000 ,
                        0x0000f03f040012000c0000000000000900436f6d70616e79204903000f000c00 ,
                        0x0100000000000000000000f03f040012000d0000000000000900436f6d70616e ,
                        0x79204a03000f000d000100000000000000000000f03f040012000e0000000000 ,
                        0x000900436f6d70616e79204b03000f000e000100000000000000000000f03f04 ,
                        0x0012000f0000000000000900436f6d70616e79204c03000f000f000100000000 ,
                        0x000000000000f03f04001200100000000000000900436f6d70616e79204d0300 ,
                        0x0f0010000100000000000000000000f03f04001200110000000000000900436f ,
                        0x6d70616e79204e03000f0011000100000000000000000000f03f040012001200 ,
                        0x00000000000900436f6d70616e79204f03000f00120001000000000000000000 ,
                        0x00f03f04001200130000000000000900436f6d70616e79205003000f00130001 ,
                        0x00000000000000000000f03f04001200140000000000000900436f6d70616e79 ,
                        0x205103000f0014000100000000000000000000f03f0400120015000000000000 ,
                        0x0900436f6d70616e79205203000f0015000100000000000000000000f03f0400 ,
                        0x1200160000000000000900436f6d70616e79205303000f001600010000000000 ,
                        0x0000000000f03f04001200170000000000000900436f6d70616e79205403000f ,
                        0x0017000100000000000000000000f03f04001200180000000000000900436f6d ,
                        0x70616e79205503000f0018000100000000000000000000f03f04001200190000 ,
                        0x000000000900436f6d70616e79205603000f0019000100000000000000000000 ,
                        0xf03f040012001a0000000000000900436f6d70616e79205703000f001a000100 ,
                        0x000000000000000000f03f040012001b0000000000000900436f6d70616e7920 ,
                        0x5803000f001b000100000000000000000000f03f040012001c00000000000009 ,
                        0x00436f6d70616e79205903000f001c000100000000000000000000f03f040012 ,
                        0x001d0000000000000900436f6d70616e79205a03000f001d0001000000000000 ,
                        0x00000000f03f571001000159100800240924096054f12c3d000a00db334128e4 ,
                        0x1bca0800003e000e0001010100010100010001000000005810020000001d0011 ,
                        0x0003010001000000010001000100010001003410000001100200000002101000 ,
                        0x0000000000000000217ed600ed7e820033100000a00004001500140064100800 ,
                        0x000001000000010003100c00030001001d001d00010000003310000051100800 ,
                        0x00010200000001000d100e000000050154006f00740061006c00511008000101 ,
                        0x0200000001005110080002010200000000005110080003010200000000000610 ,
                        0x0800ffff000000000000331000005f1002000000341000004510020000003410 ,
                        0x000003100c000300010003000300010000003310000051100800000102000000 ,
                        0x02000d1016000000090132006500200020007400720069006d002e0051100800 ,
                        0x0101020000000200511008000201020000000000511008000301020000000000 ,
                        0x06100800ffff010001000000331000005f100200000034100000451002000000 ,
                        0x3410000003100c00030001000300030001000000331000005110080000010200 ,
                        0x00000300ffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xfffffffffffffffffffffffffeffffff0c000000feffffff0e0000000f000000 ,
                        0x1000000011000000120000001300000014000000150000001600000017000000 ,
                        0x18000000190000001a0000001b0000001c0000001d0000001e0000001f000000 ,
                        0x2000000021000000220000002300000024000000250000002600000027000000 ,
                        0x28000000290000002a0000002b0000002c0000002d0000002e0000002f000000 ,
                        0x3000000031000000320000003300000034000000350000003600000037000000 ,
                        0x38000000390000003a0000003b0000003d000000feffffff3e0000003f000000 ,
                        0x40000000410000004200000043000000feffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff03004100630063006500730073004f0062006a005300690074006500 ,
                        0x4400610074006100000000000000000000000000000000000000000000000000 ,
                        0x0000000026000200ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000a00000038000000 ,
                        0x0000000002004f006c0065005000720065007300300030003000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000180002010100000004000000ffffffff000000000000000000000000 ,
                        0x00000000000000000000000000000000000000000000000018000000f4510000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000ffffffffffffffffffffffff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000400000003010800050000000b0200000000050000000c02ae00 ,
                        0x1e0105000000090200000000050000000102ffffff000400000004010d000400 ,
                        0x000002010200030000001e00040000002701ffff030000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000038000000000000000100000000000000000000000000000000000000 ,
                        0x0000000038000000000000000000000000000000000000000000000000000000 ,
                        0x000000000100feff030a0000ffffffff0308020000000000c000000000000046 ,
                        0x1a000000477261706869717565204d6963726f736f6674204772617068000700 ,
                        0x000047426966663500100000004d5347726170682e43686172742e3800f439b2 ,
                        0x71000000000000000000000000005c0020002200ac2022003b005b0052006500 ,
                        0x64005d0009081000800605006632cd07c10002000608000042000200b0042200 ,
                        0x020000001e043300050017000123002c002300230030005c0020002200ac2022 ,
                        0x003b005c002d0023002c002300230030005c0020002200ac2022001e043d0006 ,
                        0x001c000123002c002300230030005c0020002200ac2022003b005b0052006500 ,
                        0x64005d005c002d0023002c002300230030005c0020002200ac2022001e043f00 ,
                        0x07001d000123002c002300230030002e00300030005c0020002200ac2022003b ,
                        0x005c002d00010200000000003410000032100400000003003310000007100c00 ,
                        0x000000000000000009004d000a101000ffffff0000000000000000004e004d00 ,
                        0x3410000034100000341000003410000025102000020201000000000024060000 ,
                        0x45000000650300005902000081004d0000000000331000004f10140002000200 ,
                        0x0000000000000000420000001800000026100200070051100800000102000000 ,
                        0x00000d1016000000090143007500730074006f006d0065007200730027100600 ,
                        0x010000000000341000003410000000020e000000000003000000000004000000 ,
                        0x0a00000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000023002c002300230030002e00300030005c0020002200ac2022001e ,
                        0x044900080022000123002c002300230030002e00300030005c0020002200ac20 ,
                        0x22003b005b005200650064005d005c002d0023002c002300230030002e003000 ,
                        0x30005c0020002200ac2022001e0471002a003600015f002d002a00200023002c ,
                        0x002300230030005c0020002200ac2022005f002d003b005c002d002a00200023 ,
                        0x002c002300230030005c0020002200ac2022005f002d003b005f002d002a0020 ,
                        0x0022002d0022005c0020002200ac2022005f002d003b005f002d0040005f002d ,
                        0x001e046b0029003300015f002d002a00200023002c002300230030005c002000 ,
                        0x5f00ac205f002d003b005c002d002a00200023002c002300230030005c002000 ,
                        0x5f00ac205f002d003b005f002d002a00200022002d0022005c0020005f00ac20 ,
                        0x5f002d003b005f002d0040005f002d001e0481002c003e00015f002d002a0020 ,
                        0x0023002c002300230030002e00300030005c0020002200ac2022005f002d003b ,
                        0x005c002d002a00200023002c002300230030002e00300030005c0020002200ac ,
                        0x2022005f002d003b005f002d002a00200022002d0022003f003f005c00200022 ,
                        0x00ac2022005f002d003b005f002d0040005f002d001e047b002b003b00015f00 ,
                        0x2d002a00200023002c002300230030002e00300030005c0020005f00ac205f00 ,
                        0x2d003b005c002d002a00200023002c002300230030002e00300030005c002000 ,
                        0x5f00ac205f002d003b005f002d002a00200022002d0022003f003f005c002000 ,
                        0x5f00ac205f002d003b005f002d0040005f002d0031001e00a0000100ff7fbc02 ,
                        0x0000000000000701430061006c00690062007200690031001e00a0000100ff7f ,
                        0xbc020000000000000701430061006c00690062007200690031001e00c3000100 ,
                        0xff7fbc020000000000000701430061006c00690062007200690031001e00a000 ,
                        0x0100ff7fbc020000000000000701430061006c00690062007200690031001e00 ,
                        0xa0000100ff7fbc020000000000000701430061006c0069006200720069003100 ,
                        0x1e00c8000100ff7fbc020000000000000701430061006c006900620072006900 ,
                        0x31001e00c8000100ff7fbc020000000200000701430061006c00690062007200 ,
                        0x69003d0012006aff11fec0123e0d000000200023002c00238500080024040000 ,
                        0x000200000a00000009081000800600806632cd07c10002000608000060100a00 ,
                        0x4a10aa0aa0000000030060100a004a10aa0aa0000100050060100a002c109c09 ,
                        0xc80000000700ac02020038009200e200380000000000ffffff00ff00000000ff ,
                        0x00000000ff00ffff0000ff00ff0000ffff008000000000800000000080008080 ,
                        0x00008000800000808000c0c0c000808080009999ff0099336600ffffcc00ccff ,
                        0xff0066006600ff8080000066cc00ccccff0000008000ff00ff00ffff000000ff ,
                        0xff008000800080000000008080000000ff0000ccff00ccffff00ccffcc00ffff ,
                        0x990099ccff00ff99cc00cc99ff00ffcc99003366ff0033cccc0099cc0000ffcc ,
                        0x0000ff990000ff66000066669900969696000033660033996600003300003333 ,
                        0x0000993300009933660033339900333333005c100e00030000000000ffffff00 ,
                        0x000000005210040001021000331000008c000400210021002610020006005310 ,
                        0x0400000004005410040000000500551006000000000000010400130000000100 ,
                        0x0000000a0031657220207472696d2e0400120000000200000000090032652020 ,
                        0x7472696d2e04001200000003000000000900336520207472696d2e0400120000 ,
                        0x0004000000000900346520207472696d2e04000c000100000000000003004573 ,
                        0x7403000f0001000100000000666666666666344003000f000100020000000066 ,
                        0x66666666663b4003000f0001000300000000000000000080564003000f000100 ,
                        0x0400000000666666666666344004000e000200000000000005004f7565737403 ,
                        0x000f00020001000000009a99999999993e4003000f0002000200000000cdcccc ,
                        0xcccc4c434003000f0002000300000000cdcccccccc4c414003000f0002000400 ,
                        0x0000009a99999999993f4004000d000300000000000004004e6f726403000f00 ,
                        0x030001000000003333333333f3464003000f0003000200000000333333333373 ,
                        0x474003000f0003000300000000000000000080464003000f0003000400000000 ,
                        0x3333333333f34540571001000159100800240924096054f12c3d000a00f01e53 ,
                        0x25e41bca0800003e000e0001010100010100010001000000005810020000001d ,
                        0x0011000301000100000001000100010001000100341000000110020000000210 ,
                        0x10000000000000000000217ed600ed7e820033100000a0000400150014006410 ,
                        0x0800000001000000010003100c00030001000300030001000000331000005110 ,
                        0x080000010200000001000d10180000000a013100650072002000200074007200 ,
                        0x69006d002e005110080001010200000001005110080002010200000000005110 ,
                        0x0800030102000000000006100800ffff000000000000331000005f1002000000 ,
                        0x341000004510020000003410000003100c000300010003000300010000003310 ,
                        0x00005110080000010200000002000d1016000000090132006500200020007400 ,
                        0x720069006d002e00511008000101020000000200511008000201020000000000 ,
                        0x51100800030102000000000006100800ffff010001000000331000005f100200 ,
                        0x0000341000004510020000003410000003100c00030001000300030001000000 ,
                        0x331000005110080000010200000003000d101600000009013300650020002000 ,
                        0x7400720069006d002e0051100800010102000000030051100800020102000000 ,
                        0x000051100800030102000000000006100800ffff020002000000331000005f10 ,
                        0x02000000341000004510020000003410000003100c0003000100030003000100 ,
                        0x0000331000005110080000010200000004000d10160000000901340065002000 ,
                        0x20007400720069006d002e005110080001010200000004005110080002010200 ,
                        0x0000000051100800030102000000000006100800ffff03000300000033100000 ,
                        0x5f10020000003410000045100200000034100000441004000900000024100200 ,
                        0x0200251020000202010000000000bbffffff8cffffff0000000000000000b100 ,
                        0x4d0070020000331000004f101400020002000000000000000000000000000000 ,
                        0x0000261002000300511008000001020000000000341000002410020003002510 ,
                        0x20000202010000000000bbffffff8cffffff0000000000000000b1004d007002 ,
                        0x0000331000004f10140002000200000000000000000000000000000000002610 ,
                        0x0200050051100800000102000000000034100000461002000100411012000000 ,
                        0x8a000000b4030000d40a0000050b0000331000004f101400020002008a000000 ,
                        0xb4030000d40a0000050b00001d10120000000000000000000000000000000000 ,
                        0x0000331000002010080001000100010001006210120000000000010000000100 ,
                        0x000000000000ef001e101e000200010100000000000000000000000000000000 ,
                        0x0000000023004d00000021100200030007100c00808080000000000000001700 ,
                        0x0a101000c0c0c000000000000100000016004f00341000001d10120001000000 ,
                        0x0000000000000000000000000000331000001f102a0000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000001f01 ,
                        0x1e101e0002000301000000000000000000000000000000000000000023004d00 ,
                        0x000021100200010007100c00000000000000000009004d002110020003000710 ,
                        0x0c00000000000000000009004d000a101000ffffff0000000000010001004e00 ,
                        0x4d00341001000002000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000001410140000000000000000000000000000000000000000003310 ,
                        0x00001710060000009600000022100a0000000000000000000f003a100e001400 ,
                        0x0f001e00640064000000160015101400f60b00009a050000730300003a070000 ,
                        0x03011f00331000004f10140005000200f60b00009a0500000000000000000000 ,
                        0x251020000202010000000000bbffffff8cffffff0000000000000000b1004d00 ,
                        0x70020000331000004f1014000200020000000000000000000000000000000000 ,
                        0x51100800ffffffff0e0000000400000001000000ffffffff0000000000000000 ,
                        0x8f1d0000fc110000c4510000010009000003e22800000b001610000000001610 ,
                        0x000026060f002220574d4643010000000000010067ad00000000020000000020 ,
                        0x00000813000008330000010000006c000000210000000c000000140100009800 ,
                        0x00000000000000000000511e00007112000020454d4600000100083300009e02 ,
                        0x0000060000000000000000000000000000008007000038040000090200002501 ,
                        0x000000000000000000000000000028f3070088780400460000002c0000002000 ,
                        0x0000454d462b014001001c000000100000000210c0db01000000600000006000 ,
                        0x0000460000005c00000050000000454d462b224004000c000000000000001e40 ,
                        0x09000c00000000000000244001000c0000000000000030400200100000000400 ,
                        0x00000000803f214007000c00000000000000044000000c000000000000001800 ,
                        0x00000c00000000000000190000000c000000ffffff00140000000c0000000d00 ,
                        0x0000120000000c000000020000002100000008000000220000000c000000ffff ,
                        0xffff2100000008000000220000000c000000ffffffff0a000000100000000000 ,
                        0x0000000000002100000008000000190000000c000000ffffff00180000000c00 ,
                        0x000000000000520000007001000001000000f3ffffff00000000000000000000 ,
                        0x0000bc0200000000000000000022430061006c00690062007200690000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000000030000000000000009c0901460000 ,
                        0x00009c09014600000000998dc342ff7f00000000000074020000f0aebeb19400 ,
                        0x0000010000000000000078a9114c740200000000000000000000040000000000 ,
                        0x0000c06a00000000000000000000020000008067ec4474020000bbe62945ff7f ,
                        0x000000000000000000000f0e0a4b000000000000000074020000b16a2645ff7f ,
                        0x000000000000f67f00000400000094000000000000000000000060fcad517402 ,
                        0x000060b0beb1940000003d8fc34200000000c06a00000000000030e44075ff7f ,
                        0x00000f000000000000000ba7c172ff7f0000f0aebeb19400000070b0beb19400 ,
                        0x00000f0e0a4c00000000010000006476000800000000250000000c0000000100 ,
                        0x0000250000000c0000000d000080250000000c00000001000000520000007001 ,
                        0x000002000000f5ffffff000000000000000000000000bc020000000000000000 ,
                        0x0022430061006c00690062007200690000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000030000000000000009c090146000000009c09014600000000998d ,
                        0xc342ff7f00000000b242ff7f0000f9613321f67f0000a08ec342ff7f0000146a ,
                        0x3821f67f0000000000000000000004000000000000000000b242ff7f0000c164 ,
                        0x3321f67f00000400000000000000bbe62945ff7f0000a0e4beb194000000146a ,
                        0x3821000000004800000000000000b16a2645ff7f000000000000f67f00000400 ,
                        0x0000f67f00000000000000000000be17000000000000d0e6beb1940000003d8f ,
                        0xc3420000000000000000ffffffffa4290000042204000d000000000000000ba7 ,
                        0xc172ff7f000060e5beb194000000e0e6beb194000000320b0a08000000000100 ,
                        0x00006476000800000000250000000c00000002000000250000000c0000000d00 ,
                        0x0080250000000c00000002000000250000000c00000001000000250000000c00 ,
                        0x00000d000080250000000c00000001000000250000000c000000020000002500 ,
                        0x00000c0000000d000080220000000c000000ffffffff21000000080000002500 ,
                        0x00000c00000002000000190000000c000000ffffff00180000000c0000000000 ,
                        0x00001e0000001800000000000000000000001e010000ae000000250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000190000000c000000ffffff00180000000c000000000000001e00 ,
                        0x00001800000000000000000000001e010000ae000000250000000c0000000d00 ,
                        0x0080220000000c000000ffffffff2100000008000000250000000c0000000200 ,
                        0x0000190000000c000000ffffff00180000000c000000000000001e0000001800 ,
                        0x000004000000040000001a010000aa0000002700000018000000030000000000 ,
                        0x00008080800000000000250000000c00000003000000250000000c0000000800 ,
                        0x0080180000000c000000ffffff00190000000c00000080808000140000000c00 ,
                        0x00000d000000120000000c000000020000005600000030000000380000008400 ,
                        0x0000be0000008600000005000000380086003b008400be008400bb0086003800 ,
                        0x860027000000180000000400000000000000c0c0c00000000000250000000c00 ,
                        0x000004000000280000000c00000003000000180000000c000000000000001900 ,
                        0x00000c000000c0c0c000560000003000000038000000360000003b0000008600 ,
                        0x00000500000038008600380038003b0036003b00840038008600560000003000 ,
                        0x00003b00000036000000be00000084000000050000003b0084003b003600be00 ,
                        0x3600be0084003b0084001d00000018000000d900000042000000150100008a00 ,
                        0x0000260000001c00000003000000000000000100000000000000000000002500 ,
                        0x00000c000000030000001b000000100000003800000086000000190000000c00 ,
                        0x0000ffffff00120000000c0000000100000036000000100000003b0000008400 ,
                        0x00003600000010000000be000000840000001b00000010000000380000007700 ,
                        0x000036000000100000003b000000750000003600000010000000be0000007500 ,
                        0x00001b00000010000000380000006700000036000000100000003b0000006500 ,
                        0x00003600000010000000be000000650000001b00000010000000380000005700 ,
                        0x000036000000100000003b000000550000003600000010000000be0000005500 ,
                        0x00001b00000010000000380000004700000036000000100000003b0000004500 ,
                        0x00003600000010000000be000000450000001b00000010000000380000003800 ,
                        0x000036000000100000003b000000360000003600000010000000be0000003600 ,
                        0x0000250000000c00000007000080250000000c00000000000080250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000250000000c00000004000000250000000c000000030000001900 ,
                        0x00000c000000ffffff00180000000c000000000000001e000000180000000400 ,
                        0x0000040000001a010000aa000000250000000c00000005000080280000000c00 ,
                        0x000004000000180000000c000000ffffff00140000000c0000000d0000001200 ,
                        0x00000c0000000200000056000000300000003800000084000000be0000008600 ,
                        0x000005000000be008400bb008600380086003b008400be008400260000001c00 ,
                        0x00000400000000000000010000000000000080808000250000000c0000000400 ,
                        0x0000280000000c000000030000001d00000018000000d9000000420000001501 ,
                        0x00008a000000560000003000000038000000360000003b000000860000000500 ,
                        0x000038008600380038003b0036003b0084003800860056000000300000003b00 ,
                        0x000036000000be00000084000000050000003b0084003b003600be003600be00 ,
                        0x84003b008400250000000c00000007000080250000000c000000000000802500 ,
                        0x00000c0000000d000080220000000c000000ffffffff21000000080000002500 ,
                        0x00000c00000002000000250000000c00000005000080250000000c0000000400 ,
                        0x0000190000000c000000ffffff00180000000c000000ffffff001e0000001800 ,
                        0x000004000000040000001a010000aa000000260000001c000000030000000000 ,
                        0x0000010000000000000000000000250000000c00000003000000280000000c00 ,
                        0x000004000000270000001800000004000000000000004c4c7f00000000002500 ,
                        0x00000c00000004000000180000000c0000004c4c7f00190000000c0000004c4c ,
                        0x7f00140000000c0000000d000000120000000c00000002000000560000003000 ,
                        0x0000460000007400000049000000860000000500000046008600460076004900 ,
                        0x74004900840046008600270000001800000005000000000000009999ff000000 ,
                        0x0000250000000c00000005000000280000000c00000004000000180000000c00 ,
                        0x0000ffffff00190000000c0000009999ff0056000000300000003e0000007600 ,
                        0x00004600000086000000050000003e0086003e00760046007600460086003e00 ,
                        0x8600250000000c00000004000080280000000c00000005000000270000001800 ,
                        0x000005000000000000007373bf0000000000250000000c000000050000001800 ,
                        0x00000c0000007373bf00190000000c0000007373bf0056000000300000003e00 ,
                        0x0000740000004900000076000000050000004600760049007400410074003e00 ,
                        0x760046007600260000001c000000040000000000000001000000000000000000 ,
                        0x0000250000000c00000004000000280000000c00000003000000270000001800 ,
                        0x000003000000000000004c19330000000000250000000c000000030000002800 ,
                        0x00000c00000005000000180000000c0000004c193300190000000c0000004c19 ,
                        0x330056000000300000004e0000006f0000005100000086000000050000004e00 ,
                        0x86004e00710051006f00510084004e0086002700000018000000050000000000 ,
                        0x00009933660000000000250000000c00000005000000280000000c0000000300 ,
                        0x0000180000000c000000ffffff00190000000c00000099336600560000003000 ,
                        0x000046000000710000004e000000860000000500000046008600460071004e00 ,
                        0x71004e00860046008600250000000c00000004000080280000000c0000000500 ,
                        0x00002700000018000000050000000000000073264c0000000000250000000c00 ,
                        0x000005000000180000000c00000073264c00190000000c00000073264c005600 ,
                        0x000030000000460000006f0000005100000071000000050000004e0071005100 ,
                        0x6f0049006f00460071004e007100260000001c00000003000000000000000100 ,
                        0x00000000000000000000250000000c00000003000000280000000c0000000400 ,
                        0x0000270000001800000004000000000000007f7f660000000000250000000c00 ,
                        0x000004000000280000000c00000005000000180000000c0000007f7f66001900 ,
                        0x00000c0000007f7f66005600000030000000560000003d000000580000008600 ,
                        0x0000050000005600860056003f0058003d005800840056008600270000001800 ,
                        0x00000500000000000000ffffcc0000000000250000000c000000050000002800 ,
                        0x00000c00000004000000180000000c000000ffffff00190000000c000000ffff ,
                        0xcc0056000000300000004e0000003f0000005600000086000000050000004e00 ,
                        0x86004e003f0056003f00560086004e008600250000000c000000040000802800 ,
                        0x00000c0000000500000027000000180000000500000000000000bfbf99000000 ,
                        0x0000250000000c00000005000000180000000c000000bfbf9900190000000c00 ,
                        0x0000bfbf990056000000300000004e0000003d000000580000003f0000000500 ,
                        0x000056003f0058003d0051003d004e003f0056003f00260000001c0000000400 ,
                        0x000000000000010000000000000000000000250000000c000000040000002800 ,
                        0x00000c0000000300000027000000180000000300000000000000667f7f000000 ,
                        0x0000250000000c00000003000000280000000c00000005000000180000000c00 ,
                        0x0000667f7f00190000000c000000667f7f0056000000300000005e0000007400 ,
                        0x00006000000086000000050000005e0086005e00760060007400600084005e00 ,
                        0x860027000000180000000500000000000000ccffff0000000000250000000c00 ,
                        0x000005000000280000000c00000003000000180000000c000000ffffff001900 ,
                        0x00000c000000ccffff00560000003000000056000000760000005e0000008600 ,
                        0x00000500000056008600560076005e0076005e00860056008600250000000c00 ,
                        0x000004000080280000000c000000050000002700000018000000050000000000 ,
                        0x000099bfbf0000000000250000000c00000005000000180000000c00000099bf ,
                        0xbf00190000000c00000099bfbf00560000003000000056000000740000006000 ,
                        0x000076000000050000005e0076006000740058007400560076005e0076002600 ,
                        0x00001c0000000300000000000000010000000000000000000000250000000c00 ,
                        0x000003000000280000000c000000040000002700000018000000040000000000 ,
                        0x00004c4c7f0000000000250000000c00000004000000280000000c0000000500 ,
                        0x0000180000000c0000004c4c7f00190000000c0000004c4c7f00560000003000 ,
                        0x0000720000006c0000007400000086000000050000007200860072006e007400 ,
                        0x6c007400840072008600270000001800000005000000000000009999ff000000 ,
                        0x0000250000000c00000005000000280000000c00000004000000180000000c00 ,
                        0x0000ffffff00190000000c0000009999ff0056000000300000006a0000006e00 ,
                        0x00007200000086000000050000006a0086006a006e0072006e00720086006a00 ,
                        0x8600250000000c00000004000080280000000c00000005000000270000001800 ,
                        0x000005000000000000007373bf0000000000250000000c000000050000001800 ,
                        0x00000c0000007373bf00190000000c0000007373bf0056000000300000006a00 ,
                        0x00006c000000740000006e0000000500000072006e0074006c006c006c006a00 ,
                        0x6e0072006e00260000001c000000040000000000000001000000000000000000 ,
                        0x0000250000000c00000004000000280000000c00000003000000270000001800 ,
                        0x000003000000000000004c19330000000000250000000c000000030000002800 ,
                        0x00000c00000005000000180000000c0000004c193300190000000c0000004c19 ,
                        0x330056000000300000007a000000660000007c00000086000000050000007a00 ,
                        0x86007a0068007c0066007c0084007a0086002700000018000000050000000000 ,
                        0x00009933660000000000250000000c00000005000000280000000c0000000300 ,
                        0x0000180000000c000000ffffff00190000000c00000099336600560000003000 ,
                        0x000072000000680000007a000000860000000500000072008600720068007a00 ,
                        0x68007a00860072008600250000000c00000004000080280000000c0000000500 ,
                        0x00002700000018000000050000000000000073264c0000000000250000000c00 ,
                        0x000005000000180000000c00000073264c00190000000c00000073264c005600 ,
                        0x00003000000072000000660000007c00000068000000050000007a0068007c00 ,
                        0x660074006600720068007a006800260000001c00000003000000000000000100 ,
                        0x00000000000000000000250000000c00000003000000280000000c0000000400 ,
                        0x0000270000001800000004000000000000007f7f660000000000250000000c00 ,
                        0x000004000000280000000c00000005000000180000000c0000007f7f66001900 ,
                        0x00000c0000007f7f660056000000300000008200000069000000840000008600 ,
                        0x0000050000008200860082006b00840069008400840082008600270000001800 ,
                        0x00000500000000000000ffffcc0000000000250000000c000000050000002800 ,
                        0x00000c00000004000000180000000c000000ffffff00190000000c000000ffff ,
                        0xcc0056000000300000007a0000006b0000008200000086000000050000007a00 ,
                        0x86007a006b0082006b00820086007a008600250000000c000000040000802800 ,
                        0x00000c0000000500000027000000180000000500000000000000bfbf99000000 ,
                        0x0000250000000c00000005000000180000000c000000bfbf9900190000000c00 ,
                        0x0000bfbf990056000000300000007a00000069000000840000006b0000000500 ,
                        0x000082006b00840069007c0069007a006b0082006b00260000001c0000000400 ,
                        0x000000000000010000000000000000000000250000000c000000040000002800 ,
                        0x00000c0000000300000027000000180000000300000000000000667f7f000000 ,
                        0x0000250000000c00000003000000280000000c00000005000000180000000c00 ,
                        0x0000667f7f00190000000c000000667f7f0056000000300000008a0000006b00 ,
                        0x00008c00000086000000050000008a0086008a006e008c006b008c0084008a00 ,
                        0x860027000000180000000500000000000000ccffff0000000000250000000c00 ,
                        0x000005000000280000000c00000003000000180000000c000000ffffff001900 ,
                        0x00000c000000ccffff005600000030000000820000006e0000008a0000008600 ,
                        0x0000050000008200860082006e008a006e008a00860082008600250000000c00 ,
                        0x000004000080280000000c000000050000002700000018000000050000000000 ,
                        0x000099bfbf0000000000250000000c00000005000000180000000c00000099bf ,
                        0xbf00190000000c00000099bfbf005600000030000000820000006b0000008c00 ,
                        0x00006e000000050000008a006e008c006b0084006b0082006e008a006e002600 ,
                        0x00001c0000000300000000000000010000000000000000000000250000000c00 ,
                        0x000003000000280000000c000000040000002700000018000000040000000000 ,
                        0x00004c4c7f0000000000250000000c00000004000000280000000c0000000500 ,
                        0x0000180000000c0000004c4c7f00190000000c0000004c4c7f00560000003000 ,
                        0x00009e00000060000000a000000086000000050000009e0086009e006200a000 ,
                        0x6000a00084009e008600270000001800000005000000000000009999ff000000 ,
                        0x0000250000000c00000005000000280000000c00000004000000180000000c00 ,
                        0x0000ffffff00190000000c0000009999ff005600000030000000960000006200 ,
                        0x00009e000000860000000500000096008600960062009e0062009e0086009600 ,
                        0x8600250000000c00000004000080280000000c00000005000000270000001800 ,
                        0x000005000000000000007373bf0000000000250000000c000000050000001800 ,
                        0x00000c0000007373bf00190000000c0000007373bf0056000000300000009600 ,
                        0x000060000000a000000062000000050000009e006200a0006000980060009600 ,
                        0x62009e006200260000001c000000040000000000000001000000000000000000 ,
                        0x0000250000000c00000004000000280000000c00000003000000270000001800 ,
                        0x000003000000000000004c19330000000000250000000c000000030000002800 ,
                        0x00000c00000005000000180000000c0000004c193300190000000c0000004c19 ,
                        0x33005600000030000000a50000005f000000a80000008600000005000000a500 ,
                        0x8600a5006100a8005f00a8008400a50086002700000018000000050000000000 ,
                        0x00009933660000000000250000000c00000005000000280000000c0000000300 ,
                        0x0000180000000c000000ffffff00190000000c00000099336600560000003000 ,
                        0x00009e00000061000000a500000086000000050000009e0086009e006100a500 ,
                        0x6100a50086009e008600250000000c00000004000080280000000c0000000500 ,
                        0x00002700000018000000050000000000000073264c0000000000250000000c00 ,
                        0x000005000000180000000c00000073264c00190000000c00000073264c005600 ,
                        0x0000300000009e0000005f000000a80000006100000005000000a5006100a800 ,
                        0x5f00a0005f009e006100a5006100260000001c00000003000000000000000100 ,
                        0x00000000000000000000250000000c00000003000000280000000c0000000400 ,
                        0x0000270000001800000004000000000000007f7f660000000000250000000c00 ,
                        0x000004000000280000000c00000005000000180000000c0000007f7f66001900 ,
                        0x00000c0000007f7f66005600000030000000ad00000061000000b00000008600 ,
                        0x000005000000ad008600ad006300b0006100b0008400ad008600270000001800 ,
                        0x00000500000000000000ffffcc0000000000250000000c000000050000002800 ,
                        0x00000c00000004000000180000000c000000ffffff00190000000c000000ffff ,
                        0xcc005600000030000000a500000063000000ad0000008600000005000000a500 ,
                        0x8600a5006300ad006300ad008600a5008600250000000c000000040000802800 ,
                        0x00000c0000000500000027000000180000000500000000000000bfbf99000000 ,
                        0x0000250000000c00000005000000180000000c000000bfbf9900190000000c00 ,
                        0x0000bfbf99005600000030000000a500000061000000b0000000630000000500 ,
                        0x0000ad006300b0006100a8006100a5006300ad006300260000001c0000000400 ,
                        0x000000000000010000000000000000000000250000000c000000040000002800 ,
                        0x00000c0000000300000027000000180000000300000000000000667f7f000000 ,
                        0x0000250000000c00000003000000280000000c00000005000000180000000c00 ,
                        0x0000667f7f00190000000c000000667f7f005600000030000000b50000006200 ,
                        0x0000b80000008600000005000000b5008600b5006400b8006200b8008400b500 ,
                        0x860027000000180000000500000000000000ccffff0000000000250000000c00 ,
                        0x000005000000280000000c00000003000000180000000c000000ffffff001900 ,
                        0x00000c000000ccffff005600000030000000ad00000064000000b50000008600 ,
                        0x000005000000ad008600ad006400b5006400b5008600ad008600250000000c00 ,
                        0x000004000080280000000c000000050000002700000018000000050000000000 ,
                        0x000099bfbf0000000000250000000c00000005000000180000000c00000099bf ,
                        0xbf00190000000c00000099bfbf005600000030000000ad00000062000000b800 ,
                        0x00006400000005000000b5006400b8006200b0006200ad006400b50064002500 ,
                        0x00000c00000004000080280000000c00000005000000250000000c0000000700 ,
                        0x0080280000000c00000004000000260000001c00000004000000000000000100 ,
                        0x00000000000000000000250000000c000000040000001b000000100000003800 ,
                        0x000086000000190000000c000000ffffff00120000000c000000010000003600 ,
                        0x00001000000038000000380000001b0000001000000038000000860000003600 ,
                        0x00001000000035000000860000001b0000001000000038000000770000003600 ,
                        0x00001000000035000000770000001b0000001000000038000000670000003600 ,
                        0x00001000000035000000670000001b0000001000000038000000570000003600 ,
                        0x00001000000035000000570000001b0000001000000038000000470000003600 ,
                        0x00001000000035000000470000001b0000001000000038000000380000003600 ,
                        0x000010000000350000009a09000026060f002a13574d46430100000000000100 ,
                        0x0000000000000200000008130000000000000833000038000000180000000c00 ,
                        0x00000000000054000000540000002d0000007f000000320000008b0000000100 ,
                        0x00005515d9417b09d9412d0000007f000000010000004c000000000000000000 ,
                        0x000000000000ffffffffffffffff500000003000000406000000540000005800 ,
                        0x00002700000070000000320000007c000000010000005515d9417b09d9412700 ,
                        0x000070000000020000004c000000000000000000000000000000ffffffffffff ,
                        0xffff500000003200300006000000060000005400000058000000270000006000 ,
                        0x0000320000006c000000010000005515d9417b09d94127000000600000000200 ,
                        0x00004c000000000000000000000000000000ffffffffffffffff500000003400 ,
                        0x3000060000000600000054000000580000002700000050000000320000005c00 ,
                        0x0000010000005515d9417b09d9412700000050000000020000004c0000000000 ,
                        0x00000000000000000000ffffffffffffffff5000000036003000060000000600 ,
                        0x000054000000580000002700000040000000320000004c000000010000005515 ,
                        0xd9417b09d9412700000040000000020000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff50000000380030000600000006000000540000006000 ,
                        0x00002100000031000000320000003d000000010000005515d9417b09d9412100 ,
                        0x000031000000030000004c000000000000000000000000000000ffffffffffff ,
                        0xffff5400000031003000300000040600000006000000060000001b0000001000 ,
                        0x000038000000860000003600000010000000bb000000860000001b0000001000 ,
                        0x00003800000086000000360000001000000038000000890000001b0000001000 ,
                        0x00006400000086000000360000001000000064000000890000001b0000001000 ,
                        0x0000900000008600000036000000100000009000000089000000540000006000 ,
                        0x0000480000008c0000005400000098000000010000005515d9417b09d9414800 ,
                        0x00008c000000030000004c000000000000000000000000000000ffffffffffff ,
                        0xffff540000004500730074000004050000000400000004000000540000006c00 ,
                        0x00006d0000008c0000008700000098000000010000005515d9417b09d9416d00 ,
                        0x00008c000000050000004c000000000000000000000000000000ffffffffffff ,
                        0xffff580000004f00750065007300740000040700000006000000060000000400 ,
                        0x00000400000054000000640000009a0000008c000000b0000000980000000100 ,
                        0x00005515d9417b09d9419a0000008c000000040000004c000000000000000000 ,
                        0x000000000000ffffffffffffffff540000004e006f0072006400070000000600 ,
                        0x00000400000006000000250000000c00000007000080250000000c0000000d00 ,
                        0x0080220000000c000000ffffffff2100000008000000250000000c0000000200 ,
                        0x0000250000000c00000004000000190000000c000000ffffff00180000000c00 ,
                        0x0000000000001e0000001800000000000000000000001e010000ae0000002500 ,
                        0x00000c00000001000000250000000c0000000d000080250000000c0000000100 ,
                        0x0000250000000c00000007000080250000000c0000000d000080220000000c00 ,
                        0x0000ffffffff2100000008000000250000000c00000001000000250000000c00 ,
                        0x000004000000190000000c000000ffffff00180000000c000000000000001e00 ,
                        0x0000180000006f00000007000000b000000020000000140000000c0000000d00 ,
                        0x0000120000000c000000010000005400000084000000720000000c000000ac00 ,
                        0x00001a000000010000005515d9417b09d941720000000c000000090000004c00 ,
                        0x0000000000000000000000000000ffffffffffffffff60000000430075007300 ,
                        0x74006f006d006500720073000004070000000700000005000000050000000700 ,
                        0x00000b000000070000000500000005000000250000000c0000000d0000802500 ,
                        0x00000c00000001000000250000000c00000007000080250000000c0000000d00 ,
                        0x0080220000000c000000ffffffff2100000008000000250000000c0000000100 ,
                        0x0000250000000c00000004000000190000000c000000ffffff00180000000c00 ,
                        0x0000000000001e0000001800000000000000000000001e010000ae0000002500 ,
                        0x00000c00000007000080250000000c0000000d000080220000000c000000ffff ,
                        0xffff2100000008000000250000000c00000001000000250000000c0000000400 ,
                        0x0000190000000c000000ffffff00180000000c000000000000001e0000001800 ,
                        0x000000000000000000001e010000ae000000250000000c000000020000002500 ,
                        0x00000c00000005000080180000000c000000ffffff00140000000c0000000d00 ,
                        0x0000120000000c000000020000002b00000018000000d9000000420000001401 ,
                        0x00008a000000250000000c00000007000080250000000c000000000000802500 ,
                        0x00000c0000000d000080220000000c000000ffffffff21000000080000002500 ,
                        0x00000c00000002000000250000000c00000005000080250000000c0000000400 ,
                        0x0000190000000c000000ffffff00180000000c000000ffffff001e0000001800 ,
                        0x0000d900000042000000150100008a000000250000000c000000070000802500 ,
                        0x00000c00000000000080250000000c0000000d000080220000000c000000ffff ,
                        0xffff2100000008000000250000000c00000002000000250000000c0000000500 ,
                        0x0080250000000c00000004000000190000000c000000ffffff00180000000c00 ,
                        0x0000ffffff001e00000018000000d900000042000000150100008a0000002600 ,
                        0x00001c0000000500000000000000010000000000000000000000250000000c00 ,
                        0x000005000000280000000c000000040000002700000018000000040000000000 ,
                        0x00009999ff0000000000250000000c00000004000000190000000c0000009999 ,
                        0xff00140000000c0000000d000000120000000c000000020000002b0000001800 ,
                        0x0000dc00000048000000e10000004d000000180000000c000000000000001900 ,
                        0x00000c000000ffffff00120000000c00000001000000160000000c0000001800 ,
                        0x00005400000088000000e5000000440000000f01000050000000010000005515 ,
                        0xd9417b09d941e50000004e0000000a0000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff60000000310065007200200020007400720069006d00 ,
                        0x2e00060000000600000004000000020000000200000004000000040000000300 ,
                        0x00000900000003000000160000000c00000000000000250000000c0000000700 ,
                        0x0080250000000c00000000000080250000000c0000000d000080220000000c00 ,
                        0x0000ffffffff2100000008000000250000000c00000002000000250000000c00 ,
                        0x000004000000250000000c00000005000000190000000c000000ffffff001800 ,
                        0x00000c000000000000001e00000018000000d900000042000000150100008a00 ,
                        0x0000250000000c00000007000080250000000c00000000000080250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000250000000c00000004000000250000000c000000050000001900 ,
                        0x00000c000000ffffff00180000000c000000000000001e00000018000000d900 ,
                        0x000042000000150100008a000000260000001c00000003000000000000000100 ,
                        0x00000000000000000000250000000c00000003000000280000000c0000000500 ,
                        0x0000270000001800000005000000000000009933660000000000250000000c00 ,
                        0x000005000000280000000c00000004000000180000000c000000ffffff001900 ,
                        0x00000c00000099336600140000000c0000000d000000120000000c0000000200 ,
                        0x00002b00000018000000dc0000005a000000e10000005f000000180000000c00 ,
                        0x000000000000190000000c000000ffffff00120000000c000000010000001600 ,
                        0x00000c000000180000005400000084000000e5000000560000000b0100006200 ,
                        0x0000010000005515d9417b09d941e500000060000000090000004c0000000000 ,
                        0x00000000000000000000ffffffffffffffff6000000032006500200020007400 ,
                        0x720069006d002e00000406000000060000000200000002000000040000000400 ,
                        0x0000030000000900000003000000160000000c00000000000000250000000c00 ,
                        0x000007000080250000000c00000000000080250000000c0000000d0000802200 ,
                        0x00000c000000ffffffff2100000008000000250000000c000000020000002500 ,
                        0x00000c00000005000000250000000c00000003000000190000000c000000ffff ,
                        0xff00180000000c000000000000001e00000018000000d9000000420000001501 ,
                        0x00008a000000250000000c00000007000080250000000c000000000000802500 ,
                        0x00000c0000000d000080220000000c000000ffffffff21000000080000002500 ,
                        0x00000c00000002000000250000000c00000005000000250000000c0000000300 ,
                        0x0000190000000c000000ffffff00180000000c000000000000001e0000001800 ,
                        0x0000d900000042000000150100008a000000260000001c000000040000000000 ,
                        0x0000010000000000000000000000250000000c00000004000000280000000c00 ,
                        0x00000300000027000000180000000300000000000000ffffcc00000000002500 ,
                        0x00000c00000003000000280000000c00000005000000180000000c000000ffff ,
                        0xff00190000000c000000ffffcc00140000000c0000000d000000120000000c00 ,
                        0x0000020000002b00000018000000dc0000006c000000e1000000710000001800 ,
                        0x00000c00000000000000190000000c000000ffffff00120000000c0000000100 ,
                        0x0000160000000c000000180000005400000084000000e5000000680000000b01 ,
                        0x000074000000010000005515d9417b09d941e500000072000000090000004c00 ,
                        0x0000000000000000000000000000ffffffffffffffff60000000330065002000 ,
                        0x20007400720069006d002e000004060000000600000002000000020000000400 ,
                        0x000004000000030000000900000003000000160000000c000000000000002500 ,
                        0x00000c00000007000080250000000c00000000000080250000000c0000000d00 ,
                        0x0080220000000c000000ffffffff2100000008000000250000000c0000000200 ,
                        0x0000250000000c00000003000000250000000c00000004000000190000000c00 ,
                        0x0000ffffff00180000000c000000000000001e00000018000000d90000004200 ,
                        0x0000150100008a000000250000000c00000007000080250000000c0000000000 ,
                        0x0080250000000c0000000d000080220000000c000000ffffffff210000000800 ,
                        0x0000250000000c00000002000000250000000c00000003000000250000000c00 ,
                        0x000004000000190000000c000000ffffff00180000000c000000000000001e00 ,
                        0x000018000000d900000042000000150100008a000000260000001c0000000500 ,
                        0x000000000000010000000000000000000000250000000c000000050000002800 ,
                        0x00000c0000000400000027000000180000000400000000000000ccffff000000 ,
                        0x0000250000000c00000004000000280000000c00000003000000180000000c00 ,
                        0x0000ffffff00190000000c000000ccffff00140000000c0000000d0000001200 ,
                        0x00000c000000020000002b00000018000000dc0000007e000000e10000008300 ,
                        0x0000180000000c00000000000000190000000c000000ffffff00120000000c00 ,
                        0x000001000000160000000c000000180000005400000084000000e50000007a00 ,
                        0x00000b01000086000000010000005515d9417b09d941e5000000840000000900 ,
                        0x00004c000000000000000000000000000000ffffffffffffffff600000003400 ,
                        0x6500200020007400720069006d002e0000040600000006000000020000000200 ,
                        0x00000400000004000000030000000900000003000000160000000c0000000000 ,
                        0x0000250000000c00000007000080250000000c00000000000080250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000250000000c00000004000000250000000c000000050000001900 ,
                        0x00000c000000ffffff00180000000c000000000000001e00000018000000d900 ,
                        0x000042000000150100008a000000250000000c00000007000080250000000c00 ,
                        0x000000000080250000000c0000000d000080220000000c000000ffffffff2100 ,
                        0x000008000000250000000c00000002000000250000000c000000040000002500 ,
                        0x00000c00000005000000190000000c000000ffffff00180000000c0000000000 ,
                        0x00001e0000001800000000000000000000001e010000ae000000250000000c00 ,
                        0x000004000080280000000c00000004000000250000000c000000070000802800 ,
                        0x00000c00000005000000250000000c0000000d000080220000000c000000ffff ,
                        0xffff0900000010000000511e0000711200002100000008000000190000000c00 ,
                        0x0000ffffff00180000000c00000000000000220000000c000000ffffffff0a00 ,
                        0x00001000000000000000000000002100000008000000190000000c000000ffff ,
                        0xff00180000000c00000000000000220000000c000000ffffffff460000003400 ,
                        0x000028000000454d462b2a40000024000000180000000000803f000000800000 ,
                        0x00800000803f0000008000000080460000001c00000010000000454d462b0240 ,
                        0x00000c000000000000000e000000140000000000000010000000140000000400 ,
                        0x000003010800050000000b0200000000050000000c02ae001e01050000000902 ,
                        0x00000000050000000102ffffff000400000004010d0004000000020102000300 ,
                        0x00001e00040000002701ffff030000001e00040000002701ffff030000001e00 ,
                        0x050000000102ffffff00050000000902000000001c000000fb02f3ff00000000 ,
                        0x0000bc02000000000000002243616c6962726900000000000000000000000000 ,
                        0x000000000000000000000000040000002d0100001c000000fb02100007000000 ,
                        0x0000bc02000000000102022253797374656d0000000000000000000000000000 ,
                        0x000000000000000000000000040000002d010100040000002d0100001c000000 ,
                        0xfb02f5ff000000000000bc02000000000000002243616c696272690000000000 ,
                        0x0000000000000000000000000000000000000000040000002d01020004000000 ,
                        0x2d010100040000002d010200040000002d010000040000002d01010004000000 ,
                        0x2d010000040000002d010200040000002d010100040000002701ffff03000000 ,
                        0x1e00040000002d010200050000000102ffffff00050000000902000000000400 ,
                        0x00002c010000070000001604ae001e0100000000040000002d01010004000000 ,
                        0x2701ffff030000001e00040000002d010200050000000102ffffff0005000000 ,
                        0x090200000000040000002c010000070000001604ae001e010000000004000000 ,
                        0x2d010100040000002701ffff030000001e00040000002d010200050000000102 ,
                        0xffffff0005000000090200000000040000002c010000070000001604aa001a01 ,
                        0x0400040007000000fc020000808080000000040000002d01030008000000fa02 ,
                        0x050000000000ffffff00040000002d010400050000000902ffffff0005000000 ,
                        0x0102808080000400000004010d0004000000020102000e000000240305003800 ,
                        0x86003b008400be008400bb0086003800860007000000fc020000c0c0c0000000 ,
                        0x040000002d01050004000000f001030005000000090200000000050000000102 ,
                        0xc0c0c0000e0000002403050038008600380038003b0036003b00840038008600 ,
                        0x0e000000240305003b0084003b003600be003600be0084003b00840004000000 ,
                        0x2c010000070000001604aa001a01040004000700000015048a0015014200d900 ,
                        0x08000000fa0200000100000000000000040000002d0103000500000014028600 ,
                        0x3800050000000102ffffff00040000000201010005000000130284003b000500 ,
                        0x000013028400be000500000014027700380005000000130275003b0005000000 ,
                        0x13027500be000500000014026700380005000000130265003b00050000001302 ,
                        0x6500be000500000014025700380005000000130255003b000500000013025500 ,
                        0xbe000500000014024700380005000000130245003b000500000013024500be00 ,
                        0x0500000014023800380005000000130236003b000500000013023600be000800 ,
                        0x0000fa0200000000000000000000040000002d01060007000000fc020000ffff ,
                        0xff000000040000002d010700040000002d010100040000002701ffff03000000 ,
                        0x1e00040000002d010200040000002d010500040000002d010300050000000102 ,
                        0xffffff0005000000090200000000040000002c010000070000001604aa001a01 ,
                        0x0400040007000000fc020100000000000000040000002d01080004000000f001 ,
                        0x0500050000000902ffffff000400000004010d0004000000020102000e000000 ,
                        0x24030500be008400bb008600380086003b008400be00840008000000fa020000 ,
                        0x0100000080808000040000002d01050004000000f0010300040000002c010000 ,
                        0x070000001604aa001a01040004000700000015048a0015014200d9000e000000 ,
                        0x2403050038008600380038003b0036003b008400380086000e00000024030500 ,
                        0x3b0084003b003600be003600be0084003b008400040000002d01060004000000 ,
                        0x2d010700040000002d010100040000002701ffff030000001e00040000002d01 ,
                        0x0200040000002d010800040000002d010500050000000102ffffff0005000000 ,
                        0x0902ffffff00040000002c010000070000001604aa001a010400040008000000 ,
                        0xfa0200000100000000000000040000002d01030004000000f001050007000000 ,
                        0xfc0200004c4c7f000000040000002d0105000500000009024c4c7f0005000000 ,
                        0x01024c4c7f000400000004010d0004000000020102000e000000240305004600 ,
                        0x86004600760049007400490084004600860007000000fc0200009999ff000000 ,
                        0x040000002d01090004000000f0010500050000000902ffffff00050000000102 ,
                        0x9999ff000e000000240305003e0086003e00760046007600460086003e008600 ,
                        0x07000000fc020000000000000000040000002d01050004000000f00109000700 ,
                        0x0000fc0200007373bf000000040000002d0109000500000009027373bf000500 ,
                        0x000001027373bf000e000000240305004600760049007400410074003e007600 ,
                        0x4600760008000000fa0200000100000000000000040000002d010a0004000000 ,
                        0xf001030007000000fc0200004c1933000000040000002d01030004000000f001 ,
                        0x09000500000009024c1933000500000001024c1933000e000000240305004e00 ,
                        0x86004e00710051006f00510084004e00860007000000fc020000993366000000 ,
                        0x040000002d01090004000000f0010300050000000902ffffff00050000000102 ,
                        0x993366000e0000002403050046008600460071004e0071004e00860046008600 ,
                        0x040000002d01050004000000f001090007000000fc02000073264c0000000400 ,
                        0x00002d01030005000000090273264c0005000000010273264c000e0000002403 ,
                        0x05004e00710051006f0049006f00460071004e00710008000000fa0200000100 ,
                        0x000000000000040000002d01090004000000f0010a0007000000fc0200007f7f ,
                        0x66000000040000002d010a0004000000f00103000500000009027f7f66000500 ,
                        0x000001027f7f66000e000000240305005600860056003f0058003d0058008400 ,
                        0x5600860007000000fc020000ffffcc000000040000002d01030004000000f001 ,
                        0x0a00050000000902ffffff00050000000102ffffcc000e000000240305004e00 ,
                        0x86004e003f0056003f00560086004e008600040000002d01050004000000f001 ,
                        0x030007000000fc020000bfbf99000000040000002d010300050000000902bfbf ,
                        0x9900050000000102bfbf99000e0000002403050056003f0058003d0051003d00 ,
                        0x4e003f0056003f0008000000fa0200000100000000000000040000002d010a00 ,
                        0x04000000f001090007000000fc020000667f7f000000040000002d0109000400 ,
                        0x0000f0010300050000000902667f7f00050000000102667f7f000e0000002403 ,
                        0x05005e0086005e00760060007400600084005e00860007000000fc020000ccff ,
                        0xff000000040000002d01030004000000f0010900050000000902ffffff000500 ,
                        0x00000102ccffff000e0000002403050056008600560076005e0076005e008600 ,
                        0x56008600040000002d01050004000000f001030007000000fc02000099bfbf00 ,
                        0x0000040000002d01030005000000090299bfbf0005000000010299bfbf000e00 ,
                        0x0000240305005e0076006000740058007400560076005e00760008000000fa02 ,
                        0x00000100000000000000040000002d01090004000000f0010a0007000000fc02 ,
                        0x00004c4c7f000000040000002d010a0004000000f00103000500000009024c4c ,
                        0x7f000500000001024c4c7f000e000000240305007200860072006e0074006c00 ,
                        0x740084007200860007000000fc0200009999ff000000040000002d0103000400 ,
                        0x0000f0010a00050000000902ffffff000500000001029999ff000e0000002403 ,
                        0x05006a0086006a006e0072006e00720086006a008600040000002d0105000400 ,
                        0x0000f001030007000000fc0200007373bf000000040000002d01030005000000 ,
                        0x09027373bf000500000001027373bf000e0000002403050072006e0074006c00 ,
                        0x6c006c006a006e0072006e0008000000fa020000010000000000000004000000 ,
                        0x2d010a0004000000f001090007000000fc0200004c1933000000040000002d01 ,
                        0x090004000000f00103000500000009024c1933000500000001024c1933000e00 ,
                        0x0000240305007a0086007a0068007c0066007c0084007a00860007000000fc02 ,
                        0x0000993366000000040000002d01030004000000f0010900050000000902ffff ,
                        0xff00050000000102993366000e0000002403050072008600720068007a006800 ,
                        0x7a00860072008600040000002d01050004000000f001030007000000fc020000 ,
                        0x73264c000000040000002d01030005000000090273264c000500000001027326 ,
                        0x4c000e000000240305007a0068007c00660074006600720068007a0068000800 ,
                        0x0000fa0200000100000000000000040000002d01090004000000f0010a000700 ,
                        0x0000fc0200007f7f66000000040000002d010a0004000000f001030005000000 ,
                        0x09027f7f66000500000001027f7f66000e000000240305008200860082006b00 ,
                        0x84006900840084008200860007000000fc020000ffffcc000000040000002d01 ,
                        0x030004000000f0010a00050000000902ffffff00050000000102ffffcc000e00 ,
                        0x0000240305007a0086007a006b0082006b00820086007a008600040000002d01 ,
                        0x050004000000f001030007000000fc020000bfbf99000000040000002d010300 ,
                        0x050000000902bfbf9900050000000102bfbf99000e0000002403050082006b00 ,
                        0x840069007c0069007a006b0082006b0008000000fa0200000100000000000000 ,
                        0x040000002d010a0004000000f001090007000000fc020000667f7f0000000400 ,
                        0x00002d01090004000000f0010300050000000902667f7f00050000000102667f ,
                        0x7f000e000000240305008a0086008a006e008c006b008c0084008a0086000700 ,
                        0x0000fc020000ccffff000000040000002d01030004000000f001090005000000 ,
                        0x0902ffffff00050000000102ccffff000e000000240305008200860082006e00 ,
                        0x8a006e008a00860082008600040000002d01050004000000f001030007000000 ,
                        0xfc02000099bfbf000000040000002d01030005000000090299bfbf0005000000 ,
                        0x010299bfbf000e000000240305008a006e008c006b0084006b0082006e008a00 ,
                        0x6e0008000000fa0200000100000000000000040000002d01090004000000f001 ,
                        0x0a0007000000fc0200004c4c7f000000040000002d010a0004000000f0010300 ,
                        0x0500000009024c4c7f000500000001024c4c7f000e000000240305009e008600 ,
                        0x9e006200a0006000a00084009e00860007000000fc0200009999ff0000000400 ,
                        0x00002d01030004000000f0010a00050000000902ffffff000500000001029999 ,
                        0xff000e0000002403050096008600960062009e0062009e008600960086000400 ,
                        0x00002d01050004000000f001030007000000fc0200007373bf00000004000000 ,
                        0x2d0103000500000009027373bf000500000001027373bf000e00000024030500 ,
                        0x9e006200a000600098006000960062009e00620008000000fa02000001000000 ,
                        0x00000000040000002d010a0004000000f001090007000000fc0200004c193300 ,
                        0x0000040000002d01090004000000f00103000500000009024c19330005000000 ,
                        0x01024c1933000e00000024030500a5008600a5006100a8005f00a8008400a500 ,
                        0x860007000000fc020000993366000000040000002d01030004000000f0010900 ,
                        0x050000000902ffffff00050000000102993366000e000000240305009e008600 ,
                        0x9e006100a5006100a50086009e008600040000002d01050004000000f0010300 ,
                        0x07000000fc02000073264c000000040000002d01030005000000090273264c00 ,
                        0x05000000010273264c000e00000024030500a5006100a8005f00a0005f009e00 ,
                        0x6100a500610008000000fa0200000100000000000000040000002d0109000400 ,
                        0x0000f0010a0007000000fc0200007f7f66000000040000002d010a0004000000 ,
                        0xf00103000500000009027f7f66000500000001027f7f66000e00000024030500 ,
                        0xad008600ad006300b0006100b0008400ad00860007000000fc020000ffffcc00 ,
                        0x0000040000002d01030004000000f0010a00050000000902ffffff0005000000 ,
                        0x0102ffffcc000e00000024030500a5008600a5006300ad006300ad008600a500 ,
                        0x8600040000002d01050004000000f001030007000000fc020000bfbf99000000 ,
                        0x040000002d010300050000000902bfbf9900050000000102bfbf99000e000000 ,
                        0x24030500ad006300b0006100a8006100a5006300ad00630008000000fa020000 ,
                        0x0100000000000000040000002d010a0004000000f001090007000000fc020000 ,
                        0x667f7f000000040000002d01090004000000f0010300050000000902667f7f00 ,
                        0x050000000102667f7f000e00000024030500b5008600b5006400b8006200b800 ,
                        0x8400b500860007000000fc020000ccffff000000040000002d01030004000000 ,
                        0xf0010900050000000902ffffff00050000000102ccffff000e00000024030500 ,
                        0xad008600ad006400b5006400b5008600ad008600040000002d01050004000000 ,
                        0xf001030007000000fc02000099bfbf000000040000002d010300050000000902 ,
                        0x99bfbf0005000000010299bfbf000e00000024030500b5006400b8006200b000 ,
                        0x6200ad006400b5006400040000002d01050004000000f0010300040000002d01 ,
                        0x060004000000f0010a0008000000fa0200000100000000000000040000002d01 ,
                        0x030005000000140286003800050000000102ffffff0004000000020101000500 ,
                        0x0000130238003800050000001402860038000500000013028600350005000000 ,
                        0x1402770038000500000013027700350005000000140267003800050000001302 ,
                        0x6700350005000000140257003800050000001302570035000500000014024700 ,
                        0x3800050000001302470035000500000014023800380005000000130238003500 ,
                        0x0500000009020000000009000000320a7f002d0001000000300006000a000000 ,
                        0x320a70002700020000003230060006000a000000320a60002700020000003430 ,
                        0x060006000a000000320a50002700020000003630060006000a000000320a4000 ,
                        0x2700020000003830060006000c000000320a3100210003000000313030000600 ,
                        0x06000600050000001402860038000500000013028600bb000500000014028600 ,
                        0x3800050000001302890038000500000014028600640005000000130289006400 ,
                        0x05000000140286009000050000001302890090000c000000320a8c0048000300 ,
                        0x0000457374000500040004000f000000320a8c006d00050000004f7565737400 ,
                        0x070006000600040004000d000000320a8c009a00040000004e6f726407000600 ,
                        0x04000600040000002d010600040000002d010100040000002701ffff03000000 ,
                        0x1e00040000002d010200040000002d010300050000000102ffffff0005000000 ,
                        0x090200000000040000002c010000070000001604ae001e010000000004000000 ,
                        0x2d010000040000002d010100040000002d010000040000002d01060004000000 ,
                        0x2d010100040000002701ffff030000001e00040000002d010000040000002d01 ,
                        0x0300050000000102ffffff0005000000090200000000040000002c0100000700 ,
                        0x000016042000b00007006f000400000004010d00040000000201010015000000 ,
                        0x320a0c00720009000000437573746f6d65727300070007000500050007000b00 ,
                        0x070005000500040000002d010100040000002d010000040000002d0106000400 ,
                        0x00002d010100040000002701ffff030000001e00040000002d01000004000000 ,
                        0x2d010300050000000102ffffff0005000000090200000000040000002c010000 ,
                        0x070000001604ae001e0100000000040000002d010600040000002d0101000400 ,
                        0x00002701ffff030000001e00040000002d010000040000002d01030005000000 ,
                        0x0102ffffff0005000000090200000000040000002c010000070000001604ae00 ,
                        0x1e0100000000040000002d010200040000002d010800050000000902ffffff00 ,
                        0x0400000004010d000400000002010200070000001b048b0015014200d9000400 ,
                        0x00002d010600040000002d010700040000002d010100040000002701ffff0300 ,
                        0x00001e00040000002d010200040000002d010800040000002d01030005000000 ,
                        0x0102ffffff00050000000902ffffff00040000002c0100000700000016048a00 ,
                        0x15014200d900040000002d010600040000002d010700040000002d0101000400 ,
                        0x00002701ffff030000001e00040000002d010200040000002d01080004000000 ,
                        0x2d010300050000000102ffffff00050000000902ffffff00040000002c010000 ,
                        0x0700000016048a0015014200d90008000000fa02000001000000000000000400 ,
                        0x00002d01090004000000f001030007000000fc0200009999ff00000004000000 ,
                        0x2d0103000500000001029999ff000400000004010d0004000000020102000700 ,
                        0x00001b044e00e2004800dc0005000000090200000000050000000102ffffff00 ,
                        0x0400000002010100040000002e01180016000000320a4e00e5000a0000003165 ,
                        0x7220207472696d2e060006000400020002000400040003000900030004000000 ,
                        0x2e010000040000002d010600040000002d010700040000002d01010004000000 ,
                        0x2701ffff030000001e00040000002d010200040000002d010300040000002d01 ,
                        0x0900050000000102ffffff0005000000090200000000040000002c0100000700 ,
                        0x000016048a0015014200d900040000002d010600040000002d01070004000000 ,
                        0x2d010100040000002701ffff030000001e00040000002d010200040000002d01 ,
                        0x0300040000002d010900050000000102ffffff00050000000902000000000400 ,
                        0x00002c0100000700000016048a0015014200d90008000000fa02000001000000 ,
                        0x00000000040000002d010a0004000000f001090007000000fc02000099336600 ,
                        0x0000040000002d01090004000000f0010300050000000902ffffff0005000000 ,
                        0x0102993366000400000004010d000400000002010200070000001b046000e200 ,
                        0x5a00dc0005000000090200000000050000000102ffffff000400000002010100 ,
                        0x040000002e01180015000000320a6000e50009000000326520207472696d2e00 ,
                        0x060006000200020004000400030009000300040000002e010000040000002d01 ,
                        0x0600040000002d010700040000002d010100040000002701ffff030000001e00 ,
                        0x040000002d010200040000002d010900040000002d010a00050000000102ffff ,
                        0xff0005000000090200000000040000002c0100000700000016048a0015014200 ,
                        0xd900040000002d010600040000002d010700040000002d010100040000002701 ,
                        0xffff030000001e00040000002d010200040000002d010900040000002d010a00 ,
                        0x050000000102ffffff0005000000090200000000040000002c01000007000000 ,
                        0x16048a0015014200d90008000000fa0200000100000000000000040000002d01 ,
                        0x030004000000f0010a0007000000fc020000ffffcc000000040000002d010a00 ,
                        0x04000000f0010900050000000902ffffff00050000000102ffffcc0004000000 ,
                        0x04010d000400000002010200070000001b047200e2006c00dc00050000000902 ,
                        0x00000000050000000102ffffff000400000002010100040000002e0118001500 ,
                        0x0000320a7200e50009000000336520207472696d2e0006000600020002000400 ,
                        0x0400030009000300040000002e010000040000002d010600040000002d010700 ,
                        0x040000002d010100040000002701ffff030000001e00040000002d0102000400 ,
                        0x00002d010a00040000002d010300050000000102ffffff000500000009020000 ,
                        0x0000040000002c0100000700000016048a0015014200d900040000002d010600 ,
                        0x040000002d010700040000002d010100040000002701ffff030000001e000400 ,
                        0x00002d010200040000002d010a00040000002d010300050000000102ffffff00 ,
                        0x05000000090200000000040000002c0100000700000016048a0015014200d900 ,
                        0x08000000fa0200000100000000000000040000002d01090004000000f0010300 ,
                        0x07000000fc020000ccffff000000040000002d01030004000000f0010a000500 ,
                        0x00000902ffffff00050000000102ccffff000400000004010d00040000000201 ,
                        0x0200070000001b048400e2007e00dc0005000000090200000000050000000102 ,
                        0xffffff000400000002010100040000002e01180015000000320a8400e5000900 ,
                        0x0000346520207472696d2e000600060002000200040004000300090003000400 ,
                        0x00002e010000040000002d010600040000002d010700040000002d0101000400 ,
                        0x00002701ffff030000001e00040000002d010200040000002d01030004000000 ,
                        0x2d010900050000000102ffffff0005000000090200000000040000002c010000 ,
                        0x0700000016048a0015014200d900040000002d010600040000002d0107000400 ,
                        0x00002d010100040000002701ffff030000001e00040000002d01020004000000 ,
                        0x2d010300040000002d010900050000000102ffffff0005000000090200000000 ,
                        0x040000002c010000070000001604ae001e0100000000040000002d0105000400 ,
                        0x0000f0010300040000002d01060004000000f0010900040000002d0101000400 ,
                        0x00002701ffff030000001e00050000000102ffffff0005000000090200000000 ,
                        0x040000002701ffff030000001e00050000000102ffffff000500000009020000 ,
                        0x0000040000002701ffff0300000000004e414e49000000000000000000000000 ,
                        0x000000000d1016000000090133006500200020007400720069006d002e005110 ,
                        0x0800010102000000030051100800020102000000000051100800030102000000 ,
                        0x000006100800ffff020002000000331000005f10020000003410000045100200 ,
                        0x00003410000003100c0003000100030003000100000033100000511008000001 ,
                        0x0200000004000d1016000000090134006500200020007400720069006d002e00 ,
                        0x5110080001010200000004005110080002010200000000005110080003010200 ,
                        0x0000000006100800ffff030003000000331000005f1002000000341000004510 ,
                        0x0200000034100000441004000900000024100200020025102000020201000000 ,
                        0x0000bbffffff8cffffff0000000000000000b1004d00c0010000331000004f10 ,
                        0x1400020002000000000000000000000000000000000026100200060051100800 ,
                        0x000102000000000034100000241002000300251020000202010000000000bbff ,
                        0xffff8cffffff0000000000000000b1004d00c0010000331000004f1014000200 ,
                        0x0200000000000000000000000000000000002610020005005110080000010200 ,
                        0x00000000341000004610020001004110120000008a000000b4030000f60b0000 ,
                        0x050b0000331000004f101400020002008a000000b4030000f60b0000050b0000 ,
                        0x1d10120000000000000000000000000000000000000033100000201008000100 ,
                        0x0100010001006210120000000000010000000100000000000000ef001e101e00 ,
                        0x02000101000000000000000000000000000000000000000023004d0000002110 ,
                        0x0200030007100c008080800000000000000017000a101000c0c0c00000000000 ,
                        0x0100000016004f00341000001d10120001000000000000000000000000000000 ,
                        0x0000331000001f102a0000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000001f011e101e000200030100000000 ,
                        0x0000000000000000000000000000000023004d00000021100200010007100c00 ,
                        0x000000000000000009004d0021100200030007100c0000000000000000000900 ,
                        0x4d000a101000ffffff0000000000010001004e004d0034100000141014000000 ,
                        0x0000000000000000000000000000000000003310000017100600000096000000 ,
                        0x22100a0000000000000000000f003a100e0014000f001e006400640000001600 ,
                        0x15101400180d00004f08000051020000ce01000003011f00331000004f101400 ,
                        0x05000200180d00004f0800000000000000000000251020000202010000000000 ,
                        0xbbffffff8cffffff0000000000000000b1004d00c0010000331000004f101400 ,
                        0x0200020000000000000000000000000000000000511008000001020000000000 ,
                        0x3410000032100400000003003310000007100c00000000000000000009004d00 ,
                        0x0a101000ffffff0000000000000000004e004d00341000003410000034100000 ,
                        0x3410000025102000020201000000000024060000450000006503000059020000 ,
                        0x81004d0000000000331000004f10140002000200000000000000000042000000 ,
                        0x180000002610020003005110080000010200000000000d101600000009014300 ,
                        0x7500730074006f006d0065007200730027100600010000000000341000003410 ,
                        0x000000020e00000000001d0000000000010000000a0000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000015046f0015015d00ed000e000000240305004700780047003800 ,
                        0x4700380047007800470078000e000000240305004700780047003800bf003800 ,
                        0xbf00780047007800040000002d010600040000002d010700040000002d010100 ,
                        0x040000002701ffff030000001e00040000002d010200040000002d0108000400 ,
                        0x00002d010500050000000102ffffff00050000000902ffffff00040000002c01 ,
                        0x0000070000001604aa001a010400040008000000fa0200000100000000000000 ,
                        0x040000002d01030004000000f001050007000000fc0200004c4c7f0000000400 ,
                        0x00002d0105000500000009024c4c7f000500000001024c4c7f00040000000401 ,
                        0x0d0004000000020102000e000000240305004a0078004a0038004a0038004a00 ,
                        0x78004a00780007000000fc0200009999ff000000040000002d01090004000000 ,
                        0xf0010500050000000902ffffff000500000001029999ff000e00000024030500 ,
                        0x48007800480038004a0038004a0078004800780007000000fc02000000000000 ,
                        0x0000040000002d01050004000000f001090007000000fc0200007373bf000000 ,
                        0x040000002d0109000500000009027373bf000500000001027373bf000e000000 ,
                        0x240305004a0038004a00380049003800480038004a00380008000000fa020000 ,
                        0x0100000000000000040000002d010a0004000000f001030007000000fc020000 ,
                        0x4c4c7f000000040000002d01030004000000f00109000500000009024c4c7f00 ,
                        0x0500000001024c4c7f000e000000240305004e0078004e0038004f0038004f00 ,
                        0x78004e00780007000000fc0200009999ff000000040000002d01090004000000 ,
                        0xf0010300050000000902ffffff000500000001029999ff000e00000024030500 ,
                        0x4c0078004c0038004e0038004e0078004c007800040000002d01050004000000 ,
                        0xf001090007000000fc0200007373bf000000040000002d010300050000000902 ,
                        0x7373bf000500000001027373bf000e000000240305004e0038004f0038004d00 ,
                        0x38004c0038004e00380008000000fa0200000100000000000000040000002d01 ,
                        0x090004000000f0010a0007000000fc0200004c4c7f000000040000002d010a00 ,
                        0x04000000f00103000500000009024c4c7f000500000001024c4c7f000e000000 ,
                        0x24030500520078005200380053003800530078005200780007000000fc020000 ,
                        0x9999ff000000040000002d01030004000000f0010a00050000000902ffffff00 ,
                        0x0500000001029999ff000e000000240305005000780050003800520038005200 ,
                        0x780050007800040000002d01050004000000f001030007000000fc0200007373 ,
                        0xbf000000040000002d0103000500000009027373bf000500000001027373bf00 ,
                        0x0e00000024030500520038005300380051003800500038005200380008000000 ,
                        0xfa0200000100000000000000040000002d010a0004000000f001090007000000 ,
                        0xfc0200004c4c7f000000040000002d01090004000000f0010300050000000902 ,
                        0x4c4c7f000500000001024c4c7f000e0000002403050056007800560038005700 ,
                        0x3800570078005600780007000000fc0200009999ff000000040000002d010300 ,
                        0x04000000f0010900050000000902ffffff000500000001029999ff000e000000 ,
                        0x240305005500780055003800560038005600780055007800040000002d010500 ,
                        0x04000000f001030007000000fc0200007373bf000000040000002d0103000500 ,
                        0x000009027373bf000500000001027373bf000e00000024030500560038005700 ,
                        0x380055003800550038005600380008000000fa02000001000000000000000400 ,
                        0x00002d01090004000000f0010a0007000000fc0200004c4c7f00000004000000 ,
                        0x2d010a0004000000f00103000500000009024c4c7f000500000001024c4c7f00 ,
                        0x0e000000240305005a0078005a0038005b0038005b0078005a00780007000000 ,
                        0xfc0200009999ff000000040000002d01030004000000f0010a00050000000902 ,
                        0xffffff000500000001029999ff000e0000002403050059007800590038005a00 ,
                        0x38005a00780059007800040000002d01050004000000f001030007000000fc02 ,
                        0x00007373bf000000040000002d0103000500000009027373bf00050000000102 ,
                        0x7373bf000e000000240305005a0038005b00380059003800590038005a003800 ,
                        0x08000000fa0200000100000000000000040000002d010a0004000000f0010900 ,
                        0x07000000fc0200004c4c7f000000040000002d01090004000000f00103000500 ,
                        0x000009024c4c7f000500000001024c4c7f000e000000240305005e0078005e00 ,
                        0x38005f0038005f0078005e00780007000000fc0200009999ff00000004000000 ,
                        0x2d01030004000000f0010900050000000902ffffff000500000001029999ff00 ,
                        0x0e000000240305005d0078005d0038005e0038005e0078005d00780004000000 ,
                        0x2d01050004000000f001030007000000fc0200007373bf000000040000002d01 ,
                        0x03000500000009027373bf000500000001027373bf000e000000240305005e00 ,
                        0x38005f0038005d0038005d0038005e00380008000000fa020000010000000000 ,
                        0x0000040000002d01090004000000f0010a0007000000fc0200004c4c7f000000 ,
                        0x040000002d010a0004000000f00103000500000009024c4c7f00050000000102 ,
                        0x4c4c7f000e000000240305006300780063003800630038006300780063007800 ,
                        0x07000000fc0200009999ff000000040000002d01030004000000f0010a000500 ,
                        0x00000902ffffff000500000001029999ff000e00000024030500610078006100 ,
                        0x3800630038006300780061007800040000002d01050004000000f00103000700 ,
                        0x0000fc0200007373bf000000040000002d0103000500000009027373bf000500 ,
                        0x000001027373bf000e0000002403050063003800630038006100380061003800 ,
                        0x6300380008000000fa0200000100000000000000040000002d010a0004000000 ,
                        0xf001090007000000fc0200004c4c7f000000040000002d01090004000000f001 ,
                        0x03000500000009024c4c7f000500000001024c4c7f000e000000240305006700 ,
                        0x78006700380067003800670078006700780007000000fc0200009999ff000000 ,
                        0x040000002d01030004000000f0010900050000000902ffffff00050000000102 ,
                        0x9999ff000e000000240305006500780065003800670038006700780065007800 ,
                        0x040000002d01050004000000f001030007000000fc0200007373bf0000000400 ,
                        0x00002d0103000500000009027373bf000500000001027373bf000e0000002403 ,
                        0x0500670038006700380066003800650038006700380008000000fa0200000100 ,
                        0x000000000000040000002d01090004000000f0010a0007000000fc0200004c4c ,
                        0x7f000000040000002d010a0004000000f00103000500000009024c4c7f000500 ,
                        0x000001024c4c7f000e000000240305006b0078006b0038006b0038006b007800 ,
                        0x6b00780007000000fc0200009999ff000000040000002d01030004000000f001 ,
                        0x0a00050000000902ffffff000500000001029999ff000e000000240305006900 ,
                        0x7800690038006b0038006b00780069007800040000002d01050004000000f001 ,
                        0x030007000000fc0200007373bf000000040000002d0103000500000009027373 ,
                        0xbf000500000001027373bf000e000000240305006b0038006b0038006a003800 ,
                        0x690038006b00380008000000fa0200000100000000000000040000002d010a00 ,
                        0x04000000f001090007000000fc0200004c4c7f000000040000002d0109000400 ,
                        0x0000f00103000500000009024c4c7f000500000001024c4c7f000e0000002403 ,
                        0x05006f0078006f0038006f0038006f0078006f00780007000000fc0200009999 ,
                        0xff000000040000002d01030004000000f0010900050000000902ffffff000500 ,
                        0x000001029999ff000e000000240305006d0078006d0038006f0038006f007800 ,
                        0x6d007800040000002d01050004000000f001030007000000fc0200007373bf00 ,
                        0x0000040000002d0103000500000009027373bf000500000001027373bf000e00 ,
                        0x0000240305006f0038006f0038006e0038006d0038006f00380008000000fa02 ,
                        0x00000100000000000000040000002d01090004000000f0010a0007000000fc02 ,
                        0x00004c4c7f000000040000002d010a0004000000f00103000500000009024c4c ,
                        0x7f000500000001024c4c7f000e00000024030500730078007300380074003800 ,
                        0x740078007300780007000000fc0200009999ff000000040000002d0103000400 ,
                        0x0000f0010a00050000000902ffffff000500000001029999ff000e0000002403 ,
                        0x05007100780071003800730038007300780071007800040000002d0105000400 ,
                        0x0000f001030007000000fc0200007373bf000000040000002d01030005000000 ,
                        0x09027373bf000500000001027373bf000e000000240305007300380074003800 ,
                        0x72003800710038007300380008000000fa020000010000000000000004000000 ,
                        0x2d010a0004000000f001090007000000fc0200004c4c7f000000040000002d01 ,
                        0x090004000000f00103000500000009024c4c7f000500000001024c4c7f000e00 ,
                        0x000024030500770078007700380078003800780078007700780007000000fc02 ,
                        0x00009999ff000000040000002d01030004000000f0010900050000000902ffff ,
                        0xff000500000001029999ff000e00000024030500760078007600380077003800 ,
                        0x7700780076007800040000002d01050004000000f001030007000000fc020000 ,
                        0x7373bf000000040000002d0103000500000009027373bf000500000001027373 ,
                        0xbf000e0000002403050077003800780038007600380076003800770038000800 ,
                        0x0000fa0200000100000000000000040000002d01090004000000f0010a000700 ,
                        0x0000fc0200004c4c7f000000040000002d010a0004000000f001030005000000 ,
                        0x09024c4c7f000500000001024c4c7f000e000000240305007b0078007b003800 ,
                        0x7c0038007c0078007b00780007000000fc0200009999ff000000040000002d01 ,
                        0x030004000000f0010a00050000000902ffffff000500000001029999ff000e00 ,
                        0x0000240305007a0078007a0038007b0038007b0078007a007800040000002d01 ,
                        0x050004000000f001030007000000fc0200007373bf000000040000002d010300 ,
                        0x0500000009027373bf000500000001027373bf000e000000240305007b003800 ,
                        0x7c0038007a0038007a0038007b00380008000000fa0200000100000000000000 ,
                        0x040000002d010a0004000000f001090007000000fc0200004c4c7f0000000400 ,
                        0x00002d01090004000000f00103000500000009024c4c7f000500000001024c4c ,
                        0x7f000e000000240305007f0078007f00380080003800800078007f0078000700 ,
                        0x0000fc0200009999ff000000040000002d01030004000000f001090005000000 ,
                        0x0902ffffff000500000001029999ff000e000000240305007e0078007e003800 ,
                        0x7f0038007f0078007e007800040000002d01050004000000f001030007000000 ,
                        0xfc0200007373bf000000040000002d0103000500000009027373bf0005000000 ,
                        0x01027373bf000e000000240305007f003800800038007e0038007e0038007f00 ,
                        0x380008000000fa0200000100000000000000040000002d01090004000000f001 ,
                        0x0a0007000000fc0200004c4c7f000000040000002d010a0004000000f0010300 ,
                        0x0500000009024c4c7f000500000001024c4c7f000e0000002403050084007800 ,
                        0x8400380084003800840078008400780007000000fc0200009999ff0000000400 ,
                        0x00002d01030004000000f0010a00050000000902ffffff000500000001029999 ,
                        0xff000e0000002403050082007800820038008400380084007800820078000400 ,
                        0x00002d01050004000000f001030007000000fc0200007373bf00000004000000 ,
                        0x2d0103000500000009027373bf000500000001027373bf000e00000024030500 ,
                        0x840038008400380082003800820038008400380008000000fa02000001000000 ,
                        0x00000000040000002d010a0004000000f001090007000000fc0200004c4c7f00 ,
                        0x0000040000002d01090004000000f00103000500000009024c4c7f0005000000 ,
                        0x01024c4c7f000e00000024030500880078008800380088003800880078008800 ,
                        0x780007000000fc0200009999ff000000040000002d01030004000000f0010900 ,
                        0x050000000902ffffff000500000001029999ff000e0000002403050086007800 ,
                        0x86003800880038008800780086007800040000002d01050004000000f0010300 ,
                        0x07000000fc0200007373bf000000040000002d0103000500000009027373bf00 ,
                        0x0500000001027373bf000e000000240305008800380088003800870038008600 ,
                        0x38008800380008000000fa0200000100000000000000040000002d0109000400 ,
                        0x0000f0010a0007000000fc0200004c4c7f000000040000002d010a0004000000 ,
                        0xf00103000500000009024c4c7f000500000001024c4c7f000e00000024030500 ,
                        0x8c0078008c0038008c0038008c0078008c00780007000000fc0200009999ff00 ,
                        0x0000040000002d01030004000000f0010a00050000000902ffffff0005000000 ,
                        0x01029999ff000e000000240305008a0078008a0038008c0038008c0078008a00 ,
                        0x7800040000002d01050004000000f001030007000000fc0200007373bf000000 ,
                        0x040000002d0103000500000009027373bf000500000001027373bf000e000000 ,
                        0x240305008c0038008c0038008b0038008a0038008c00380008000000fa020000 ,
                        0x0100000000000000040000002d010a0004000000f001090007000000fc020000 ,
                        0x4c4c7f000000040000002d01090004000000f00103000500000009024c4c7f00 ,
                        0x0500000001024c4c7f000e000000240305009000780090003800900038009000 ,
                        0x78009000780007000000fc0200009999ff000000040000002d01030004000000 ,
                        0xf0010900050000000902ffffff000500000001029999ff000e00000024030500 ,
                        0x8e0078008e00380090003800900078008e007800040000002d01050004000000 ,
                        0xf001030007000000fc0200007373bf000000040000002d010300050000000902 ,
                        0x7373bf000500000001027373bf000e0000002403050090003800900038008f00 ,
                        0x38008e0038009000380008000000fa0200000100000000000000040000002d01 ,
                        0x090004000000f0010a0007000000fc0200004c4c7f000000040000002d010a00 ,
                        0x04000000f00103000500000009024c4c7f000500000001024c4c7f000e000000 ,
                        0x24030500940078009400380095003800950078009400780007000000fc020000 ,
                        0x9999ff000000040000002d01030004000000f0010a00050000000902ffffff00 ,
                        0x0500000001029999ff000e000000240305009200780092003800940038009400 ,
                        0x780092007800040000002d01050004000000f001030007000000fc0200007373 ,
                        0xbf000000040000002d0103000500000009027373bf000500000001027373bf00 ,
                        0x0e00000024030500940038009500380093003800920038009400380008000000 ,
                        0xfa0200000100000000000000040000002d010a0004000000f001090007000000 ,
                        0xfc0200004c4c7f000000040000002d01090004000000f0010300050000000902 ,
                        0x4c4c7f000500000001024c4c7f000e0000002403050098007800980038009900 ,
                        0x3800990078009800780007000000fc0200009999ff000000040000002d010300 ,
                        0x04000000f0010900050000000902ffffff000500000001029999ff000e000000 ,
                        0x240305009700780097003800980038009800780097007800040000002d010500 ,
                        0x04000000f001030007000000fc0200007373bf000000040000002d0103000500 ,
                        0x000009027373bf000500000001027373bf000e00000024030500980038009900 ,
                        0x380097003800970038009800380008000000fa02000001000000000000000400 ,
                        0x00002d01090004000000f0010a0007000000fc0200004c4c7f00000004000000 ,
                        0x2d010a0004000000f00103000500000009024c4c7f000500000001024c4c7f00 ,
                        0x0e000000240305009c0078009c0038009d0038009d0078009c00780007000000 ,
                        0xfc0200009999ff000000040000002d01030004000000f0010a00050000000902 ,
                        0xffffff000500000001029999ff000e000000240305009b0078009b0038009c00 ,
                        0x38009c0078009b007800040000002d01050004000000f001030007000000fc02 ,
                        0x00007373bf000000040000002d0103000500000009027373bf00050000000102 ,
                        0x7373bf000e000000240305009c0038009d0038009b0038009b0038009c003800 ,
                        0x08000000fa0200000100000000000000040000002d010a0004000000f0010900 ,
                        0x07000000fc0200004c4c7f000000040000002d01090004000000f00103000500 ,
                        0x000009024c4c7f000500000001024c4c7f000e00000024030500a0007800a000 ,
                        0x3800a1003800a1007800a000780007000000fc0200009999ff00000004000000 ,
                        0x2d01030004000000f0010900050000000902ffffff000500000001029999ff00 ,
                        0x0e000000240305009f0078009f003800a0003800a00078009f00780004000000 ,
                        0x2d01050004000000f001030007000000fc0200007373bf000000040000002d01 ,
                        0x03000500000009027373bf000500000001027373bf000e00000024030500a000 ,
                        0x3800a10038009f0038009f003800a000380008000000fa020000010000000000 ,
                        0x0000040000002d01090004000000f0010a0007000000fc0200004c4c7f000000 ,
                        0x040000002d010a0004000000f00103000500000009024c4c7f00050000000102 ,
                        0x4c4c7f000e00000024030500a5007800a5003800a5003800a5007800a5007800 ,
                        0x07000000fc0200009999ff000000040000002d01030004000000f0010a000500 ,
                        0x00000902ffffff000500000001029999ff000e00000024030500a3007800a300 ,
                        0x3800a5003800a5007800a3007800040000002d01050004000000f00103000700 ,
                        0x0000fc0200007373bf000000040000002d0103000500000009027373bf000500 ,
                        0x000001027373bf000e00000024030500a5003800a5003800a3003800a3003800 ,
                        0xa500380008000000fa0200000100000000000000040000002d010a0004000000 ,
                        0xf001090007000000fc0200004c4c7f000000040000002d01090004000000f001 ,
                        0x03000500000009024c4c7f000500000001024c4c7f000e00000024030500a900 ,
                        0x7800a9003800a9003800a9007800a900780007000000fc0200009999ff000000 ,
                        0x040000002d01030004000000f0010900050000000902ffffff00050000000102 ,
                        0x9999ff000e00000024030500a7007800a7003800a9003800a9007800a7007800 ,
                        0x040000002d01050004000000f001030007000000fc0200007373bf0000000400 ,
                        0x00002d0103000500000009027373bf000500000001027373bf000e0000002403 ,
                        0x0500a9003800a9003800a8003800a7003800a900380008000000fa0200000100 ,
                        0x000000000000040000002d01090004000000f0010a0007000000fc0200004c4c ,
                        0x7f000000040000002d010a0004000000f00103000500000009024c4c7f000500 ,
                        0x000001024c4c7f000e00000024030500ad007800ad003800ad003800ad007800 ,
                        0xad00780007000000fc0200009999ff000000040000002d01030004000000f001 ,
                        0x0a00050000000902ffffff000500000001029999ff000e00000024030500ab00 ,
                        0x7800ab003800ad003800ad007800ab007800040000002d01050004000000f001 ,
                        0x030007000000fc0200007373bf000000040000002d0103000500000009027373 ,
                        0xbf000500000001027373bf000e00000024030500ad003800ad003800ac003800 ,
                        0xab003800ad00380008000000fa0200000100000000000000040000002d010a00 ,
                        0x04000000f001090007000000fc0200004c4c7f000000040000002d0109000400 ,
                        0x0000f00103000500000009024c4c7f000500000001024c4c7f000e0000002403 ,
                        0x0500b1007800b1003800b1003800b1007800b100780007000000fc0200009999 ,
                        0xff000000040000002d01030004000000f0010900050000000902ffffff000500 ,
                        0x000001029999ff000e00000024030500af007800af003800b1003800b1007800 ,
                        0xaf007800040000002d01050004000000f001030007000000fc0200007373bf00 ,
                        0x0000040000002d0103000500000009027373bf000500000001027373bf000e00 ,
                        0x000024030500b1003800b1003800b0003800af003800b100380008000000fa02 ,
                        0x00000100000000000000040000002d01090004000000f0010a0007000000fc02 ,
                        0x00004c4c7f000000040000002d010a0004000000f00103000500000009024c4c ,
                        0x7f000500000001024c4c7f000e00000024030500b5007800b5003800b6003800 ,
                        0xb6007800b500780007000000fc0200009999ff000000040000002d0103000400 ,
                        0x0000f0010a00050000000902ffffff000500000001029999ff000e0000002403 ,
                        0x0500b3007800b3003800b5003800b5007800b3007800040000002d0105000400 ,
                        0x0000f001030007000000fc0200007373bf000000040000002d01030005000000 ,
                        0x09027373bf000500000001027373bf000e00000024030500b5003800b6003800 ,
                        0xb4003800b3003800b500380008000000fa020000010000000000000004000000 ,
                        0x2d010a0004000000f001090007000000fc0200004c4c7f000000040000002d01 ,
                        0x090004000000f00103000500000009024c4c7f000500000001024c4c7f000e00 ,
                        0x000024030500b9007800b9003800ba003800ba007800b900780007000000fc02 ,
                        0x00009999ff000000040000002d01030004000000f0010900050000000902ffff ,
                        0xff000500000001029999ff000e00000024030500b8007800b8003800b9003800 ,
                        0xb9007800b8007800040000002d01050004000000f001030007000000fc020000 ,
                        0x7373bf000000040000002d0103000500000009027373bf000500000001027373 ,
                        0xbf000e00000024030500b9003800ba003800b8003800b8003800b90038000800 ,
                        0x0000fa0200000100000000000000040000002d01090004000000f0010a000700 ,
                        0x0000fc0200004c4c7f000000040000002d010a0004000000f001030005000000 ,
                        0x09024c4c7f000500000001024c4c7f000e00000024030500bd007800bd003800 ,
                        0xbe003800be007800bd00780007000000fc0200009999ff000000040000002d01 ,
                        0x030004000000f0010a00050000000902ffffff000500000001029999ff000e00 ,
                        0x000024030500bc007800bc003800bd003800bd007800bc007800040000002d01 ,
                        0x050004000000f001030007000000fc0200007373bf000000040000002d010300 ,
                        0x0500000009027373bf000500000001027373bf000e00000024030500bd003800 ,
                        0xbe003800bc003800bc003800bd003800040000002d01050004000000f0010300 ,
                        0x040000002d01060004000000f001090008000000fa0200000100000000000000 ,
                        0x040000002d01030005000000140278004700050000000102ffffff0004000000 ,
                        0x0201010005000000130238004700050000001402780047000500000013027800 ,
                        0x44000500000014026c0047000500000013026c0044000500000014025f004700 ,
                        0x0500000013025f00440005000000140252004700050000001302520044000500 ,
                        0x0000140245004700050000001302450044000500000014023800470005000000 ,
                        0x1302380044000500000009020000000009000000320a71003c00010000003000 ,
                        0x06000c000000320a6500330003000000302c32000600030006000c000000320a ,
                        0x5800330003000000302c34000600030006000c000000320a4b00330003000000 ,
                        0x302c36000600030006000c000000320a3e00330003000000302c380006000300 ,
                        0x060009000000320a31003c000100000031000600050000001402780047000500 ,
                        0x000013027800bf00050000001402780047000500000013027b00470005000000 ,
                        0x140278004b000500000013027b004b0005000000140278004f00050000001302 ,
                        0x7b004f00050000001402780053000500000013027b0053000500000014027800 ,
                        0x57000500000013027b00570005000000140278005c000500000013027b005c00 ,
                        0x050000001402780060000500000013027b006000050000001402780064000500 ,
                        0x000013027b006400050000001402780068000500000013027b00680005000000 ,
                        0x140278006c000500000013027b006c0005000000140278007000050000001302 ,
                        0x7b007000050000001402780074000500000013027b0074000500000014027800 ,
                        0x78000500000013027b00780005000000140278007d000500000013027b007d00 ,
                        0x050000001402780081000500000013027b008100050000001402780085000500 ,
                        0x000013027b008500050000001402780089000500000013027b00890005000000 ,
                        0x140278008d000500000013027b008d0005000000140278009100050000001302 ,
                        0x7b009100050000001402780095000500000013027b0095000500000014027800 ,
                        0x99000500000013027b00990005000000140278009e000500000013027b009e00 ,
                        0x0500000014027800a2000500000013027b00a2000500000014027800a6000500 ,
                        0x000013027b00a6000500000014027800aa000500000013027b00aa0005000000 ,
                        0x14027800ae000500000013027b00ae000500000014027800b200050000001302 ,
                        0x7b00b2000500000014027800b6000500000013027b00b6000500000014027800 ,
                        0xba000500000013027b00ba0012000000320a7e00340007000000436f6d70616e ,
                        0x7900060006000900060005000600050009000000320a8c004600010000004100 ,
                        0x070012000000320a7e00650007000000436f6d70616e79000600060009000600 ,
                        0x05000600050009000000320a8c007900010000004a00040012000000320a7e00 ,
                        0x970007000000436f6d70616e7900060006000900060005000600050009000000 ,
                        0x320a8c00a9000100000056000700040000002d010600040000002d0101000400 ,
                        0x00002701ffff030000001e00040000002d010200040000002d01030005000000 ,
                        0x0102ffffff0005000000090200000000040000002c010000070000001604ae00 ,
                        0x1e0100000000040000002d010000040000002d010100040000002d0100000400 ,
                        0x00002d010600040000002d010100040000002701ffff030000001e0004000000 ,
                        0x2d010000040000002d010300050000000102ffffff0005000000090200000000 ,
                        0x040000002c0100000700000016042000b00007006f000400000004010d000400 ,
                        0x00000201010015000000320a0c00720009000000437573746f6d657273000700 ,
                        0x07000500050007000b00070005000500040000002d010100040000002d010000 ,
                        0x040000002d010600040000002d010100040000002701ffff030000001e000400 ,
                        0x00002d010000040000002d010300050000000102ffffff000500000009020000 ,
                        0x0000040000002c010000070000001604ae001e0100000000040000002d010600 ,
                        0x040000002d010100040000002701ffff030000001e00040000002d0100000400 ,
                        0x00002d010300050000000102ffffff0005000000090200000000040000002c01 ,
                        0x0000070000001604ae001e0100000000040000002d010200040000002d010800 ,
                        0x050000000902ffffff000400000004010d000400000002010200070000001b04 ,
                        0x700015015d00ed00040000002d010600040000002d010700040000002d010100 ,
                        0x040000002701ffff030000001e00040000002d010200040000002d0108000400 ,
                        0x00002d010300050000000102ffffff00050000000902ffffff00040000002c01 ,
                        0x00000700000016046f0015015d00ed00040000002d010600040000002d010700 ,
                        0x040000002d010100040000002701ffff030000001e00040000002d0102000400 ,
                        0x00002d010800040000002d010300050000000102ffffff00050000000902ffff ,
                        0xff00040000002c0100000700000016046f0015015d00ed0008000000fa020000 ,
                        0x0100000000000000040000002d01090004000000f001030007000000fc020000 ,
                        0x9999ff000000040000002d0103000500000001029999ff000400000004010d00 ,
                        0x0400000002010200070000001b046900f6006300f00005000000090200000000 ,
                        0x050000000102ffffff000400000002010100040000002e0118000f000000320a ,
                        0x6900f90005000000546f74616c0005000600040005000300040000002e010000 ,
                        0x040000002d010600040000002d010700040000002d010100040000002701ffff ,
                        0x030000001e00040000002d010200040000002d010300040000002d0109000500 ,
                        0x00000102ffffff0005000000090200000000040000002c010000070000001604 ,
                        0x6f0015015d00ed00040000002d010600040000002d010700040000002d010100 ,
                        0x040000002701ffff030000001e00040000002d010200040000002d0103000400 ,
                        0x00002d010900050000000102ffffff0005000000090200000000040000002c01 ,
                        0x0000070000001604ae001e0100000000040000002d01050004000000f0010300 ,
                        0x040000002d01060004000000f0010900040000002d010100040000002701ffff ,
                        0x030000001e00050000000102ffffff0005000000090200000000040000002701 ,
                        0xffff030000001e00050000000102ffffff000500000009020000000004000000 ,
                        0x2701ffff0300000000004e414e49000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000ffffffff0e0000000400000001000000ffffffff0000000000000000 ,
                        0x8f1d0000fc110000be7a00000100090000035f3d00000b001610000000001610 ,
                        0x000026060f002220574d46430100000000000100a9fe00000000030000000020 ,
                        0x0000102c0000104c0000010000006c000000330000000c000000140100009800 ,
                        0x00000000000000000000511e00007112000020454d4600000100104c0000d603 ,
                        0x0000060000000000000000000000000000008007000038040000090200002501 ,
                        0x000000000000000000000000000028f3070088780400460000002c0000002000 ,
                        0x0000454d462b014001001c000000100000000210c0db01000000600000006000 ,
                        0x0000460000005c00000050000000454d462b224004000c000000000000001e40 ,
                        0x09000c00000000000000244001000c0000000000000030400200100000000400 ,
                        0x00000000803f214007000c00000000000000044000000c000000000000001800 ,
                        0x00000c00000000000000190000000c000000ffffff00140000000c0000000d00 ,
                        0x0000120000000c000000020000002100000008000000220000000c000000ffff ,
                        0xffff2100000008000000220000000c000000ffffffff0a000000100000000000 ,
                        0x0000000000002100000008000000190000000c000000ffffff00180000000c00 ,
                        0x000000000000520000007001000001000000f3ffffff00000000000000000000 ,
                        0x0000bc0200000000000000000022430061006c00690062007200690000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000003000000000000000950a0185ffff ,
                        0xffff950a0185ffffffff998dc342ff7f000000000000040000001077f6e37d00 ,
                        0x000001000000060000008093cc5cc50100000000000000000000040000000000 ,
                        0x0000060000000000000000000000020000000000000000000000bbe62945ff7f ,
                        0x000000000000000000007d0b0aee0000ffff0000000007000000b16a2645ff7f ,
                        0x000000000000f67f0000040000007d0000000000000000000000040000000600 ,
                        0x00008078f6e37d0000003d8fc342000000000600000007000000050000000700 ,
                        0x00000f000000000000000ba7c172ff7f00001077f6e37d0000009078f6e37d00 ,
                        0x00007d0b0aefffffffff010000006476000800000000250000000c0000000100 ,
                        0x0000250000000c0000000d000080250000000c00000001000000520000007001 ,
                        0x000002000000f5ffffff000000000000000000000000bc020000000000000000 ,
                        0x0022430061006c00690062007200690000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000030000000000000009b0d0180ffffffff9b0d0180ffffffff998d ,
                        0xc342ff7f00000000b242ff7f0000f9613321f67f0000a08ec342ff7f0000146a ,
                        0x3821f67f0000000000000000000004000000000000000000b242ff7f0000c164 ,
                        0x3321f67f00000400000000000000bbe62945ff7f000010e2f6e37d000000146a ,
                        0x3821000000004800000000000000b16a2645ff7f000000000000f67f00000400 ,
                        0x0000f67f00000000000000000000be1700000000000040e4f6e37d0000003d8f ,
                        0xc3420000000000000000ffffffff3c22000004c804000d000000000000000ba7 ,
                        0xc172ff7f0000d0e2f6e37d00000050e4f6e37d0000002f0c0a17000000000100 ,
                        0x00006476000800000000250000000c00000002000000250000000c0000000d00 ,
                        0x0080250000000c00000002000000250000000c00000001000000250000000c00 ,
                        0x00000d000080250000000c00000001000000250000000c000000020000002500 ,
                        0x00000c0000000d000080220000000c000000ffffffff21000000080000002500 ,
                        0x00000c00000002000000190000000c000000ffffff00180000000c0000000000 ,
                        0x00001e0000001800000000000000000000001e010000ae000000250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000190000000c000000ffffff00180000000c000000000000001e00 ,
                        0x00001800000000000000000000001e010000ae000000250000000c0000000d00 ,
                        0x0080220000000c000000ffffffff2100000008000000250000000c0000000200 ,
                        0x0000190000000c000000ffffff00180000000c000000000000001e0000001800 ,
                        0x000004000000040000001a010000aa0000002700000018000000030000000000 ,
                        0x00008080800000000000250000000c00000003000000250000000c0000000800 ,
                        0x0080180000000c000000ffffff00190000000c00000080808000140000000c00 ,
                        0x00000d000000120000000c000000020000005600000030000000470000007800 ,
                        0x0000bf00000078000000050000004700780047007800bf007800bf0078004700 ,
                        0x780027000000180000000400000000000000c0c0c00000000000250000000c00 ,
                        0x000004000000280000000c00000003000000180000000c000000000000001900 ,
                        0x00000c000000c0c0c00056000000300000004700000038000000470000007800 ,
                        0x0000050000004700780047003800470038004700780047007800560000003000 ,
                        0x00004700000038000000bf00000078000000050000004700780047003800bf00 ,
                        0x3800bf007800470078001d00000018000000ed0000005d000000150100006f00 ,
                        0x0000260000001c00000003000000000000000100000000000000000000002500 ,
                        0x00000c000000030000001b000000100000004700000078000000190000000c00 ,
                        0x0000ffffff00120000000c000000010000003600000010000000470000007800 ,
                        0x00003600000010000000bf000000780000001b00000010000000470000006c00 ,
                        0x00003600000010000000470000006b0000003600000010000000bf0000006b00 ,
                        0x00001b00000010000000470000005f0000003600000010000000470000005e00 ,
                        0x00003600000010000000bf0000005e0000001b00000010000000470000005200 ,
                        0x0000360000001000000047000000510000003600000010000000bf0000005100 ,
                        0x00001b0000001000000047000000450000003600000010000000470000004400 ,
                        0x00003600000010000000bf000000440000001b00000010000000470000003800 ,
                        0x0000360000001000000047000000380000003600000010000000bf0000003800 ,
                        0x0000250000000c00000007000080250000000c00000000000080250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000250000000c00000004000000250000000c000000030000001900 ,
                        0x00000c000000ffffff00180000000c000000000000001e000000180000000400 ,
                        0x0000040000001a010000aa000000250000000c00000005000080280000000c00 ,
                        0x000004000000180000000c000000ffffff00140000000c0000000d0000001200 ,
                        0x00000c0000000200000056000000300000004700000078000000bf0000007800 ,
                        0x000005000000bf007800bf0078004700780047007800bf007800260000001c00 ,
                        0x00000400000000000000010000000000000080808000250000000c0000000400 ,
                        0x0000280000000c000000030000001d00000018000000ed0000005d0000001501 ,
                        0x00006f0000005600000030000000470000003800000047000000780000000500 ,
                        0x0000470078004700380047003800470078004700780056000000300000004700 ,
                        0x000038000000bf00000078000000050000004700780047003800bf003800bf00 ,
                        0x780047007800250000000c00000007000080250000000c000000000000802500 ,
                        0x00000c0000000d000080220000000c000000ffffffff21000000080000002500 ,
                        0x00000c00000002000000250000000c00000005000080250000000c0000000400 ,
                        0x0000190000000c000000ffffff00180000000c000000ffffff001e0000001800 ,
                        0x000004000000040000001a010000aa000000260000001c000000030000000000 ,
                        0x0000010000000000000000000000250000000c00000003000000280000000c00 ,
                        0x000004000000270000001800000004000000000000004c4c7f00000000002500 ,
                        0x00000c00000004000000180000000c0000004c4c7f00190000000c0000004c4c ,
                        0x7f00140000000c0000000d000000120000000c00000002000000560000003000 ,
                        0x00004a000000380000004a00000078000000050000004a0078004a0038004a00 ,
                        0x38004a0078004a007800270000001800000005000000000000009999ff000000 ,
                        0x0000250000000c00000005000000280000000c00000004000000180000000c00 ,
                        0x0000ffffff00190000000c0000009999ff005600000030000000480000003800 ,
                        0x00004a000000780000000500000048007800480038004a0038004a0078004800 ,
                        0x7800250000000c00000004000080280000000c00000005000000270000001800 ,
                        0x000005000000000000007373bf0000000000250000000c000000050000001800 ,
                        0x00000c0000007373bf00190000000c0000007373bf0056000000300000004800 ,
                        0x0000380000004a00000038000000050000004a0038004a003800490038004800 ,
                        0x38004a003800260000001c000000040000000000000001000000000000000000 ,
                        0x0000250000000c00000004000000280000000c00000003000000270000001800 ,
                        0x000003000000000000004c4c7f0000000000250000000c000000030000002800 ,
                        0x00000c00000005000000180000000c0000004c4c7f00190000000c0000004c4c ,
                        0x7f0056000000300000004e000000380000004f00000078000000050000004e00 ,
                        0x78004e0038004f0038004f0078004e0078002700000018000000050000000000 ,
                        0x00009999ff0000000000250000000c00000005000000280000000c0000000300 ,
                        0x0000180000000c000000ffffff00190000000c0000009999ff00560000003000 ,
                        0x00004c000000380000004e00000078000000050000004c0078004c0038004e00 ,
                        0x38004e0078004c007800250000000c00000004000080280000000c0000000500 ,
                        0x0000270000001800000005000000000000007373bf0000000000250000000c00 ,
                        0x000005000000180000000c0000007373bf00190000000c0000007373bf005600 ,
                        0x0000300000004c000000380000004f00000038000000050000004e0038004f00 ,
                        0x38004d0038004c0038004e003800260000001c00000003000000000000000100 ,
                        0x00000000000000000000250000000c00000003000000280000000c0000000400 ,
                        0x0000270000001800000004000000000000004c4c7f0000000000250000000c00 ,
                        0x000004000000280000000c00000005000000180000000c0000004c4c7f001900 ,
                        0x00000c0000004c4c7f0056000000300000005200000038000000530000007800 ,
                        0x0000050000005200780052003800530038005300780052007800270000001800 ,
                        0x000005000000000000009999ff0000000000250000000c000000050000002800 ,
                        0x00000c00000004000000180000000c000000ffffff00190000000c0000009999 ,
                        0xff00560000003000000050000000380000005200000078000000050000005000 ,
                        0x780050003800520038005200780050007800250000000c000000040000802800 ,
                        0x00000c00000005000000270000001800000005000000000000007373bf000000 ,
                        0x0000250000000c00000005000000180000000c0000007373bf00190000000c00 ,
                        0x00007373bf005600000030000000500000003800000053000000380000000500 ,
                        0x00005200380053003800510038005000380052003800260000001c0000000400 ,
                        0x000000000000010000000000000000000000250000000c000000040000002800 ,
                        0x00000c00000003000000270000001800000003000000000000004c4c7f000000 ,
                        0x0000250000000c00000003000000280000000c00000005000000180000000c00 ,
                        0x00004c4c7f00190000000c0000004c4c7f005600000030000000560000003800 ,
                        0x0000570000007800000005000000560078005600380057003800570078005600 ,
                        0x7800270000001800000005000000000000009999ff0000000000250000000c00 ,
                        0x000005000000280000000c00000003000000180000000c000000ffffff001900 ,
                        0x00000c0000009999ff0056000000300000005500000038000000560000007800 ,
                        0x0000050000005500780055003800560038005600780055007800250000000c00 ,
                        0x000004000080280000000c000000050000002700000018000000050000000000 ,
                        0x00007373bf0000000000250000000c00000005000000180000000c0000007373 ,
                        0xbf00190000000c0000007373bf00560000003000000055000000380000005700 ,
                        0x0000380000000500000056003800570038005500380055003800560038002600 ,
                        0x00001c0000000300000000000000010000000000000000000000250000000c00 ,
                        0x000003000000280000000c000000040000002700000018000000040000000000 ,
                        0x00004c4c7f0000000000250000000c00000004000000280000000c0000000500 ,
                        0x0000180000000c0000004c4c7f00190000000c0000004c4c7f00560000003000 ,
                        0x00005a000000380000005b00000078000000050000005a0078005a0038005b00 ,
                        0x38005b0078005a007800270000001800000005000000000000009999ff000000 ,
                        0x0000250000000c00000005000000280000000c00000004000000180000000c00 ,
                        0x0000ffffff00190000000c0000009999ff005600000030000000590000003800 ,
                        0x00005a000000780000000500000059007800590038005a0038005a0078005900 ,
                        0x7800250000000c00000004000080280000000c00000005000000270000001800 ,
                        0x000005000000000000007373bf0000000000250000000c000000050000001800 ,
                        0x00000c0000007373bf00190000000c0000007373bf0056000000300000005900 ,
                        0x0000380000005b00000038000000050000005a0038005b003800590038005900 ,
                        0x38005a003800260000001c000000040000000000000001000000000000000000 ,
                        0x0000250000000c00000004000000280000000c00000003000000270000001800 ,
                        0x000003000000000000004c4c7f0000000000250000000c000000030000002800 ,
                        0x00000c00000005000000180000000c0000004c4c7f00190000000c0000004c4c ,
                        0x7f0056000000300000005e000000380000005f00000078000000050000005e00 ,
                        0x78005e0038005f0038005f0078005e0078002700000018000000050000000000 ,
                        0x00009999ff0000000000250000000c00000005000000280000000c0000000300 ,
                        0x0000180000000c000000ffffff00190000000c0000009999ff00560000003000 ,
                        0x00005d000000380000005e00000078000000050000005d0078005d0038005e00 ,
                        0x38005e0078005d007800250000000c00000004000080280000000c0000000500 ,
                        0x0000270000001800000005000000000000007373bf0000000000250000000c00 ,
                        0x000005000000180000000c0000007373bf00190000000c0000007373bf005600 ,
                        0x0000300000005d000000380000005f00000038000000050000005e0038005f00 ,
                        0x38005d0038005d0038005e003800260000001c00000003000000000000000100 ,
                        0x00000000000000000000250000000c00000003000000280000000c0000000400 ,
                        0x0000270000001800000004000000000000004c4c7f0000000000250000000c00 ,
                        0x000004000000280000000c00000005000000180000000c0000004c4c7f001900 ,
                        0x00000c0000004c4c7f0056000000300000006300000038000000630000007800 ,
                        0x0000050000006300780063003800630038006300780063007800270000001800 ,
                        0x000005000000000000009999ff0000000000250000000c000000050000002800 ,
                        0x00000c00000004000000180000000c000000ffffff00190000000c0000009999 ,
                        0xff00560000003000000061000000380000006300000078000000050000006100 ,
                        0x780061003800630038006300780061007800250000000c000000040000802800 ,
                        0x00000c00000005000000270000001800000005000000000000007373bf000000 ,
                        0x0000250000000c00000005000000180000000c0000007373bf00190000000c00 ,
                        0x00007373bf005600000030000000610000003800000063000000380000000500 ,
                        0x00006300380063003800610038006100380063003800260000001c0000000400 ,
                        0x000000000000010000000000000000000000250000000c000000040000002800 ,
                        0x00000c00000003000000270000001800000003000000000000004c4c7f000000 ,
                        0x0000250000000c00000003000000280000000c00000005000000180000000c00 ,
                        0x00004c4c7f00190000000c0000004c4c7f005600000030000000670000003800 ,
                        0x0000670000007800000005000000670078006700380067003800670078006700 ,
                        0x7800270000001800000005000000000000009999ff0000000000250000000c00 ,
                        0x000005000000280000000c00000003000000180000000c000000ffffff001900 ,
                        0x00000c0000009999ff0056000000300000006500000038000000670000007800 ,
                        0x0000050000006500780065003800670038006700780065007800250000000c00 ,
                        0x000004000080280000000c000000050000002700000018000000050000000000 ,
                        0x00007373bf0000000000250000000c00000005000000180000000c0000007373 ,
                        0xbf00190000000c0000007373bf00560000003000000065000000380000006700 ,
                        0x0000380000000500000067003800670038006600380065003800670038002600 ,
                        0x00001c0000000300000000000000010000000000000000000000250000000c00 ,
                        0x000003000000280000000c000000040000002700000018000000040000000000 ,
                        0x00004c4c7f0000000000250000000c00000004000000280000000c0000000500 ,
                        0x0000180000000c0000004c4c7f00190000000c0000004c4c7f00560000003000 ,
                        0x00006b000000380000006b00000078000000050000006b0078006b0038006b00 ,
                        0x38006b0078006b007800270000001800000005000000000000009999ff000000 ,
                        0x0000250000000c00000005000000280000000c00000004000000180000000c00 ,
                        0x0000ffffff00190000000c0000009999ff005600000030000000690000003800 ,
                        0x00006b000000780000000500000069007800690038006b0038006b0078006900 ,
                        0x7800250000000c00000004000080280000000c00000005000000270000001800 ,
                        0x000005000000000000007373bf0000000000250000000c000000050000001800 ,
                        0x00000c0000007373bf00190000000c0000007373bf0056000000300000006900 ,
                        0x0000380000006b00000038000000050000006b0038006b0038006a0038006900 ,
                        0x38006b003800260000001c000000040000000000000001000000000000000000 ,
                        0x0000250000000c00000004000000280000000c00000003000000270000001800 ,
                        0x000003000000000000004c4c7f0000000000250000000c000000030000002800 ,
                        0x00000c00000005000000180000000c0000004c4c7f00190000000c0000004c4c ,
                        0x7f0056000000300000006f000000380000006f00000078000000050000006f00 ,
                        0x78006f0038006f0038006f0078006f0078002700000018000000050000000000 ,
                        0x00009999ff0000000000250000000c00000005000000280000000c0000000300 ,
                        0x0000180000000c000000ffffff00190000000c0000009999ff00560000003000 ,
                        0x00006d000000380000006f00000078000000050000006d0078006d0038006f00 ,
                        0x38006f0078006d007800250000000c00000004000080280000000c0000000500 ,
                        0x0000270000001800000005000000000000007373bf0000000000250000000c00 ,
                        0x000005000000180000000c0000007373bf00190000000c0000007373bf005600 ,
                        0x0000300000006d000000380000006f00000038000000050000006f0038006f00 ,
                        0x38006e0038006d0038006f003800260000001c00000003000000000000000100 ,
                        0x00000000000000000000250000000c00000003000000280000000c0000000400 ,
                        0x0000270000001800000004000000000000004c4c7f0000000000250000000c00 ,
                        0x000004000000280000000c00000005000000180000000c0000004c4c7f001900 ,
                        0x00000c0000004c4c7f0056000000300000007300000038000000740000007800 ,
                        0x0000050000007300780073003800740038007400780073007800270000001800 ,
                        0x000005000000000000009999ff0000000000250000000c000000050000002800 ,
                        0x00000c00000004000000180000000c000000ffffff00190000000c0000009999 ,
                        0xff00560000003000000071000000380000007300000078000000050000007100 ,
                        0x780071003800730038007300780071007800250000000c000000040000802800 ,
                        0x00000c00000005000000270000001800000005000000000000007373bf000000 ,
                        0x0000250000000c00000005000000180000000c0000007373bf00190000000c00 ,
                        0x00007373bf005600000030000000710000003800000074000000380000000500 ,
                        0x00007300380074003800720038007100380073003800260000001c0000000400 ,
                        0x000000000000010000000000000000000000250000000c000000040000002800 ,
                        0x00000c00000003000000270000001800000003000000000000004c4c7f000000 ,
                        0x0000250000000c00000003000000280000000c00000005000000180000000c00 ,
                        0x00004c4c7f00190000000c0000004c4c7f005600000030000000770000003800 ,
                        0x0000780000007800000005000000770078007700380078003800780078007700 ,
                        0x7800270000001800000005000000000000009999ff0000000000250000000c00 ,
                        0x000005000000280000000c00000003000000180000000c000000ffffff001900 ,
                        0x00000c0000009999ff0056000000300000007600000038000000770000007800 ,
                        0x0000050000007600780076003800770038007700780076007800250000000c00 ,
                        0x000004000080280000000c000000050000002700000018000000050000000000 ,
                        0x00007373bf0000000000250000000c00000005000000180000000c0000007373 ,
                        0xbf00190000000c0000007373bf00560000003000000076000000380000007800 ,
                        0x0000380000000500000077003800780038007600380076003800770038002600 ,
                        0x00001c0000000300000000000000010000000000000000000000250000000c00 ,
                        0x000003000000280000000c000000040000002700000018000000040000000000 ,
                        0x00004c4c7f0000000000250000000c00000004000000280000000c0000000500 ,
                        0x0000180000000c0000004c4c7f00190000000c0000004c4c7f00560000003000 ,
                        0x00007b000000380000007c00000078000000050000007b0078007b0038007c00 ,
                        0x38007c0078007b007800270000001800000005000000000000009999ff000000 ,
                        0x0000250000000c00000005000000280000000c00000004000000180000000c00 ,
                        0x0000ffffff00190000000c0000009999ff0056000000300000007a0000003800 ,
                        0x00007b00000078000000050000007a0078007a0038007b0038007b0078007a00 ,
                        0x7800250000000c00000004000080280000000c00000005000000270000001800 ,
                        0x000005000000000000001610000026060f002220574d46430100000000000100 ,
                        0x0000000000000300000000200000100c0000104c00007373bf00000000002500 ,
                        0x00000c00000005000000180000000c0000007373bf00190000000c0000007373 ,
                        0xbf0056000000300000007a000000380000007c00000038000000050000007b00 ,
                        0x38007c0038007a0038007a0038007b003800260000001c000000040000000000 ,
                        0x0000010000000000000000000000250000000c00000004000000280000000c00 ,
                        0x000003000000270000001800000003000000000000004c4c7f00000000002500 ,
                        0x00000c00000003000000280000000c00000005000000180000000c0000004c4c ,
                        0x7f00190000000c0000004c4c7f0056000000300000007f000000380000008000 ,
                        0x000078000000050000007f0078007f00380080003800800078007f0078002700 ,
                        0x00001800000005000000000000009999ff0000000000250000000c0000000500 ,
                        0x0000280000000c00000003000000180000000c000000ffffff00190000000c00 ,
                        0x00009999ff0056000000300000007e000000380000007f000000780000000500 ,
                        0x00007e0078007e0038007f0038007f0078007e007800250000000c0000000400 ,
                        0x0080280000000c00000005000000270000001800000005000000000000007373 ,
                        0xbf0000000000250000000c00000005000000180000000c0000007373bf001900 ,
                        0x00000c0000007373bf0056000000300000007e00000038000000800000003800 ,
                        0x0000050000007f003800800038007e0038007e0038007f003800260000001c00 ,
                        0x00000300000000000000010000000000000000000000250000000c0000000300 ,
                        0x0000280000000c00000004000000270000001800000004000000000000004c4c ,
                        0x7f0000000000250000000c00000004000000280000000c000000050000001800 ,
                        0x00000c0000004c4c7f00190000000c0000004c4c7f0056000000300000008400 ,
                        0x0000380000008400000078000000050000008400780084003800840038008400 ,
                        0x780084007800270000001800000005000000000000009999ff00000000002500 ,
                        0x00000c00000005000000280000000c00000004000000180000000c000000ffff ,
                        0xff00190000000c0000009999ff00560000003000000082000000380000008400 ,
                        0x0000780000000500000082007800820038008400380084007800820078002500 ,
                        0x00000c00000004000080280000000c0000000500000027000000180000000500 ,
                        0x0000000000007373bf0000000000250000000c00000005000000180000000c00 ,
                        0x00007373bf00190000000c0000007373bf005600000030000000820000003800 ,
                        0x0000840000003800000005000000840038008400380082003800820038008400 ,
                        0x3800260000001c00000004000000000000000100000000000000000000002500 ,
                        0x00000c00000004000000280000000c0000000300000027000000180000000300 ,
                        0x0000000000004c4c7f0000000000250000000c00000003000000280000000c00 ,
                        0x000005000000180000000c0000004c4c7f00190000000c0000004c4c7f005600 ,
                        0x0000300000008800000038000000880000007800000005000000880078008800 ,
                        0x3800880038008800780088007800270000001800000005000000000000009999 ,
                        0xff0000000000250000000c00000005000000280000000c000000030000001800 ,
                        0x00000c000000ffffff00190000000c0000009999ff0056000000300000008600 ,
                        0x0000380000008800000078000000050000008600780086003800880038008800 ,
                        0x780086007800250000000c00000004000080280000000c000000050000002700 ,
                        0x00001800000005000000000000007373bf0000000000250000000c0000000500 ,
                        0x0000180000000c0000007373bf00190000000c0000007373bf00560000003000 ,
                        0x0000860000003800000088000000380000000500000088003800880038008700 ,
                        0x38008600380088003800260000001c0000000300000000000000010000000000 ,
                        0x000000000000250000000c00000003000000280000000c000000040000002700 ,
                        0x00001800000004000000000000004c4c7f0000000000250000000c0000000400 ,
                        0x0000280000000c00000005000000180000000c0000004c4c7f00190000000c00 ,
                        0x00004c4c7f0056000000300000008c000000380000008c000000780000000500 ,
                        0x00008c0078008c0038008c0038008c0078008c00780027000000180000000500 ,
                        0x0000000000009999ff0000000000250000000c00000005000000280000000c00 ,
                        0x000004000000180000000c000000ffffff00190000000c0000009999ff005600 ,
                        0x0000300000008a000000380000008c00000078000000050000008a0078008a00 ,
                        0x38008c0038008c0078008a007800250000000c00000004000080280000000c00 ,
                        0x000005000000270000001800000005000000000000007373bf00000000002500 ,
                        0x00000c00000005000000180000000c0000007373bf00190000000c0000007373 ,
                        0xbf0056000000300000008a000000380000008c00000038000000050000008c00 ,
                        0x38008c0038008b0038008a0038008c003800260000001c000000040000000000 ,
                        0x0000010000000000000000000000250000000c00000004000000280000000c00 ,
                        0x000003000000270000001800000003000000000000004c4c7f00000000002500 ,
                        0x00000c00000003000000280000000c00000005000000180000000c0000004c4c ,
                        0x7f00190000000c0000004c4c7f00560000003000000090000000380000009000 ,
                        0x0000780000000500000090007800900038009000380090007800900078002700 ,
                        0x00001800000005000000000000009999ff0000000000250000000c0000000500 ,
                        0x0000280000000c00000003000000180000000c000000ffffff00190000000c00 ,
                        0x00009999ff0056000000300000008e0000003800000090000000780000000500 ,
                        0x00008e0078008e00380090003800900078008e007800250000000c0000000400 ,
                        0x0080280000000c00000005000000270000001800000005000000000000007373 ,
                        0xbf0000000000250000000c00000005000000180000000c0000007373bf001900 ,
                        0x00000c0000007373bf0056000000300000008e00000038000000900000003800 ,
                        0x00000500000090003800900038008f0038008e00380090003800260000001c00 ,
                        0x00000300000000000000010000000000000000000000250000000c0000000300 ,
                        0x0000280000000c00000004000000270000001800000004000000000000004c4c ,
                        0x7f0000000000250000000c00000004000000280000000c000000050000001800 ,
                        0x00000c0000004c4c7f00190000000c0000004c4c7f0056000000300000009400 ,
                        0x0000380000009500000078000000050000009400780094003800950038009500 ,
                        0x780094007800270000001800000005000000000000009999ff00000000002500 ,
                        0x00000c00000005000000280000000c00000004000000180000000c000000ffff ,
                        0xff00190000000c0000009999ff00560000003000000092000000380000009400 ,
                        0x0000780000000500000092007800920038009400380094007800920078002500 ,
                        0x00000c00000004000080280000000c0000000500000027000000180000000500 ,
                        0x0000000000007373bf0000000000250000000c00000005000000180000000c00 ,
                        0x00007373bf00190000000c0000007373bf005600000030000000920000003800 ,
                        0x0000950000003800000005000000940038009500380093003800920038009400 ,
                        0x3800260000001c00000004000000000000000100000000000000000000002500 ,
                        0x00000c00000004000000280000000c0000000300000027000000180000000300 ,
                        0x0000000000004c4c7f0000000000250000000c00000003000000280000000c00 ,
                        0x000005000000180000000c0000004c4c7f00190000000c0000004c4c7f005600 ,
                        0x0000300000009800000038000000990000007800000005000000980078009800 ,
                        0x3800990038009900780098007800270000001800000005000000000000009999 ,
                        0xff0000000000250000000c00000005000000280000000c000000030000001800 ,
                        0x00000c000000ffffff00190000000c0000009999ff0056000000300000009700 ,
                        0x0000380000009800000078000000050000009700780097003800980038009800 ,
                        0x780097007800250000000c00000004000080280000000c000000050000002700 ,
                        0x00001800000005000000000000007373bf0000000000250000000c0000000500 ,
                        0x0000180000000c0000007373bf00190000000c0000007373bf00560000003000 ,
                        0x0000970000003800000099000000380000000500000098003800990038009700 ,
                        0x38009700380098003800260000001c0000000300000000000000010000000000 ,
                        0x000000000000250000000c00000003000000280000000c000000040000002700 ,
                        0x00001800000004000000000000004c4c7f0000000000250000000c0000000400 ,
                        0x0000280000000c00000005000000180000000c0000004c4c7f00190000000c00 ,
                        0x00004c4c7f0056000000300000009c000000380000009d000000780000000500 ,
                        0x00009c0078009c0038009d0038009d0078009c00780027000000180000000500 ,
                        0x0000000000009999ff0000000000250000000c00000005000000280000000c00 ,
                        0x000004000000180000000c000000ffffff00190000000c0000009999ff005600 ,
                        0x0000300000009b000000380000009c00000078000000050000009b0078009b00 ,
                        0x38009c0038009c0078009b007800250000000c00000004000080280000000c00 ,
                        0x000005000000270000001800000005000000000000007373bf00000000002500 ,
                        0x00000c00000005000000180000000c0000007373bf00190000000c0000007373 ,
                        0xbf0056000000300000009b000000380000009d00000038000000050000009c00 ,
                        0x38009d0038009b0038009b0038009c003800260000001c000000040000000000 ,
                        0x0000010000000000000000000000250000000c00000004000000280000000c00 ,
                        0x000003000000270000001800000003000000000000004c4c7f00000000002500 ,
                        0x00000c00000003000000280000000c00000005000000180000000c0000004c4c ,
                        0x7f00190000000c0000004c4c7f005600000030000000a000000038000000a100 ,
                        0x00007800000005000000a0007800a0003800a1003800a1007800a00078002700 ,
                        0x00001800000005000000000000009999ff0000000000250000000c0000000500 ,
                        0x0000280000000c00000003000000180000000c000000ffffff00190000000c00 ,
                        0x00009999ff0056000000300000009f00000038000000a0000000780000000500 ,
                        0x00009f0078009f003800a0003800a00078009f007800250000000c0000000400 ,
                        0x0080280000000c00000005000000270000001800000005000000000000007373 ,
                        0xbf0000000000250000000c00000005000000180000000c0000007373bf001900 ,
                        0x00000c0000007373bf0056000000300000009f00000038000000a10000003800 ,
                        0x000005000000a0003800a10038009f0038009f003800a0003800260000001c00 ,
                        0x00000300000000000000010000000000000000000000250000000c0000000300 ,
                        0x0000280000000c00000004000000270000001800000004000000000000004c4c ,
                        0x7f0000000000250000000c00000004000000280000000c000000050000001800 ,
                        0x00000c0000004c4c7f00190000000c0000004c4c7f005600000030000000a500 ,
                        0x000038000000a50000007800000005000000a5007800a5003800a5003800a500 ,
                        0x7800a5007800270000001800000005000000000000009999ff00000000002500 ,
                        0x00000c00000005000000280000000c00000004000000180000000c000000ffff ,
                        0xff00190000000c0000009999ff005600000030000000a300000038000000a500 ,
                        0x00007800000005000000a3007800a3003800a5003800a5007800a30078002500 ,
                        0x00000c00000004000080280000000c0000000500000027000000180000000500 ,
                        0x0000000000007373bf0000000000250000000c00000005000000180000000c00 ,
                        0x00007373bf00190000000c0000007373bf005600000030000000a30000003800 ,
                        0x0000a50000003800000005000000a5003800a5003800a3003800a3003800a500 ,
                        0x3800260000001c00000004000000000000000100000000000000000000002500 ,
                        0x00000c00000004000000280000000c0000000300000027000000180000000300 ,
                        0x0000000000004c4c7f0000000000250000000c00000003000000280000000c00 ,
                        0x000005000000180000000c0000004c4c7f00190000000c0000004c4c7f005600 ,
                        0x000030000000a900000038000000a90000007800000005000000a9007800a900 ,
                        0x3800a9003800a9007800a9007800270000001800000005000000000000009999 ,
                        0xff0000000000250000000c00000005000000280000000c000000030000001800 ,
                        0x00000c000000ffffff00190000000c0000009999ff005600000030000000a700 ,
                        0x000038000000a90000007800000005000000a7007800a7003800a9003800a900 ,
                        0x7800a7007800250000000c00000004000080280000000c000000050000002700 ,
                        0x00001800000005000000000000007373bf0000000000250000000c0000000500 ,
                        0x0000180000000c0000007373bf00190000000c0000007373bf00560000003000 ,
                        0x0000a700000038000000a90000003800000005000000a9003800a9003800a800 ,
                        0x3800a7003800a9003800260000001c0000000300000000000000010000000000 ,
                        0x000000000000250000000c00000003000000280000000c000000040000002700 ,
                        0x00001800000004000000000000004c4c7f0000000000250000000c0000000400 ,
                        0x0000280000000c00000005000000180000000c0000004c4c7f00190000000c00 ,
                        0x00004c4c7f005600000030000000ad00000038000000ad000000780000000500 ,
                        0x0000ad007800ad003800ad003800ad007800ad00780027000000180000000500 ,
                        0x0000000000009999ff0000000000250000000c00000005000000280000000c00 ,
                        0x000004000000180000000c000000ffffff00190000000c0000009999ff005600 ,
                        0x000030000000ab00000038000000ad0000007800000005000000ab007800ab00 ,
                        0x3800ad003800ad007800ab007800250000000c00000004000080280000000c00 ,
                        0x000005000000270000001800000005000000000000007373bf00000000002500 ,
                        0x00000c00000005000000180000000c0000007373bf00190000000c0000007373 ,
                        0xbf005600000030000000ab00000038000000ad0000003800000005000000ad00 ,
                        0x3800ad003800ac003800ab003800ad003800260000001c000000040000000000 ,
                        0x0000010000000000000000000000250000000c00000004000000280000000c00 ,
                        0x000003000000270000001800000003000000000000004c4c7f00000000002500 ,
                        0x00000c00000003000000280000000c00000005000000180000000c0000004c4c ,
                        0x7f00190000000c0000004c4c7f005600000030000000b100000038000000b100 ,
                        0x00007800000005000000b1007800b1003800b1003800b1007800b10078002700 ,
                        0x00001800000005000000000000009999ff0000000000250000000c0000000500 ,
                        0x0000280000000c00000003000000180000000c000000ffffff00190000000c00 ,
                        0x00009999ff005600000030000000af00000038000000b1000000780000000500 ,
                        0x0000af007800af003800b1003800b1007800af007800250000000c0000000400 ,
                        0x0080280000000c00000005000000270000001800000005000000000000007373 ,
                        0xbf0000000000250000000c00000005000000180000000c0000007373bf001900 ,
                        0x00000c0000007373bf005600000030000000af00000038000000b10000003800 ,
                        0x000005000000b1003800b1003800b0003800af003800b1003800260000001c00 ,
                        0x00000300000000000000010000000000000000000000250000000c0000000300 ,
                        0x0000280000000c00000004000000270000001800000004000000000000004c4c ,
                        0x7f0000000000250000000c00000004000000280000000c000000050000001800 ,
                        0x00000c0000004c4c7f00190000000c0000004c4c7f005600000030000000b500 ,
                        0x000038000000b60000007800000005000000b5007800b5003800b6003800b600 ,
                        0x7800b5007800270000001800000005000000000000009999ff00000000002500 ,
                        0x00000c00000005000000280000000c00000004000000180000000c000000ffff ,
                        0xff00190000000c0000009999ff005600000030000000b300000038000000b500 ,
                        0x00007800000005000000b3007800b3003800b5003800b5007800b30078002500 ,
                        0x00000c00000004000080280000000c0000000500000027000000180000000500 ,
                        0x0000000000007373bf0000000000250000000c00000005000000180000000c00 ,
                        0x00007373bf00190000000c0000007373bf005600000030000000b30000003800 ,
                        0x0000b60000003800000005000000b5003800b6003800b4003800b3003800b500 ,
                        0x3800260000001c00000004000000000000000100000000000000000000002500 ,
                        0x00000c00000004000000280000000c0000000300000027000000180000000300 ,
                        0x0000000000004c4c7f0000000000250000000c00000003000000280000000c00 ,
                        0x000005000000180000000c0000004c4c7f00190000000c0000004c4c7f005600 ,
                        0x000030000000b900000038000000ba0000007800000005000000b9007800b900 ,
                        0x3800ba003800ba007800b9007800270000001800000005000000000000009999 ,
                        0xff0000000000250000000c00000005000000280000000c000000030000001800 ,
                        0x00000c000000ffffff00190000000c0000009999ff005600000030000000b800 ,
                        0x000038000000b90000007800000005000000b8007800b8003800b9003800b900 ,
                        0x7800b8007800250000000c00000004000080280000000c000000050000002700 ,
                        0x00001800000005000000000000007373bf0000000000250000000c0000000500 ,
                        0x0000180000000c0000007373bf00190000000c0000007373bf00560000003000 ,
                        0x0000b800000038000000ba0000003800000005000000b9003800ba003800b800 ,
                        0x3800b8003800b9003800260000001c0000000300000000000000010000000000 ,
                        0x000000000000250000000c00000003000000280000000c000000040000002700 ,
                        0x00001800000004000000000000004c4c7f0000000000250000000c0000000400 ,
                        0x0000280000000c00000005000000180000000c0000004c4c7f00190000000c00 ,
                        0x00004c4c7f005600000030000000bd00000038000000be000000780000000500 ,
                        0x0000bd007800bd003800be003800be007800bd00780027000000180000000500 ,
                        0x0000000000009999ff0000000000250000000c00000005000000280000000c00 ,
                        0x000004000000180000000c000000ffffff00190000000c0000009999ff005600 ,
                        0x000030000000bc00000038000000bd0000007800000005000000bc007800bc00 ,
                        0x3800bd003800bd007800bc007800250000000c00000004000080280000000c00 ,
                        0x000005000000270000001800000005000000000000007373bf00000000002500 ,
                        0x00000c00000005000000180000000c0000007373bf00190000000c0000007373 ,
                        0xbf005600000030000000bc00000038000000be0000003800000005000000bd00 ,
                        0x3800be003800bc003800bc003800bd003800250000000c000000040000802800 ,
                        0x00000c00000005000000250000000c00000007000080280000000c0000000300 ,
                        0x0000260000001c00000003000000000000000100000000000000000000002500 ,
                        0x00000c000000030000001b000000100000004700000078000000190000000c00 ,
                        0x0000ffffff00120000000c000000010000003600000010000000470000003800 ,
                        0x00001b0000001000000047000000780000003600000010000000440000007800 ,
                        0x00001b00000010000000470000006c0000003600000010000000440000006c00 ,
                        0x00001b00000010000000470000005f0000003600000010000000440000005f00 ,
                        0x00001b0000001000000047000000520000003600000010000000440000005200 ,
                        0x00001b0000001000000047000000450000003600000010000000440000004500 ,
                        0x00001b0000001000000047000000380000003600000010000000440000003800 ,
                        0x0000180000000c0000000000000054000000540000003c000000710000004100 ,
                        0x00007d000000010000005515d9417b09d9413c00000071000000010000004c00 ,
                        0x0000000000000000000000000000ffffffffffffffff500000003000312f0600 ,
                        0x0000540000006000000033000000650000004100000071000000010000005515 ,
                        0xd9417b09d9413300000065000000030000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff5400000030002c003200550006000000030000000600 ,
                        0x0000540000006000000033000000580000004100000064000000010000005515 ,
                        0xd9417b09d9413300000058000000030000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff5400000030002c0034001d0006000000030000000600 ,
                        0x00005400000060000000330000004b0000004100000057000000010000005515 ,
                        0xd9417b09d941330000004b000000030000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff5400000030002c003600950006000000030000000600 ,
                        0x00005400000060000000330000003e000000410000004a000000010000005515 ,
                        0xd9417b09d941330000003e000000030000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff5400000030002c003800840006000000030000000600 ,
                        0x000054000000540000003c00000031000000410000003d000000010000005515 ,
                        0xd9417b09d9413c00000031000000010000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff500000003100f35e060000001b000000100000004700 ,
                        0x0000780000003600000010000000bf000000780000001b000000100000004700 ,
                        0x0000780000003600000010000000470000007b0000001b000000100000004b00 ,
                        0x00007800000036000000100000004b0000007b0000001b000000100000004f00 ,
                        0x00007800000036000000100000004f0000007b0000001b000000100000005300 ,
                        0x0000780000003600000010000000530000007b0000001b000000100000005700 ,
                        0x0000780000003600000010000000570000007b0000001b000000100000005c00 ,
                        0x00007800000036000000100000005c0000007b0000001b000000100000006000 ,
                        0x0000780000003600000010000000600000007b0000001b000000100000006400 ,
                        0x0000780000003600000010000000640000007b0000001b000000100000006800 ,
                        0x0000780000003600000010000000680000007b0000001b000000100000006c00 ,
                        0x00007800000036000000100000006c0000007b0000001b000000100000007000 ,
                        0x0000780000003600000010000000700000007b0000001b000000100000007400 ,
                        0x0000780000003600000010000000740000007b0000001e06000026060f00320c ,
                        0x574d4643010000000000010000000000000003000000100c000000000000104c ,
                        0x00001b0000001000000078000000780000003600000010000000780000007b00 ,
                        0x00001b000000100000007d0000007800000036000000100000007d0000007b00 ,
                        0x00001b0000001000000081000000780000003600000010000000810000007b00 ,
                        0x00001b0000001000000085000000780000003600000010000000850000007b00 ,
                        0x00001b0000001000000089000000780000003600000010000000890000007b00 ,
                        0x00001b000000100000008d0000007800000036000000100000008d0000007b00 ,
                        0x00001b0000001000000091000000780000003600000010000000910000007b00 ,
                        0x00001b0000001000000095000000780000003600000010000000950000007b00 ,
                        0x00001b0000001000000099000000780000003600000010000000990000007b00 ,
                        0x00001b000000100000009e0000007800000036000000100000009e0000007b00 ,
                        0x00001b00000010000000a2000000780000003600000010000000a20000007b00 ,
                        0x00001b00000010000000a6000000780000003600000010000000a60000007b00 ,
                        0x00001b00000010000000aa000000780000003600000010000000aa0000007b00 ,
                        0x00001b00000010000000ae000000780000003600000010000000ae0000007b00 ,
                        0x00001b00000010000000b2000000780000003600000010000000b20000007b00 ,
                        0x00001b00000010000000b6000000780000003600000010000000b60000007b00 ,
                        0x00001b00000010000000ba000000780000003600000010000000ba0000007b00 ,
                        0x00005400000078000000340000007e0000005e0000008a000000010000005515 ,
                        0xd9417b09d941340000007e000000070000004c00000000000000000000000000 ,
                        0x0000ffffffffffffffff5c00000043006f006d00700061006e00790000000600 ,
                        0x0000060000000900000006000000050000000600000005000000540000005400 ,
                        0x0000460000008c0000004c00000098000000010000005515d9417b09d9414600 ,
                        0x00008c000000010000004c000000000000000000000000000000ffffffffffff ,
                        0xffff5000000041000000070000005400000078000000650000007e0000008f00 ,
                        0x00008a000000010000005515d9417b09d941650000007e000000070000004c00 ,
                        0x0000000000000000000000000000ffffffffffffffff5c00000043006f006d00 ,
                        0x700061006e007900000006000000060000000900000006000000050000000600 ,
                        0x0000050000005400000054000000790000008c0000007c000000980000000100 ,
                        0x00005515d9417b09d941790000008c000000010000004c000000000000000000 ,
                        0x000000000000ffffffffffffffff500000004a00000004000000540000007800 ,
                        0x0000970000007e000000c10000008a000000010000005515d9417b09d9419700 ,
                        0x00007e000000070000004c000000000000000000000000000000ffffffffffff ,
                        0xffff5c00000043006f006d00700061006e007900000006000000060000000900 ,
                        0x0000060000000500000006000000050000005400000054000000a90000008c00 ,
                        0x0000af00000098000000010000005515d9417b09d941a90000008c0000000100 ,
                        0x00004c000000000000000000000000000000ffffffffffffffff500000005600 ,
                        0x000007000000250000000c00000007000080250000000c0000000d0000802200 ,
                        0x00000c000000ffffffff2100000008000000250000000c000000020000002500 ,
                        0x00000c00000003000000190000000c000000ffffff00180000000c0000000000 ,
                        0x00001e0000001800000000000000000000001e010000ae000000250000000c00 ,
                        0x000001000000250000000c0000000d000080250000000c000000010000002500 ,
                        0x00000c00000007000080250000000c0000000d000080220000000c000000ffff ,
                        0xffff2100000008000000250000000c00000001000000250000000c0000000300 ,
                        0x0000190000000c000000ffffff00180000000c000000000000001e0000001800 ,
                        0x00006f00000007000000b000000020000000140000000c0000000d0000001200 ,
                        0x00000c000000010000005400000084000000720000000c000000ac0000001a00 ,
                        0x0000010000005515d9417b09d941720000000c000000090000004c0000000000 ,
                        0x00000000000000000000ffffffffffffffff6000000043007500730074006f00 ,
                        0x6d00650072007300000007000000070000000500000005000000070000000b00 ,
                        0x0000070000000500000005000000250000000c0000000d000080250000000c00 ,
                        0x000001000000250000000c00000007000080250000000c0000000d0000802200 ,
                        0x00000c000000ffffffff2100000008000000250000000c000000010000002500 ,
                        0x00000c00000003000000190000000c000000ffffff00180000000c0000000000 ,
                        0x00001e0000001800000000000000000000001e010000ae000000250000000c00 ,
                        0x000007000080250000000c0000000d000080220000000c000000ffffffff2100 ,
                        0x000008000000250000000c00000001000000250000000c000000030000001900 ,
                        0x00000c000000ffffff00180000000c000000000000001e000000180000000000 ,
                        0x0000000000001e010000ae000000250000000c00000002000000250000000c00 ,
                        0x000005000080180000000c000000ffffff00140000000c0000000d0000001200 ,
                        0x00000c000000020000002b00000018000000ed0000005d000000140100006f00 ,
                        0x0000250000000c00000007000080250000000c00000000000080250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000250000000c00000005000080250000000c000000030000001900 ,
                        0x00000c000000ffffff00180000000c000000ffffff001e00000018000000ed00 ,
                        0x00005d000000150100006f000000250000000c00000007000080250000000c00 ,
                        0x000000000080250000000c0000000d000080220000000c000000ffffffff2100 ,
                        0x000008000000250000000c00000002000000250000000c000000050000802500 ,
                        0x00000c00000003000000190000000c000000ffffff00180000000c000000ffff ,
                        0xff001e00000018000000ed0000005d000000150100006f000000260000001c00 ,
                        0x00000500000000000000010000000000000000000000250000000c0000000500 ,
                        0x0000280000000c00000003000000270000001800000003000000000000009999 ,
                        0xff0000000000250000000c00000003000000190000000c0000009999ff001400 ,
                        0x00000c0000000d000000120000000c000000020000002b00000018000000f000 ,
                        0x000063000000f500000068000000180000000c00000000000000190000000c00 ,
                        0x0000ffffff00120000000c00000001000000160000000c000000180000005400 ,
                        0x00006c000000f90000005f0000000f0100006b000000010000005515d9417b09 ,
                        0xd941f900000069000000050000004c000000000000000000000000000000ffff ,
                        0xffffffffffff5800000054006f00740061006c00000005000000060000000400 ,
                        0x00000500000003000000160000000c00000000000000250000000c0000000700 ,
                        0x0080250000000c00000000000080250000000c0000000d000080220000000c00 ,
                        0x0000ffffffff2100000008000000250000000c00000002000000250000000c00 ,
                        0x000003000000250000000c00000005000000190000000c000000ffffff001800 ,
                        0x00000c000000000000001e00000018000000ed0000005d000000150100006f00 ,
                        0x0000250000000c00000007000080250000000c00000000000080250000000c00 ,
                        0x00000d000080220000000c000000ffffffff2100000008000000250000000c00 ,
                        0x000002000000250000000c00000003000000250000000c000000050000001900 ,
                        0x00000c000000ffffff00180000000c000000000000001e000000180000000000 ,
                        0x0000000000001e010000ae000000250000000c00000004000080280000000c00 ,
                        0x000003000000250000000c00000007000080280000000c000000050000002500 ,
                        0x00000c0000000d000080220000000c000000ffffffff0900000010000000511e ,
                        0x0000711200002100000008000000190000000c000000ffffff00180000000c00 ,
                        0x000000000000220000000c000000ffffffff0a00000010000000000000000000 ,
                        0x00002100000008000000190000000c000000ffffff00180000000c0000000000 ,
                        0x0000220000000c000000ffffffff460000003400000028000000454d462b2a40 ,
                        0x000024000000180000000000803f00000080000000800000803f000000800000 ,
                        0x0080460000001c00000010000000454d462b024000000c000000000000000e00 ,
                        0x0000140000000000000010000000140000000400000003010800050000000b02 ,
                        0x00000000050000000c02ae001e0105000000090200000000050000000102ffff ,
                        0xff000400000004010d000400000002010200030000001e00040000002701ffff ,
                        0x030000001e00040000002701ffff030000001e00050000000102ffffff000500 ,
                        0x00000902000000001c000000fb02f3ff000000000000bc020000000000000022 ,
                        0x43616c6962726900000000000000000000000000000000000000000000000000 ,
                        0x040000002d0100001c000000fb021000070000000000bc020000000001020222 ,
                        0x53797374656d0000000000000000000000000000000000000000000000000000 ,
                        0x040000002d010100040000002d0100001c000000fb02f5ff000000000000bc02 ,
                        0x000000000000002243616c696272690000000000000000000000000000000000 ,
                        0x00000000fdffffff8200000044000000feffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff00000000040000002d010200040000002d010100040000002d010200 ,
                        0x040000002d010000040000002d010100040000002d010000040000002d010200 ,
                        0x040000002d010100040000002701ffff030000001e00040000002d0102000500 ,
                        0x00000102ffffff0005000000090200000000040000002c010000070000001604 ,
                        0xae001e0100000000040000002d010100040000002701ffff030000001e000400 ,
                        0x00002d010200050000000102ffffff0005000000090200000000040000002c01 ,
                        0x0000070000001604ae001e0100000000040000002d010100040000002701ffff ,
                        0x030000001e00040000002d010200050000000102ffffff000500000009020000 ,
                        0x0000040000002c010000070000001604aa001a010400040007000000fc020000 ,
                        0x808080000000040000002d01030008000000fa02050000000000ffffff000400 ,
                        0x00002d010400050000000902ffffff0005000000010280808000040000000401 ,
                        0x0d0004000000020102000e000000240305004700780047007800bf007800bf00 ,
                        0x78004700780007000000fc020000c0c0c0000000040000002d01050004000000 ,
                        0xf001030005000000090200000000050000000102c0c0c0000e00000024030500 ,
                        0x47007800470038004700380047007800470078000e0000002403050047007800 ,
                        0x47003800bf003800bf00780047007800040000002c010000070000001604aa00 ,
                        0x1a01040004000700000015046f0015015d00ed0008000000fa02000001000000 ,
                        0x00000000040000002d01030005000000140278004700050000000102ffffff00 ,
                        0x0400000002010100050000001302780047000500000013027800bf0005000000 ,
                        0x14026c0047000500000013026b0047000500000013026b00bf00050000001402 ,
                        0x5f0047000500000013025e0047000500000013025e00bf000500000014025200 ,
                        0x4700050000001302510047000500000013025100bf0005000000140245004700 ,
                        0x050000001302440047000500000013024400bf00050000001402380047000500 ,
                        0x00001302380047000500000013023800bf0008000000fa020000000000000000 ,
                        0x0000040000002d01060007000000fc020000ffffff000000040000002d010700 ,
                        0x040000002d010100040000002701ffff030000001e00040000002d0102000400 ,
                        0x00002d010500040000002d010300050000000102ffffff000500000009020000 ,
                        0x0000040000002c010000070000001604aa001a010400040007000000fc020100 ,
                        0x000000000000040000002d01080004000000f0010500050000000902ffffff00 ,
                        0x0400000004010d0004000000020102000e00000024030500bf007800bf007800 ,
                        0x4700780047007800bf00780008000000fa020000010000008080800004000000 ,
                        0x2d01050004000000f0010300040000002c010000070000001604aa001a010400 ,
                        0x040007000000ef001e101e000200010100000000000000000000000000000000 ,
                        0x0000000023004d00000021100200030007100c00808080000000000000001700 ,
                        0x0a101000c0c0c000000000000100000016004f00341000001d10120001000000 ,
                        0x0000000000000000000000000000331000001f102a0000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000001f01 ,
                        0x1e101e0002000301000000000000000000000000000000000000000023004d00 ,
                        0x000021100200010007100c00000000000000000009004d002110020003000710 ,
                        0x0c00000000000000000009004d000a101000ffffff0000000000010001004e00 ,
                        0x4d00341001000002000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000001410140000000000000000000000000000000000000000003310 ,
                        0x00001710060000009600000022100a0000000000000000000f003a100e001400 ,
                        0x0f001e00640064000000160015101400f60b00009a050000730300003a070000 ,
                        0x03011f00331000004f10140005000200f60b00009a0500000000000000000000 ,
                        0x251020000202010000000000bbffffff8cffffff0000000000000000b1004d00 ,
                        0x70020000331000004f1014000200020000000000000000000000000000000000 ,
                        0x5110080000000000
                    End
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [Company],Count(*) AS [Total] FROM [Customers]   GROUP BY [Company];"
                    Class ="MSGraph.Chart.8"
                    OLEClass ="Microsoft Graph Chart"
                    GridlineColor =10921638

                    LayoutCachedLeft =8858
                    LayoutCachedTop =5362
                    LayoutCachedWidth =13394
                    LayoutCachedHeight =8197
                End
            End
        End
        Begin FormFooter
            Height =0
            BackColor =-2147483613
            Name ="FormFooter"
            AutoHeight =1
        End
    End
End
