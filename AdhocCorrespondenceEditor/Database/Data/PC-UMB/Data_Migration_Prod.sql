USE ACE
GO

declare @environment varchar(max)
declare @lobUMB int


Select @lobUMB=  lobId from dbo.LOB where LOBName='PC-UMB'


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

			(@lobUMB,'ESBUrl','PROD',   'http://esbp.njmgroup.com:3012/PolicyDataService/UMCorrespondenceData',SUSER_SNAME(),GETDATE(),null,null),
			(@lobUMB,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewPCHUDDcoument',SUSER_SNAME(),GETDATE(),null,null)

   END

GO




IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PL_HA2')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PL_HA2','Hammonton 2',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PL_HA3')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PL_HA3','Hammonton 3',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'MFP5')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('MFP5','MFP5',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PL_ONLINEAUTOAPP')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PL_ONLINEAUTOAPP','Off Call Processing',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PPLBC2')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PPLBC2','Parsippany 2',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PRT_PL_CLRMFP4')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PRT_PL_CLRMFP4','PRT_PL_CLRMFP4',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PRT_PL_CLRMFP3')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PRT_PL_CLRMFP3','PRT_PL_CLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PRT_PL_IN4')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PRT_PL_IN4','PRT_PL_IN4',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PRT_PL_MFP6')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PRT_PL_MFP6','PRT_PL_MFP6',1,SUSER_SNAME(),GETDATE(),null,null)
END
--IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PRT_PL_P004')
--BEGIN
-- INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
--      ,[CreatedDateTime]
--      ,[UpdatedBy]
--      ,[UpdatedDateTime])
-- Values
--  ('PRT_PL_P004','PRT_PL_P004',1,SUSER_SNAME(),GETDATE(),null,null)
--END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PL_CUS2')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
  ('PL_CUS2','West Trenton 1',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'WPLBC1')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('WPLBC1','WPLBC1',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'WPLBC2')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('WPLBC2','WPLBC2',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'ACLB10')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('ACLB10','ACLB10',1,SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS (SELECT * FROM ACE.dbo.Printer WHERE PrinterCode = 'PRT_PL_QA1')
BEGIN
 INSERT INTO ACE.dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('PRT_PL_QA1','PRT_PL_QA1',1,SUSER_SNAME(),GETDATE(),null,null)
END





declare @lobIdbcpa int,@lobwcu int,@catunder int;

Select @lobwcu=  lobId from dbo.LOB where LOBName='PC-UMB'

Select @catunder=  CategoryId from dbo.Category where CategoryName='PL_UNDERWRITING_UMB'

declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,
@printer8 int,@printer9 int,@printer10 int,@printer11 int,@printer12 int,@printer13 int,@printer14 int,
@printer15 int,@printer16 int,@printer17 int,@printer18 int,@printer19 int,@printer20 int


Select @printer1=  PrinterId from ACE.dbo.Printer where PrinterCode='ACLB10'
Select @printer2=  PrinterId from ACE.dbo.Printer where PrinterCode='Archive Only'
Select @printer3=  PrinterId from ACE.dbo.Printer where PrinterCode='PL_HA1'
Select @printer4=  PrinterId from ACE.dbo.Printer where PrinterCode='PL_HA2'
Select @printer5=  PrinterId from ACE.dbo.Printer where PrinterCode='PL_HA3'
Select @printer6=  PrinterId from ACE.dbo.Printer where PrinterCode='MFP5'
Select @printer7=  PrinterId from ACE.dbo.Printer where PrinterCode='PL_ONLINEAUTOAPP'
Select @printer8=  PrinterId from ACE.dbo.Printer where PrinterCode='PPLBC3'
Select @printer9=  PrinterId from ACE.dbo.Printer where PrinterCode='PPLBC2'
Select @printer10=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_CLRMFP4'
Select @printer11=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_CLRMFP3'
Select @printer12=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_IN4'
Select @printer13=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_MFP6'
Select @printer14=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_P004'
Select @printer15=  PrinterId from ACE.dbo.Printer where PrinterCode='PRT_PL_QA1'
Select @printer16=  PrinterId from ACE.dbo.Printer where PrinterCode='PL_CUS2'
--Select @printer17=  PrinterId from ACE.dbo.Printer where PrinterCode='West Trenton 2'
Select @printer18=  PrinterId from ACE.dbo.Printer where PrinterCode='WPLBC1'
Select @printer19=  PrinterId from ACE.dbo.Printer where PrinterCode='WPLBC2'
Select @printer20=  PrinterId from ACE.dbo.Printer where PrinterCode='IT_Test'


 INSERT INTO [ACE].[dbo].[LOBPrinter]
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


 (@lobwcu,@catunder, @printer1,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer2,20,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer3,30,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer4,40,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer5,50,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer6,60,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer7,70,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer8,80,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer9,90,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer10,100,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer11,110,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer12,120,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer13,130,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer14,140,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer15,150,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer16,160,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobwcu,@catunder, @printer17,170,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer18,180,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer19,190,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu,@catunder, @printer20,200,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)



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


 (@lobwcu, @printer18,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer19,20,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer20,30,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer8,40,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer7,50,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer16,60,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 --(@lobwcu, @printer17,70,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer3,80,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer4,90,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer5,100,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer9,110,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer11,120,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer14,130,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer12,140,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer13,150,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer10,160,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobwcu, @printer6,170,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
 
