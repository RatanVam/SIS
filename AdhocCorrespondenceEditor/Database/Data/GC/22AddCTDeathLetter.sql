-- =============================================
-- Author:		Sandhya Kethenei
-- Create date: 08/14/2024
-- Description: CLAIM-10664 2161848002_FN_Adding back CT Death Letter
-- =============================================

If not exists (select documentId from Document where DocumentFriendlyName='CT Death Letter')
insert into Document 
(DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,CreatedBy,CreatedDateTime)
values
('CT Death Letter','CT Death Letter',1,null,'companyRoot:S:Production://Templates/GeneralClaims/CT Death Letter.jld','GCOM  Correspondence Out',SYSTEM_USER,SYSDATETIME())

declare @doc_CT_Death_ltr int = (Select documentId from Document where DocumentFriendlyName = 'CT Death Letter')
declare @cat_PIP int = (Select categoryId from Category where CategoryName = 'GC_PIP')


If not exists (select documentId from CategoryDocument where DocumentId=@doc_CT_Death_ltr and CategoryId = @cat_PIP)
insert into CategoryDocument ( CategoryId,DocumentId,DocumentOrder, EffectiveDate,ExpirationDate, CreatedBy,CreatedDateTime)
values (@cat_PIP, @doc_CT_Death_ltr, 1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE())

declare @ctrl_GCExposureNameAndType int = (select controlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select controlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select controlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select controlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select controlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select controlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdownwCheckbox int = (select controlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select controlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select controlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select controlId from Control where controlName='ClaimsCcBcc')


IF not exists (select * from [DocumentControl] where DocumentId= @doc_CT_Death_ltr)
 INSERT [dbo].[DocumentControl] (
	  [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      )
VALUES
(@doc_CT_Death_ltr,@ctrl_GCExposureNameAndType,100,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_GCAddrOneandTwowGreetingName,200,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_GCAuthor,300,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_GCReSection,400,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_SelectCommunicationSection,500,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_GCBatchControls,600,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_PrinterDropdownwCheckbox,700,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_WCCEmail,800,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_ClaimsFax,900,SYSTEM_USER,SYSDATETIME()),
(@doc_CT_Death_ltr,@ctrl_ClaimsCcBcc,1000,SYSTEM_USER,SYSDATETIME())


declare @lobID  int =(select  LOBId from LOB where LOBName = 'GC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'restrictExposureTypeToMedPay' and LOBId = @lobid  and DocumentId=@doc_CT_Death_ltr)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'restrictExposureTypeToMedPay','True',@doc_CT_Death_ltr,SYSTEM_USER,SYSDATETIME())
end




