'InsertTrackingConvert2ExcelFromAccess

'=======================================================
Private Sub Command13_Click()
On Error GoTo Err_Command13_Click
'Dim stDocName As String
'stDocName = "MacroTest4Transfer2XLWeekliesFramingham"
'DoCmd.RunMacro stDocName
DoCmd.RunMacro "Run Schedules"
DoCmd.OpenQuery "qmakTemplateRow&ColumnsmodWeekliesFramingham"
DoCmd.OpenQuery "qappendWeekliesREPORTTESTX2modFramingham"
'DoCmd.OpenQuery "WeekliesSchedule2XDummyRowsFramingham-1"
'DoCmd.OpenQuery "WeekliesSchedule2XDummyRowsFramingham-2"
'DoCmd.OpenQuery "WeekliesSchedule2XDummyRowsFramingham-3"
'DoCmd.Close acQuery, "WeekliesSchedule2XDummyRowsFramingham-3"
'DoCmd.Close acQuery, "WeekliesSchedule2XDummyRowsFramingham-2"
'DoCmd.Close acQuery, "WeekliesSchedule2XDummyRowsFramingham-1"
DoCmd.RunMacro "MacroTest4Transfer2XLWeekliesFramingham"
Exit_Command13_Click:
Exit Sub
Err_Command13_Click:
MsgBox Err.Description
Resume Exit_Command13_Click
End Sub

