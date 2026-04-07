-- =============================================
-- Author	Vijay Kirna Kumar Bhimuni
-- Create date: 11/2/2023
-- Description:	Delete printer WPASCAN1 - Work order 1035440
-- =============================================

Delete from  LOBPrinter where PrinterId in  (select PrinterId from Printer where PrinterName =  'WPASCAN1')
Delete from Printer where PrinterName =  'WPASCAN1'
  