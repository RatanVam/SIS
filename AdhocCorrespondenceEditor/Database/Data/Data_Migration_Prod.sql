USE ACE
GO

declare @environment varchar(max)
declare @lobIdca int,@lobcgl int, @lobbop int, @lobcumb int,@lobMulti int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobIdca=  lobId from dbo.LOB where LOBName='PC-CA'
Select @lobcgl=  lobId from dbo.LOB where LOBName='PC-CGL'
Select @lobbop=  lobId from dbo.LOB where LOBName='PC-BOP'
Select @lobcumb=  lobId from dbo.LOB where LOBName='PC-CUMB'
Select @lobmulti=  lobId from dbo.LOB where LOBName='PC-MULTI'


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
			(@lobIdca,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3048/PolicyDataService/CAPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobIdca,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewCLDocument',SUSER_SNAME(),GETDATE(),null,null),

			(@lobcgl,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3053/PolicyDataService/CGLPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobcgl,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewCLDocument',SUSER_SNAME(),GETDATE(),null,null),

			(@lobbop,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3111/PolicyDataService/BOPPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobbop,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewCLDocument',SUSER_SNAME(),GETDATE(),null,null),

			(@lobcumb,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3112/PolicyDataService/CUMBPolicyInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobcumb,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewCLDocument',SUSER_SNAME(),GETDATE(),null,null),

			(@lobmulti,'ESBUrl','PROD', 'http://esbp.njmgroup.com:3126/AccountDataService/CPPAcccountInformationRetriever',SUSER_SNAME(),GETDATE(),null,null),
			(@lobmulti,'SampleUrl','PROD','http://inspireprod:30600/rest/api/submit-job/PreviewCLDocument',SUSER_SNAME(),GETDATE(),null,null)

   END

GO


 INSERT INTO dbo.Printer (PrinterCode, PrinterName, IsPrinterActive,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
 Values
('TCOMAUT1XP','TCOMAUT1XP',1,SUSER_SNAME(),GETDATE(),null,null),
('WUWBC1',	'WUWBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('WENGBC1',	'WENGBC1',1,SUSER_SNAME(),GETDATE(),null,null),
('IT_Test',	'IT_Test',1,SUSER_SNAME(),GETDATE(),null,null),
('WPASCAN1','WPASCAN1',1,SUSER_SNAME(),GETDATE(),null,null),
('Archive Only',	'Archive Only',1,SUSER_SNAME(),GETDATE(),null,null),
('PRT_CL_CLRMFP4',	'PRT_CL_CLRMFP4',1,SUSER_SNAME(),GETDATE(),null,null)


declare @lobIdca int,@lobcgl int, @lobbop int, @lobcumb int,@lobMulti int
Select @lobIdca=  lobId from dbo.LOB where LOBName='PC-CA'
Select @lobcgl=  lobId from dbo.LOB where LOBName='PC-CGL'
Select @lobbop=  lobId from dbo.LOB where LOBName='PC-BOP'
Select @lobcumb=  lobId from dbo.LOB where LOBName='PC-CUMB'
Select @lobmulti=  lobId from dbo.LOB where LOBName='PC-MULTI'

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
 (@lobIdca,1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdca,2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdca,3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdca,4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdca,5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdca,6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobIdca,7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobbop,1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobbop,2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobbop,3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobbop,4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobbop,5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobbop,6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobbop,7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobcgl,1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcgl,2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcgl,3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcgl,4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcgl,5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcgl,6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcgl,7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobcumb,1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcumb,2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcumb,3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcumb,4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcumb,5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcumb,6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobcumb,7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

 (@lobmulti,1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobmulti,2,2,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobmulti,3,3,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobmulti,4,4,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobmulti,5,5,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobmulti,6,6,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
 (@lobmulti,7,7,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
 
 GO
