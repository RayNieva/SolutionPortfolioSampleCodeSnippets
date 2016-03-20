USE [CNC-FPReports]
GO
/****** Object: StoredProcedure [dbo].[slp_CNC_Order_Extract_TinyUpdate] Script Date: 10/13/2011 13:03:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
--CREATE PROCEDURE [dbo].[slp_CNC_Order_Extract_TinyUpdate]
ALTER PROCEDURE [dbo].[slp_CNC_Order_Extract_TinyUpdate]
AS
--BEGIN
IF EXISTS (SELECT 1
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE='BASE TABLE'
AND TABLE_NAME='temp_testdailytable1')
Begin
SELECT 'temp_testdailytable1 exists.'
drop table temp_testdailytable1
End
else
Begin
SELECT 'temp_testdailytable1 does not exist.'
goto NextCheck
End
NextCheck:
IF EXISTS (SELECT 1
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE='BASE TABLE'
AND TABLE_NAME='temp_testdailytable2')
Begin
SELECT 'temp_testdailytable2 exists.'
drop table temp_testdailytable2
End
else
Begin
SELECT 'temp_testdailytable2 does not exist.'
goto Main
End
Main:
/*Create base temp_Order_Record_tiny2 table */
IF EXISTS (SELECT 1
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE='BASE TABLE'
AND TABLE_NAME='temp_Order_Record_tiny2')
Begin
SELECT 'temp_Order_Record_tiny2.'
drop table temp_Order_Record_tiny2
SELECT Order_Record.Create_time, Order_Record.Update_time, Order_Record.URN_text,
Order_Record.Status, Order_Record.Order_ID,
Order_Row.Order_Row_ID,
Order_Record.First_insert_date, Order_Record.Last_insert_date, Order_Record.Customer_ID, Order_Record.Sales_Area_ID,
Order_Record.Price, Order_Record.Payment_Type_ID,
Order_Record.URN_number, Order_Record.Creator_ID
INTO temp_Order_Record_tiny2
FROM Order_Record INNER JOIN
Order_Row ON Order_Record.Order_ID =
Order_Row.Order_ID
WHERE (Order_Record.Create_time >= DATEADD(n, - 60, GETDATE())) AND
(Order_Record.Create_time <= GETDATE()) OR
(Order_Record.Update_time >= DATEADD(n, - 60,
GETDATE())) AND (Order_Record.Update_time <= GETDATE())
--select * from temp_Order_Record_tiny2
exec sp_rename 'testdailytable', 'temp_testdailytable1'
------testing zone------------------------
--select * from testdailytable
--select Insert_Date, Order_Row_ID ,max(Create_time)as LatestUpdate from testdailytable
--group by insert_Date, Order_Row_ID
------------------------------------------
--select * into testdailytable from temp_testdailytable
select * into temp_testdailytable2 from temp_testdailytable1
union
/*60 min current slice*/
SELECT
Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
--Create_time,
--Update_time,
--URN_text,
--Sales_Area_ID,
--Order_ID
Title, --5
TitleS, --6
Feature_type, --7
--Feature_ID,
Net_price, --8
--Gross_price,
--Title,
--TitleS,
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
--Stop_date,
--Stop_number,
--HJ_pages,
--HJ_columns,
--HJ_width,
--HJ_depth,
--HJ_natural_depth,
--HJ_lines, Depth,
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
EdZone, --31
EdZoneS, --32
PgGrp, --33
PgGrpS, --34
Classification, --35
Class, --36
Style, --37
StyleS, --38
Setting, --39
Size, --40
SizeS, --41
Color, --42
ColorS, --43
Position, --44
Pos, --45
--Text_sample,
First_insert_date, --46
Last_insert_date, --47
Status, --48
Customer_ID, --49
Sales_Area_ID, --50
Price, --add? --51
Payment_Type_ID, --add? --52
URN_text, --53
URN_number, --54
Creator_ID, --55
Create_time, --56
Update_time, --57
--Title_ID,
Log_on_name, --58
RepCode, --59
Surname, --60
Forenames, --61
--Surname,
Team_ID, --62
Manager_ID, --63
Team, --64
TeamS, --65
Name, --66
Cust_URN_text, --67
Cust_URN_number, --68
--Customer_Account_ID,
--Usual_Canvasser_ID,
Account_number, --69
Usual_Canvasser_ID, --70
Sequential_number, --71
testSeqNumNull, --72
Product_ID, --73
Section_number, --74
--Planned_Rectangle_ID,
testSectNumNull, --75
Text_sample, --76
--Sequential_number,
--Order_Text_ID,
--Section_number,
--testSeqNumNull,
--testSectNumNull,
Col, --77
--page1, page2, (page1 + page2) as Page,
CustNameAcct, --78
--Expr1,
Depth, --79
PosX, --80
AtSize, --81
FullName, --82
Telephone_prefix, --83
Telephone_std, --84
Telephone_number, --85
Telephone_extension, --86
page1, --87
page2, --88
(page1+page2) as Page --89
--Telephone_prefix
FROM
(
SELECT Insert_Date, Order_Row_ID, Insert_net_price, Create_time, Update_time, URN_text,
Sales_Area_ID, Order_ID,
First_insert_date,
Last_insert_date,
Feature_type, Feature_ID, Net_price,
Gross_price, Title, TitleS, Actual_date, InsertDate,
Edzone_ID,Pgroup_ID,Class_ID,Style_ID,Size_ID,Colour_ID,Position_ID,
Stop_date, Stop_number, HJ_pages, HJ_columns, HJ_width, HJ_depth, HJ_natural_depth,
HJ_lines, Depth, Physical_inserts, Last_insert,
Actual_date_1,
Actual_date_2,
EdZone, EdZoneS, PgGrp, PgGrpS,
Classification,
Class,
Style, StyleS, Setting, Size, SizeS, Color, ColorS, Position, Pos,
Text_sample, Status, Customer_ID, URN_number, Creator_ID,
Price, --add?
Payment_Type_ID, --add?
Title_ID, Log_on_name, RepCode, Forenames, Surname, Team_ID,
Manager_ID, Team, TeamS, Name, Cust_URN_text, Cust_URN_number, Customer_Account_ID,
Usual_Canvasser_ID, Account_number,
Product_ID, Planned_Rectangle_ID, Sequential_number, Order_Text_ID, Section_number, testSeqNumNull,
testSectNumNull, Col,
CHAR(64 + testSectNumNull) AS page1, CAST(testSeqNumNull AS char(2)) AS page2, CustNameAcct, PosX,
AtSize, FullName,
Telephone_std, Telephone_number, Telephone_prefix, Telephone_extension
FROM
(
SELECT oRec9.Insert_Date, oRec9.Order_Row_ID, oRec9.Insert_net_price, oRec9.Create_time,
oRec9.Update_time, oRec9.URN_text,
oRec9.Sales_Area_ID, oRec9.Order_ID,
oRec9.First_insert_date,
oRec9.Last_insert_date,
oRec9.Feature_type, oRec9.Feature_ID, oRec9.Net_price, oRec9.Gross_price, oRec9.Title, oRec9.TitleS,
oRec9.Actual_date, oRec9.InsertDate,
oRec9.Edzone_ID,oRec9.Pgroup_ID,oRec9.Class_ID,oRec9.Style_ID,oRec9.Size_ID,oRec9.Colour_ID,oRec9.Position_I
D,--oRec9.Order_Text_ID,
oRec9.Stop_date, oRec9.Stop_number, oRec9.HJ_pages, oRec9.HJ_columns,
oRec9.HJ_width, oRec9.HJ_depth, oRec9.HJ_natural_depth, oRec9.HJ_lines, oRec9.HJ_depth / 2.54 AS
Depth,
oRec9.Physical_inserts,oRec9.Last_insert,
oRec9.Actual_date_1,
oRec9.Actual_date_2,
oRec9.EdZone, oRec9.EdZoneS, oRec9.PgGrp, oRec9.PgGrpS,
oRec9.Classification,
oRec9.Class,
oRec9.Style, oRec9.StyleS,
oRec9.Setting, oRec9.Size, oRec9.SizeS, oRec9.Color, oRec9.ColorS, oRec9.Position, oRec9.Pos,
oRec9.Text_sample,
oRec9.Status, oRec9.Customer_ID, oRec9.URN_number, oRec9.Creator_ID,
oRec9.Price, --add?
oRec9.Payment_Type_ID, --add?
oRec9.Title_ID, oRec9.Log_on_name,
oRec9.RepCode, oRec9.Forenames, oRec9.Surname, oRec9.Team_ID, oRec9.Manager_ID, oRec9.Team,
oRec9.TeamS,
oRec9.Name, oRec9.Cust_URN_text, oRec9.Cust_URN_number, oRec9.Customer_Account_ID,
oRec9.Usual_Canvasser_ID,
oRec9.Account_number, oRec9.Product_ID, oRec9.Planned_Rectangle_ID, oRec9.Sequential_number,
oRec9.Order_Text_ID,
oRec9.Section_number, ISNULL(oRec9.Sequential_number, ' ') AS testSeqNumNull,
ISNULL(oRec9.Section_number, ' ')
AS testSectNumNull, CASE WHEN Feature_Type = 'PCO' THEN Net_price ELSE 0 END AS Col,
oRec9.Name + ' ' + ISNULL(oRec9.Account_number, oRec9.Cust_URN_number) AS CustNameAcct,
CASE WHEN Feature_Type = 'PPO' THEN Net_price ELSE 0 END AS PosX,
oRec9.HJ_columns * oRec9.HJ_depth * (CASE WHEN HJ_pages > 0 THEN HJ_pages ELSE 1 END) AS
AtSize,
oRec9.Forenames + ' ' + oRec9.Surname AS FullName, Operator_Telephone.Telephone_std,
Operator_Telephone.Telephone_number,
Operator_Telephone.Telephone_prefix,Operator_Telephone.Telephone_extension
FROM
(
SELECT
Order_Insert.Insert_Date,
Order_Insert.Order_Row_ID,
Order_Insert.Insert_net_price,
temp_Order_Record_tiny2.Create_time,
temp_Order_Record_tiny2.Update_time,
temp_Order_Record_tiny2.URN_text,
temp_Order_Record_tiny2.Sales_Area_ID,
temp_Order_Record_tiny2.Order_ID,
temp_Order_Record_tiny2.First_insert_date,
temp_Order_Record_tiny2.Last_insert_date,
Order_Insert_Breakdown.Feature_type,
Order_Insert_Breakdown.Feature_ID,
Order_Insert_Breakdown.Net_price,
Order_Insert_Breakdown.Gross_price,
Title_Card.Long_name AS Title,
Title_Card.Short_name AS TitleS,
True_Invoice_Date.Actual_date,
ISNULL(True_Invoice_Date.Actual_date, Order_Insert.Insert_Date) AS InsertDate,
Order_Row.Edzone_ID,Order_Row.Pgroup_ID,Order_Row.Class_ID,Order_Row.Style_ID,Order_Row.Size_ID,Order_Ro
w.Colour_ID,Order_Row.Position_ID,--Order_Row.Order_Text_ID,
Order_Row.Stop_date,
Order_Row.HJ_pages,
Order_Row.HJ_columns,
Order_Row.HJ_width,
Order_Row.HJ_depth,
Order_Row.HJ_natural_depth,
Order_Row.HJ_lines,
Order_Row.Stop_number,
Order_Row.Physical_inserts,
Order_Row.Last_insert,
True_Invoice_Date_1.Actual_date AS Actual_date_1,
True_Invoice_Date_2.Actual_date AS Actual_date_2,
Edzone_Card.Long_name AS EdZone,
Edzone_Card.Short_name AS EdZoneS,
Pgroup_Card.Long_name AS PgGrp,
Pgroup_Card.Short_name AS PgGrpS,
Class_Card.Long_name As Classification,
Class_Card.Short_name As Class,
Style_Card.Long_name AS Style,
Style_Card.Short_name AS StyleS,
Style_Card.Style_type_setting AS Setting,
Size_Card.Long_name AS Size,
Size_Card.Short_name AS SizeS,
Colour_Card.Long_name AS Color,
Colour_Card.Short_name AS ColorS,
Position_Card.Long_name AS Position,
Position_Card.Short_name AS Pos,
Order_Text.Text_sample,
temp_Order_Record_tiny2.Status,
temp_Order_Record_tiny2.Customer_ID,
temp_Order_Record_tiny2.URN_number,
temp_Order_Record_tiny2.Creator_ID,
temp_Order_Record_tiny2.Price, --add?
temp_Order_Record_tiny2.Payment_Type_ID, --add?
Order_Insert.Title_ID,
Operator.Log_on_name,
Operator.Short_name AS RepCode,
Operator.Forenames,
Operator.Surname,
Operator.Team_ID,
Operator.Manager_ID,
Team.Long_name AS Team,
Team.Short_name AS TeamS, Customer.Name,
Customer.URN_text AS Cust_URN_text,
Customer.URN_number AS Cust_URN_number,
Customer.Customer_Account_ID,
Customer.Usual_Canvasser_ID,
Customer_Account.Account_number,
Planned_Advert.Product_ID,
Planned_Advert.Planned_Rectangle_ID,
Planned_Rectangle.Sequential_number,
Order_Text.Order_Text_ID,
temp_Planned_Advert.Section_number
FROM temp_Planned_Advert RIGHT OUTER JOIN
Planned_Rectangle ON temp_Planned_Advert.Sequential_number = Planned_Rectangle.Sequential_number
AND
temp_Planned_Advert.Product_ID = Planned_Rectangle.Product_ID RIGHT OUTER JOIN
Title_Card RIGHT OUTER JOIN
Operator INNER JOIN
Order_Insert_Breakdown INNER JOIN
Order_Insert INNER JOIN
temp_Order_Record_tiny2 ON Order_Insert.Order_Row_ID = temp_Order_Record_tiny2.Order_Row_ID
INNER JOIN
Order_Row ON Order_Insert.Order_Row_ID = Order_Row.Order_Row_ID ON
Order_Insert_Breakdown.Order_Row_ID = Order_Insert.Order_Row_ID AND
Order_Insert_Breakdown.Insert_Date = Order_Insert.Insert_Date INNER JOIN
Edzone_Card ON Order_Row.Edzone_ID = Edzone_Card.Edzone_ID INNER JOIN
Pgroup_Card ON Order_Row.Pgroup_ID = Pgroup_Card.Pgroup_ID INNER JOIN
Class_Card ON Order_Row.Class_ID = Class_Card.Class_ID INNER JOIN
Style_Card ON Order_Row.Style_ID = Style_Card.Style_ID INNER JOIN
Size_Card ON Order_Row.Size_ID = Size_Card.Size_ID INNER JOIN
Colour_Card ON Order_Row.Colour_ID = Colour_Card.Colour_ID INNER JOIN
Position_Card ON Order_Row.Position_ID = Position_Card.Position_ID INNER JOIN
Order_Text ON Order_Row.Order_Text_ID = Order_Text.Order_Text_ID ON
Operator.Operator_ID = temp_Order_Record_tiny2.Creator_ID INNER JOIN
Team ON Operator.Team_ID = Team.Team_ID INNER JOIN
Customer ON temp_Order_Record_tiny2.Customer_ID = Customer.Customer_ID INNER JOIN
Customer_Account ON Customer.Customer_Account_ID = Customer_Account.Customer_Account_ID LEFT
OUTER JOIN
Planned_Advert ON Order_Insert.Order_Row_ID = Planned_Advert.Order_Row_ID AND
Order_Insert.Insert_Date = Planned_Advert.Insert_Date ON Title_Card.Title_ID = Order_Row.Title_ID LEFT
OUTER JOIN
True_Invoice_Date ON Title_Card.Title_ID = True_Invoice_Date.Title_ID AND
Order_Insert.Insert_Date = True_Invoice_Date.Notional_date ON
Planned_Rectangle.Product_ID = Planned_Advert.Product_ID AND
Planned_Rectangle.Planned_Rectangle_ID = Planned_Advert.Planned_Rectangle_ID
LEFT OUTER JOIN
True_Invoice_Date AS True_Invoice_Date_2
ON
Order_row.Title_ID = True_Invoice_Date_2.Title_ID
AND
Order_row.Stop_date = True_Invoice_Date_2.Actual_date
LEFT OUTER JOIN
True_Invoice_Date AS True_Invoice_Date_1
ON
Order_row.Title_ID = True_Invoice_Date_1.Title_ID
AND
Order_row.Last_insert = True_Invoice_Date_1.Notional_date
WHERE (Order_Insert.Insert_Date >= DATEADD(dd, - 36, GETDATE())) AND (Order_Insert.Insert_Date
<= DATEADD(dd, 30,
GETDATE())) AND (temp_Order_Record_tiny2.Status = 'RUN') --AND (Style_Card.Style_type_setting =
'PRD')
) AS oRec9 LEFT OUTER JOIN
Operator_Telephone ON oRec9.Creator_ID = Operator_Telephone.Operator_ID
) AS oRec13
) AS oTopLevel
SELECT Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
Title, --5
TitleS, --6
Feature_Type, --7
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
--Update_time, --57
max(Update_time) as Update_Time, --57
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
--78
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
--90
--91
--92
--93
--94
--Sales_Area.Long_name AS SalesArea, Sales_Area.Short_name AS SalesAreaS, Sales_Area.Description AS
SalesDescription, @From_Date, @To_Date
INTO testDailyTable from temp_testdailytable2
--from temp_testdailytable2 --testDailyTable
group by
Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
Title, --5
TitleS, --6
Feature_Type, --7
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
--Update_time, --57
--max(Update_time) --57
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
--78
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
--page1 + page2 AS
Page --89
--90
--91
--92
--93
--94
order by create_time
--select * from testdailytable
--where URN_text like 'CN1251000%'
--order by URN_text
drop table temp_testdailytable1
drop table temp_testdailytable2
END
ELSE
BEGIN
SELECT 'temp_Order_Record_tiny2 does not exist.'
SELECT Order_Record.Create_time, Order_Record.Update_time, Order_Record.URN_text,
Order_Record.Status, Order_Record.Order_ID,
Order_Row.Order_Row_ID,
Order_Record.First_insert_date, Order_Record.Last_insert_date, Order_Record.Customer_ID, Order_Record.Sales_Area_ID,
Order_Record.Price, Order_Record.Payment_Type_ID,
Order_Record.URN_number, Order_Record.Creator_ID
INTO temp_Order_Record_tiny2
FROM Order_Record INNER JOIN
Order_Row ON Order_Record.Order_ID =
Order_Row.Order_ID
WHERE (Order_Record.Create_time >= DATEADD(n, - 60, GETDATE())) AND
(Order_Record.Create_time <= GETDATE()) OR
(Order_Record.Update_time >= DATEADD(n, - 60,
GETDATE())) AND (Order_Record.Update_time <= GETDATE())
--select * from temp_Order_Record_tiny2
exec sp_rename 'testdailytable', 'temp_testdailytable1'
------testing zone------------------------
--select * from testdailytable
--select Insert_Date, Order_Row_ID ,max(Create_time)as LatestUpdate from testdailytable
--group by insert_Date, Order_Row_ID
------------------------------------------
--select * into testdailytable from temp_testdailytable
select * into temp_testdailytable2 from temp_testdailytable1
union
/*60 min current slice*/
SELECT
Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
--Create_time,
--Update_time,
--URN_text,
--Sales_Area_ID,
--Order_ID
Title, --5
TitleS, --6
Feature_type, --7
--Feature_ID,
Net_price, --8
--Gross_price,
--Title,
--TitleS,
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
--Stop_date,
--Stop_number,
--HJ_pages,
--HJ_columns,
--HJ_width,
--HJ_depth,
--HJ_natural_depth,
--HJ_lines, Depth,
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
EdZone, --31
EdZoneS, --32
PgGrp, --33
PgGrpS, --34
Classification, --35
Class, --36
Style, --37
StyleS, --38
Setting, --39
Size, --40
SizeS, --41
Color, --42
ColorS, --43
Position, --44
Pos, --45
--Text_sample,
First_insert_date, --46
Last_insert_date, --47
Status, --48
Customer_ID, --49
Sales_Area_ID, --50
Price, --add? --51
Payment_Type_ID, --add? --52
URN_text, --53
URN_number, --54
Creator_ID, --55
Create_time, --56
Update_time, --57
--Title_ID,
Log_on_name, --58
RepCode, --59
Surname, --60
Forenames, --61
--Surname,
Team_ID, --62
Manager_ID, --63
Team, --64
TeamS, --65
Name, --66
Cust_URN_text, --67
Cust_URN_number, --68
--Customer_Account_ID,
--Usual_Canvasser_ID,
Account_number, --69
Usual_Canvasser_ID, --70
Sequential_number, --71
testSeqNumNull, --72
Product_ID, --73
Section_number, --74
--Planned_Rectangle_ID,
testSectNumNull, --75
Text_sample, --76
--Sequential_number,
--Order_Text_ID,
--Section_number,
--testSeqNumNull,
--testSectNumNull,
Col, --77
--page1, page2, (page1 + page2) as Page,
CustNameAcct, --78
--Expr1,
Depth, --79
PosX, --80
AtSize, --81
FullName, --82
Telephone_prefix, --83
Telephone_std, --84
Telephone_number, --85
Telephone_extension, --86
page1, --87
page2, --88
(page1+page2) as Page --89
--Telephone_prefix
FROM
(
SELECT Insert_Date, Order_Row_ID, Insert_net_price, Create_time, Update_time, URN_text,
Sales_Area_ID, Order_ID,
First_insert_date,
Last_insert_date,
Feature_type, Feature_ID, Net_price,
Gross_price, Title, TitleS, Actual_date, InsertDate,
Edzone_ID,Pgroup_ID,Class_ID,Style_ID,Size_ID,Colour_ID,Position_ID,
Stop_date, Stop_number, HJ_pages, HJ_columns, HJ_width, HJ_depth, HJ_natural_depth,
HJ_lines, Depth, Physical_inserts, Last_insert,
Actual_date_1,
Actual_date_2,
EdZone, EdZoneS, PgGrp, PgGrpS,
Classification,
Class,
Style, StyleS, Setting, Size, SizeS, Color, ColorS, Position, Pos,
Text_sample, Status, Customer_ID, URN_number, Creator_ID,
Price, --add?
Payment_Type_ID, --add?
Title_ID, Log_on_name, RepCode, Forenames, Surname, Team_ID,
Manager_ID, Team, TeamS, Name, Cust_URN_text, Cust_URN_number, Customer_Account_ID,
Usual_Canvasser_ID, Account_number,
Product_ID, Planned_Rectangle_ID, Sequential_number, Order_Text_ID, Section_number, testSeqNumNull,
testSectNumNull, Col,
CHAR(64 + testSectNumNull) AS page1, CAST(testSeqNumNull AS char(2)) AS page2, CustNameAcct, PosX,
AtSize, FullName,
Telephone_std, Telephone_number, Telephone_prefix, Telephone_extension
FROM
(
SELECT oRec9.Insert_Date, oRec9.Order_Row_ID, oRec9.Insert_net_price, oRec9.Create_time,
oRec9.Update_time, oRec9.URN_text,
oRec9.Sales_Area_ID, oRec9.Order_ID,
oRec9.First_insert_date,
oRec9.Last_insert_date,
oRec9.Feature_type, oRec9.Feature_ID, oRec9.Net_price, oRec9.Gross_price, oRec9.Title, oRec9.TitleS,
oRec9.Actual_date, oRec9.InsertDate,
oRec9.Edzone_ID,oRec9.Pgroup_ID,oRec9.Class_ID,oRec9.Style_ID,oRec9.Size_ID,oRec9.Colour_ID,oRec9.Position_I
D,--oRec9.Order_Text_ID,
oRec9.Stop_date, oRec9.Stop_number, oRec9.HJ_pages, oRec9.HJ_columns,
oRec9.HJ_width, oRec9.HJ_depth, oRec9.HJ_natural_depth, oRec9.HJ_lines, oRec9.HJ_depth / 2.54 AS
Depth,
oRec9.Physical_inserts,oRec9.Last_insert,
oRec9.Actual_date_1,
oRec9.Actual_date_2,
oRec9.EdZone, oRec9.EdZoneS, oRec9.PgGrp, oRec9.PgGrpS,
oRec9.Classification,
oRec9.Class,
oRec9.Style, oRec9.StyleS,
oRec9.Setting, oRec9.Size, oRec9.SizeS, oRec9.Color, oRec9.ColorS, oRec9.Position, oRec9.Pos,
oRec9.Text_sample,
oRec9.Status, oRec9.Customer_ID, oRec9.URN_number, oRec9.Creator_ID,
oRec9.Price, --add?
oRec9.Payment_Type_ID, --add?
oRec9.Title_ID, oRec9.Log_on_name,
oRec9.RepCode, oRec9.Forenames, oRec9.Surname, oRec9.Team_ID, oRec9.Manager_ID, oRec9.Team,
oRec9.TeamS,
oRec9.Name, oRec9.Cust_URN_text, oRec9.Cust_URN_number, oRec9.Customer_Account_ID,
oRec9.Usual_Canvasser_ID,
oRec9.Account_number, oRec9.Product_ID, oRec9.Planned_Rectangle_ID, oRec9.Sequential_number,
oRec9.Order_Text_ID,
oRec9.Section_number, ISNULL(oRec9.Sequential_number, ' ') AS testSeqNumNull,
ISNULL(oRec9.Section_number, ' ')
AS testSectNumNull, CASE WHEN Feature_Type = 'PCO' THEN Net_price ELSE 0 END AS Col,
oRec9.Name + ' ' + ISNULL(oRec9.Account_number, oRec9.Cust_URN_number) AS CustNameAcct,
CASE WHEN Feature_Type = 'PPO' THEN Net_price ELSE 0 END AS PosX,
oRec9.HJ_columns * oRec9.HJ_depth * (CASE WHEN HJ_pages > 0 THEN HJ_pages ELSE 1 END) AS
AtSize,
oRec9.Forenames + ' ' + oRec9.Surname AS FullName, Operator_Telephone.Telephone_std,
Operator_Telephone.Telephone_number,
Operator_Telephone.Telephone_prefix,Operator_Telephone.Telephone_extension
FROM
(
SELECT
Order_Insert.Insert_Date,
Order_Insert.Order_Row_ID,
Order_Insert.Insert_net_price,
temp_Order_Record_tiny2.Create_time,
temp_Order_Record_tiny2.Update_time,
temp_Order_Record_tiny2.URN_text,
temp_Order_Record_tiny2.Sales_Area_ID,
temp_Order_Record_tiny2.Order_ID,
temp_Order_Record_tiny2.First_insert_date,
temp_Order_Record_tiny2.Last_insert_date,
Order_Insert_Breakdown.Feature_type,
Order_Insert_Breakdown.Feature_ID,
Order_Insert_Breakdown.Net_price,
Order_Insert_Breakdown.Gross_price,
Title_Card.Long_name AS Title,
Title_Card.Short_name AS TitleS,
True_Invoice_Date.Actual_date,
ISNULL(True_Invoice_Date.Actual_date, Order_Insert.Insert_Date) AS InsertDate,
Order_Row.Edzone_ID,Order_Row.Pgroup_ID,Order_Row.Class_ID,Order_Row.Style_ID,Order_Row.Size_ID,Order_Ro
w.Colour_ID,Order_Row.Position_ID,--Order_Row.Order_Text_ID,
Order_Row.Stop_date,
Order_Row.HJ_pages,
Order_Row.HJ_columns,
Order_Row.HJ_width,
Order_Row.HJ_depth,
Order_Row.HJ_natural_depth,
Order_Row.HJ_lines,
Order_Row.Stop_number,
Order_Row.Physical_inserts,
Order_Row.Last_insert,
True_Invoice_Date_1.Actual_date AS Actual_date_1,
True_Invoice_Date_2.Actual_date AS Actual_date_2,
Edzone_Card.Long_name AS EdZone,
Edzone_Card.Short_name AS EdZoneS,
Pgroup_Card.Long_name AS PgGrp,
Pgroup_Card.Short_name AS PgGrpS,
Class_Card.Long_name As Classification,
Class_Card.Short_name As Class,
Style_Card.Long_name AS Style,
Style_Card.Short_name AS StyleS,
Style_Card.Style_type_setting AS Setting,
Size_Card.Long_name AS Size,
Size_Card.Short_name AS SizeS,
Colour_Card.Long_name AS Color,
Colour_Card.Short_name AS ColorS,
Position_Card.Long_name AS Position,
Position_Card.Short_name AS Pos,
Order_Text.Text_sample,
temp_Order_Record_tiny2.Status,
temp_Order_Record_tiny2.Customer_ID,
temp_Order_Record_tiny2.URN_number,
temp_Order_Record_tiny2.Creator_ID,
temp_Order_Record_tiny2.Price, --add?
temp_Order_Record_tiny2.Payment_Type_ID, --add?
Order_Insert.Title_ID,
Operator.Log_on_name,
Operator.Short_name AS RepCode,
Operator.Forenames,
Operator.Surname,
Operator.Team_ID,
Operator.Manager_ID,
Team.Long_name AS Team,
Team.Short_name AS TeamS, Customer.Name,
Customer.URN_text AS Cust_URN_text,
Customer.URN_number AS Cust_URN_number,
Customer.Customer_Account_ID,
Customer.Usual_Canvasser_ID,
Customer_Account.Account_number,
Planned_Advert.Product_ID,
Planned_Advert.Planned_Rectangle_ID,
Planned_Rectangle.Sequential_number,
Order_Text.Order_Text_ID,
temp_Planned_Advert.Section_number
FROM temp_Planned_Advert RIGHT OUTER JOIN
Planned_Rectangle ON temp_Planned_Advert.Sequential_number = Planned_Rectangle.Sequential_number
AND
temp_Planned_Advert.Product_ID = Planned_Rectangle.Product_ID RIGHT OUTER JOIN
Title_Card RIGHT OUTER JOIN
Operator INNER JOIN
Order_Insert_Breakdown INNER JOIN
Order_Insert INNER JOIN
temp_Order_Record_tiny2 ON Order_Insert.Order_Row_ID = temp_Order_Record_tiny2.Order_Row_ID
INNER JOIN
Order_Row ON Order_Insert.Order_Row_ID = Order_Row.Order_Row_ID ON
Order_Insert_Breakdown.Order_Row_ID = Order_Insert.Order_Row_ID AND
Order_Insert_Breakdown.Insert_Date = Order_Insert.Insert_Date INNER JOIN
Edzone_Card ON Order_Row.Edzone_ID = Edzone_Card.Edzone_ID INNER JOIN
Pgroup_Card ON Order_Row.Pgroup_ID = Pgroup_Card.Pgroup_ID INNER JOIN
Class_Card ON Order_Row.Class_ID = Class_Card.Class_ID INNER JOIN
Style_Card ON Order_Row.Style_ID = Style_Card.Style_ID INNER JOIN
Size_Card ON Order_Row.Size_ID = Size_Card.Size_ID INNER JOIN
Colour_Card ON Order_Row.Colour_ID = Colour_Card.Colour_ID INNER JOIN
Position_Card ON Order_Row.Position_ID = Position_Card.Position_ID INNER JOIN
Order_Text ON Order_Row.Order_Text_ID = Order_Text.Order_Text_ID ON
Operator.Operator_ID = temp_Order_Record_tiny2.Creator_ID INNER JOIN
Team ON Operator.Team_ID = Team.Team_ID INNER JOIN
Customer ON temp_Order_Record_tiny2.Customer_ID = Customer.Customer_ID INNER JOIN
Customer_Account ON Customer.Customer_Account_ID = Customer_Account.Customer_Account_ID LEFT
OUTER JOIN
Planned_Advert ON Order_Insert.Order_Row_ID = Planned_Advert.Order_Row_ID AND
Order_Insert.Insert_Date = Planned_Advert.Insert_Date ON Title_Card.Title_ID = Order_Row.Title_ID LEFT
OUTER JOIN
True_Invoice_Date ON Title_Card.Title_ID = True_Invoice_Date.Title_ID AND
Order_Insert.Insert_Date = True_Invoice_Date.Notional_date ON
Planned_Rectangle.Product_ID = Planned_Advert.Product_ID AND
Planned_Rectangle.Planned_Rectangle_ID = Planned_Advert.Planned_Rectangle_ID
LEFT OUTER JOIN
True_Invoice_Date AS True_Invoice_Date_2
ON
Order_row.Title_ID = True_Invoice_Date_2.Title_ID
AND
Order_row.Stop_date = True_Invoice_Date_2.Actual_date
LEFT OUTER JOIN
True_Invoice_Date AS True_Invoice_Date_1
ON
Order_row.Title_ID = True_Invoice_Date_1.Title_ID
AND
Order_row.Last_insert = True_Invoice_Date_1.Notional_date
WHERE (Order_Insert.Insert_Date >= DATEADD(dd, - 36, GETDATE())) AND (Order_Insert.Insert_Date
<= DATEADD(dd, 30,
GETDATE())) AND (temp_Order_Record_tiny2.Status = 'RUN') --AND (Style_Card.Style_type_setting =
'PRD')
) AS oRec9 LEFT OUTER JOIN
Operator_Telephone ON oRec9.Creator_ID = Operator_Telephone.Operator_ID
) AS oRec13
) AS oTopLevel
SELECT Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
Title, --5
TitleS, --6
Feature_Type, --7
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
--Update_time, --57
max(Update_time) as Update_Time, --57
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
--78
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
--90
--91
--92
--93
--94
--Sales_Area.Long_name AS SalesArea, Sales_Area.Short_name AS SalesAreaS, Sales_Area.Description AS
SalesDescription, @From_Date, @To_Date
INTO testDailyTable from temp_testdailytable2
--from temp_testdailytable2 --testDailyTable
group by
Insert_Date, --1
Order_Row_ID, --2
Title_ID, --3
Insert_net_price, --4
Title, --5
TitleS, --6
Feature_Type, --7
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
--Update_time, --57
--max(Update_time) --57
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
--78
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
--page1 + page2 AS
Page --89
--90
--91
--92
--93
--94
order by create_time
--select * from testdailytable
--where URN_text like 'CN1251000%'
--order by URN_text
drop table temp_testdailytable1
drop table temp_testdailytable2
END
