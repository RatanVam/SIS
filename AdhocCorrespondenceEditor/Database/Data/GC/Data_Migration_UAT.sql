Declare @LOBId int = (select LOBId from LOB where LOBName = 'GC')
if  @@SERVERNAME ='SQLU08VA1A01\SQL19UAT'
begin
if not exists (select * from dbo.WebService where Lobid = @LOBId)
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
           ,'UGCP1'
           ,'ESBUrl'
           ,'http://esbu.njmgroup.com:5407/XpCCCorrGCWeb/sca/DocumentDataRepository'
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		   (@LOBId
           ,'UGCP1'
           ,'SampleUrl'
           ,'http://inspireuat:30600/rest/api/submit-job/PreviewGCDocument'
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		    (@LOBId
           ,'UGCLO'
           ,'ESBUrl'
           ,'http://esbu.njmgroup.com:3209/XpCCCorrGCWeb/sca/DocumentDataRepository'
           ,SUSER_SNAME()
           ,GETDATE()
          ),
		   (@LOBId
           ,'UGCLO'
           ,'SampleUrl'
           ,'http://inspireuat:30600/rest/api/submit-job/PreviewGCDocument'
           ,SUSER_SNAME()
           ,GETDATE()
          )
         
		 
if not exists (select * from dbo.Printer where PrinterName = 'HPIPBC1')
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


declare @ptr_HPIPBC1 int = (select PrinterId from Printer where PrinterName = 'HPIPBC1')
declare @ptr_HPIPBC2 int = (select PrinterId from Printer where PrinterName = 'HPIPBC2')
declare @ptr_PHOBC1 int = (select PrinterId from Printer where PrinterName = 'PHOBC1')
declare @ptr_PLEGBC1 int = (select PrinterId from Printer where PrinterName = 'PLEGBC1')
declare @ptr_PPDBC2 int = (select PrinterId from Printer where PrinterName = 'PPDBC2')
declare @ptr_PPIPBC1 int = (select PrinterId from Printer where PrinterName = 'PPIPBC1')
declare @ptr_PPIPBC2 int = (select PrinterId from Printer where PrinterName = 'PPIPBC2')
declare @ptr_TLEGBC1 int = (select PrinterId from Printer where PrinterName = 'TLEGBC1')
declare @ptr_TLEGBC2 int = (select PrinterId from Printer where PrinterName = 'TLEGBC2')
declare @ptr_TMSABPUBC1 int = (select PrinterId from Printer where PrinterName = 'TMSABPUBC1')
declare @ptr_TPDBC1 int = (select PrinterId from Printer where PrinterName = 'TPDBC1')
declare @ptr_TPDBC3 int = (select PrinterId from Printer where PrinterName = 'TPDBC3')
declare @ptr_TPIPBC1 int = (select PrinterId from Printer where PrinterName = 'TPIPBC1')
declare @ptr_TPIPBC2 int = (select PrinterId from Printer where PrinterName = 'TPIPBC2')
declare @ptr_XPADMINBC1 int = (select PrinterId from Printer where PrinterName = 'XPADMINBC1')
declare @ptr_IT_Test int = (select PrinterId from Printer where PrinterName = 'IT_Test')
declare @ptr_HOADJ int = (select PrinterId from Printer where PrinterName = 'HOADJ')
declare @ptr_GCMFP2 int = (select PrinterId from Printer where PrinterName = 'GCMFP2')
declare @ptr_GCMFP3 int = (select PrinterId from Printer where PrinterName = 'GCMFP3')
declare @ptr_Archive_Only int = (select PrinterId from Printer where PrinterName = 'Archive Only')
declare @ptr_PRT_MSA_HCLRMFP3 int = (select PrinterId from Printer where PrinterName = 'PRT_MSA_HCLRMFP3')
declare @ptr_WMSAPROSVCSBC5 int = (select PrinterId from Printer where PrinterName = 'WMSAPROSVCSBC5')
declare @ptr_PRT_MSA_CLRMFP2 int = (select PrinterId from Printer where PrinterName = 'PRT_MSA_CLRMFP2')
declare @ptr_PRT_GC_HCLRMFP3 int = (select PrinterId from Printer where PrinterName = 'PRT_GC_HCLRMFP3')
declare @ptr_PRT_MSA_PMFP1 int = (select PrinterId from Printer where PrinterName = 'PRT_MSA_PMFP1')
declare @ptr_PRT_MSA_PMFP2 int = (select PrinterId from Printer where PrinterName = 'PRT_MSA_PMFP2')
declare @ptr_PRT_GC_PMFP2 int = (select PrinterId from Printer where PrinterName = 'PRT_GC_PMFP2')
declare @ptr_PRT_GC_HCLRMFP6 int = (select PrinterId from Printer where PrinterName = 'PRT_GC_HCLRMFP6')
declare @ptr_PRT_MSA_HCLRMFP2 int = (select PrinterId from Printer where PrinterName = 'PRT_MSA_HCLRMFP2')
declare @ptr_PRT_GC_MFP3 int = (select PrinterId from Printer where PrinterName = 'PRT_GC_MFP3')


if not exists (select * from dbo.LOBPrinter where PrinterId = @ptr_HPIPBC1 and LOBId=@LOBId)
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