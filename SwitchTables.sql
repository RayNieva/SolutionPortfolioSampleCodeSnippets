USE [CNC-FPReports]
GO
/****** Object: StoredProcedure [dbo].[slp_CNC_switch_Tables] Script Date: 10/19/2011 12:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[slp_CNC_switch_Tables]
--Create procedure [dbo].[slp_CNC_switch_Tables2]
(
@xFrom_Date DateTime=null,
@xTo_Date DateTime=null,
@xTitle NVARCHAR(100)=null,
@xPageGroup NVARCHAR(50)=null,
@xClassification NVARCHAR(100)=null,
@xOperatorLogon NVARCHAR(50)=null,
@xTeam NVARCHAR(100)=null,
@actualFromDate datetime=null output,
@actualToDate datetime=null output,
@xSetting NVARCHAR(5)=null
)
as
/*if @CustomerID = ''
set @CustomerID = null */
if @xTitle = ''
set @xTitle=null
if @xTitle = ' '
set @xTitle=null
if @xPageGroup = ''
set @xPageGroup=null
if @xPageGroup = ' '
set @xPageGroup=null
if @xClassification = ''
set @xClassification=null
if @xClassification = ' '
set @xClassification=null
if @xOperatorLogon = ''
set @xOperatorLogon=null
if @xOperatorLogon = ' '
set @xOperatorLogon=null
if @xTeam = ''
set @xTeam=null
if @xTeam = ' '
set @xTeam=null
if @actualFromDate = ''
set @actualFromDate=null
if @actualFromDate = ' '
set @actualFromDate=null
if @actualToDate = ''
set @actualToDate=null
if @actualToDate = ' '
set @actualToDate=null
if @xSetting = ''
set @xsetting=null
if @xSetting = ' '
set @xSetting=null
----------manual query run
/*
declare @xFrom_Date datetime, @xTo_Date datetime, @xTitle NVARCHAR(100), @xPageGroup NVARCHAR(50),
@xClassification NVARCHAR(100), @xOperatorLogon NVARCHAR(50), @xTeam NVARCHAR(100),@actualFromDate datetime,
@actualToDate datetime,
@xSetting NVARCHAR(5)
set @xFrom_Date='6/01/11';
set @xTo_Date='6/01/11';
--set @xTitle='Metrowest Daily News'
--set @xPageGroup=
--set @xClassification=
--set @xOperatorLogon=
--set @xTeam=
set @xSetting='PRD'
*/
-------------------------------------------
--if @xFrom_Date > '5/30/10'
--if @xFrom_Date > dateadd("dd",-30,'09/01/10')
--if @xFrom_Date > dateadd("dd",-30,getdate())Or @xFrom_Date=dateadd("dd",-30,getdate())
--if @xFrom_Date >= dateadd("dd",-35,getdate())
---------------------------------------------------------------------------------------------------------------
/****************************Greater than 35 days less than current date (From)*****************************/
---------------------------------------------------------------------------------------------------------------
IF @xFrom_Date >= dateadd("dd",-35,getdate()) --or @xTo_Date > ("dd",30,'6/1/11')
--or @xFrom_Date=dateadd("dd",30,getdate()))
Begin
--IF @xTo_Date >= dateadd("dd",29,getdate())
---------------------------------------------------------------------------------------------------------------
/****************************Greater than 29 days more than current date (From)********************************/
---------------------------------------------------------------------------------------------------------------
IF @xFrom_Date >= dateadd("dd",29,getdate())
Begin
print 'Use Big Table'
--USE [CNC-FPTEST3]
set @actualFromDate=dbo.DateOnly(@xFrom_Date)
set @actualToDate=dbo.DateOnly(@xTo_Date)
SELECT Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
Title, --5
TitleS, --6
Feature_type, --7
Net_price, --8
Actual_date, --9
InsertDate, --10
Order_ID, --11
Edzone_ID, --12
Pgroup_ID, --13
Class_ID, --14
Style_ID, --15
Size_ID, --16
Colour_ID, --17
Position_ID, --18
Physical_inserts, --19
HJ_pages, --20
HJ_columns, --21
Stop_date, --22
Stop_number, --23
HJ_width, --24
HJ_depth, --25
HJ_natural_depth, --26
Order_Text_ID, --27
Last_insert, --28
Actual_date_1, --29
Actual_date_2, --30
Edzone, --31
EdzoneS, --32
PageGroup, --33
PageGroupS, --34
Classification, --35
ClassificationS, --36
Style, --37
StyleS, --38
Setting, --39
Size, --40
SizeS, --41
Color, --42
ColorS, --43
Position, --44
PositionS, --45
First_insert_date, --46
Last_insert_date, --47
Status, --48
Customer_ID, --49
Sales_Area_ID, --50
Price, --51
Payment_Type_ID, --52
URN_text, --53
URN_number, --54
Creator_ID, --55
Create_time, --56
Update_time, --57
Log_on_name, --58
Short_name, --59
Surname, --60
Forenames, --61
Team_ID, --62
Manager_ID, --63
Team, --64
TeamS, --65
Name, --66
Cust_URN_text, --67
Cust_URN_number, --68
Account_number, --69
Usual_Canvasser_ID, --70
Sequential_number, --71
testSeqNumNull, --72
Product_ID, --73
Section_number, --74
testSectNumNull, --75
Text_sample, --76
Col,
--77
CustNameAcct, --78
Depth, --79
Pos,
--80
AtSize, --81
FullName, --82
Telephone_prefix, --83
Telephone_std, --84
Telephone_number, --85
Telephone_extension, --86
page1, --87
page2, --88
page1 + page2 AS Page --89
--oRec13.page2,
--90
--oRec13.page1 + oRec13.page2 AS Page
--91
--oRec13.Order_Row_ID,
--92
--oRec13.Order_Row_ID,
--93
--oRec13.Order_Row_ID,
--94
FROM testYearlyTable
WHERE ((InsertDate >=
DATEADD(dd, 0, @actualFromDate)) AND (InsertDate <= DATEADD(hh, 23, @actualToDate)))
--WHERE ((InsertDate >=
DATEADD(dd, 0, '8/31/10')) AND (InsertDate <= DATEADD(hh, 23, '8/31/10')))
--WHERE ((InsertDate >=
@xFrom_Date) AND (InsertDate <= DATEADD(hh, 23, @xTo_Date)))
AND
((Title = @xTitle) OR
(@xTitle IS NULL)) AND ((PageGroup =
@xPageGroup) OR
(@xPageGroup IS NULL)) AND
((Classification = @xClassification) OR
(@xClassification IS NULL)) AND
((Log_on_name = @xOperatorLogon) OR
(@xOperatorLogon IS NULL)) AND
((Team = @xTeam) OR
(@xTeam IS NULL)) AND
(Setting='PRD') --
((Setting=@xSetting) OR (@xSetting IS NULL))
Order by InsertDate
End
ELSE
Begin
print 'Use Small Table Based Query'
set
@actualFromDate=dbo.DateOnly(@xFrom_Date)
set
@actualToDate=dbo.DateOnly(@xTo_Date)
SELECT Insert_Date,
--1
Order_Row_ID, --2
Title_ID,
--3
Insert_net_price, --4
Title,
--5
TitleS,
--6
Feature_Type, --7
Net_price,
--8
Actual_date, --9
InsertDate, --10
Order_ID,
--11
Edzone_ID, --12
Pgroup_ID, --13
Class_ID,
--14
Style_ID,
--15
Size_ID,
--16
Colour_ID, --17
Position_ID, --18
Physical_inserts, --19
HJ_pages, --20
HJ_columns, --21
Stop_date, --22
Stop_number, --23
HJ_width,
--24
HJ_depth,
--25
HJ_natural_depth, --26
Order_Text_ID, --27
Last_insert, --28
Actual_date_1, --29
Actual_date_2, --30
Edzone,
--31
EdzoneS,
--32
PageGroup, --33
PageGroupS, --34
Classification, --35
ClassificationS, --36
Style,
--37
StyleS,
--38
Setting,
--39
Size,
--40
SizeS,
--41
Color,
--42
ColorS,
--43
Position,
--44
PositionS,
--45
First_insert_date, --46
Last_insert_date, --47
Status,
--48
Customer_ID, --49
Sales_Area_ID, --50
Price,
--51
Payment_Type_ID, --52
URN_text,
--53
URN_number, --54
Creator_ID, --55
Create_time, --56
Update_Time, --57
Log_on_name, --58
Short_name, --59
Surname,
--60
Forenames, --61
Team_ID,
--62
Manager_ID, --63
Team,
--64
TeamS,
--65
Name,
--66
Cust_URN_text, --67
Cust_URN_number, --68
Account_number, --69
Usual_Canvasser_ID, --70
Sequential_number, --71
testSeqNumNull, --72
Product_ID, --73
Section_number, --74
testSectNumNull, --75
Text_sample, --76
Col,
--77
CustNameAcct, --78
Depth,
--79
Pos,
--80
AtSize,
--81
FullName,
--82
Telephone_prefix, --83
Telephone_std, --84
Telephone_number, --85
Telephone_extension, --86
page1,
--87
page2,
--88
Page,
--89
page2,
--90
Page,
--91
Order_Row_ID, --92
Order_Row_ID, --93
Order_Row_ID --94
FROM testDailyTable
--FROM Detail
WHERE ((InsertDate >=
DATEADD(dd, 0, @actualFromDate)) AND (InsertDate <= DATEADD(hh, 23, @actualToDate)))
--WHERE ((InsertDate >=
DATEADD(dd, 0, '8/31/10')) AND (InsertDate <= DATEADD(hh, 23, '8/31/10')))
--WHERE ((InsertDate >=
@xFrom_Date) AND (InsertDate <= DATEADD(hh, 23, @xTo_Date)))
AND
((Title = @xTitle) OR
(@xTitle IS NULL)) AND ((PageGroup =
@xPageGroup) OR
(@xPageGroup IS NULL)) AND
((Classification = @xClassification) OR
(@xClassification IS NULL)) AND
((Log_on_name = @xOperatorLogon) OR
(@xOperatorLogon IS NULL)) AND
((Team = @xTeam) OR
(@xTeam IS NULL)) AND
(Setting='PRD') --
((Setting=@xSetting) OR (@xSetting IS NULL))
Order by InsertDate
--select * from testDailyTable
End
END
---------------------------------------------------------------------------------------------------------------
/****************************Less than 35 days less than current date**************************************/
---------------------------------------------------------------------------------------------------------------
ELSE
--if @xFrom_Date < dateadd("dd",-30,getdate())
--if @xFrom_Date < dateadd("dd",-30,'6/1/11') --or @xTo_Date > ("dd",30,'6/1/11'))
Begin
print 'Use Big Table'
--USE [CNC-FPTEST3]
set @actualFromDate=dbo.DateOnly(@xFrom_Date)
set @actualToDate=dbo.DateOnly(@xTo_Date)
SELECT Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
Title, --5
TitleS, --6
Feature_type, --7
Net_price, --8
Actual_date, --9
InsertDate, --10
Order_ID, --11
Edzone_ID, --12
Pgroup_ID, --13
Class_ID, --14
Style_ID, --15
Size_ID, --16
Colour_ID, --17
Position_ID, --18
Physical_inserts, --19
HJ_pages, --20
HJ_columns, --21
Stop_date, --22
Stop_number, --23
HJ_width, --24
HJ_depth, --25
HJ_natural_depth, --26
Order_Text_ID, --27
Last_insert, --28
Actual_date_1, --29
Actual_date_2, --30
Edzone, --31
EdzoneS, --32
PageGroup, --33
PageGroupS, --34
Classification, --35
ClassificationS, --36
Style, --37
StyleS, --38
Setting, --39
Size, --40
SizeS, --41
Color, --42
ColorS, --43
Position, --44
PositionS, --45
First_insert_date, --46
Last_insert_date, --47
Status, --48
Customer_ID, --49
Sales_Area_ID, --50
Price, --51
Payment_Type_ID, --52
URN_text, --53
URN_number, --54
Creator_ID, --55
Create_time, --56
Update_time, --57
Log_on_name, --58
Short_name, --59
Surname, --60
Forenames, --61
Team_ID, --62
Manager_ID, --63
Team, --64
TeamS, --65
Name, --66
Cust_URN_text, --67
Cust_URN_number, --68
Account_number, --69
Usual_Canvasser_ID, --70
Sequential_number, --71
testSeqNumNull, --72
Product_ID, --73
Section_number, --74
testSectNumNull, --75
Text_sample, --76
Col, --77
CustNameAcct, --78
Depth, --79
Pos, --80
AtSize, --81
FullName, --82
Telephone_prefix, --83
Telephone_std, --84
Telephone_number, --85
Telephone_extension, --86
page1, --87
page2, --88
page1 + page2 AS Page --89
--oRec13.page2,
--90
--oRec13.page1 + oRec13.page2 AS Page --91
--oRec13.Order_Row_ID, --92
--oRec13.Order_Row_ID, --93
--oRec13.Order_Row_ID,
--94
FROM testYearlyTable
WHERE ((InsertDate >= DATEADD(dd, 0, @actualFromDate))
AND (InsertDate <= DATEADD(hh, 23, @actualToDate)))
--WHERE ((InsertDate >= DATEADD(dd, 0, '8/31/10')) AND
(InsertDate <= DATEADD(hh, 23, '8/31/10')))
--WHERE ((InsertDate >= @xFrom_Date) AND (InsertDate <=
DATEADD(hh, 23, @xTo_Date)))
AND
((Title = @xTitle) OR
(@xTitle IS NULL)) AND ((PageGroup = @xPageGroup) OR
(@xPageGroup IS NULL)) AND ((Classification = @xClassification)
OR
(@xClassification IS NULL)) AND ((Log_on_name =
@xOperatorLogon) OR
(@xOperatorLogon IS NULL)) AND ((Team = @xTeam) OR
(@xTeam IS NULL)) AND
(Setting='PRD') -- ((Setting=@xSetting) OR (@xSetting IS
NULL))
Order by InsertDate
End
---------------------------------------------------------------------------------------------------------------
-----Old stuff for reference below above line
/*
else
--if @xFrom_Date < dateadd("dd",-30,getdate())
if @xTo_Date > ("dd",30,'6/1/11')
Begin
print 'Use Main Permanent Tables'
--USE [CNC-FPTEST3]
set @actualFromDate=dbo.DateOnly(@xFrom_Date)
set @actualToDate=dbo.DateOnly(@xTo_Date)
SELECT Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
Title, --5
TitleS, --6
Feature_type, --7
Net_price, --8
Actual_date, --9
InsertDate, --10
Order_ID, --11
Edzone_ID, --12
Pgroup_ID, --13
Class_ID, --14
Style_ID, --15
Size_ID, --16
Colour_ID, --17
Position_ID, --18
Physical_inserts, --19
HJ_pages, --20
HJ_columns, --21
Stop_date, --22
Stop_number, --23
HJ_width, --24
HJ_depth, --25
HJ_natural_depth, --26
Order_Text_ID, --27
Last_insert, --28
Actual_date_1, --29
Actual_date_2, --30
Edzone, --31
EdzoneS, --32
PageGroup, --33
PageGroupS, --34
Classification, --35
ClassificationS, --36
Style, --37
StyleS, --38
Setting, --39
Size, --40
SizeS, --41
Color, --42
ColorS, --43
Position, --44
PositionS, --45
First_insert_date, --46
Last_insert_date, --47
Status, --48
Customer_ID, --49
Sales_Area_ID, --50
Price, --51
Payment_Type_ID, --52
URN_text, --53
URN_number, --54
Creator_ID, --55
Create_time, --56
Update_time, --57
Log_on_name, --58
Short_name, --59
Surname, --60
Forenames, --61
Team_ID, --62
Manager_ID, --63
Team, --64
TeamS, --65
Name, --66
Cust_URN_text, --67
Cust_URN_number, --68
Account_number, --69
Usual_Canvasser_ID, --70
Sequential_number, --71
testSeqNumNull, --72
Product_ID, --73
Section_number, --74
testSectNumNull, --75
Text_sample, --76
Col, --77
CustNameAcct, --78
Depth, --79
Pos, --80
AtSize, --81
FullName, --82
Telephone_prefix, --83
Telephone_std, --84
Telephone_number, --85
Telephone_extension, --86
page1, --87
page2, --88
page1 + page2 AS Page --89
--oRec13.page2, --90
--oRec13.page1 + oRec13.page2 AS Page --91
--oRec13.Order_Row_ID, --92
--oRec13.Order_Row_ID, --93
--oRec13.Order_Row_ID, --94
FROM testYearlyTable
WHERE ((InsertDate >= DATEADD(dd, 0, @actualFromDate)) AND (InsertDate <=
DATEADD(hh, 23, @actualToDate)))
--WHERE ((InsertDate >= DATEADD(dd, 0, '8/31/10')) AND (InsertDate <= DATEADD(hh, 23, '8/31/10')))
--WHERE ((InsertDate >= @xFrom_Date) AND (InsertDate <= DATEADD(hh, 23,
@xTo_Date)))
AND
((Title = @xTitle) OR
(@xTitle IS NULL)) AND ((PageGroup = @xPageGroup) OR
(@xPageGroup IS NULL)) AND ((Classification = @xClassification) OR
(@xClassification IS NULL)) AND ((Log_on_name = @xOperatorLogon) OR
(@xOperatorLogon IS NULL)) AND ((Team = @xTeam) OR
(@xTeam IS NULL)) AND ((Setting=@xSetting) OR
(@xSetting IS NULL))
Order by InsertDate
End
*/
/*
--Else if @xFrom_Date > dateadd("dd",29,getdate())
Else if @xFrom_Date > dateadd("dd",29,'6/1/11')
Begin
print 'Use Main Permanent Tables'
--USE [CNC-FPTEST3]
set @actualFromDate=dbo.DateOnly(@xFrom_Date)
set @actualToDate=dbo.DateOnly(@xTo_Date)
--DECLARE @return_value int
EXEC --@return_value =
[dbo].[slp_CNC_Order_Extract_Using_CC_SubQueries_w_Planned_Advert_BigTable]
[dbo].[slp_CNC_Order_Extract_Using_CC_SubQueries_w_Planned_Advert_BigTable]
/*@From_Date = @xFrom_Date,
*@To_Date = @xTo_Date,
*/
@From_Date = @actualFromDate,
@To_Date = @actualToDate,
@Title = @xTitle,
@PageGroup = @xPageGroup,
@Classification = @xClassification,
@OperatorLogon = @xOperatorLogon,
@Team = @xTeam,
@Setting=@xSetting
End
*/
