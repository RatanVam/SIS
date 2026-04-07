USE ACE
GO

declare @environment varchar(max)
declare @lobIdPa int,@lobWCU int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'


SET @environment = 'PROD'

-- This differes from each environment

  if @environment = 'PROD'
  BEGIN
		 INSERT INTO [dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values
			(@lobIdPa,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3117/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewBCDocument',SUSER_SNAME(),GETDATE(),null,null),

			(@lobWCU,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3117/ICEBillingDataServiceAdapterWeb/sca/BillingDataServicePort',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewWCBCDocument',SUSER_SNAME(),GETDATE(),null,null)

   END

GO


 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('CASHPRT1','CASHPRT1',1,SUSER_SNAME(),GETDATE(),null,null),
('PL_HA1',	'Hammonton 1',1,SUSER_SNAME(),GETDATE(),null,null),
('PPLBC3',	'Parsippany 1',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_PL_P004',	'West Trenton 2',1,SUSER_SNAME(),GETDATE(),null,null),
('DISBURS2','DISBURS2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_CM_CLRMFP2',	'PRT_CM_CLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null)


declare @lobIdPa int,@lobWCU int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'

declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int

Select @printer1=  PrinterId from ACE.dbo.Printer where PrinterCode='CASHPRT1'
Select @printer2=  PrinterId from ACE.dbo.Printer where PrinterCode='PL_HA1'
Select @printer3=  PrinterId from ACE.dbo.Printer where PrinterCode='PPLBC3'
Select @printer4=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_P004'
Select @printer5=  PrinterId from ACE.dbo.Printer where PrinterCode='DISBURS2'
Select @printer6=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_CM_CLRMFP2'
Select @printer7=  PrinterId from ACE.dbo.Printer where PrinterCode='Archive Only'


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
 (@lobIdPa,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdPa,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdPa,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdPa,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdPa,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdPa,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdPa,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobWCU,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 GO
