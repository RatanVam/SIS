USE ACE
GO

declare @environment varchar(max)
declare @lobPCUMB int
Select @lobPCUMB=  lobId from dbo.LOB where LOBName='PC-UMB'


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
			(@lobPCUMB,'ESBUrl','ISUD', 'http://esbu.njmgroup.com:1034/PolicyDataService/UMCorrespondenceData',SUSER_SNAME(),GETDATE(),null,null),
			(@lobPCUMB,'SampleUrl','ISUD','http://inspireuat:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobPCUMB,'ESBUrl','ISU1', 'http://esbu.njmgroup.com:3013/PolicyDataService/UMCorrespondenceData',SUSER_SNAME(),GETDATE(),null,null),
			(@lobPCUMB,'SampleUrl','ISU1','http://inspireuat:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null)
   END

GO


declare @lobPCUMB int,@printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int

Select @printer1=  PrinterId from ACE.dbo.Printer where PrinterCode='TCOMAUT1XP'
Select @printer2=  PrinterId from ACE.dbo.Printer where PrinterCode='WUWBC1'
Select @printer3=  PrinterId from ACE.dbo.Printer where PrinterCode='WENGBC1'
Select @printer4=  PrinterId from ACE.dbo.Printer where PrinterCode='IT_Test'
Select @printer5=  PrinterId from ACE.dbo.Printer where PrinterCode='HCL_India2'
Select @printer6=  PrinterId from ACE.dbo.Printer where PrinterCode='Archive Only'
Select @printer7=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_CL_CLRMFP4'
declare @lobWCU int,@lobIdpcWCU int
Select @lobPCUMB=  lobId from dbo.LOB where LOBName='PC-UMB'

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


 (@lobPCUMB,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCUMB,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCUMB,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCUMB,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCUMB,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCUMB,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCUMB,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 Go

  INSERT INTO ACe.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  
  ('Parsippany 2','PPLBC2',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_CLRMFP3','PRT_PL_CLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
  ('WPLBC2','WPLBC2',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PPLBC2','Parsippany 2',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_P004','PRT_PL_P004',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_IN4','PRT_PL_IN4',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_MFP6','PRT_PL_MFP6',1,SUSER_SNAME(),GETDATE(),null,null),
  ('West Trenton 1','PL_CUS2',1,SUSER_SNAME(),GETDATE(),null,null),
    ('PRT_PL_CLRMFP4','PRT_PL_CLRMFP4',1,SUSER_SNAME(),GETDATE(),null,null),
  ('West Trenton 1','PL_CUS2',1,SUSER_SNAME(),GETDATE(),null,null),
   ('WPLBC1','WPLBC1',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_QA1','PRT_PL_QA1',1,SUSER_SNAME(),GETDATE(),null,null),
  ('West Trenton 2','PRT_PL_P004',1,SUSER_SNAME(),GETDATE(),null,null)

  go



 declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,@printer8 int,@printer9 int,@printer10 int,@printer11 int,@printer12 int

Select @printer1=  PrinterId from ACE.dbo.Printer where PrinterCode='Parsippany 2'
Select @printer2=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_CLRMFP4'
Select @printer3=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_CLRMFP3'
Select @printer4=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_IN4'
Select @printer5=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_MFP6'
Select @printer6=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_P004'
Select @printer7=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_QA1'
Select @printer8=  PrinterId from ACE.dbo.Printer where PrinterCode='West Trenton 1'
Select @printer9=  PrinterId from ACE.dbo.Printer where PrinterCode='West Trenton 2'
Select @printer10=  PrinterId from ACE.dbo.Printer where PrinterCode='WPLBC1'
Select @printer11=  PrinterId from ACE.dbo.Printer where PrinterCode='WPLBC2'
Select @printer12=  PrinterId from ACE.dbo.Printer where PrinterCode='IT_Test'
declare @lobPCUMB int,@prinerCategory int
Select @lobPCUMB=  lobId from dbo.LOB where LOBName='PC-UMB'
Select @prinerCategory=  CategoryId from dbo.Category where CategoryName='PL_UNDERWRITING_UMB'
INSERT INTO [ACE].[dbo].[LOBPrinter]
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


 (@lobPCUMB,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer8,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer9,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer10,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
 (@lobPCUMB,@printer11,11,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory),
  (@lobPCUMB,@printer12,12,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@prinerCategory)

  go