
declare @environment varchar(max)
declare @lobWCC int


Select @lobWCC=  lobId from dbo.LOB where LOBName='WCC'


IF NOT EXISTS (SELECT * from WebService where LOBId= @lobWCC )
  BEGIN
		 INSERT INTO [dbo].[WebService] (LOBId,URLType,Environment,URL
		  ,[CreatedBy]
		  ,[CreatedDateTime]
		  ,[UpdatedBy]
		  ,[UpdatedDateTime])
		Values

			(@lobWCC,'ESBUrl','PROD',   'http://esbp.njmgroup.com:3403/XpCorrESBWeb/sca/GetCorrData',SUSER_SNAME(),GETDATE(),null,null),
			(@lobWCC,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewWCCDocument',SUSER_SNAME(),GETDATE(),null,null)

   END
GO

IF NOT EXISTS (SELECT * from dbo.Printer where PrinterCode= 'PRT_WC_HCLRMFP2' )
  BEGIN
INSERT INTO dbo.Printer ( PrinterName,PrinterCode, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values

('WCC ARCHIVE ONLY','WCC ARCHIVE ONLY',1,SUSER_SNAME(),GETDATE(),null,null),
('PADJBC2-WCC','PADJBC2-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('PMSAMEDMGMTBC3-WCC','PMSAMEDMGMTBC3-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WCOLORBC1-WCC','WCOLORBC1-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WINFOSVCSBC7-WCC','WINFOSVCSBC7-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WLEGALBC10-WCC','WLEGALBC10-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WLEGALBC8-WCC','WLEGALBC8-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSABPUBC1-WCC','WMSABPUBC1-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSAPROSVCSBC1-WCC','WMSAPROSVCSBC1-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSAPROSVCSBC5-WCC','WMSAPROSVCSBC5-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('WSUBROBC4-WCC','WSUBROBC4-WCC',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_CLRMFP2','PRT_WC_CLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_PMFP2','PRT_WC_PMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_CLRMFP4','PRT_WC_CLRMFP4',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_WC_HCLRMFP2','PRT_WC_HCLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null)

END


declare @lobWCC int
Select @lobWCC=  lobId from dbo.LOB where LOBName='WCC'

declare @printer1 int,@printer2 int,@printer3 int,@printer4 int,@printer5 int,@printer6 int,@printer7 int,
@printer8 int,@printer9 int,@printer10 int,@printer11 int,@printer12 int,@printer13 int,@printer14 int,@printer15 int


Select @printer1=  PrinterId from dbo.Printer where PrinterCode='WCC ARCHIVE ONLY'
Select @printer2=  PrinterId from dbo.Printer where PrinterCode='PADJBC2-WCC'
Select @printer3=  PrinterId from dbo.Printer where PrinterCode='PMSAMEDMGMTBC3-WCC'
Select @printer4=  PrinterId from dbo.Printer where PrinterCode='WCOLORBC1-WCC'
Select @printer5=  PrinterId from dbo.Printer where PrinterCode='WINFOSVCSBC7-WCC'
Select @printer6=  PrinterId from dbo.Printer where PrinterCode='WLEGALBC10-WCC'
Select @printer7=  PrinterId from dbo.Printer where PrinterCode='WLEGALBC8-WCC'
Select @printer8=  PrinterId from dbo.Printer where PrinterCode='WMSABPUBC1-WCC'
Select @printer9=  PrinterId from dbo.Printer where PrinterCode='WMSAPROSVCSBC1-WCC'
Select @printer10=  PrinterId from dbo.Printer where PrinterCode='WMSAPROSVCSBC5-WCC'
Select @printer11=  PrinterId from dbo.Printer where PrinterCode='WSUBROBC4-WCC'
Select @printer12=  PrinterId from dbo.Printer where PrinterCode='PRT_WC_CLRMFP2'
Select @printer13=  PrinterId from dbo.Printer where PrinterCode='PRT_WC_PMFP2'
Select @printer14=  PrinterId from dbo.Printer where PrinterCode='PRT_WC_CLRMFP4'
Select @printer15=  PrinterId from dbo.Printer where PrinterCode='PRT_WC_HCLRMFP2'

IF NOT EXISTS (SELECT * from dbo.LOBPrinter where DocumentId is NULL AND CategoryId is NULL AND LOBId = @lobWCC )
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

 
 (@lobWCC,@printer1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer8,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer9,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobWCC,@printer10,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer11,11,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer12,12,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer13,13,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer14,14,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobWCC,@printer15,15,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

 END


