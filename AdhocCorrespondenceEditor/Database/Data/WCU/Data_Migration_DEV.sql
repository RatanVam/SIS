USE ACE
GO

declare @environment varchar(max)
declare @lobIdPa int,@lobWCU int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-WCU'



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
			(@lobWCU,'ESBUrl','ISD2','http://172.25.7.17:2654/PolicyInformationRetrieverServiceWeb/sca/PolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','ISD1', 'http://inspiredwt1:30600/rest/api/submit-job/PreviewWCBCDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISD1','http://172.25.7.17:8454/PolicyInformationRetrieverServiceWeb/sca/PolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null)



   END

GO

 INSERT INTO ACe.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PRT_CM_CLRMFP2','PRT_CM_CLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null)
 
-- ('PRT_CL_CLRMFP2','PRT_CL_CLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
-- ('HCL_India2','HCL_India2',1,SUSER_SNAME(),GETDATE(),null,null),
--('DEVTEST1','DEVTEST1',1,SUSER_SNAME(),GETDATE(),null,null)


 	 




declare @lobIdbcpa int,@lobwcu int;

Select @lobwcu=  lobId from dbo.LOB where LOBName='PC-WCU'

declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,
@printer8 int

Select @printer1=  PrinterId from ACE.dbo.Printer where PrinterCode='TCOMAUT1XP'
Select @printer2=  PrinterId from ACE.dbo.Printer where PrinterCode='WUWBC1'
Select @printer3=  PrinterId from ACE.dbo.Printer where PrinterCode='WENGBC1'
Select @printer4=  PrinterId from ACE.dbo.Printer where PrinterCode='IT_Test'
Select @printer5=  PrinterId from ACE.dbo.Printer where PrinterCode='HCL_India2'
Select @printer6=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_CM_CLRMFP2'
Select @printer7=  PrinterId from ACE.dbo.Printer where PrinterCode='Archive Only'
Select @printer8=  PrinterId from ACE.dbo.Printer where PrinterCode='DEVTEST1'


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


 (@lobwcu,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer8,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)




