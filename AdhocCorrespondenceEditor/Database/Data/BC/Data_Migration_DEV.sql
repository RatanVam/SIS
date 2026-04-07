USE ACE
GO

declare @environment varchar(max)
declare @lobIdPa int,@lobWCU int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'



SET @environment = 'DEV' --QA/PROD

-- This differes from each environment

  if @environment = 'DEV'
  BEGIN
		 INSERT INTO ACE.[dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values
			(@lobIdPa,'ESBUrl','ISD2', 'http://172.25.7.17:3117/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort', SUSER_SNAME(),GETDATE(),null,null),			
			(@lobIdPa,'ESBUrl','ISD5', 'http://172.25.7.17:8417/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort', SUSER_SNAME(),GETDATE(),null,null),			

			(@lobIdPa,'ESBUrl','ISD4', 'http://172.25.7.17:8469/WCUBillingDataServiceWeb/sca/WCUBillingDataService', SUSER_SNAME(),GETDATE(),null,null),			
			(@lobIdPa,'ESBUrl','ISD1', 'http://172.25.7.17:8417/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'SampleUrl','ISD1','http://insprappdva1a01.njmgroup.com:30600/rest/api/submit-job/PreviewBCDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISD1', 'http://172.25.7.17:8417/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','ISD1','http://insprappdva1a01.njmgroup.com:30600/rest/api/submit-job/PreviewWCBCDocument',SUSER_SNAME(),GETDATE(),null,null)
   END

GO

 INSERT INTO ACe.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
--('TCOMAUT1XP','TCOMAUT1XP',1,SUSER_SNAME(),GETDATE(),null,null),
--('WUWBC1',	'WUWBC1',1,SUSER_SNAME(),GETDATE(),null,null),
--('WENGBC1',	'WENGBC1',1,SUSER_SNAME(),GETDATE(),null,null),
--('IT_Test',	'IT_Test',1,SUSER_SNAME(),GETDATE(),null,null),
--('HCL_India2',	'HCL_India2',1,SUSER_SNAME(),GETDATE(),null,null),
--('WPASCAN1',	'WPASCAN1',1,SUSER_SNAME(),GETDATE(),null,null),
--('Archive Only',	'Archive Only',1,SUSER_SNAME(),GETDATE(),null,null),
--('PRT_CL_CLRMFP4',	'PRT_CL_CLRMFP4',1,SUSER_SNAME(),GETDATE(),null,null),
--('DEVTEST1',	'DEVTEST1',1,SUSER_SNAME(),GETDATE(),null,null),

('CASHPRT1','TCOMAUT1XP',1,SUSER_SNAME(),GETDATE(),null,null),
('ACLB10','ACLB10',1,SUSER_SNAME(),GETDATE(),null,null),
('PL_HA1','Hammonton 1',1,SUSER_SNAME(),GETDATE(),null,null),
('PPLBC3','Parsippany 1',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_PL_P004','West Trenton 2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_IT_CLRMFP5','PRT_IT_CLRMFP5',1,SUSER_SNAME(),GETDATE(),null,null),
('WCUBC1','WCUBC1',1,SUSER_SNAME(),GETDATE(),null,null)
 	 



declare @lobIdbcpa int,@lobwcu int;
Select @lobIdbcpa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobwcu=  lobId from dbo.LOB where LOBName='BC-WCU'



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


 (@lobIdbcpa,4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,5,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,7,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,9,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,10,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,11,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,12,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,13,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,14,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,15,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdbcpa,16,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 
 (@lobwcu,4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,5,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,7,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,9,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,10,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,11,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,12,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,13,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,14,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,15,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,16,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)




