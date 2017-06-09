/*****This File while impressively long was quite easy to create using the power of automatic code generation via the 
SQL Designer built into SQL Server and is essentially continuously nested sub-queries to ultimately produce a very large table.
rather than using MIles recommendation of complex joins to extract report data and relying on SQL Server to "find its way" we
force it to produce simple joins cascading to the next created table to improve performance*****/
USE [CNC-FPReports]
GO
/****** Object: StoredProcedure [dbo].[slp_CNC_Order_Extract_Using_CC_SubQueries_w_Planned_Advert] Script Date:
08/11/2011 09:28:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[slp_CNC_Order_Extract_Using_CC_SubQueries_w_Planned_Advert]
/*( @Title NVARCHAR(100), @PageGroup NVARCHAR(50),
@Classification NVARCHAR(100), @OperatorLogon NVARCHAR(50), @Team NVARCHAR(100))*/
as
drop table testDailyTable
Declare @From_Date DateTime, @To_Date DateTime, @Title NVARCHAR(100), @PageGroup NVARCHAR(50), @Classification
NVARCHAR(100),
@OperatorLogon NVARCHAR(50), @Team NVARCHAR(100)
--set @From_Date=dateadd(dd,-36,'6-1-11')
set @From_Date=dateadd(dd,-36,getdate())
--set @To_Date=dateadd(dd,30,'6-1-11')
set @To_Date=dateadd(dd,30,getdate())
SELECT oRec13.Insert_Date, --1
oRec13.Order_Row_ID, --2
oRec13.Title_ID, --3
oRec13.Insert_net_price, --4
oRec13.Title, --5
oRec13.TitleS, --6
oRec13.Feature_Type, --7
oRec13.Net_price, --8
oRec13.Actual_date, --9
oRec13.InsertDate, --10
oRec13.Order_ID, --11
oRec13.Edzone_ID, --12
oRec13.Pgroup_ID, --13
oRec13.Class_ID, --14
oRec13.Style_ID, --15
oRec13.Size_ID, --16
oRec13.Colour_ID, --17
oRec13.Position_ID, --18
oRec13.Physical_inserts, --19
oRec13.HJ_pages, --20
oRec13.HJ_columns, --21
oRec13.Stop_date, --22
oRec13.Stop_number, --23
oRec13.HJ_width, --24
oRec13.HJ_depth, --25
oRec13.HJ_natural_depth, --26
oRec13.Order_Text_ID, --27
oRec13.Last_insert, --28
oRec13.Actual_date_1, --29
oRec13.Actual_date_2, --30
oRec13.Edzone, --31
oRec13.EdzoneS, --32
oRec13.PageGroup, --33
oRec13.PageGroupS, --34
oRec13.Classification, --35
oRec13.ClassificationS, --36
oRec13.Style, --37
oRec13.StyleS, --38
oRec13.Setting, --39
oRec13.Size, --40
oRec13.SizeS, --41
oRec13.Color, --42
oRec13.ColorS, --43
oRec13.Position, --44
oRec13.PositionS, --45
oRec13.First_insert_date, --46
oRec13.Last_insert_date, --47
oRec13.Status, --48
oRec13.Customer_ID, --49
oRec13.Sales_Area_ID, --50
oRec13.Price, --51
oRec13.Payment_Type_ID, --52
oRec13.URN_text, --53
oRec13.URN_number, --54
oRec13.Creator_ID, --55
oRec13.Create_time, --56
oRec13.Update_time, --57
oRec13.Log_on_name, --58
oRec13.Short_name, --59
oRec13.Surname, --60
oRec13.Forenames, --61
oRec13.Team_ID, --62
oRec13.Manager_ID, --63
oRec13.Team, --64
oRec13.TeamS, --65
oRec13.Name, --66
oRec13.Cust_URN_text, --67
oRec13.Cust_URN_number, --68
oRec13.Account_number, --69
oRec13.Usual_Canvasser_ID, --70
oRec13.Sequential_number, --71
oRec13.testSeqNumNull, --72
oRec13.Product_ID, --73
oRec13.Section_number, --74
oRec13.testSectNumNull, --75
oRec13.Text_sample, --76
oRec13.Col, --77
--78
oRec13.CustNameAcct, --78
oRec13.Depth, --79
oRec13.Pos, --80
oRec13.AtSize, --81
oRec13.FullName, --82
oRec13.Telephone_prefix, --83
oRec13.Telephone_std, --84
oRec13.Telephone_number, --85
oRec13.Telephone_extension, --86
oRec13.page1, --87
oRec13.page2, --88
oRec13.page1 + oRec13.page2 AS Page --89
--90
--91
--92
--93
--94
--Sales_Area.Long_name AS SalesArea, Sales_Area.Short_name AS SalesAreaS, Sales_Area.Description AS SalesDescription,
@From_Date, @To_Date
INTO testDailyTable
FROM
(
/*
Declare @From_Date DateTime, @To_Date DateTime, @Title NVARCHAR(100), @PageGroup NVARCHAR(50), @Classification
NVARCHAR(100),
@OperatorLogon NVARCHAR(50), @Team NVARCHAR(100)
set @From_Date=dateadd(dd,-30,'6-1-11')
set @To_Date=dateadd(dd,30,'6-1-11')
set @Title='Milford Daily News'
*/
--set @Team='Milford Sales'
SELECT Insert_Date, Order_Row_ID, Title_ID, Insert_net_price, Title, TitleS, Feature_Type, Net_price, Actual_date,
InsertDate, Order_ID, Edzone_ID,
Pgroup_ID, Class_ID, Style_ID, Size_ID, Colour_ID, Position_ID, Physical_inserts, HJ_pages, HJ_columns, Stop_date,
Stop_number,
HJ_width, HJ_depth, HJ_natural_depth, Order_Text_ID, Last_insert, Actual_date_1, Actual_date_2, Edzone, EdzoneS, PageGroup,
PageGroupS, Classification, ClassificationS, Style, StyleS, Setting, Size, SizeS, Color, ColorS, Position, PositionS,
First_insert_date,
Last_insert_date, Status, Customer_ID, Sales_Area_ID, Price, Payment_Type_ID, URN_text, URN_number, Creator_ID,
Create_time,
Update_time,
Log_on_name, Short_name, Surname, Forenames, Team_ID, Manager_ID, Team, TeamS, Name, Cust_URN_text,
Cust_URN_number,
Account_number, Usual_Canvasser_ID, Sequential_number, testSeqNumNull, Product_ID, Section_number, testSectNumNull,
Text_sample,
Col, CustNameAcct, Depth, Pos, AtSize, FullName, Telephone_prefix, Telephone_std, Telephone_number, Telephone_extension,
CHAR(64 + testSectNumNull) AS page1, CAST(testSeqNumNull AS char(2)) AS page2
FROM
(
SELECT oRec11.Insert_Date, oRec11.Order_Row_ID, oRec11.Title_ID, oRec11.Insert_net_price, oRec11.Title,
oRec11.TitleS,
oRec11.Feature_Type, oRec11.Net_price, oRec11.Actual_date, oRec11.InsertDate, oRec11.Order_ID, oRec11.Edzone_ID,
oRec11.Pgroup_ID, oRec11.Class_ID, oRec11.Style_ID, oRec11.Size_ID, oRec11.Colour_ID, oRec11.Position_ID,
oRec11.Physical_inserts, oRec11.HJ_pages, oRec11.HJ_columns, oRec11.Stop_date, oRec11.Stop_number, oRec11.HJ_width,
oRec11.HJ_depth, oRec11.HJ_natural_depth, oRec11.Order_Text_ID, oRec11.Last_insert, oRec11.Actual_date_1,
oRec11.Actual_date_2, oRec11.Edzone, oRec11.EdzoneS, oRec11.PageGroup, oRec11.PageGroupS, oRec11.Classification,
oRec11.ClassificationS, oRec11.Style, oRec11.StyleS, oRec11.Setting, oRec11.Size, oRec11.SizeS, oRec11.Color,
oRec11.ColorS, oRec11.Position, oRec11.PositionS, oRec11.First_insert_date, oRec11.Last_insert_date, oRec11.Status,
oRec11.Customer_ID, oRec11.Sales_Area_ID, oRec11.Price, oRec11.Payment_Type_ID, oRec11.URN_text,
oRec11.URN_number, oRec11.Creator_ID,
oRec11.Create_time,
oRec11.Update_time,
oRec11.Log_on_name, oRec11.Short_name, oRec11.Surname,
oRec11.Forenames, oRec11.Team_ID, oRec11.Manager_ID, oRec11.Team, oRec11.TeamS, oRec11.Name,
oRec11.Cust_URN_text, oRec11.Cust_URN_number, oRec11.Account_number, oRec11.Usual_Canvasser_ID,
oRec11.Sequential_number, ISNULL(oRec11.Sequential_number, ' ') AS testSeqNumNull, oRec11.Product_ID,
oRec11.Section_number, ISNULL(oRec11.Section_number, ' ') AS testSectNumNull, oRec11.Text_sample, oRec11.Col,
oRec11.CustNameAcct, oRec11.Depth, oRec11.Pos,
oRec11.HJ_columns * oRec11.Depth * (CASE WHEN HJ_pages > 0 THEN HJ_pages ELSE 1 END) AS AtSize,
oRec11.Forenames + ' ' + oRec11.Surname AS FullName, Operator_Telephone.Telephone_prefix,
Operator_Telephone.Telephone_std, Operator_Telephone.Telephone_number, Operator_Telephone.Telephone_extension
FROM
(
SELECT oRec10.Insert_Date, oRec10.Order_Row_ID, oRec10.Title_ID, oRec10.Insert_net_price, oRec10.Title,
oRec10.TitleS,
oRec10.Feature_Type, oRec10.Net_price, oRec10.Actual_date, oRec10.InsertDate, oRec10.Order_ID,
oRec10.Edzone_ID, oRec10.Pgroup_ID, oRec10.Class_ID, oRec10.Style_ID, oRec10.Size_ID, oRec10.Colour_ID,
oRec10.Position_ID, oRec10.Physical_inserts, oRec10.HJ_pages, oRec10.HJ_columns, oRec10.Stop_date,
oRec10.Stop_number, oRec10.HJ_width, oRec10.HJ_depth, oRec10.HJ_natural_depth, oRec10.Order_Text_ID,
oRec10.Last_insert,
oRec10.Actual_date_1, oRec10.Actual_date_2, oRec10.Edzone, oRec10.EdzoneS,
oRec10.PageGroup, oRec10.PageGroupS, oRec10.Classification, oRec10.ClassificationS, oRec10.Style,
oRec10.StyleS, oRec10.Setting, oRec10.Size, oRec10.SizeS, oRec10.Color, oRec10.ColorS, oRec10.Position,
oRec10.PositionS, oRec10.First_insert_date,
oRec10.Last_insert_date,
oRec10.Status, oRec10.Customer_ID,
oRec10.Sales_Area_ID, oRec10.Price, oRec10.Payment_Type_ID, oRec10.URN_text, oRec10.URN_number,
oRec10.Creator_ID,
oRec10.Create_time,
oRec10.Update_time,
oRec10.Log_on_name, oRec10.Short_name, oRec10.Surname,
oRec10.Forenames, oRec10.Team_ID, oRec10.Manager_ID, oRec10.Team, oRec10.TeamS, oRec10.Name,
oRec10.Cust_URN_text, oRec10.Cust_URN_number, oRec10.Account_number, oRec10.Usual_Canvasser_ID,
oRec10.Sequential_number, oRec10.Product_ID, oRec10.Section_number, Order_Text.Text_sample,
CASE WHEN oRec10.Feature_Type = 'PCO' THEN oRec10.Net_price ELSE 0 END AS Col,
oRec10.Name + ' ' + ISNULL(oRec10.Account_number, oRec10.Cust_URN_number) AS CustNameAcct,
oRec10.HJ_depth / 2.54 AS Depth,
CASE WHEN oRec10.Feature_Type = 'PPO' THEN oRec10.Net_price ELSE 0 END AS Pos
FROM
(
SELECT oRec9.Insert_Date, oRec9.Order_Row_ID, oRec9.Title_ID, oRec9.Insert_net_price, oRec9.Title,
oRec9.TitleS, oRec9.Feature_Type, oRec9.Net_price, oRec9.Actual_date, oRec9.InsertDate,
oRec9.Order_ID, oRec9.Edzone_ID, oRec9.Pgroup_ID, oRec9.Class_ID, oRec9.Style_ID, oRec9.Size_ID,
oRec9.Colour_ID, oRec9.Position_ID, oRec9.Physical_inserts, oRec9.HJ_pages, oRec9.HJ_columns,
oRec9.Stop_date, oRec9.Stop_number, oRec9.HJ_width, oRec9.HJ_depth, oRec9.HJ_natural_depth,
oRec9.Order_Text_ID, oRec9.Last_insert,
--oRec9.Order_ID AS Expr1,
oRec9.Actual_date_1,
oRec9.Actual_date_2, oRec9.Edzone, oRec9.EdzoneS, oRec9.PageGroup, oRec9.PageGroupS,
oRec9.Classification, oRec9.ClassificationS, oRec9.Style, oRec9.StyleS, oRec9.Setting, oRec9.Size,
oRec9.SizeS, oRec9.Color, oRec9.ColorS, oRec9.Position, oRec9.PositionS, oRec9.First_insert_date,
oRec9.Last_insert_date,
oRec9.Status, oRec9.Customer_ID, oRec9.Sales_Area_ID, oRec9.Price,
oRec9.Payment_Type_ID, oRec9.URN_text, oRec9.URN_number, oRec9.Creator_ID,
oRec9.Create_time,
oRec9.Update_time,
oRec9.Log_on_name, oRec9.Short_name, oRec9.Surname, oRec9.Forenames, oRec9.Team_ID,
oRec9.Manager_ID, oRec9.Team, oRec9.TeamS, oRec9.Name, oRec9.Cust_URN_text,
oRec9.Cust_URN_number, oRec9.Account_number, oRec9.Usual_Canvasser_ID,
oRec9.Sequential_number, oRec9.Product_ID, temp_Planned_Advert.Section_number
FROM
(
SELECT oRec8.Insert_Date, oRec8.Order_Row_ID, oRec8.Title_ID, oRec8.Insert_net_price, oRec8.Title,
oRec8.TitleS, oRec8.Feature_Type, oRec8.Net_price, oRec8.Actual_date, oRec8.InsertDate,
oRec8.Order_ID, oRec8.Edzone_ID, oRec8.Pgroup_ID, oRec8.Class_ID, oRec8.Style_ID,
oRec8.Size_ID, oRec8.Colour_ID, oRec8.Position_ID, oRec8.Physical_inserts,
oRec8.HJ_pages, oRec8.HJ_columns, oRec8.Stop_date, oRec8.Stop_number, oRec8.HJ_width,
oRec8.HJ_depth, oRec8.HJ_natural_depth, oRec8.Order_Text_ID, oRec8.Last_insert,
--oRec8.Expr1,
oRec8.Actual_date_1, oRec8.Actual_date_2, oRec8.Edzone, oRec8.EdzoneS,
oRec8.PageGroup, oRec8.PageGroupS, oRec8.Classification, oRec8.ClassificationS,
oRec8.Style, oRec8.StyleS, oRec8.Setting, oRec8.Size, oRec8.SizeS, oRec8.Color,
oRec8.ColorS, oRec8.Position, oRec8.PositionS, oRec8.First_insert_date,
oRec8.Last_insert_date,
--oRec8.Expr2,
oRec8.Status, oRec8.Customer_ID,
oRec8.Sales_Area_ID, oRec8.Price, oRec8.Payment_Type_ID, oRec8.URN_text,
oRec8.URN_number, oRec8.Creator_ID,
oRec8.Create_time,
oRec8.Update_time,
oRec8.Log_on_name,
oRec8.Short_name, oRec8.Surname, oRec8.Forenames, oRec8.Team_ID, oRec8.Manager_ID,
oRec8.Team, oRec8.TeamS, oRec8.Name, oRec8.Cust_URN_text, oRec8.Cust_URN_number,
oRec8.Account_number, oRec8.Usual_Canvasser_ID, Planned_Rectangle.Sequential_number,
Planned_Rectangle.Product_ID
FROM Planned_Rectangle
RIGHT OUTER JOIN
Planned_Advert ON Planned_Rectangle.Product_ID = Planned_Advert.Product_ID AND
Planned_Rectangle.Planned_Rectangle_ID = Planned_Advert.Planned_Rectangle_ID
RIGHT OUTER JOIN
(
SELECT oRec7.Insert_Date, oRec7.Order_Row_ID, oRec7.Title_ID, oRec7.Insert_net_price,
oRec7.Title, oRec7.TitleS, oRec7.Feature_Type, oRec7.Net_price,
oRec7.Actual_date, oRec7.InsertDate, oRec7.Order_ID, oRec7.Edzone_ID,
oRec7.Pgroup_ID, oRec7.Class_ID, oRec7.Style_ID, oRec7.Size_ID,
oRec7.Colour_ID, oRec7.Position_ID, oRec7.Physical_inserts, oRec7.HJ_pages,
oRec7.HJ_columns, oRec7.Stop_date, oRec7.Stop_number, oRec7.HJ_width,
oRec7.HJ_depth, oRec7.HJ_natural_depth, oRec7.Order_Text_ID,
oRec7.Last_insert,
--oRec7.Expr1,
oRec7.Actual_date_1, oRec7.Actual_date_2,
oRec7.Edzone, oRec7.EdzoneS, oRec7.PageGroup, oRec7.PageGroupS,
oRec7.Classification, oRec7.ClassificationS, oRec7.Style, oRec7.StyleS,
oRec7.Setting, oRec7.Size, oRec7.SizeS, oRec7.Color, oRec7.ColorS,
oRec7.Position, oRec7.PositionS, oRec7.First_insert_date,
oRec7.Last_insert_date,
--oRec7.Expr2,
oRec7.Status, oRec7.Customer_ID,
oRec7.Sales_Area_ID, oRec7.Price, oRec7.Payment_Type_ID, oRec7.URN_text,
oRec7.URN_number, oRec7.Creator_ID,
oRec7.Create_time,
oRec7.Update_time,
oRec7.Log_on_name,
oRec7.Short_name, oRec7.Surname, oRec7.Forenames, oRec7.Team_ID,
oRec7.Manager_ID, oRec7.Team, oRec7.TeamS, Customer.Name,
Customer.URN_text AS Cust_URN_text,
Customer.URN_number AS Cust_URN_number,
Customer_Account.Account_number, Customer.Usual_Canvasser_ID
FROM
(
/*
Declare @From_Date DateTime, @To_Date DateTime, @Title NVARCHAR(100), @PageGroup NVARCHAR(50), @Classification
NVARCHAR(100),
@OperatorLogon NVARCHAR(50), @Team NVARCHAR(100)
set @From_Date=dateadd(dd,-30,'6-1-11')
set @To_Date=dateadd(dd,30,'6-1-11')
set @Title='Milford Daily News'
*/
--set @Team='Milford Sales'
SELECT oRec6.Insert_Date, oRec6.Order_Row_ID, oRec6.Title_ID,
oRec6.Insert_net_price, oRec6.Title, oRec6.TitleS,
oRec6.Feature_Type, oRec6.Net_price, oRec6.Actual_date,
oRec6.InsertDate, oRec6.Order_ID, oRec6.Edzone_ID,
oRec6.Pgroup_ID, oRec6.Class_ID, oRec6.Style_ID, oRec6.Size_ID,
oRec6.Colour_ID, oRec6.Position_ID, oRec6.Physical_inserts,
oRec6.HJ_pages, oRec6.HJ_columns, oRec6.Stop_date,
oRec6.Stop_number, oRec6.HJ_width, oRec6.HJ_depth,
oRec6.HJ_natural_depth, oRec6.Order_Text_ID, oRec6.Last_insert,
--oRec6.Expr1,
oRec6.Actual_date_1, oRec6.Actual_date_2,
oRec6.Edzone, oRec6.EdzoneS, oRec6.PageGroup,
oRec6.PageGroupS, oRec6.Classification, oRec6.ClassificationS,
oRec6.Style, oRec6.StyleS, oRec6.Setting, oRec6.Size, oRec6.SizeS,
oRec6.Color, oRec6.ColorS, oRec6.Position, oRec6.PositionS,
oRec6.First_insert_date, oRec6.Last_insert_date,
--oRec6.Expr2,
oRec6.Status, oRec6.Customer_ID, oRec6.Sales_Area_ID, oRec6.Price,
oRec6.Payment_Type_ID, oRec6.URN_text, oRec6.URN_number,
oRec6.Creator_ID, oRec6.Create_time,
oRec6.Update_time,
oRec6.Log_on_name,
oRec6.Short_name, oRec6.Surname, oRec6.Forenames,
oRec6.Team_ID, oRec6.Manager_ID, Team.Long_name AS Team,
Team.Short_name AS TeamS
FROM
(
/*
Declare @From_Date DateTime, @To_Date DateTime, @Title NVARCHAR(100), @PageGroup NVARCHAR(50), @Classification
NVARCHAR(100),
@OperatorLogon NVARCHAR(50), @Team NVARCHAR(100)
set @From_Date=dateadd(dd,-30,'6-1-11')
set @To_Date=dateadd(dd,30,'6-1-11')
set @Title='Milford Daily News'
*/
--set @Team='Milford Sales'
SELECT oRec5.Insert_Date, oRec5.Order_Row_ID, oRec5.Title_ID,
oRec5.Insert_net_price, oRec5.Title, oRec5.TitleS,
oRec5.Feature_Type, oRec5.Net_price, oRec5.Actual_date,
oRec5.InsertDate, oRec5.Order_ID, oRec5.Edzone_ID,
oRec5.Pgroup_ID, oRec5.Class_ID, oRec5.Style_ID,
oRec5.Size_ID, oRec5.Colour_ID, oRec5.Position_ID,
oRec5.Physical_inserts, oRec5.HJ_pages,
oRec5.HJ_columns, oRec5.Stop_date, oRec5.Stop_number,
oRec5.HJ_width, oRec5.HJ_depth, oRec5.HJ_natural_depth,
oRec5.Order_Text_ID, oRec5.Last_insert,
--oRec5.Expr1,
oRec5.Actual_date_1, oRec5.Actual_date_2, oRec5.Edzone,
oRec5.EdzoneS, oRec5.PageGroup, oRec5.PageGroupS,
oRec5.Classification, oRec5.ClassificationS, oRec5.Style,
oRec5.StyleS, oRec5.Setting, oRec5.Size, oRec5.SizeS,
oRec5.Color, oRec5.ColorS, oRec5.Position,
oRec5.PositionS, oRec5.First_insert_date,
oRec5.Last_insert_date,
--oRec5.Expr2,
oRec5.Status,
oRec5.Customer_ID, oRec5.Sales_Area_ID, oRec5.Price,
oRec5.Payment_Type_ID, oRec5.URN_text,
oRec5.URN_number, oRec5.Creator_ID,
oRec5.Create_time,
oRec5.Update_time,
Operator.Log_on_name, Operator.Short_name,
Operator.Surname, Operator.Forenames, Operator.Team_ID,
Operator.Manager_ID
FROM
(
/*
Declare @From_Date DateTime, @To_Date DateTime, @Title NVARCHAR(100), @PageGroup NVARCHAR(50), @Classification
NVARCHAR(100),
@OperatorLogon NVARCHAR(50), @Team NVARCHAR(100)
set @From_Date=dateadd(dd,-30,'6-1-11')
set @To_Date=dateadd(dd,30,'6-1-11')
set @Title='Milford Daily News'
*/
SELECT oRec4.Insert_Date, oRec4.Order_Row_ID,
oRec4.Title_ID, oRec4.Insert_net_price,
oRec4.Title, oRec4.TitleS, oRec4.Feature_Type,
oRec4.Net_price, oRec4.Actual_date,
oRec4.InsertDate, oRec4.Order_ID,
oRec4.Edzone_ID, oRec4.Pgroup_ID,
oRec4.Class_ID, oRec4.Style_ID,
oRec4.Size_ID, oRec4.Colour_ID,
oRec4.Position_ID, oRec4.Physical_inserts,
oRec4.HJ_pages, oRec4.HJ_columns,
oRec4.Stop_date, oRec4.Stop_number,
oRec4.HJ_width, oRec4.HJ_depth,
oRec4.HJ_natural_depth, oRec4.Order_Text_ID,
oRec4.Last_insert,
--oRec4.Expr1,
oRec4.Actual_date_1, oRec4.Actual_date_2,
oRec4.Edzone, oRec4.EdzoneS,
oRec4.PageGroup, oRec4.PageGroupS,
oRec4.Classification, oRec4.ClassificationS,
oRec4.Style, oRec4.StyleS, oRec4.Setting,
oRec4.Size, oRec4.SizeS, oRec4.Color,
oRec4.ColorS, oRec4.Position, oRec4.PositionS,
temp_Order_Record.First_insert_date,
temp_Order_Record.Last_insert_date,
--temp_Order_Record.Order_ID AS Expr2,
temp_Order_Record.Status,
temp_Order_Record.Customer_ID,
temp_Order_Record.Sales_Area_ID,
temp_Order_Record.Price,
temp_Order_Record.Payment_Type_ID,
temp_Order_Record.URN_text,
temp_Order_Record.URN_number,
temp_Order_Record.Creator_ID,
temp_Order_Record.Create_time,
temp_Order_Record.Update_time
FROM
(
SELECT oRow3.Insert_Date,
oRow3.Order_Row_ID,
oRow3.Title_ID,
oRow3.Insert_net_price, oRow3.Title,
oRow3.TitleS, oRow3.Feature_Type,
oRow3.Net_price, oRow3.Actual_date,
oRow3.InsertDate, oRow3.Order_ID,
oRow3.Edzone_ID,
oRow3.Pgroup_ID, oRow3.Class_ID,
oRow3.Style_ID, oRow3.Size_ID,
oRow3.Colour_ID,
oRow3.Position_ID,
oRow3.Physical_inserts,
oRow3.HJ_pages,
oRow3.HJ_columns,
oRow3.Stop_date,
oRow3.Stop_number,
oRow3.HJ_width, oRow3.HJ_depth,
oRow3.HJ_natural_depth,
oRow3.Order_Text_ID,
oRow3.Last_insert,
--oRow3.Order_ID AS Expr1,
True_Invoice_Date_1.Actual_date AS Actual_date_1,
True_Invoice_Date_2.Actual_date AS Actual_date_2,
Edzone_Card.Long_name AS Edzone,
Edzone_Card.Short_name AS EdzoneS,
Pgroup_Card.Long_name AS PageGroup,
Pgroup_Card.Short_name AS PageGroupS,
Class_Card.Long_name AS Classification,
Class_Card.Short_name AS ClassificationS,
Style_Card.Long_name AS Style,
Style_Card.Short_name AS StyleS,
Style_Card.Style_type_setting AS Setting,
Size_Card.Long_name AS Size,
Size_Card.Short_name AS SizeS,
Colour_Card.Long_name AS Color,
Colour_Card.Short_name AS ColorS,
Position_Card.Long_name AS Position,
Position_Card.Short_name AS PositionS
FROM
(
SELECT oRow2.Insert_Date,
oRow2.Order_Row_ID,
oRow2.Title_ID,
oRow2.Insert_net_price,
oRow2.Title, oRow2.TitleS,
oRow2.Feature_Type,
oRow2.Net_price,
oRow2.Actual_date,
oRow2.InsertDate,
Order_Row.Order_ID,
Order_Row.Edzone_ID,
Order_Row.Pgroup_ID,
Order_Row.Class_ID,
Order_Row.Style_ID,
Order_Row.Size_ID,
Order_Row.Colour_ID,
Order_Row.Position_ID,
Order_Row.Physical_inserts,
Order_Row.HJ_pages,
Order_Row.HJ_columns,
Order_Row.Stop_date,
Order_Row.Stop_number,
Order_Row.HJ_width,
Order_Row.HJ_depth,
Order_Row.HJ_natural_depth,
Order_Row.Order_Text_ID,
Order_Row.Last_insert
FROM
(
SELECT oIns1A.Insert_Date,
oIns1A.Order_Row_ID,
oIns1A.Title_ID,
oIns1A.Insert_net_price,
oIns1A.Title,
oIns1A.TitleS,
temp_Breakdown.Feature_Type,
temp_Breakdown.Net_price,
oIns1A.Actual_date,
oIns1A.InsertDate
FROM
(
/*
Declare @From_Date DateTime, @To_Date DateTime, @Title NVARCHAR(100), @PageGroup NVARCHAR(50), @Classification
NVARCHAR(100),
@OperatorLogon NVARCHAR(50), @Team NVARCHAR(100)
set @From_Date=dateadd(dd,-30,'6-1-11')
set @To_Date=dateadd(dd,30,'6-1-11')
*/
SELECT oIns1.Insert_Date,
oIns1.Order_Row_ID,
oIns1.Title_ID,
oIns1.Insert_net_price,
Title_Card.Long_name
AS Title,
Title_Card.Short_name
AS TitleS,
True_Invoice_Date.Actual_date,
ISNULL(True_Invoice_Date.Actual_date,oIns1.Insert_Date)
--ISNULL(True_Invoice_Date.Actual_date, dateadd(dd,-1,oIns1.Insert_Date))
AS InsertDate
FROM
(
/*
Declare @From_Date DateTime, @To_Date DateTime, @Title NVARCHAR(100), @PageGroup NVARCHAR(50), @Classification
NVARCHAR(100),
@OperatorLogon NVARCHAR(50), @Team NVARCHAR(100)
set @From_Date=dateadd(dd,-30,'6-1-11')
set @To_Date=dateadd(dd,30,'6-1-11')
*/
SELECT Insert_Date,
Order_Row_ID,
Title_ID,
Insert_net_price
FROM temp_insert_Date
WHERE (Insert_Date >= DATEADD(dd,-5, @From_Date)) AND (Insert_Date<= DATEADD(hh, 23,@To_Date))
)
AS oIns1
INNER
JOIN
Title_Card ON oIns1.Title_ID = Title_Card.Title_ID
LEFT
OUTER
JOIN
True_Invoice_Date ON oIns1.Insert_Date = True_Invoice_Date.Notional_date
AND
oIns1.Title_ID
= True_Invoice_Date.Title_ID
)AS oIns1A LEFT
OUTER JOIN
temp_Breakdown ON
oIns1A.Order_Row_ID = temp_Breakdown.Order_Row_ID
AND
oIns1A.Insert_Date = temp_Breakdown.Insert_Date
WHERE (oIns1A.InsertDate >= @From_Date)
AND
(oIns1A.InsertDate <= DATEADD(hh,23, @To_Date))
) AS oRow2
INNER JOIN
Order_Row ON
oRow2.Order_Row_ID = Order_Row.Order_Row_ID
WHERE (oRow2.Title = @Title) OR (@Title IS NULL)
) AS oRow3
INNER JOIN
Edzone_Card ON
oRow3.Edzone_ID = Edzone_Card.Edzone_ID
INNER JOIN
Pgroup_Card ON
oRow3.Pgroup_ID = Pgroup_Card.Pgroup_ID
INNER JOIN
Style_Card ON
oRow3.Style_ID = Style_Card.Style_ID
INNER JOIN
Size_Card ON
oRow3.Size_ID = Size_Card.Size_ID INNER
JOIN
Colour_Card ON
oRow3.Colour_ID = Colour_Card.Colour_ID
INNER JOIN
Position_Card ON
oRow3.Position_ID = Position_Card.Position_ID
INNER JOIN
Class_Card ON
oRow3.Class_ID = Class_Card.Class_ID
LEFT OUTER JOIN
True_Invoice_Date AS True_Invoice_Date_2
ON
oRow3.Title_ID = True_Invoice_Date_2.Title_ID
AND
oRow3.Stop_date = True_Invoice_Date_2.Actual_date
LEFT OUTER JOIN
True_Invoice_Date AS True_Invoice_Date_1
ON
oRow3.Title_ID = True_Invoice_Date_1.Title_ID
AND
oRow3.Last_insert = True_Invoice_Date_1.Notional_date
WHERE (Pgroup_Card.Long_name = @PageGroup)
OR
(@PageGroup IS NULL) AND
(Class_Card.Long_name = @Classification)
OR
(@Classification IS NULL) --AND
--(Style_Card.Style_type_setting = 'PRD')
)
AS oRec4 INNER JOIN
temp_Order_Record ON
oRec4.Order_ID = temp_Order_Record.Order_ID
WHERE (temp_Order_Record.Status = 'RUN')
)
AS oRec5 LEFT OUTER JOIN
Operator ON
oRec5.Creator_ID = Operator.Operator_ID
WHERE (Operator.Log_on_name = @OperatorLogon) OR
(@OperatorLogon IS NULL)
) AS oRec6 INNER JOIN
Team ON oRec6.Team_ID = Team.Team_ID
WHERE (Team.Long_name = @Team) OR
(@Team IS NULL)
) AS oRec7 INNER JOIN
Customer ON oRec7.Customer_ID = Customer.Customer_ID INNER JOIN
Customer_Account ON
Customer.Customer_Account_ID = Customer_Account.Customer_Account_ID
)
AS oRec8 ON Planned_Advert.Insert_Date = oRec8.Insert_Date AND
Planned_Advert.Order_Row_ID = oRec8.Order_Row_ID
) AS oRec9 LEFT OUTER JOIN
temp_Planned_Advert ON oRec9.Product_ID = temp_Planned_Advert.Product_ID AND
oRec9.Sequential_number = temp_Planned_Advert.Sequential_number
) AS oRec10 INNER JOIN
Order_Text ON oRec10.Order_Text_ID = Order_Text.Order_Text_ID
) AS oRec11 LEFT OUTER JOIN
Operator_Telephone ON oRec11.Creator_ID = Operator_Telephone.Operator_ID
) AS oRec12
) AS oRec13 INNER JOIN
Sales_Area ON oRec13.Sales_Area_ID = Sales_Area.Sales_Area_ID
--select distinct * from testdailytable
--order by Update_time, Urn_text
