USE ACE
GO

declare @environment varchar(max)
declare @lobIdPa int,@lobWCU int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'


SET @environment = 'UAT' --QA/PROD

-- This differes from each environment

  if @environment = 'UAT'
  BEGIN
		 INSERT INTO ACE.[dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values
			(@lobIdPa,'ESBUrl','ISUD', 'http://esbu.njmgroup.com:7469/WCUBillingDataServiceWeb/sca/WCUBillingDataService',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'SampleUrl','ISUD','http://inspireuat:30600/rest/api/submit-job/PreviewBCDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'ESBUrl','ISU2', 'http://esbu.njmgroup.com:3117/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISUD', 'http://esbu.njmgroup.com:7469/WCUBillingDataServiceWeb/sca/WCUBillingDataService',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','ISUD','http://inspireuat:30600/rest/api/submit-job/PreviewWCBCDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISU2', 'http://esbu.njmgroup.com:3117/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null)
   END

GO

declare @lobIdbcpa int,@lobIdbcwcu int, @lobcgl int, @lobbop int, @lobcumb int,@lobMulti int
Select @lobIdbcpa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobIdbcwcu=  lobId from dbo.LOB where LOBName='BC-WCU'
 INSERT INTO ACe.dbo.Printer (PrinterName, PrinterCode, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('CASHPRT1','CASHPRT1',1,SUSER_SNAME(),GETDATE(),null,null),
('ACLB10','ACLB10',1,SUSER_SNAME(),GETDATE(),null,null),
('Hammonton 1','PL_HA1',1,SUSER_SNAME(),GETDATE(),null,null),
('Parsippany 1','PPLBC3',1,SUSER_SNAME(),GETDATE(),null,null),
('West Trenton 2','PRT_PL_P004',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_IT_CLRMFP5','PRT_IT_CLRMFP5',1,SUSER_SNAME(),GETDATE(),null,null),
('WCUBC1','WCUBC1',1,SUSER_SNAME(),GETDATE(),null,null)

declare @CASHPRT1 int,@HCL_India2 int,@IT_Test int,@ArchiveOnly int,@ACLB10 int,@Hammonton1 int,@Parsippany1 int,@WestTrenton2 int,@PRT_IT_CLRMFP5 int,@WCUBC1 int
select @CASHPRT1 = PrinterId from ACe.dbo.Printer where PrinterName = 'CASHPRT1'
select @HCL_India2  = PrinterId from ACe.dbo.Printer where PrinterName = 'HCL_India2'
select @IT_Test  = PrinterId from ACe.dbo.Printer where PrinterName = 'IT_Test'
select @ArchiveOnly  = PrinterId from ACe.dbo.Printer where PrinterName = 'Archive Only'
select @ACLB10  = PrinterId from ACe.dbo.Printer where PrinterName = 'ACLB10'
select @Hammonton1  = PrinterId from ACe.dbo.Printer where PrinterName = 'Hammonton 1'
select @Parsippany1  = PrinterId from ACe.dbo.Printer where PrinterName = 'Parsippany 1'
select @WestTrenton2  = PrinterId from ACe.dbo.Printer where PrinterName = 'West Trenton 2'
select @PRT_IT_CLRMFP5  = PrinterId from ACe.dbo.Printer where PrinterName = 'PRT_IT_CLRMFP5'
select @WCUBC1  = PrinterId from ACe.dbo.Printer where PrinterName = 'WCUBC1'

INSERT INTO [ACE].[dbo].[LOBPrinter]
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
 (@lobIdbcpa,@ArchiveOnly,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@CASHPRT1,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@HCL_India2,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@IT_Test,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@ACLB10,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@Hammonton1,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@Parsippany1,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@WestTrenton2,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@PRT_IT_CLRMFP5,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,@WCUBC1,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@lobIdbcwcu,@ArchiveOnly,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@CASHPRT1,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@HCL_India2,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@IT_Test,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@ACLB10,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@Hammonton1,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@Parsippany1,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@WestTrenton2,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@PRT_IT_CLRMFP5,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcwcu,@WCUBC1,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)


 
 GO
