Declare @LOBId int = (select LOBId from LOB where LOBName = 'GC')
If @@SERVERNAME = 'SQLP09AGBUS9,54931'
begin
if not exists (select * from dbo.WebService where Lobid = @LOBId)
INSERT INTO [dbo].[WebService]
           ([LOBId]
           ,[Environment]
           ,[URLType]
           ,[URL]
           ,[CreatedBy]
           ,[CreatedDateTime]
        )
     VALUES
           (@LOBId
           ,'Prod'
           ,'ESBUrl'
           ,'http://esbp.njmgroup.com:3209/XpCCCorrGCWeb/sca/DocumentDataRepository'
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		   (@LOBId
           ,'Prod'
           ,'SampleUrl'
           ,'http://inspireprod:30600/rest/api/submit-job/PreviewGCDocument'
           ,SUSER_SNAME()
           ,GETDATE()
          )

if not exists (select * from dbo.Printer where PrinterCode='HPIPBC1')
 INSERT INTO dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('HPIPBC1','HPIPBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('HPIPBC2','HPIPBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('PPIPBC1','PPIPBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('PPIPBC2','PPIPBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('TLEGBC1','TLEGBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('TLEGBC2','TLEGBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('TMSABPUBC1','TMSABPUBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('TPDBC3','TPDBC3',1,SUSER_SNAME(),GETDATE(),null,null),
('TPIPBC1','TPIPBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('TPIPBC2','TPIPBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('XPADMINBC1','XPADMINBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('HOADJ','HOADJ',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_HCLRMFP3','PRT_MSA_HCLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSAPROSVCSBC5','WMSAPROSVCSBC5',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_CLRMFP2','PRT_MSA_CLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_PMFP1','PRT_MSA_PMFP1',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_PMFP2','PRT_MSA_PMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_HCLRMFP2','PRT_MSA_HCLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_GC_HCLRMFP3','PRT_GC_HCLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_GC_HCLRMFP6','PRT_GC_HCLRMFP6',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_GC_MFP3','PRT_GC_MFP3',1,SUSER_SNAME(),GETDATE(),null,null)

Declare @ptr_HPIPBC1 int=(select PrinterId from Printer where PrinterName = 'HPIPBC1')
Declare @ptr_HPIPBC2 int=(select PrinterId from Printer where PrinterName = 'HPIPBC2')
Declare @ptr_PPIPBC1 int=(select PrinterId from Printer where PrinterName = 'PPIPBC1')
Declare @ptr_PPIPBC2 int=(select PrinterId from Printer where PrinterName = 'PPIPBC2')
Declare @ptr_TLEGBC1 int=(select PrinterId from Printer where PrinterName = 'TLEGBC1')
Declare @ptr_TLEGBC2 int=(select PrinterId from Printer where PrinterName = 'TLEGBC2')
Declare @ptr_TMSABPUBC1 int=(select PrinterId from Printer where PrinterName = 'TMSABPUBC1')
Declare @ptr_TPDBC3 int=(select PrinterId from Printer where PrinterName = 'TPDBC3')
Declare @ptr_TPIPBC1 int=(select PrinterId from Printer where PrinterName = 'TPIPBC1')
Declare @ptr_TPIPBC2 int=(select PrinterId from Printer where PrinterName = 'TPIPBC2')
Declare @ptr_XPADMINBC1 int=(select PrinterId from Printer where PrinterName = 'XPADMINBC1')
Declare @ptr_IT_Test int=(select PrinterId from Printer where PrinterName = 'IT_Test')
Declare @ptr_HOADJ int=(select PrinterId from Printer where PrinterName = 'HOADJ')
Declare @ptr_Archive_Only int=(select PrinterId from Printer where PrinterName = 'Archive Only')
Declare @ptr_PRT_MSA_HCLRMFP3 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_HCLRMFP3')
Declare @ptr_WMSAPROSVCSBC5 int=(select PrinterId from Printer where PrinterName = 'WMSAPROSVCSBC5')
Declare @ptr_PRT_MSA_CLRMFP2 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_CLRMFP2')
Declare @ptr_PRT_MSA_PMFP1 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_PMFP1')
Declare @ptr_PRT_MSA_PMFP2 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_PMFP2')
Declare @ptr_PRT_MSA_HCLRMFP2 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_HCLRMFP2')
Declare @ptr_PRT_GC_MFP3 int=(select PrinterId from Printer where PrinterName = 'PRT_GC_MFP3')
Declare @ptr_PRT_GC_HCLRMFP3 int=(select PrinterId from Printer where PrinterName = 'PRT_GC_HCLRMFP3')
Declare @ptr_PRT_GC_HCLRMFP6 int=(select PrinterId from Printer where PrinterName = 'PRT_GC_HCLRMFP6')


if not exists (select * from dbo.LOBPrinter where LOBId=@LOBId)
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
(@LOBId,@ptr_HPIPBC1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_HPIPBC2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PPIPBC1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PPIPBC2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TLEGBC1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TLEGBC2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TMSABPUBC1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TPDBC3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TPIPBC1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TPIPBC2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_XPADMINBC1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_IT_Test,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_HOADJ,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_Archive_Only,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_HCLRMFP3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_WMSAPROSVCSBC5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_CLRMFP2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_PMFP1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_PMFP2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_HCLRMFP2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_GC_MFP3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_GC_HCLRMFP3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_GC_HCLRMFP6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
end