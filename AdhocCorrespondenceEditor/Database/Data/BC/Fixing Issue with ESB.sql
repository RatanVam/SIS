-- =============================================
-- Author:		Vijay
-- Create date: 20-Dec-2023
-- Description:	Fixing existing table. 
-- =============================================

update [ACE].[dbo].[WebService]
  set Environment='Prod'
  Where WebServiceId in (11,12,13,14)

