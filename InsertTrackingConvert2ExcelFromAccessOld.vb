InsertTrackingConvert2ExcelFromAccessOld.txt
Dim Counter As Integer
Dim Increment As Integer
Dim facility As Integer
Dim InsertDate As Date
Dim OldDayNumber As Integer
Dim DayNumber As Integer
Dim PreviousPage2 As Integer
Dim Page2 As Integer
Dim OldAccountType As Integer
Dim AccountType As Integer 'Distinguishes between House and NonHouse Accounts
Dim AdOrderNumber As Variant
Dim AccountNumber As String
Dim PreviousAccountName As String
Dim AccountName As String
Dim PreviousTagLine As String
Dim TagLine As String
Dim PreviousRack As String
Dim Rack As String
Dim PubCode As String
Dim DistribCode As String
Dim ProdCode As String
Dim Publication As String
Dim InsertCirc As Integer
Dim LayoutCol As Variant 'Determines Column Position for Publication
'Dim LayoutCol As Integer Determines Column Position for Publication
'Dim XCellPos As Variant
Dim PreviousN As Variant
Dim N As Variant
Dim TrueN As Integer
Dim PrintRack As String
Dim HouseInsert As String
Dim CapAccountName As String
Dim CapTagline As String
Dim LastCount As Integer
Dim BeginDate As Date
Dim ErrorCount As Integer
Dim ActiveInFacility1 As Boolean
Dim Multizone As Boolean
Dim PubZones As Range
Sub Main()
Workbooks(1).Activate
Sheet1.Activate
Page 1
InsertTrackingConvert2ExcelFromAccessOld.txt
'MsgBox "Job Started for: " & BeginDate
'MsgBox "This is the Main Module"
'Initialize
Increment = 25
DayNumber = 0
Page2 = 0
AccountType = 0
AccountName = ""
TagLine = ""
Rack = ""
ProdCode = ""
PrintRack = ""
N = 1
ErrorCount = 1
AdOrderNumber = 0
Workbooks.Open Filename:="C:\Data\Auburn.xls"
'ActiveWorkbook.RunAutoMacros xlAutoOpen
'InputName = Workbooks(2).Name
'MsgBox InputName
'Workbooks(2).Sheets.Visible = False
Workbooks(1).Activate
Workbooks(1).Sheets("Controls").Activate
Workbooks.Open Filename:="C:\Data\SavedInsertOutputFiles\Outputtest.xls"
ActiveWorkbook.RunAutoMacros xlAutoOpen
BeginDate = Workbooks(2).Worksheets(1).Cells(2, 2).Value
Workbooks(3).Sheets(1).Cells(1, 1).Value = BeginDate
MsgBox "Job Started for: " & BeginDate
LastCount = Workbooks(2).Worksheets(1).Cells(1, 18).Value
MsgBox "Total Records= " & LastCount
'Loop Thru Auburn.xls, read values and save status values
For Counter = 2 To LastCount + 2 'up ?
'For Counter = 304 To 316
'MsgBox "Counter= " & Counter
If Counter = LastCount + 2 Then
MsgBox "Job Complete"
Workbooks(2).Close
Workbooks(1).Save
Workbooks(1).Close
'Workbooks(3).Close
'AppActivate "Microsoft Excel - OutputTest.xls"
Else
'Save Current Values Prior to new assignment
OldDayNumber = DayNumber
Page 2
InsertTrackingConvert2ExcelFromAccessOld.txt
PreviousPage2 = Page2
OldAccountType = AccountType
PreviousAccountName = AccountName
PreviousTagLine = TagLine
PreviousRack = Rack
PreviousN = N
'This is the input file Workbook(2)
'Workbooks.Open Filename:="C:\download\Auburn.xls", ReadOnly:=True
'Workbooks.Open Filename:="C:\Auburn.xls", ReadOnly:=True
'Start Getting New Values
'Workbooks(2).Activate
DayNumber = Workbooks(2).Worksheets(1).Cells(Counter, 3).Value
'MsgBox "DayNumber=" & DayNumber
'MsgBox "OldDayNumber=" & OldDayNumber
Page2 = Workbooks(2).Worksheets(1).Cells(Counter, 4).Value
AccountType = Workbooks(2).Worksheets(1).Cells(Counter, 5).Value
AdOrderNumber = Workbooks(2).Worksheets(1).Cells(Counter, 6).Value
AccountNumber = Workbooks(2).Worksheets(1).Cells(Counter, 7).Value
AccountName = Workbooks(2).Worksheets(1).Cells(Counter, 8).Value
'MsgBox AccountName
TagLine = Workbooks(2).Worksheets(1).Cells(Counter, 9).Value
'MsgBox TagLine
Rack = Workbooks(2).Worksheets(1).Cells(Counter, 10).Value
'MsgBox Rack
ProdCode = Workbooks(2).Worksheets(1).Cells(Counter, 13).Value
'MsgBox ProdCode
'ActiveInFacility1 = Application.VLookup(ProdCode, Sheet6.Range("A2:E150"), 5,
False)
'On Error Resume Next
'If ActiveInFacility1 = True Then
'Rout to Subroutines
'Select Case DayNumber And Page2 And AccountType
'Case DayNumber = 2 And Page2 = 1 And AccountType = 1
If DayNumber = 2 And Page2 = 1 And AccountType = 1 Then
TrueN = 1
'MsgBox "Sub House"
'MsgBox "ProdCode= " & ProdCode
'Get Values from Layout Table
'Workbooks(1).Activate
LookupDayWorkSheet (ProdCode)
'MsgBox N
House
'Case DayNumber = 2 And Page2 = 1 And AccountType = 2
ElseIf DayNumber = 2 And Page2 = 1 And AccountType = 2 Then
TrueN = 1
'MsgBox "Sub NonHouse"
'MsgBox "ProdCode= " & ProdCode
'Get Values from Layout Table
'Workbooks(1).Activate
LookupDayWorkSheet (ProdCode)
'MsgBox N
NonHouse
'Case DayNumber = 3 And Page2 = 1 And AccountType = 1
ElseIf DayNumber = 3 And Page2 = 1 And AccountType = 1 Then
Page 3
InsertTrackingConvert2ExcelFromAccessOld.txt
TrueN = 2
'MsgBox "Sub House"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
House
'Case DayNumber = 3 And Page2 = 1 And AccountType = 2
ElseIf DayNumber = 3 And Page2 = 1 And AccountType = 2 Then
TrueN = 2
'MsgBox "Sub NonHouse"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
NonHouse
'Case DayNumber = 4 And Page2 = 1 And AccountType = 1
ElseIf DayNumber = 4 And Page2 = 1 And AccountType = 1 Then
TrueN = 3
'MsgBox "Sub House"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
House
'Case DayNumber = 4 And Page2 = 1 And AccountType = 2
ElseIf DayNumber = 4 And Page2 = 1 And AccountType = 2 Then
TrueN = 3
'MsgBox "Sub NonHouse"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
NonHouse
'Case DayNumber = 4 And Page2 = 2 And AccountType = 1
ElseIf DayNumber = 4 And Page2 = 2 And AccountType = 1 Then
TrueN = 4
'MsgBox "Sub House"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
House
'Case DayNumber = 4 And Page2 = 2 And AccountType = 2
ElseIf DayNumber = 4 And Page2 = 2 And AccountType = 2 Then
TrueN = 4
'MsgBox "Sub NonHouse"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
NonHouse
'Case DayNumber = 5 And Page2 = 1 And AccountType = 1
ElseIf DayNumber = 5 And Page2 = 1 And AccountType = 1 Then
TrueN = 5
'MsgBox "Sub House"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
House
Page 4
InsertTrackingConvert2ExcelFromAccessOld.txt
'Case DayNumber = 5 And Page2 = 1 And AccountType = 2
ElseIf DayNumber = 5 And Page2 = 1 And AccountType = 2 Then
TrueN = 5
'MsgBox "Sub NonHouse"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
NonHouse
'Case DayNumber = 5 And Page2 = 2 And AccountType = 1
ElseIf DayNumber = 5 And Page2 = 2 And AccountType = 1 Then
TrueN = 6
'MsgBox "Sub House"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
House
'Case DayNumber = 5 And Page2 = 2 And AccountType = 2
ElseIf DayNumber = 5 And Page2 = 2 And AccountType = 2 Then
TrueN = 6
'MsgBox "Sub NonHouse"
'MsgBox "ProdCode= " & ProdCode
LookupDayWorkSheet (ProdCode)
'MsgBox N
NonHouse
End If
'Else
'MsgBox ProdCode & " Is Inactive"
'End If
End If
Next Counter
End Sub
Function LookupDayWorkSheet(ProdCode)
N = Application.VLookup(ProdCode, Sheet6.Range("A2:C150"), 3, False)
'MsgBox "Day of Week-Worksheet Number= " & N
End Function
Sub Test()
ProdCode = "C1ORLS"
N = Application.VLookup(ProdCode, Sheet6.Range("A2:C107"), 3, False)
MsgBox N
End Sub
Sub Test2()
ProdCode = "BPFULL"
LookupDayWorkSheet (ProdCode)
MsgBox N
End Sub
Sub House()
'Is this a multizone pub? (if it is a multizone pub cannot exit this structure
until compete.)
On Error GoTo ErrorHandler
Multizone = Application.VLookup(ProdCode, Sheet6.Range("A2:D150"), 4, False)
If Multizone = True Then
'MsgBox "Multizone=" & ProdCode
Page 5
InsertTrackingConvert2ExcelFromAccessOld.txt
MultizonePub (ProdCode)
LoopRange
'MsgBox "Passed LoopRange"
'LookupColumn (ProdCode)
'PositionRowHouse
Else
LookupColumn (ProdCode)
PositionRowHouse
End If
Exit Sub
ErrorHandler:
Multizone = False
LookupColumn (ProdCode)
PositionRowHouse
End Sub
Function LookupColumn(ProdCode)
LayoutCol = Application.VLookup(ProdCode, Sheet6.Range("A2:C150"), 2, False)
'MsgBox LayoutCol
End Function
Sub OutputSpreadSheetHouse()
On Error GoTo ErrorHandler2
ActiveInFacility1 = Application.VLookup(ProdCode, Sheet6.Range("A2:E150"), 5,
False)
If ActiveInFacility1 = True Then
HouseInsert = UCase(TagLine)
'Workbooks(3).Sheets(N).Cells(Increment, 1).Value = AccountName & " " &
TagLine
Workbooks(3).Sheets(N).Cells(Increment, 1).Value = HouseInsert
Workbooks(3).Sheets(N).Cells(Increment, LayoutCol).Value = "X"
Exit Sub
ErrorHandler2:
MsgBox "(" & ErrorCount & ") Error(s) has/have occurred"
HouseInsert = UCase(TagLine)
Workbooks(3).Sheets(TrueN).Cells(Increment, 1).Value = HouseInsert
Workbooks(3).Sheets(TrueN).Cells(Increment, 3).Value = "Error Unassigned
ProdCode=" & ProdCode
Increment = Increment + 1
ErrorCount = ErrorCount + 1
Exit Sub
Else
'Exit Sub
MsgBox ProdCode & " Is Inactive"
'Increment = Increment + 1
HouseInsert = UCase(TagLine)
Workbooks(3).Sheets(N).Cells(Increment, 1).Value = HouseInsert
Page 6
InsertTrackingConvert2ExcelFromAccessOld.txt
Workbooks(3).Sheets(N).Cells(Increment, 3).Value = ProdCode & " is inactive
in this facility"
Increment = Increment + 1
ErrorCount = ErrorCount + 1
End If
End Sub
Sub NonHouse()
'Is this a multizone pub? (if it is a multizone pub cannot exit this
structure until compete.)
On Error GoTo ErrorHandler
Multizone = Application.VLookup(ProdCode, Sheet6.Range("A2:D150"), 4, False)
If Multizone = True Then
'MsgBox "Multizone=" & ProdCode
MultizonePub (ProdCode)
LoopRangeNonHouse
'MsgBox "Passed LoopRange"
'LookupColumn (ProdCode)
'PositionRowHouse
Else
LookupColumn (ProdCode)
PositionRowNonHouse
End If
Exit Sub
ErrorHandler:
Multizone = False
LookupColumn (ProdCode)
PositionRowNonHouse
End Sub
Sub OutputSpreadSheetNonHouse()
On Error GoTo ErrorHandler2
ActiveInFacility1 = Application.VLookup(ProdCode, Sheet6.Range("A2:E150"), 5,
False)
'On Error Resume Next
If ActiveInFacility1 = True Then
'On Error GoTo ErrorHandler2
'CapAccountName = UCase(AccountName) & "-" & AdOrderNumber
CapAccountName = UCase(AccountName)
CapTagline = UCase(TagLine)
Workbooks(3).Sheets(N).Cells(Increment, 1).Value = CapAccountName
Workbooks(3).Sheets(N).Cells(Increment, 2).Value = CapTagline
Workbooks(3).Sheets(N).Cells(Increment, 3).Value = PrintRack
Workbooks(3).Sheets(N).Cells(Increment, LayoutCol).Value = "X"
Workbooks(3).Sheets(N).Cells(Increment, 40).Value = AccountNumber
Workbooks(3).Sheets(N).Cells(Increment, 41).Value = AdOrderNumber
Exit Sub
ErrorHandler2:
Page 7
InsertTrackingConvert2ExcelFromAccessOld.txt
MsgBox "(" & ErrorCount & ") Error(s) has/have occurred"
Increment = Increment + 1
Workbooks(3).Sheets(TrueN).Cells(Increment, 1).Value = CapAccountName
Workbooks(3).Sheets(TrueN).Cells(Increment, 2).Value = CapTagline
'Workbooks(3).Sheets(TrueN).Cells(Increment, 3).Value = Rack
Workbooks(3).Sheets(TrueN).Cells(Increment, 3).Value = "Error Unassigned
ProdCode=" & ProdCode
Workbooks(3).Sheets(TrueN).Cells(Increment, 40).Value = AccountNumber
Workbooks(3).Sheets(TrueN).Cells(Increment, 41).Value = AdOrderNumber
Increment = Increment + 1
ErrorCount = ErrorCount + 1
Exit Sub
Else
'Exit Sub
MsgBox ProdCode & " Is Inactive"
'Increment = Increment + 1
CapAccountName = UCase(AccountName)
CapTagline = UCase(TagLine)
Workbooks(3).Sheets(N).Cells(Increment, 1).Value = CapAccountName
Workbooks(3).Sheets(N).Cells(Increment, 2).Value = CapTagline
'Workbooks(3).Sheets(N).Cells(Increment, 3).Value = PrintRack
Workbooks(3).Sheets(N).Cells(Increment, 3).Value = ProdCode & " is inactive
in this facility"
Workbooks(3).Sheets(N).Cells(Increment, 40).Value = AccountNumber
Workbooks(3).Sheets(N).Cells(Increment, 41).Value = AdOrderNumber
Increment = Increment + 1
ErrorCount = ErrorCount + 1
End If
End Sub
Sub CountRecords()
Dim NumWords As String
Dim Number As Integer
'PreCount = Application.CountIf(A2:A5000,">1")
NumWords = Application.CountIf(Worksheets(6).Range("A2:A120"), "*")
MsgBox NumWords
NumWords = Application.CountIf(Sheet6.Range("A2:A120"), "*")
MsgBox NumWords
NumWords = Application.CountIf(Sheets(6).Range("A2:A120"), "*")
MsgBox NumWords
'Number = Application.Count(Sheet6.Range("B2:B120"))
Number = Application.Count(Sheets(6).Range("B2:B120"))
MsgBox Number
End Sub
Sub Auto_Open()
Dim Text As String
Sheet11.Activate
Text = "INSTRUCTIONS:" & Chr(10) & Chr(13)
Text = Text & Chr(9) & "1) Press View Input Source to Insure Correct File" &
Chr(10) & Chr(13)
Page 8
InsertTrackingConvert2ExcelFromAccessOld.txt
Text = Text & Chr(9) & "2) Press Destination to insure Output file is clear." &
Chr(10) & Chr(13)
Text = Text & Chr(9) & "3) Press Begin Job and Save/Rename Output file"
MsgBox Text
End Sub
Sub PositionRowHouse()
On Error GoTo ErrorHandler
ActiveInFacility1 = Application.VLookup(ProdCode, Sheet6.Range("A2:E150"), 5,
False)
If OldDayNumber = DayNumber And AccountType = 1 Then
If PreviousAccountName = AccountName And PreviousTagLine = TagLine Or
PreviousTagLine = "" Then
'LookupColumn (ProdCode)
If ActiveInFacility1 = False Then
Increment = Increment + 1
End If
OutputSpreadSheetHouse
Else
If OldAccountType = 2 Then
Increment = 25
'LookupColumn (ProdCode)
OutputSpreadSheetHouse
Else
Increment = Increment + 1
'LookupColumn (ProdCode)
OutputSpreadSheetHouse
End If
End If
Else
Increment = 25
'LookupColumn (ProdCode)
OutputSpreadSheetHouse
End If
Exit Sub
ErrorHandler:
ActiveInFacility1 = False
Resume Next
'OutputSpreadSheetHouse
End Sub
Sub PositionRowNonHouse()
On Error GoTo ErrorHandler
ActiveInFacility1 = Application.VLookup(ProdCode, Sheet6.Range("A2:E150"),
5, False)
If PreviousAccountName = AccountName And PreviousTagLine = TagLine Then
'LookupColumn (ProdCode)
If PreviousRack = Rack Then
If ActiveInFacility1 = False Then
Increment = Increment + 1
End If
Page 9
InsertTrackingConvert2ExcelFromAccessOld.txt
PrintRack = PrintRack
'MsgBox PrintRack
OutputSpreadSheetNonHouse
Else
If OldAccountType = 1 Then
Increment = Increment + 1
PrintRack = Rack
'MsgBox PrintRack
OutputSpreadSheetNonHouse
ElseIf OldAccountType = 2 And Page2 > PreviousPage2 Then
Increment = 25
PrintRack = Rack
OutputSpreadSheetNonHouse
Else
PrintRack = PrintRack & "," & Rack
'MsgBox PrintRack
OutputSpreadSheetNonHouse
End If
End If
'ElseIf OldAccountType = 2 And Page2 = PreviousPage2 Then
'Increment = 25
'PrintRack = Rack
'OutputSpreadSheetNonHouse
Else
If OldAccountType = 2 And Page2 = PreviousPage2 And DayNumber >
OldDayNumber Then
Increment = 26
'PrintRack = Rack
'OutputSpreadSheetNonHouse
End If
Increment = Increment + 1
If OldAccountType = 1 Then
Increment = Increment + 1
PrintRack = Rack
'MsgBox PrintRack
OutputSpreadSheetNonHouse
ElseIf OldAccountType = 2 And Page2 > PreviousPage2 Then
Increment = 26
PrintRack = Rack
OutputSpreadSheetNonHouse
Else
If PreviousRack = "" Then
PrintRack = Rack
'MsgBox PrintRack
OutputSpreadSheetNonHouse
'ElseIf OldAccountType = 2 And Page2 = PreviousPage2 Then
'Increment = 25
'PrintRack = Rack
'OutputSpreadSheetNonHouse
Else
PrintRack = ""
'PrintRack = PrintRack & "," & Rack
PrintRack = PrintRack & Rack
'MsgBox PrintRack
OutputSpreadSheetNonHouse
End If
Page 10
InsertTrackingConvert2ExcelFromAccessOld.txt
End If
End If
Exit Sub
ErrorHandler:
ActiveInFacility1 = False
Resume Next
End Sub
Sub Check4Zones()
LookupColumn (ProdCode)
End Sub
Function MultizonePub(ProdCode)
Select Case ProdCode
Case "ASFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("AshlandFull")
Case "BIFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("BridgewaterFull")
Case "C1FULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("CapeCodderFull")
Case "CGFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("CountryGazetteFull")
Case "HAFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("HarvardFull")
Case "LCFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("TimesCourierFull")
'MsgBox PubZones.Name
Case "NOFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("NorthShoreSundayFull")
Case "RAFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("RandolphFull")
Case "TAFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("TewksburyFull")
Case "WHFULL"
'MsgBox "Finding Column Positions for " & ProdCode
Set PubZones = Sheet6.Range("WhitmanFull")
Case Else
MsgBox "Cannot Find Column Positions for ProdCode"
End Select
End Function
Page 11
InsertTrackingConvert2ExcelFromAccessOld.txt
Sub LoopRange()
Dim c As Range
LookupColumn (ProdCode)
PositionRowHouse
For Each c In PubZones
LayoutCol = c.Value
'MsgBox "LayoutCol= " & LayoutCol
Workbooks(3).Sheets(N).Cells(Increment, LayoutCol).Value = "X"
Next c
End Sub
Sub LoopRangeNonHouse()
Dim c As Range
LookupColumn (ProdCode)
PositionRowNonHouse
For Each c In PubZones
LayoutCol = c.Value
'MsgBox "LayoutCol= " & LayoutCol
Workbooks(3).Sheets(N).Cells(Increment, LayoutCol).Value = "X"
Next c
End Sub
Page 12