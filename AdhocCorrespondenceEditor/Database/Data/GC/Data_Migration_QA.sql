Declare @LOBId int = (select LOBId from LOB where LOBName = 'GC')
If @@SERVERNAME = 'SQLQ08VA1A01\SQL19QA'
begin
if exists (select * from dbo.WebService where Lobid = @LOBId)
delete from [dbo].[WebService]
where LOBId=@LOBId

--Insert ESB URL for GC
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
           ,'QGCP1'
           ,'ESBUrl'
           ,'http://esbq.njmgroup.com:5407/XpCCCorrGCWeb/sca/DocumentDataRepository '
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		   (@LOBId
           ,'QGCP1'
           ,'SampleUrl'
           ,'http://inspireqa:30600/rest/api/submit-job/PreviewGCDocument'
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		   (@LOBId
           ,'QGCLO'
           ,'ESBUrl'
           ,'http://esbq.njmgroup.com:3209/XpCCCorrGCWeb/sca/DocumentDataRepository'
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		   (@LOBId
           ,'QGCLO'
           ,'SampleUrl'
           ,'http://inspireqa:30600/rest/api/submit-job/PreviewGCDocument'
           ,SUSER_SNAME()
           ,GETDATE()
          )

		  
if exists (select * from dbo.[LOBPrinter] where LOBId=@LOBId)
delete from LOBPrinter
where LOBId=@LOBId

if exists (select * from dbo.Printer where PrinterName = 'HPIPBC1')
delete from Printer
where PrinterName in ('HPIPBC1',
'HPIPBC2',
'PHOBC1',
'PLEGBC1',
'PPDBC2',
'PPIPBC1',
'PPIPBC2',
'TLEGBC1',
'TLEGBC2',
'TMSABPUBC1',
'TPDBC1',
'TPDBC3',
'TPIPBC1',
'TPIPBC2',
'XPADMINBC1',
'HOADJ',
'GCMFP2',
'GCMFP3',
'PRT_MSA_HCLRMFP3',
'WMSAPROSVCSBC5',
'PRT_MSA_CLRMFP2',
'PRT_GC_HCLRMFP3',
'PRT_MSA_PMFP1',
'PRT_MSA_PMFP2',
'PRT_GC_PMFP2',
'PRT_GC_HCLRMFP6',
'PRT_MSA_HCLRMFP2',
'PRT_GC_MFP3')

 INSERT INTO dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('HPIPBC1','HPIPBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('HPIPBC2','HPIPBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('PHOBC1','PHOBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('PLEGBC1','PLEGBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('PPDBC2','PPDBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('PPIPBC1','PPIPBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('PPIPBC2','PPIPBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('TLEGBC1','TLEGBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('TLEGBC2','TLEGBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('TMSABPUBC1','TMSABPUBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('TPDBC1','TPDBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('TPDBC3','TPDBC3',1,SUSER_SNAME(),GETDATE(),null,null),
('TPIPBC1','TPIPBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('TPIPBC2','TPIPBC2',1,SUSER_SNAME(),GETDATE(),null,null),
('XPADMINBC1','XPADMINBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('HOADJ','HOADJ',1,SUSER_SNAME(),GETDATE(),null,null),
('GCMFP2','GCMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('GCMFP3','GCMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_HCLRMFP3','PRT_MSA_HCLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
('WMSAPROSVCSBC5','WMSAPROSVCSBC5',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_CLRMFP2','PRT_MSA_CLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_GC_HCLRMFP3','PRT_GC_HCLRMFP3',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_PMFP1','PRT_MSA_PMFP1',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_PMFP2','PRT_MSA_PMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_GC_PMFP2','PRT_GC_PMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_GC_HCLRMFP6','PRT_GC_HCLRMFP6',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_MSA_HCLRMFP2','PRT_MSA_HCLRMFP2',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_GC_MFP3','PRT_GC_MFP3',1,SUSER_SNAME(),GETDATE(),null,null)


Declare @ptr_HPIPBC1 int=(select PrinterId from Printer where PrinterName = 'HPIPBC1')
Declare @ptr_HPIPBC2 int=(select PrinterId from Printer where PrinterName = 'HPIPBC2')
Declare @ptr_PHOBC1 int=(select PrinterId from Printer where PrinterName = 'PHOBC1')
Declare @ptr_PLEGBC1 int=(select PrinterId from Printer where PrinterName = 'PLEGBC1')
Declare @ptr_PPDBC2 int=(select PrinterId from Printer where PrinterName = 'PPDBC2')
Declare @ptr_PPIPBC1 int=(select PrinterId from Printer where PrinterName = 'PPIPBC1')
Declare @ptr_PPIPBC2 int=(select PrinterId from Printer where PrinterName = 'PPIPBC2')
Declare @ptr_TLEGBC1 int=(select PrinterId from Printer where PrinterName = 'TLEGBC1')
Declare @ptr_TLEGBC2 int=(select PrinterId from Printer where PrinterName = 'TLEGBC2')
Declare @ptr_TMSABPUBC1 int=(select PrinterId from Printer where PrinterName = 'TMSABPUBC1')
Declare @ptr_TPDBC1 int=(select PrinterId from Printer where PrinterName = 'TPDBC1')
Declare @ptr_TPDBC3 int=(select PrinterId from Printer where PrinterName = 'TPDBC3')
Declare @ptr_TPIPBC1 int=(select PrinterId from Printer where PrinterName = 'TPIPBC1')
Declare @ptr_TPIPBC2 int=(select PrinterId from Printer where PrinterName = 'TPIPBC2')
Declare @ptr_XPADMINBC1 int=(select PrinterId from Printer where PrinterName = 'XPADMINBC1')
Declare @ptr_IT_Test int=(select PrinterId from Printer where PrinterName = 'IT_Test')
Declare @ptr_HOADJ int=(select PrinterId from Printer where PrinterName = 'HOADJ')
Declare @ptr_GCMFP2 int=(select PrinterId from Printer where PrinterName = 'GCMFP2')
Declare @ptr_GCMFP3 int=(select PrinterId from Printer where PrinterName = 'GCMFP3')
Declare @ptr_Archive_Only int=(select PrinterId from Printer where PrinterName = 'Archive Only')
Declare @ptr_PRT_MSA_HCLRMFP3 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_HCLRMFP3')
Declare @ptr_WMSAPROSVCSBC5 int=(select PrinterId from Printer where PrinterName = 'WMSAPROSVCSBC5')
Declare @ptr_PRT_MSA_CLRMFP2 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_CLRMFP2')
Declare @ptr_PRT_GC_HCLRMFP3 int=(select PrinterId from Printer where PrinterName = 'PRT_GC_HCLRMFP3')
Declare @ptr_PRT_MSA_PMFP1 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_PMFP1')
Declare @ptr_PRT_MSA_PMFP2 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_PMFP2')
Declare @ptr_PRT_GC_PMFP2 int=(select PrinterId from Printer where PrinterName = 'PRT_GC_PMFP2')
Declare @ptr_PRT_GC_HCLRMFP6 int=(select PrinterId from Printer where PrinterName = 'PRT_GC_HCLRMFP6')
Declare @ptr_PRT_MSA_HCLRMFP2 int=(select PrinterId from Printer where PrinterName = 'PRT_MSA_HCLRMFP2')
Declare @ptr_PRT_GC_MFP3 int=(select PrinterId from Printer where PrinterName = 'PRT_GC_MFP3')

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
(@LOBId,@ptr_HPIPBC2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PHOBC1,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PLEGBC1,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PPDBC2,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PPIPBC1,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PPIPBC2,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TLEGBC1,8,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TLEGBC2,9,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TMSABPUBC1,10,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TPDBC1,11,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TPDBC3,12,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TPIPBC1,13,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_TPIPBC2,14,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_XPADMINBC1,15,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_IT_Test,16,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_HOADJ,17,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_GCMFP2,18,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_GCMFP3,19,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_Archive_Only,20,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_HCLRMFP3,21,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_WMSAPROSVCSBC5,22,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_CLRMFP2,23,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_GC_HCLRMFP3,24,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_PMFP1,25,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_PMFP2,26,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_GC_PMFP2,27,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_GC_HCLRMFP6,28,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_MSA_HCLRMFP2,29,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@LOBId,@ptr_PRT_GC_MFP3,30,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
end