-- =============================================
-- Author:		Kethinei,Sandhya
-- Create date: 07/02/2025
-- Description:	CLAIM-13084 - Add new Letter Diminished Value Release
-- =============================================

DECLARE @CatId int = (SELECT [CategoryId] FROM [dbo].[Category] WHERE [CategoryName] = 'GC_RELEASES')
DECLARE @LobId int = (SELECT [LOBId] FROM [dbo].[LOB] WHERE [LOBName] = 'GC')

IF NOT EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'Diminished Value Release')
BEGIN
	INSERT INTO [dbo].[Document] ([DocumentName], [DocumentFriendlyName], [IsDocumentActive], [JldFilePath], [DocumentType],[DocumentOtherType], [CreatedBy], [CreatedDateTime])
	VALUES ('Diminished Value Release', 'Diminished Value Release', 1, 'companyRoot:S:Production://Templates/GeneralClaims/Diminished Value Release.jld', 'GCOM  Correspondence Out','GLGL  Release', SUSER_SNAME(), GETDATE())
END

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Diminished Value Release')

IF NOT EXISTS (SELECT * FROM [dbo].[CategoryDocument] WHERE [DocumentId] = @DocId)
BEGIN
	INSERT INTO [dbo].[CategoryDocument] ([DocumentId], [CategoryId], [DocumentOrder], [EffectiveDate], [ExpirationDate], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CatId, 1, DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 90, GETDATE()), SUSER_SNAME(), GETDATE())
END

DECLARE @CtrlId_ExposureInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCExposureNameAndType')
DECLARE @CtrlId_Addressee int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCAddrOneandTwowGreetingName')
DECLARE @CtrlId_Author int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCAuthor')
DECLARE @CtrlId_ReSection int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCReSection')
DECLARE @CtrlId_GCVehicle int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCVehicle')
DECLARE @CtrlId_GCClaimantNameContactsOne int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCClaimantNmContactsOne')
DECLARE @CtrlId_GCClaimantNameContactsTwo int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCClaimantNameContactsTwo')
DECLARE @CtrlId_Select int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'SelectCommunicationSection')
DECLARE @CtrlId_PrintServices int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCBatchControls')
DECLARE @CtrlId_PrinterInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'PrinterDropdownwCheckbox')
DECLARE @CtrlId_Email int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'WCCEmail')
DECLARE @CtrlId_FaxInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'ClaimsFax')
DECLARE @CtrlId_CCSection int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'ClaimsCcBcc')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @DocId)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES
		(@DocId, @CtrlId_ExposureInformation, 100, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Addressee, 200, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Author, 300, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_ReSection, 400, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_GCVehicle, 500, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_GCClaimantNameContactsOne, 600, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_GCClaimantNameContactsTwo, 700, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Select, 800, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_PrintServices, 900, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_PrinterInformation, 1000, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Email, 1100, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_FaxInformation, 1200, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_CCSection, 1300, SUSER_SNAME(), GETDATE())
END


IF NOT EXISTS(select * from Configuration where ConfigKey='chkClaimant' and LOBId=@LobId and DocumentId=@DocId)
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values(@LobId,'chkClaimant','True',@DocId,SUSER_SNAME(), GETDATE())

go
-- =============================================
-- Author:		Kethinei,Sandhya
-- Create date: 07/15/2025
-- Description:	CLAIM-13082 - Remove controls for 750 Ltr Updates
-- =============================================
declare @docId int = (Select DocumentId from Document where DocumentFriendlyName='750 Ltr')
declare @pipCtrl int = (Select ControlId from Control where ControlName='GCPipDeductibileValue')
declare @healthCtrl int = (Select ControlId from Control where ControlName='GCHealthBenefitsList')

if exists(select * from DocumentControl where DocumentId = @docId and ControlId in (@pipCtrl,@healthCtrl))
delete from DocumentControl
where DocumentId = @docId
and ControlId in (@pipCtrl,@healthCtrl)

go
-- =============================================
-- Author:		Kethinei,Sandhya
-- Create date: 08/13/2025
-- Description:	CLAIM-13325 - Add rule for PA Unable to Contact Ltr
-- =============================================
declare @RuleId int = (select RuleId from [Rule] where RuleName='GC_SetLtrValue_PAExplainLtr')
declare @docId int = (select DocumentId from Document where DocumentFriendlyName='PA Unable to Contact Ltr')
declare @catId int = (select CategoryId from CategoryDocument where DocumentId = @docId)
declare @lobid int =(select LOBId from LOB where LOBName='GC')

if not exists(select * from RuleItem where DocumentId=@docId and RuleId=@RuleId)
insert into RuleItem (CategoryId,DocumentId,RuleId,LobId,CreatedBy,CreatedDateTime)
values (@catId, @docId, @RuleId,@lobid,SUSER_SNAME(),GETDATE())

go