use ACE
GO

declare @environment varchar(max)
declare @lobWCU int
Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-WCU'


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
			(@lobWCU,'SampleUrl','ISQ2','http://inspireqa:30600/rest/api/submit-job/PreviewWCUPCDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISQ2', 'http://esbq.njmgroup.com:3054/PolicyInformationRetrieverServiceWeb/sca/PolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			
			(@lobWCU,'ESBUrl','ISQ1',  'http://esbq.njmgroup.com:7433/PolicyInformationRetrieverServiceWeb/sca/PolicyInfomationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','ISQ1','http://inspireqa:30600/rest/api/submit-job/PreviewWCUPCDocument',SUSER_SNAME(),GETDATE(),null,null)


   END
GO


declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int

Select @printer1=  PrinterId from ACE.dbo.Printer where PrinterCode='TCOMAUT1XP'
Select @printer2=  PrinterId from ACE.dbo.Printer where PrinterCode='WUWBC1'
Select @printer3=  PrinterId from ACE.dbo.Printer where PrinterCode='WENGBC1'
Select @printer4=  PrinterId from ACE.dbo.Printer where PrinterCode='IT_Test'
Select @printer5=  PrinterId from ACE.dbo.Printer where PrinterCode='HCL_India2'
Select @printer6=  PrinterId from ACE.dbo.Printer where PrinterCode='Archive Only'
Select @printer7=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_CL_CLRMFP2'
declare @lobWCU int,@lobIdpcWCU int
Select @lobIdpcWCU=  lobId from dbo.LOB where LOBName='PC-WCU'

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


 (@lobIdpcWCU,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdpcWCU,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdpcWCU,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdpcWCU,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdpcWCU,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdpcWCU,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdpcWCU,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 Go



