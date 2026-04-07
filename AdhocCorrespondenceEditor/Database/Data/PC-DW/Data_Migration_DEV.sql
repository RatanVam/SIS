


USE ACE_Enh
GO

declare @environment varchar(max)
declare @lobIdPa int,@lobWCU int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-HO'



SET @environment = 'DEV' --QA/PROD

-- This differes from each environment

  if @environment = 'DEV'
  BEGIN
		 INSERT INTO [dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values
			(@lobWCU,'SampleUrl','ISD2', 'http://inspiredwt1:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','ISD3', 'http://inspiredwt1:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISD2','http://172.25.7.17:2612/PolicyDataService/CorrEditor/HOPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISD3','http://172.25.7.17:7413/PolicyDataService/CorrEditor/HOPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'ESBUrl','ISD1','http://172.25.7.17:7413/PolicyDataService/CorrEditor/HOPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCU,'SampleUrl','ISD1', 'http://inspiredwt1:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null)

   END

GO



declare @lobIdbcpa int,@lobwcu int,@catunder int;

Select @lobwcu=  lobId from dbo.LOB where LOBName='PC-HO'

Select @catunder=  CategoryId from dbo.Category where CategoryName='PL_UNDERWRITING_HO'

declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,
@printer8 int,@printer10 int,@printer11 int,@printer12 int,@printer13 int,@printer14 int,
@printer15 int,@printer16 int,@printer17 int,@printer18 int,@printer19 int

Select @printer1=  PrinterId from dbo.Printer where PrinterCode='WPLBC1'
Select @printer2=  PrinterId from dbo.Printer where PrinterCode='WPLBC2'
Select @printer3=  PrinterId from dbo.Printer where PrinterCode='IT_Test'
Select @printer14=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_P004'
Select @printer15=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_IN4'
Select @printer16=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_MFP6'
Select @printer13=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP3'
Select @printer17=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP4'
Select @printer4=  PrinterId from dbo.Printer where PrinterName='Parsippany 1'
Select @printer5=  PrinterId from dbo.Printer where PrinterName='Off Call Processing'
Select @printer6=  PrinterId from dbo.Printer where PrinterName='West Trenton 1'
Select @printer7=  PrinterId from dbo.Printer where PrinterName='West Trenton 2'
Select @printer12=  PrinterId from dbo.Printer where PrinterName='Parsippany 2'
Select @printer18=  PrinterId from dbo.Printer where PrinterCode='MFP5'
Select @printer8=  PrinterId from dbo.Printer where PrinterName='Hammonton 1'
Select @printer10=  PrinterId from dbo.Printer where PrinterName='Hammonton 2'
Select @printer11=  PrinterId from dbo.Printer where PrinterName='Hammonton 3'
Select @printer19=  PrinterId from dbo.Printer where PrinterName='Archive Only'


 INSERT INTO [dbo].[LOBPrinter]
  (    [LOBId]
	  ,[CategoryId]
      ,[PrinterId]
      ,[PrinterOrder]
	  ,[EffectiveDate] 
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime]	  )
 VALUES 


 (@lobwcu,@catunder, @printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer10,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer11,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer13,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer14,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer15,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer16,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer17,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer18,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer19,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)



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


 (@lobwcu,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer8,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobwcu,@printer10,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer11,11,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer12,12,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer13,13,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer14,14,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer15,15,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer16,16,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer17,17,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@printer18,18,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)






 














































































































































































