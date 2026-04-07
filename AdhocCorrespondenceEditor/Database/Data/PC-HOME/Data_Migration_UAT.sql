
declare @environment varchar(max)
declare @lobPCHO int
Select @lobPCHO=  lobId from dbo.LOB where LOBName='PC-HO'


SET @environment = 'UAT' --QA/PROD

-- This differes from each environment

  if @environment = 'UAT'
  BEGIN
		 INSERT INTO [dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values
			(@lobPCHO,'ESBUrl','ISUD', 'http://esbu.njmgroup.com:7413/PolicyDataService/CorrEditor/HOPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobPCHO,'SampleUrl','ISUD','http://inspireuat:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobPCHO,'ESBUrl','ISU1', 'http://esbu.njmgroup.com:3012/PolicyDataService/CorrEditor/HOPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobPCHO,'SampleUrl','ISU1','http://inspireuat:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null)
   END

GO


declare @lobPCHO int,@printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int

Select @printer1=  PrinterId from dbo.Printer where PrinterCode='TCOMAUT1XP'
Select @printer2=  PrinterId from dbo.Printer where PrinterCode='WUWBC1'
Select @printer3=  PrinterId from dbo.Printer where PrinterCode='WENGBC1'
Select @printer4=  PrinterId from dbo.Printer where PrinterCode='IT_Test'
Select @printer5=  PrinterId from dbo.Printer where PrinterCode='HCL_India2'
Select @printer6=  PrinterId from dbo.Printer where PrinterCode='Archive Only'
Select @printer7=  PrinterId from dbo.Printer where PrinterCode='PRT_CL_CLRMFP4'
declare @lobWCU int,@lobIdpcWCU int
Select @lobPCHO=  lobId from dbo.LOB where LOBName='PC-HO'

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


 (@lobPCHO,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCHO,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCHO,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCHO,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCHO,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCHO,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCHO,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 Go



 declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,@printer8 int,@printer9 int,@printer10 int,@printer11 int,@printer12 int

Select @printer1=  PrinterId from dbo.Printer where PrinterCode='Parsippany 2'
Select @printer2=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP4'
Select @printer3=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP3'
Select @printer4=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_IN4'
Select @printer5=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_MFP6'
Select @printer6=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_P004'
Select @printer7=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_QA1'
Select @printer8=  PrinterId from dbo.Printer where PrinterCode='West Trenton 1'
Select @printer9=  PrinterId from dbo.Printer where PrinterCode='West Trenton 2'
Select @printer10=  PrinterId from dbo.Printer where PrinterCode='WPLBC1'
Select @printer11=  PrinterId from dbo.Printer where PrinterCode='WPLBC2'
Select @printer12=  PrinterId from dbo.Printer where PrinterCode='IT_Test'
declare @lobPCHO int,@prinerCategory int
Select @lobPCHO=  lobId from dbo.LOB where LOBName='PC-HO'
Select @prinerCategory=  CategoryId from dbo.Category where CategoryName='PL_UNDERWRITING_HO'
INSERT INTO [dbo].[LOBPrinter]
  (    [LOBId]
      ,[PrinterId]
      ,[PrinterOrder]
	  ,[EffectiveDate] 
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime],
	  CategoryId)
 VALUES 


 (@lobPCHO,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer8,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer9,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer10,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCHO,@printer11,11,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
  (@lobPCHO,@printer12,12,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory)

  go