use ACE
GO

declare @environment varchar(max)
declare @lobIdPa int,@lobWCU int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'


SET @environment = 'QA' --QA/PROD

-- This differes from each environment

  if @environment = 'QA'
  BEGIN
		 INSERT INTO ACE.[dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values
		--	(@lobIdPa,'ESBUrl','ISQ1', 'http://esbq.njmgroup.com:7417/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
		--	(@lobIdPa,'SampleUrl','ISQ1','http://insprappsva1a01.njmgroup.com:30600/rest/api/submit-job/PreviewBCDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'ESBUrl','ISQL', 'http://esbq.njmgroup.com:3117/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
			
			(@lobWCU,'ESBUrl','ISQ1',  'http://esbq.njmgroup.com:7417/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','ISQ1','http://insprappsva1a01.njmgroup.com:30600/rest/api/submit-job/PreviewWCBCDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISQL', 'http://esbq.njmgroup.com:3117/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null)


   END
GO


 --INSERT INTO ACe.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
 --     ,[CreatedDateTime]
 --     ,[UpdatedBy]
 --     ,[UpdatedDateTime])
 --Values



--('ACLB10',	'ACLB10',1,SUSER_SNAME(),GETDATE(),null,null),
--('CASHPRT1','CASHPRT1',1,SUSER_SNAME(),GETDATE(),null,null),
--('Hammonton 1',	'Hammonton 1',1,SUSER_SNAME(),GETDATE(),null,null),
--('Parsippany 1',	'Parsippany 1',1,SUSER_SNAME(),GETDATE(),null,null),
--('PRT_IT_CLRMFP5',	'PRT_IT_CLRMFP5',1,SUSER_SNAME(),GETDATE(),null,null),
--('WCUBC1',	'WCUBC1',1,SUSER_SNAME(),GETDATE(),null,null),
--('West Trenton 2',	'West Trenton 2',1,SUSER_SNAME(),GETDATE(),null,null)

declare @lobIdbcpa int,@lobIdbcWCU int, @lobbop int, @lobcumb int,@lobMulti int
Select @lobIdbcpa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobIdbcWCU=  lobId from dbo.LOB where LOBName='BC-WCU'

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
 --(@lobIdbcpa,15,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,12,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,5,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 --(@lobIdbcpa,17,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,18,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,19,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,20,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,21,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,22,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobIdbcpa,23,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),


 (@lobIdbcWCU,15,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,12,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,5,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,17,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,18,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,19,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,20,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,21,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,22,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcWCU,23,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 
 GO
