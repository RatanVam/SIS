
declare @environment varchar(max)
declare @lobIdPa int,@lobWCU int
declare @catbl int,@catcoverage int, @catmulti int
declare @lobIdbcpa int,@catunder int,@catunder1 int,@catunder2 int;
declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,
@printer8 int,@printer9 int,@printer10 int,@printer11 int,@printer12 int,@printer13 int,@printer14 int,
@printer15 int,@printer16 int,@printer17 int,@printer18 int,@printer19 int,
@printer20 int, @printer21 int, @printer22 int, @printer23 int, @printer24 int
declare @document1 int,@document2 int,@document3 int,@document4 int,@document5 int,@document6 int


Select @lobIdPa=  lobId from dbo.LOB where LOBName='PC-PA'
IF EXISTS (SELECT * from WebService where LOBId= @lobIdPa and URLType = 'ESBUrl' and  Environment = 'Prod')
return

declare @lobPCPA int


Select @lobPCPA=  lobId from dbo.LOB where LOBName='PC-PA'

-- This differes from each environment


IF NOT EXISTS (SELECT * from WebService where LOBId= @lobPCPA )
  BEGIN
		 INSERT INTO [dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values

			(@lobPCPA,'ESBUrl','PROD',   'http://esbp.njmgroup.com:3026/PAPolicyInformationRetrieverWeb/sca/PAPolicyInformationRetrieverEnhancer',SUSER_SNAME(),GETDATE(),null,null),
			(@lobPCPA,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewPCAutoDocument',SUSER_SNAME(),GETDATE(),null,null)

   END


IF NOT EXISTS (SELECT * from dbo.Printer where PrinterCode= 'HPLBC1' )
  BEGIN
INSERT INTO dbo.Printer ( PrinterName,PrinterCode, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values

('Hammonton ID','HPLBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('Parsippany ID','PPLBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('Parsippany 2','PPLBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('West Trenton ID','WPLBC3',1,SUSER_SNAME(),GETDATE(),null,null),
('West Trenton Lobby ID','PRT_PL_IN12',1,SUSER_SNAME(),GETDATE(),null,null)
END

GO

declare @lobIdbcpa int,@lobPCPA int,@catunder int,@catunder1 int,@catunder2 int;
declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,
@printer8 int,@printer9 int,@printer10 int,@printer11 int,@printer12 int,@printer13 int,@printer14 int,
@printer15 int,@printer16 int,@printer17 int,@printer18 int,@printer19 int,@printer20 int

declare @printerid1 int,@printerid2 int,@printerid3 int,@printerid4 int,@printerid5 int
declare @document1 int,@document2 int,@document3 int,@document4 int,@document5 int,@document6 int


Select @lobPCPA=  lobId from dbo.LOB where LOBName='PC-PA'
Select @catunder1=  CategoryId from dbo.Category where CategoryName='PL_UNDERWRITING_AUTO'
Select @catunder2=  CategoryId from dbo.Category where CategoryName='PL_RENEWALS_UNDERWRITER_AUTO'


Select @document1 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ ID Card-PC'
Select @document2 =  DocumentId from [dbo].[Document] where DocumentName='NJM PA ID Card-PC'
Select @document3 =  DocumentId from [dbo].[Document] where DocumentName='NJM CT ID Card-PC'
Select @document4 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ Temporary ID Card'
Select @document5 =  DocumentId from [dbo].[Document] where DocumentName='NJM OH ID Card-PC'
Select @document6 =  DocumentId from [dbo].[Document] where DocumentName='NJM MD ID Card-PC'


Select @printerid1=  PrinterId from dbo.Printer where PrinterCode='HPLBC1'
Select @printerid2=  PrinterId from dbo.Printer where PrinterCode='PPLBC1'
Select @printerid3=  PrinterId from dbo.Printer where PrinterCode='PPLBC2'
Select @printerid4=  PrinterId from dbo.Printer where PrinterCode='WPLBC3'
Select @printerid5=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_IN12'


Select @printer1=  PrinterId from dbo.Printer where PrinterCode='WPLBC1'
Select @printer2=  PrinterId from dbo.Printer where PrinterCode='WPLBC2'
Select @printer3=  PrinterId from dbo.Printer where PrinterCode='IT_Test'
Select @printer4=  PrinterId from dbo.Printer where PrinterName='Parsippany 1'
Select @printer5=  PrinterId from dbo.Printer where PrinterName='Off Call Processing'
Select @printer6=  PrinterId from dbo.Printer where PrinterName='West Trenton 1'
Select @printer7=  PrinterId from dbo.Printer where PrinterName='West Trenton 2'
Select @printer8=  PrinterId from dbo.Printer where PrinterName='Hammonton 1'
Select @printer9=  PrinterId from dbo.Printer where PrinterName='Hammonton 2'
Select @printer10=  PrinterId from dbo.Printer where PrinterName='Hammonton 3'
Select @printer11=  PrinterId from dbo.Printer where PrinterName='Parsippany 2'
Select @printer12=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP3'
Select @printer13=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_IN4'
Select @printer14=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_MFP6'
Select @printer15=  PrinterId from dbo.Printer where PrinterCode='PRT_PL_CLRMFP4'
Select @printer16=  PrinterId from dbo.Printer where PrinterCode='MFP5'
Select @printer17=  PrinterId from dbo.Printer where PrinterName='Archive Only'
Select @printer18=  PrinterId from dbo.Printer where PrinterName='PRT_PL_QA1'


IF NOT EXISTS (SELECT * from dbo.LOBPrinter where DocumentId= @document1 AND LOBId = @lobPCPA )
  BEGIN
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
 (@lobPCPA, @document1, @printerid1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document1, @printerid2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document1, @printerid3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document1, @printerid4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document1, @printerid5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobPCPA, @document2, @printerid1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document2, @printerid2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document2, @printerid3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document2, @printerid4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document2, @printerid5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobPCPA, @document3, @printerid1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document3, @printerid2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document3, @printerid3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document3, @printerid4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document3, @printerid5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobPCPA, @document4, @printerid1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document4, @printerid2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document4, @printerid3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document4, @printerid4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document4, @printerid5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobPCPA, @document5, @printerid1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document5, @printerid2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document5, @printerid3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document5, @printerid4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document5, @printerid5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 
 (@lobPCPA, @document6, @printerid1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document6, @printerid2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document6, @printerid3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document6, @printerid4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA, @document6, @printerid5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
 --End of document printers
 END

 IF NOT EXISTS (SELECT * from dbo.LOBPrinter where DocumentId is NULL AND CategoryId is NULL AND LOBId = @lobPCPA )
 BEGIN
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


 (@lobPCPA,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer8,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer9,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobPCPA,@printer10,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer11,11,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer12,12,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer13,13,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer14,14,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer15,15,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@printer16,16,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
 --(@lobPCPA,@printer17,17,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobPCPA,@printer18,18,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
 END



 IF NOT EXISTS (SELECT * from dbo.LOBPrinter where CategoryId= @catunder1 AND LOBId = @lobPCPA )
 BEGIN
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
 
 
 (@lobPCPA,@catunder1, @printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer9,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer10,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer11,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer13,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer14,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer15,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer16,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer17,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder1, @printer18,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobPCPA,@catunder2, @printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer9,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer10,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer11,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer13,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer14,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer15,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer16,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer17,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobPCPA,@catunder2, @printer18,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 END



