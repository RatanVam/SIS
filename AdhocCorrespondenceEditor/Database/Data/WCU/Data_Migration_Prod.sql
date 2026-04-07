USE ACE
GO

declare @environment varchar(max)
declare @lobWCU int


Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-WCU'


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

			(@lobWCU,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3054/PolicyInformationRetrieverServiceWeb/sca/PolicyInfomationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewWCUPCDocument',SUSER_SNAME(),GETDATE(),null,null)

   END

GO




 --INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
 --     ,[CreatedDateTime]
 --     ,[UpdatedBy]
 --     ,[UpdatedDateTime])
 --Values





declare @lobIdPa int,@lobWCU int

Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-WCU'


declare @printer1 int,@printer2 int,@printer3 int,@printer5 int,@printer6 int,@printer4 int



Select @printer1=  PrinterId from ACE.dbo.Printer where PrinterCode='TCOMAUT1XP'
Select @printer2=  PrinterId from ACE.dbo.Printer where PrinterCode='Archive Only'
Select @printer3=  PrinterId from ACE.dbo.Printer where PrinterCode='WUWBC1'
Select @printer4=  PrinterId from ACE.dbo.Printer where PrinterCode='WENGBC1'
Select @printer5=  PrinterId from ACE.dbo.Printer where PrinterCode='IT_Test'
Select @printer6=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_CL_CLRMFP4'



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

 (@lobWCU,@printer1,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer2,20,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer3,30,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer4,40,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer5,50,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCU,@printer6,60,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 GO


