USE [ACE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DECLARE @retVal int

SELECT @retVal = COUNT(*) FROM [dbo].[LOB]

IF (@retVal  > 0)
BEGIN
	 Truncate table [dbo].[GenericLookupItem]
	 Truncate table [dbo].[PolicyLookupItem]
	 Truncate table [dbo].[Configuration] 
	 Truncate table [dbo].[DocumentControl]
	 Truncate table [dbo].[CategoryDocument]
	 Truncate table [dbo].[LOBCategory]
	 Truncate table [dbo].WebService
	 Truncate table [dbo].LOBPrinter

	 delete from [dbo].[Control]
	 DBCC CHECKIDENT ('dbo.Control', RESEED, 0)

	 delete from [dbo].[Document]
	 DBCC CHECKIDENT ('dbo.Document', RESEED, 0)
	 delete from [dbo].[Category] 
	 DBCC CHECKIDENT ('dbo.Category', RESEED, 0)
	 delete from [dbo].[LOB]
	 DBCC CHECKIDENT ('dbo.LOB', RESEED, 0)
	 delete from [dbo].[LookupType]
	 DBCC CHECKIDENT ('dbo.LookupType', RESEED, 0)
	 delete from [dbo].Printer
	 DBCC CHECKIDENT ('dbo.Printer', RESEED, 0)

END


Insert into [dbo].[LOB] (LOBName,LOBType,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
  ('BC-PA','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-CA','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-CGL','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-BOP','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-CUMB','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-MULTI','',SUSER_SNAME(),GETDATE(),null,null)
, ('BC-WCU','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-PA','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-HO','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-DW','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-UMB','',SUSER_SNAME(),GETDATE(),null,null)
, ('GC','',SUSER_SNAME(),GETDATE(),null,null)
, ('WCC','',SUSER_SNAME(),GETDATE(),null,null)
, ('PC-WCU','',SUSER_SNAME(),GETDATE(),null,null)

GO


Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
('PC_CL_BLANK_LETTER_TEMPLATE',	'Blank Letter Templates',	1,SUSER_SNAME(),GETDATE(),null,null),
('Coverage Forms',	'Coverage Forms',	1	,SUSER_SNAME(),GETDATE(),null,null),
('CL Multiline',	'CL Multiline',	1	     ,SUSER_SNAME(),GETDATE(),null,null)

go

Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('CL Blank Letter Template',		'CL Blank Letter Template',	1,			NULL,	'companyRoot:S:Production://Templates/CommercialLines/CL Blank Letter Template.jld',	'CL  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Coverage Verification',	'Vehicle Coverage Verification',	1,	NULL,	'companyRoot:S:Production://Templates/CommercialLines/Vehicle Coverage Verification.jld'	,'CL  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CL Multi Line Quote Template',	'CL Multiline Quote',	1,				NULL,	'companyRoot:S:Production://Templates/CommercialLines/CL Multi Line Quote Template.jld'	,'CL  Multiline Quote Cover Pages',SUSER_SNAME(),GETDATE(),null,null)

GO


INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 
	 ('PrinterDropdown',SUSER_SNAME(),GETDATE(),null,null),
	 ('AddresseeOne',SUSER_SNAME(),GETDATE(),null,null),
	 ('CcSection',SUSER_SNAME(),GETDATE(),null,null),
	 ('VehicleDropdown',SUSER_SNAME(),GETDATE(),null,null),
	 ('CppDropdown',SUSER_SNAME(),GETDATE(),null,null),
	 ('CppTransactions',SUSER_SNAME(),GETDATE(),null,null)


declare @lobIdca int,@lobcgl int, @lobbop int, @lobcumb int,@lobMulti int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobIdca=  lobId from dbo.LOB where LOBName='PC-CA'
Select @lobcgl=  lobId from dbo.LOB where LOBName='PC-CGL'
Select @lobbop=  lobId from dbo.LOB where LOBName='PC-BOP'
Select @lobcumb=  lobId from dbo.LOB where LOBName='PC-CUMB'
Select @lobmulti=  lobId from dbo.LOB where LOBName='PC-MULTI'

Select @catbl=  CategoryId from [dbo].[Category] where CategoryName='PC_CL_BLANK_LETTER_TEMPLATE'
Select @catcoverage=  CategoryId from [dbo].[Category] where CategoryName='Coverage Forms'
Select @catmulti=  CategoryId from [dbo].[Category] where CategoryName='CL Multiline'
 

INSERT INTO [dbo].[LOBCategory]
	  ([LOBId]
      ,[CategoryId]
      ,[CategoryOrder]
	  ,[CategoryGroups]
	  ,[EffectiveDate]
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])

  VALUES
   (@lobIdca,@catbl,10,'Inspire_ACE_Prod,Inspire_Commercial_Lines,Inspire_CNSL_Commercial_Lines,Inspire_CNSLT_CommLines,Inspire_Blank_Letter_Template',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null), 
   (@lobIdca,@catcoverage,20,'Inspire_ACE_Prod,Inspire_Commercial_Lines,Inspire_CNSL_Commercial_Lines,Inspire_CNSLT_CommLines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null), 
   (@lobcgl,@catbl,10,'Inspire_ACE_Prod,Inspire_Commercial_Lines,Inspire_CNSL_Commercial_Lines,Inspire_CNSLT_CommLines,Inspire_Blank_Letter_Template',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null), 
   (@lobbop,@catbl,10,'Inspire_ACE_Prod,Inspire_Commercial_Lines,Inspire_CNSL_Commercial_Lines,Inspire_CNSLT_CommLines,Inspire_Blank_Letter_Template,Inspire_Preview_ES_FA',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null) ,
   (@lobcumb,@catbl,10,'Inspire_ACE_Prod,Inspire_Commercial_Lines,Inspire_CNSL_Commercial_Lines,Inspire_CNSLT_CommLines,Inspire_Blank_Letter_Template,Inspire_Preview_ES_FA',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
   (@lobmulti,@catmulti,10,'Inspire_ACE_Prod,Inspire_Commercial_Lines,Inspire_CNSL_Commercial_Lines,Inspire_CNSLT_CommLines,Inspire_Blank_Letter_Template,Inspire_Preview_ES_FA',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)    
GO


declare @catbl int,@catcoverage int, @catmulti int
declare @docbl int,@doccoverage int, @docmulti int

Select @catbl=  CategoryId from [dbo].[Category] where CategoryName='PC_CL_BLANK_LETTER_TEMPLATE'
Select @catcoverage=  CategoryId from [dbo].[Category] where CategoryName='Coverage Forms'
Select @catmulti=  CategoryId from [dbo].[Category] where CategoryName='CL Multiline'

Select @docbl=  DocumentId from [dbo].[Document] where DocumentName='CL Blank Letter Template'
Select @doccoverage=  DocumentId from [dbo].[Document] where DocumentName='Vehicle Coverage Verification'
Select @docmulti=  DocumentId from [dbo].[Document] where DocumentName='CL Multi Line Quote Template'


INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES
(@docbl,@catbl,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doccoverage,@catcoverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docmulti,@catmulti,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)


GO


declare @docbl int,@doccoverage int, @docmulti int

Select @docbl=  DocumentId from [dbo].[Document] where DocumentName='CL Blank Letter Template'
Select @doccoverage=  DocumentId from [dbo].[Document] where DocumentName='Vehicle Coverage Verification'
Select @docmulti=  DocumentId from [dbo].[Document] where DocumentName='CL Multi Line Quote Template'


 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@docbl,2,100,SUSER_SNAME(),GETDATE(),null,null),
(@docbl,1,200,SUSER_SNAME(),GETDATE(),null,null),
(@docbl,3,300,SUSER_SNAME(),GETDATE(),null,null),

(@doccoverage,2,100,SUSER_SNAME(),GETDATE(),null,null),
(@doccoverage,4,200,SUSER_SNAME(),GETDATE(),null,null),
(@doccoverage,1,300,SUSER_SNAME(),GETDATE(),null,null),
(@doccoverage,3,400,SUSER_SNAME(),GETDATE(),null,null),

(@docmulti,5,100,SUSER_SNAME(),GETDATE(),null,null),
(@docmulti,6,200,SUSER_SNAME(),GETDATE(),null,null),
(@docmulti,1,300,SUSER_SNAME(),GETDATE(),null,null)


GO

--TRUNCATE TABLE [ACE].[dbo].[Configuration] 
declare @lobIdca int,@lobcgl int, @lobbop int, @lobcumb int,@lobMulti int
declare @catbl int,@catcoverage int, @catmulti int

Select @lobIdca=  lobId from dbo.LOB where LOBName='PC-CA'
Select @lobcgl=  lobId from dbo.LOB where LOBName='PC-CGL'
Select @lobbop=  lobId from dbo.LOB where LOBName='PC-BOP'
Select @lobcumb=  lobId from dbo.LOB where LOBName='PC-CUMB'
Select @lobmulti=  lobId from dbo.LOB where LOBName='PC-MULTI'

 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobIdca,'SourceSystem','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'OnBaseKeyword1','A',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'LineOfBusiness','Commercial Automobile',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'CLDocSource','OUTGOING',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'PrintInd','DEPT',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'RecordKey','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'ProductCode','CA',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'LossPayeeSeqNo','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'Tag4','Policy Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'Tag4Num','004:',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'Tag6','Account Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'Tag6Num','080:',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'Tag12','Line of Business:',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'Tag12Num','002:',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'Value12','Commercial Auto',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdca,'ArchiveInd','Y',SUSER_SNAME(),GETDATE(),null,null),

(@lobcgl,'SourceSystem','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'OnBaseKeyword1','G',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'LineOfBusiness','Commercial General Liability',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'CLDocSource','OUTGOING',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'PrintInd','DEPT',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'RecordKey','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'ProductCode','CGL',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'LossPayeeSeqNo','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'Tag4','Policy Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'Tag4Num','004:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'Tag6','Account Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'Tag6Num','080:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'Tag12','Line of Business:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'Tag12Num','002:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'Value12','General Liability',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'ArchiveInd','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobcgl,'DocumentRecipient','INSURED',SUSER_SNAME(),GETDATE(),null,null),


(@lobbop,'SourceSystem','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'OnBaseKeyword1','B',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'LineOfBusiness','Businessowners',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'CLDocSource','OUTGOING',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'PrintInd','DEPT',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'RecordKey','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'ProductCode','BP',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'LossPayeeSeqNo','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'Tag4','Policy Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'Tag4Num','004:',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'Tag6','Account Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'Tag6Num','080:',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'Tag12','Line of Business:',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'Tag12Num','002:',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'Value12','Businessowners',SUSER_SNAME(),GETDATE(),null,null),
(@lobbop,'ArchiveInd','Y',SUSER_SNAME(),GETDATE(),null,null),

(@lobcumb,'SourceSystem','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'OnBaseKeyword1','U',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'LineOfBusiness','Commercial Excess and Umbrella',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'CLDocSource','OUTGOING',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'PrintInd','DEPT',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'RecordKey','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'ProductCode','BP',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'LossPayeeSeqNo','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'Tag4','Policy Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'Tag4Num','004:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'Tag6','Account Number:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'Tag6Num','080:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'Tag12','Line of Business:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'Tag12Num','002:',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'Value12','Commercial Excess and Umbrella',SUSER_SNAME(),GETDATE(),null,null),
(@lobcumb,'ArchiveInd','Y',SUSER_SNAME(),GETDATE(),null,null), 


(@lobmulti,'SourceSystem','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobmulti,'OnBaseKeyword1','',SUSER_SNAME(),GETDATE(),null,null),
(@lobmulti,'LineOfBusiness','Commercial Package Policy',SUSER_SNAME(),GETDATE(),null,null),
(@lobmulti,'CLDocSource','OUTGOING',SUSER_SNAME(),GETDATE(),null,null),
(@lobmulti,'PrintInd','DEPT',SUSER_SNAME(),GETDATE(),null,null),
(@lobmulti,'RecordKey','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobmulti,'ArchiveInd','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobmulti,'DocumentRecipient','BROKER',SUSER_SNAME(),GETDATE(),null,null)


GO


INSERT INTO [dbo].[LookupType] (LookupTypeValue
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])

  VALUES 
('PLLineOfBusiness',SUSER_SNAME(),GETDATE(),null,null),
('CSFEffective',SUSER_SNAME(),GETDATE(),null,null),
('CSFCoverage',SUSER_SNAME(),GETDATE(),null,null),
('Greeting',SUSER_SNAME(),GETDATE(),null,null),
('Attention',SUSER_SNAME(),GETDATE(),null,null),
('ReItem',SUSER_SNAME(),GETDATE(),null,null),
('NJMCompany',SUSER_SNAME(),GETDATE(),null,null),
('ReSection',SUSER_SNAME(),GETDATE(),null,null),
('DocumentsReferenced',SUSER_SNAME(),GETDATE(),null,null),
('LineOfBusiness',SUSER_SNAME(),GETDATE(),null,null),
('InsCompany',SUSER_SNAME(),GETDATE(),null,null),
('PCPAUnderwriterPrinters',SUSER_SNAME(),GETDATE(),null,null)

GO


INSERT INTO [dbo].[PolicyLookupItem] 
(PolicyLookupItemCode,PolicyLookupItemValue,LookupTypeId,
PolicyLookupItemOrder,IsPolicyLookupItemActive
	  ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
Values
('Automobile','Automobile','1',1,1,SUSER_SNAME(),GETDATE(),null,null),
('Homeowners','Homeowners','1',2,1,SUSER_SNAME(),GETDATE(),null,null),
('Dwelling','Dwelling','1',3,1,SUSER_SNAME(),GETDATE(),null,null),
('Umbrella','Umbrella','1',4,1,SUSER_SNAME(),GETDATE(),null,null),
('Commercial Auto','Commercial Auto','1',5,1,SUSER_SNAME(),GETDATE(),null,null),
('General Liability','General Liability','1',6,1,SUSER_SNAME(),GETDATE(),null,null),
('Business Owners Policy','Business Owners Policy','1',7,1,SUSER_SNAME(),GETDATE(),null,null),
('Commercial Umbrella','Commercial Umbrella','1',8,1,SUSER_SNAME(),GETDATE(),null,null),
('Commercial Package Policy','Commercial Package Policy','1',9,1,SUSER_SNAME(),GETDATE(),null,null),

('New Policy','N','2',1,1,SUSER_SNAME(),GETDATE(),null,null),
('Mid-Term Change','M','2',2,1,SUSER_SNAME(),GETDATE(),null,null),
('Renewal Change','R','2',3,1,SUSER_SNAME(),GETDATE(),null,null),

('NJM','NJM','3',1,1,SUSER_SNAME(),GETDATE(),null,null),
('Health Insurance','Health Insurance','3',2,1,SUSER_SNAME(),GETDATE(),null,null),
('Limitation on Lawsuit','Limitation on Lawsuit','3',3,1,SUSER_SNAME(),GETDATE(),null,null),
('No Limitation on Lawsuit','No Limitation on Lawsuit','3',4,1,SUSER_SNAME(),GETDATE(),null,null),

('Your Claim No:','Your Claim No:','6',1,1,SUSER_SNAME(),GETDATE(),null,null),
('Your Policy No:','Your Policy No:','6',2,1,SUSER_SNAME(),GETDATE(),null,null),
('Your Insured:','Your Insured:','6',3,1,SUSER_SNAME(),GETDATE(),null,null),
('Your Client:','Your Client:','6',4,1,SUSER_SNAME(),GETDATE(),null,null),
('Case Caption:','Case Caption:','6',5,1,SUSER_SNAME(),GETDATE(),null,null),
('Your File No:','Your File No:','6',6,1,SUSER_SNAME(),GETDATE(),null,null),
('Date(s) of Service:','Date(s) of Service:','6',7,1,SUSER_SNAME(),GETDATE(),null,null),

('NJM Insurance Company',	'Manufacturers Insurance','7',1,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM Re-Insurance Company',	'Re-Insurance','7',2,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM Indemnity Insurance Company',	'Indemnity Insurance','7',3,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM Casualty Insurance Company',	'Casualty Insurance','7',4,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM',	'Manufacturers Insurance','7',5,1,SUSER_SNAME(),GETDATE(),null,null),
('NJC',	'Casualty Insurance','7',6,1,SUSER_SNAME(),GETDATE(),null,null),
('NJI',	'Indemnity Insurance','7',7,1,SUSER_SNAME(),GETDATE(),null,null),
('NJRE',	'Re-Insurance','7',8,1,SUSER_SNAME(),GETDATE(),null,null),
('njm_ext',	'Manufacturers Insurance','7',9,1,SUSER_SNAME(),GETDATE(),null,null),
('njc_ext',	'Casualty Insurance','7',10,1,SUSER_SNAME(),GETDATE(),null,null),
('njre_ext',	'Re-Insurance','7',11,1,SUSER_SNAME(),GETDATE(),null,null),
('nji_ext',	'Indemnity Insurance','7',12,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM Claims Management Services LLC',	'NJM Claims Management Services LLC','7',13,1,SUSER_SNAME(),GETDATE(),null,null),

('Claim Petition Number',	'Claim Petition Number','8',1,1,SUSER_SNAME(),GETDATE(),null,null),
('State ID Number',	'State ID Number','8',2,1,SUSER_SNAME(),GETDATE(),null,null),
('Docket Number',	'Docket Number','8',3,1,SUSER_SNAME(),GETDATE(),null,null),
('Listing Date',	'Listing Date','8',4,1,SUSER_SNAME(),GETDATE(),null,null),
('NY WCB Number',	'NY WCB Number','8',5,1,SUSER_SNAME(),GETDATE(),null,null),

('AMA','AMA','9',1,1,SUSER_SNAME(),GETDATE(),null,null),
('AAOS','AAOS','9',2,1,SUSER_SNAME(),GETDATE(),null,null),
('NJ Fee Schedule guidelines','NJ Fee Schedule guidelines','9',3,1,SUSER_SNAME(),GETDATE(),null,null),
('Coding Companion','Coding Companion','9',4,1,SUSER_SNAME(),GETDATE(),null,null),
('Physician’s Fee Reference','Physician’s Fee Reference','9',5,1,SUSER_SNAME(),GETDATE(),null,null),
('RedBook PFR','RedBook PFR','9',6,1,SUSER_SNAME(),GETDATE(),null,null),

('Personal Lines Underwriting','Personal Lines Underwriting','10',1,1,SUSER_SNAME(),GETDATE(),null,null),
('Commercial Lines Underwriting','Commercial Lines Underwriting','10',2,1,SUSER_SNAME(),GETDATE(),null,null),

('NJM Insurance Company','NJM','11',1,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM Re-Insurance Company','NJRe','11',2,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM Indemnity Insurance Company','NJ Indemnity','11',3,1,SUSER_SNAME(),GETDATE(),null,null),
('NJM Casualty Insurance Company','NJ Casualty','11',4,1,SUSER_SNAME(),GETDATE(),null,null)


  INSERT INTO [dbo].[GenericLookupItem](
       [GenericLookupItemCode]
       ,[GenericLookupItemValue]
      ,[LookupTypeId]
      ,[GenericLookupItemOrder]
      ,[IsGenericLookupItemActive]
	  ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
  VALUES 
  ('Attn:','Attn:','5',1,1,SUSER_SNAME(),GETDATE(),null,null),
  ('c/o','c/o','5',2,1,SUSER_SNAME(),GETDATE(),null,null),

  ('None','','4',1,1,SUSER_SNAME(),GETDATE(),null,null),
  ('Mr.','Mr.','4',2,1,SUSER_SNAME(),GETDATE(),null,null),
  ('Mrs.','Mrs.','4',3,1,SUSER_SNAME(),GETDATE(),null,null),
  ('Ms.','Ms.','4',4,1,SUSER_SNAME(),GETDATE(),null,null),
  ('Dr.','Dr.','4',5,1,SUSER_SNAME(),GETDATE(),null,null)

GO

--INSERT [ACE].[dbo].[DocumentDropdownLookupType]
--	  (
--	   [DocumentId]
--      ,[LobId]
--      ,[DocumentDropdownLookupTypeCode]
--      ,[DocumentDropdownLookupTypeLabelName]
--      ,[DocumentDirection]
--	  ,[CreatedBy]
--      ,[CreatedDateTime]
--      ,[UpdatedBy]
--      ,[UpdatedDateTime])	  
--VALUES
--(2,2,'CL Doc Source','CL Doc Source','In', SUSER_SNAME(),GETDATE(),null,null)

  --insert into [ACE].[dbo].[DocumentDropdownLookupItem]
