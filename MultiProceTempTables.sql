USE [CNC-FPReports]
GO
/****** Object: StoredProcedure [dbo].[slp_CNC_multi_proc_temp_tables] Script Date: 04/19/2011
08:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[slp_CNC_multi_proc_temp_tables]
as
exec slp_CNC_proc_temp_Breakdown
exec slp_CNC_proc_temp_insert_date
exec slp_CNC_proc_temp_Order_Record
exec slp_CNC_proc_temp_planned
exec slp_CNC_Order_Extract_Using_CC_SubQueries_w_Planned_Advert
select * from testDailyTable
--end of procedure
