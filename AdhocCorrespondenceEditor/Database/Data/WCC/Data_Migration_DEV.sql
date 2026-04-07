Declare @LOBId int = (select LOBId from LOB where LOBName = 'WCC')
If @@SERVERNAME = 'SQLD08VA1A01\SQL19DEV'
begin
if exists (select * from dbo.WebService where Lobid = @LOBId)
delete from [dbo].[WebService]
where LOBId=@LOBId

--Insert ESB URL for WCC
INSERT INTO [dbo].[WebService]
           ([LOBId]
           ,[Environment]
           ,[URLType]
           ,[URL]
           ,[CreatedBy]
           ,[CreatedDateTime]
        )
     VALUES
           (@LOBId
           ,'DWCCP1'
           ,'ESBUrl'
           ,'http://esbd.njmgroup.com:8001/XpCorrESBWeb/sca/GetCorrData'
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		   (@LOBId
           ,'DWCCP1'
           ,'SampleUrl'
           ,'http://inspiredwt1:30600/rest/api/submit-job/PreviewWCCDocument'
           ,SUSER_SNAME()
           ,GETDATE()
          )

		  
if exists (select * from dbo.[LOBPrinter] where LOBId=@LOBId)
delete from LOBPrinter
where LOBId=@LOBId

if exists (select * from dbo.Printer where PrinterName = 'WCC ARCHIVE ONLY')
delete from Printer
where PrinterName in ('WCC ARCHIVE ONLY',
					  'PADJBC2-WCC',
					  'PMSAMEDMGMTBC3-WCC',
					  'WCC PRINT Engine Room 6-(XP4250)',
					  'WCOLORBC1-WCC',
					  'WINFOSVCSBC7-WCC',
					  'WLEGALBC10-WCC',
					  'WLEGALBC8-WCC',
					  'WMSABPUBC1-WCC',
					   'WMSAPROSVCSBC1-WCC',
					   'WMSAPROSVCSBC5-WCC',
					   'WSUBROBC4-WCC',
					   'PRT_WC_CLRMFP1',
					   'PRT_WC_PMFP2',
					   'PRT_WC_MFP4',
					   'PRT_WC_HCLRMFP2')

 INSERT INTO dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('WCC ARCHIVE ONLY','WCC ARCHIVE ONLY',1,SUSER_SNAME(),GETDATE(),null,null),
('PADJBC2-WCC',	'PADJBC2-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('PMSAMEDMGMTBC3-WCC',	'PMSAMEDMGMTBC3-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WCC PRINT Engine Room 6-(XP4250)',	'WCC PRINT Engine Room 6-(XP4250)',1,SUSER_SNAME(),GETDATE(),null,null),
('WCOLORBC1-WCC',	'WCOLORBC1-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WINFOSVCSBC7-WCC',	'WINFOSVCSBC7-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WLEGALBC10-WCC',	'WLEGALBC10-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WLEGALBC8-WCC',	'WLEGALBC8-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSABPUBC1-WCC',	'WMSABPUBC1-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSAPROSVCSBC1-WCC',	'WMSAPROSVCSBC1-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSAPROSVCSBC5-WCC',	'WMSAPROSVCSBC5-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WSUBROBC4-WCC',	'WSUBROBC4-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_CLRMFP1',	'PRT_WC_CLRMFP1',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_PMFP2',	'PRT_WC_PMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_MFP4',	'PRT_WC_MFP4',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_HCLRMFP2',	'PRT_WC_HCLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null)

Declare @Prt1 int =(select PrinterId from Printer where PrinterName = 'WCC ARCHIVE ONLY')
Declare @Prt2 int =(select PrinterId from Printer where PrinterName = 'PADJBC2-WCC')
Declare @Prt3 int =( select PrinterId from Printer where PrinterName = 'PMSAMEDMGMTBC3-WCC')
Declare @Prt4 int =( select PrinterId from Printer where PrinterName = 'WCC PRINT Engine Room 6-(XP4250)')
Declare @Prt5 int =( select PrinterId from Printer where PrinterName = 'WCOLORBC1-WCC')
Declare @Prt6 int =( select PrinterId from Printer where PrinterName = 'WINFOSVCSBC7-WCC')
Declare @Prt7 int =( select PrinterId from Printer where PrinterName = 'WLEGALBC10-WCC')
Declare @Prt8 int =( select PrinterId from Printer where PrinterName = 'WLEGALBC8-WCC')
Declare @Prt9 int =( select PrinterId from Printer where PrinterName = 'WMSABPUBC1-WCC')
Declare @Prt10 int =( select PrinterId from Printer where PrinterName = 'WMSAPROSVCSBC1-WCC')
Declare @Prt11 int =( select PrinterId from Printer where PrinterName = 'WMSAPROSVCSBC5-WCC')
Declare @Prt12 int =( select PrinterId from Printer where PrinterName = 'WSUBROBC4-WCC')
Declare @Prt13 int =( select PrinterId from Printer where PrinterName = 'PRT_WC_CLRMFP1')
Declare @Prt14 int =( select PrinterId from Printer where PrinterName = 'PRT_WC_PMFP2')
Declare @Prt15 int =( select PrinterId from Printer where PrinterName = 'PRT_WC_MFP4')
Declare @Prt16 int =( select PrinterId from Printer where PrinterName = 'PRT_WC_HCLRMFP2')


--CheckIf lokkupitemorder same as PrinterOrder
INSERT INTO [dbo].[LOBPrinter]
  (    [LOBId]
      ,[PrinterId]
      ,[PrinterOrder]
	  ,[EffectiveDate] 
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime]	  )
 VALUES 
 (@LOBId,@Prt1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt8,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt9,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt10,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt11,11,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt12,12,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt13,13,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt14,14,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt15,15,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@LOBId,@Prt16,16,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
 end