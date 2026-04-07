

GO

declare @environment varchar(max)
declare @lobIdPa int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='PC-PA'

SET @environment = 'QA' --QA/PROD

-- This differes from each environment

  if @environment = 'QA' 
  BEGIN
		 INSERT INTO [dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values
			(@lobIdPa,'SampleUrl','ISQ6', 'http://inspireqa:30600/rest/api/submit-job/PreviewPCAutoDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'SampleUrl','ISQ1', 'http://inspireqa:30600/rest/api/submit-job/PreviewPCAutoDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'ESBUrl','ISQ6','http://esbq.njmgroup.com:3026/PAPolicyInformationRetrieverWeb/sca/PAPolicyInformationRetrieverEnhancer',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'ESBUrl','ISQ1','http://esbq.njmgroup.com:7400/PAPolicyInformationRetrieverWeb/sca/PAPolicyInformationRetrieverEnhancer',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'SampleUrl','ISQ2', 'http://inspireqa:30600/rest/api/submit-job/PreviewPCAutoDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'SampleUrl','ISQ3', 'http://inspireqa:30600/rest/api/submit-job/PreviewPCAutoDocument',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'ESBUrl','ISQ2','http://esbq.njmgroup.com:3026/PAPolicyInformationRetrieverWeb/sca/PAPolicyInformationRetrieverEnhancer',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdPa,'ESBUrl','ISQ3','http://esbq.njmgroup.com:3026/PAPolicyInformationRetrieverWeb/sca/PAPolicyInformationRetrieverEnhancer',SUSER_SNAME(),GETDATE(),null,null)

   END

GO

INSERT INTO dbo.Printer ( PrinterName,PrinterCode, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values

('Hammonton ID','HPLBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('Parsippany ID','PPLBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('West Trenton ID','WPLBC3',1,SUSER_SNAME(),GETDATE(),null,null),
('West Trenton Lobby ID','PRT_PL_IN12',1,SUSER_SNAME(),GETDATE(),null,null)


declare @lobIdbcpa int,@lobwcu int,@catunder int,@catunder1 int,@catunder2 int;
Select @lobwcu=  lobId from dbo.LOB where LOBName='PC-PA'

Select @catunder1=  CategoryId from dbo.Category where CategoryName='PL_UNDERWRITING_AUTO'
Select @catunder2=  CategoryId from dbo.Category where CategoryName='PL_RENEWALS_UNDERWRITER_AUTO'

declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,
@printer8 int,@printer10 int,@printer11 int,@printer12 int,@printer13 int,@printer14 int,
@printer15 int,@printer16 int,@printer17 int,@printer18 int,@printer19 int,
@printer20 int, @printer21 int, @printer22 int, @printer23 int


declare @document1 int,@document2 int,@document3 int,@document4 int,@document5 int,@document6 int

Select @document1 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ ID Card-PC'
Select @document2 =  DocumentId from [dbo].[Document] where DocumentName='NJM PA ID Card-PC'
Select @document3 =  DocumentId from [dbo].[Document] where DocumentName='NJM CT ID Card-PC'
Select @document4 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ Temporary ID Card'
Select @document5 =  DocumentId from [dbo].[Document] where DocumentName='NJM OH ID Card-PC'
Select @document6 =  DocumentId from [dbo].[Document] where DocumentName='NJM MD ID Card-PC'


Select @printer1=  PrinterId from dbo.Printer where PrinterName='WPLBC1'
Select @printer2=  PrinterId from dbo.Printer where PrinterName='WPLBC2'
Select @printer3=  PrinterId from dbo.Printer where PrinterCode='IT_Test'
Select @printer4=  PrinterId from dbo.Printer where PrinterName='Parsippany 1'
Select @printer5=  PrinterId from dbo.Printer where PrinterName='Off Call Processing'
Select @printer6=  PrinterId from dbo.Printer where PrinterName='West Trenton 1'
Select @printer7=  PrinterId from dbo.Printer where PrinterName='West Trenton 2'
Select @printer8=  PrinterId from dbo.Printer where PrinterName='Hammonton 1'
Select @printer10=  PrinterId from dbo.Printer where PrinterName='Hammonton 2'
Select @printer11=  PrinterId from dbo.Printer where PrinterName='Hammonton 3'
Select @printer12=  PrinterId from dbo.Printer where PrinterName='Parsippany 2'
Select @printer13=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP3'
Select @printer14=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_P004'
Select @printer15=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_IN4'
Select @printer16=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_MFP6'
Select @printer17=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP4'
Select @printer18=  PrinterId from dbo.Printer where PrinterCode='MFP5'
Select @printer19=  PrinterId from dbo.Printer where PrinterName='Archive Only'
Select @printer20=  PrinterId from dbo.Printer where PrinterName='Hammonton ID'
Select @printer21=  PrinterId from dbo.Printer where PrinterName='Parsippany ID'
Select @printer22=  PrinterId from dbo.Printer where PrinterName='West Trenton ID'
Select @printer23=  PrinterId from dbo.Printer where PrinterName='West Trenton Lobby ID'



 INSERT INTO [dbo].[LOBPrinter]
  (    [LOBId]
	  ,[DocumentId]
      ,[PrinterId]
      ,[PrinterOrder]
	  ,[EffectiveDate] 
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime]	  )
 VALUES 
 (@lobwcu, @document1, @printer20,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document1, @printer21,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document1, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document1, @printer22,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document1, @printer23,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobwcu, @document2, @printer20,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document2, @printer21,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document2, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document2, @printer22,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document2, @printer23,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobwcu, @document3, @printer20,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document3, @printer21,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document3, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document3, @printer22,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document3, @printer23,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobwcu, @document4, @printer20,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document4, @printer21,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document4, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document4, @printer22,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document4, @printer23,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobwcu, @document5, @printer20,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document5, @printer21,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document5, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document5, @printer22,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document5, @printer23,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobwcu, @document6, @printer20,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document6, @printer21,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document6, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document6, @printer22,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @document6, @printer23,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
 


 --End of document printers



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
 


 (@lobwcu,@catunder1, @printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer10,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer11,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer13,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer14,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer15,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer16,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer17,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer18,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder1, @printer19,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer10,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer11,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer13,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer14,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer15,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer16,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer17,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer18,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder2, @printer19,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

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




















































































































































































































































































































 INSERT INTO dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  
  ('PRT_PL_CLRMFP4','PRT_PL_CLRMFP4',1,SUSER_SNAME(),GETDATE(),null,null),
  ('WPLBC1','WPLBC1',1,SUSER_SNAME(),GETDATE(),null,null),
  ('WPLBC2','WPLBC2',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PL_ONLINEAUTOAPP','Off Call Processing',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PL_CUS2','West Trenton 1',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PL_HA2','Hammonton 2',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PL_HA3','Hammonton 3',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PPLBC2','Parsippany 2',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_CLRMFP3','PRT_PL_CLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_P004','PRT_PL_P004',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_IN4','PRT_PL_IN4',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_MFP6','PRT_PL_MFP6',1,SUSER_SNAME(),GETDATE(),null,null),
  ('MFP5','MFP5',1,SUSER_SNAME(),GETDATE(),null,null),
  
  ('ACLB10','ACLB10',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_CLRMFP3','PRT_PL_CLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_IN4','PRT_PL_IN4',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_MFP6','PRT_PL_MFP6',1,SUSER_SNAME(),GETDATE(),null,null),
  ('PRT_PL_QA1','PRT_PL_QA1',1,SUSER_SNAME(),GETDATE(),null,null)

  go



declare @lobIdbcpa int,@lobwcu int,@catunder int;

Select @lobwcu=  lobId from dbo.LOB where LOBName='PC-UMB'

Select @catunder=  CategoryId from dbo.Category where CategoryName='PL_UNDERWRITING_UMB'

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




