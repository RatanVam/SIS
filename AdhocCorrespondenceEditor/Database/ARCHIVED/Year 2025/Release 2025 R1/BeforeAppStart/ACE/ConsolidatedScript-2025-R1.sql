-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 12/31/2024
-- Description:	CLAIM-11665 Add new letter Denial-Motorized Bicycle.
-- =============================================

declare @categoryId int = (select categoryid from Category where CategoryFriendlyName= 'PIP')

if not exists(select * from Document where DocumentFriendlyName='Denial-Motorized Bicycle')
insert into Document (DocumentName,DocumentFriendlyName,IsDocumentActive,JldFilePath,DocumentType,CreatedBy,CreatedDateTime)
values ('Denial-Motorized Bicycle','Denial-Motorized Bicycle',1,'companyRoot:S:Production://Templates/GeneralClaims/Denial-Motorized Bicycle.jld','GCOM  Correspondence Out',SUSER_SNAME(),GETDATE())

declare @documentId int = (select documentId from Document where DocumentFriendlyName= 'Denial-Motorized Bicycle')

if not exists(select * from CategoryDocument where DocumentId = @documentId)
insert into CategoryDocument ( CategoryId , DocumentId, DocumentOrder,EffectiveDate,ExpirationDate,CreatedBy,CreatedDateTime)
values (@categoryId,@documentId,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE())

declare @ctrl_GCExposureNameAndType int= (select controlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int= (select controlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int= (select controlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int= (select controlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int= (select controlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int= (select controlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdownwCheckbox int= (select controlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int= (select controlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int= (select controlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int= (select controlId from Control where controlName='ClaimsCcBcc')

If not exists (select * from DocumentControl where documentId = @documentId)
insert into DocumentControl  ([ControlId],[DocumentId],[ControlOrder],[CreatedBy],[CreatedDateTime])
values
(@ctrl_GCExposureNameAndType,@documentId,100,SUSER_SNAME(),GETDATE()),
(@ctrl_GCAddrOneandTwowGreetingName,@documentId,200,SUSER_SNAME(),GETDATE()),
(@ctrl_GCAuthor,@documentId,300,SUSER_SNAME(),GETDATE()),
(@ctrl_GCReSection,@documentId,400,SUSER_SNAME(),GETDATE()),
(@ctrl_SelectCommunicationSection,@documentId,500,SUSER_SNAME(),GETDATE()),
(@ctrl_GCBatchControls,@documentId,600,SUSER_SNAME(),GETDATE()),
(@ctrl_PrinterDropdownwCheckbox,@documentId,700,SUSER_SNAME(),GETDATE()),
(@ctrl_WCCEmail,@documentId,800,SUSER_SNAME(),GETDATE()),
(@ctrl_ClaimsFax,@documentId,900,SUSER_SNAME(),GETDATE()),
(@ctrl_ClaimsCcBcc,@documentId,1000,SUSER_SNAME(),GETDATE())
 go
 
 -- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 12/31/2024
-- Description:	CLAIM-11668 Add GcClaimantNmAndVehicle control to Limited power of Attny
-- =============================================
 declare @lobId int = (select LOBId from LOB where LOBName = 'GC')
declare @documentId int = (select documentId from Document where DocumentFriendlyName= 'Limited Power of Attorney')

If not exists (select * from Configuration where documentId = @documentId and ConfigKey = 'isClaimantNameContactRequired')
insert into Configuration (ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime, LOBId)
values ('isClaimantNameContactRequired', 'true',@documentId,SUSER_SNAME(),GETDATE(),@lobId)


If not exists (select * from Configuration where documentId = @documentId and ConfigKey = 'makeClaimantVehicleMandatory')
insert into Configuration (ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime, LOBId)
values ('makeClaimantVehicleMandatory', 'true',@documentId,SUSER_SNAME(),GETDATE(),@lobId)

go

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 01/02/2025
-- Description:	CLAIM-11689 Add NY IME Notification and Reschedule Ltr
-- =============================================

declare @categoryId int = (select categoryid from Category where CategoryFriendlyName= 'PIP')

if not exists(select * from Document where DocumentFriendlyName='NY IME Notification and Reschedule Ltr')
insert into Document (DocumentName,DocumentFriendlyName,IsDocumentActive,JldFilePath,DocumentType,CreatedBy,CreatedDateTime)
values ('NY IME Notification and Reschedule Ltr','NY IME Notification and Reschedule Ltr',1,'companyRoot:S:Production://Templates/GeneralClaims/NY IME Notification and Reschedule Ltr.jld','GCOM  Correspondence Out',SUSER_SNAME(),GETDATE())

declare @documentId int = (select documentId from Document where DocumentFriendlyName= 'NY IME Notification and Reschedule Ltr')

if not exists(select * from CategoryDocument where DocumentId = @documentId)
insert into CategoryDocument ( CategoryId , DocumentId, DocumentOrder,EffectiveDate,ExpirationDate,CreatedBy,CreatedDateTime)
values (@categoryId,@documentId,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE())


if not exists(select * from Control where ControlName = 'GCSendLtrToInfo')
insert into Control (ControlName,CreatedBy,CreatedDateTime)
values ('GCSendLtrToInfo',SUSER_SNAME(),GETDATE())

declare @ctrl_GCExposureNameAndType int= (select controlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int= (select controlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int= (select controlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int= (select controlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int= (select controlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int= (select controlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdownwCheckbox int= (select controlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int= (select controlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int= (select controlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int= (select controlId from Control where controlName='ClaimsCcBcc')
declare @ctrl_SendLtrTo int= (select controlId from Control where controlName='GCSendLtrToInfo')


If not exists (select * from DocumentControl where documentId = @documentId)
insert into DocumentControl  ([ControlId],[DocumentId],[ControlOrder],[CreatedBy],[CreatedDateTime])
values
(@ctrl_GCExposureNameAndType,@documentId,100,SUSER_SNAME(),GETDATE()),
(@ctrl_GCAddrOneandTwowGreetingName,@documentId,200,SUSER_SNAME(),GETDATE()),
(@ctrl_GCAuthor,@documentId,300,SUSER_SNAME(),GETDATE()),
(@ctrl_GCReSection,@documentId,400,SUSER_SNAME(),GETDATE()),
(@ctrl_SendLtrTo,@documentId,500,SUSER_SNAME(),GETDATE()),
(@ctrl_SelectCommunicationSection,@documentId,600,SUSER_SNAME(),GETDATE()),
(@ctrl_GCBatchControls,@documentId,700,SUSER_SNAME(),GETDATE()),
(@ctrl_PrinterDropdownwCheckbox,@documentId,800,SUSER_SNAME(),GETDATE()),
(@ctrl_WCCEmail,@documentId,900,SUSER_SNAME(),GETDATE()),
(@ctrl_ClaimsFax,@documentId,1000,SUSER_SNAME(),GETDATE()),
(@ctrl_ClaimsCcBcc,@documentId,1100,SUSER_SNAME(),GETDATE())
 go

 declare @sendLtrTo varchar(20) = 'sendLtrToOptions'
 declare @lobId int = (select LOBId from LOB where LOBName = 'GC')

 IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @sendLtrTo )
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@sendLtrTo,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @sendLtrToId int = (select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @sendLtrTo)

IF NOT EXISTS (SELECT * from DocumentDropdownLookupItem where DocumentDropdownLookupItemTypeId = @sendLtrToId )
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime)
Values
('Attorney','Attorney',@sendLtrToId,100,SUSER_SNAME(),GETDATE()),
('Claimant','Claimant',@sendLtrToId,200,SUSER_SNAME(),GETDATE())

-- =============================================
-- Author:		John Ryan
-- Create date: 01/21/2025
-- Description:	CLAIM-11673 - 2219894885_FN_PA Threshold Denial to Clmt or Atty
-- =============================================

IF NOT EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'PA Threshold Denial to Clmt or Atty')
BEGIN
	UPDATE [dbo].[Document]
	SET
		[DocumentName] = 'PA Threshold Denial to Clmt or Atty',
		[DocumentFriendlyName] = 'PA Threshold Denial to Clmt or Atty',
		[JldFilePath] = 'companyRoot:S:Production://Templates/GeneralClaims/PA Threshold Denial to Clmt or Atty.jld',
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE [DocumentName] = 'PA Threshold Denial to Clmt'

	UPDATE [dbo].[Document]
	SET
		[IsDocumentActive] = 0,
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE [DocumentName] = 'PA Threshold Denial to Atty'

	DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'PA Threshold Denial to Atty')
	DECLARE @CatId int = (SELECT [CategoryId] FROM [dbo].[Category] WHERE [CategoryName] = 'GC_BODILY_INJURY')

	UPDATE [dbo].[CategoryDocument]
	SET
		[ExpirationDate] = '01/21/2025',
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE
		[DocumentId] = @DocId
		AND [CategoryId] = @CatId
END

-- =============================================
-- Author:		Kalva Bala Krishna
-- Create date: 01/28/2025
-- Description:	PLPC-19788 Umb -CT Notice of Nonrenewal - there is no field available to select Nonrenewal reason at ACE UI and there is no field to enter values for driving record columns in Interactive UI..
-- =============================================

DECLARE @CategoryId int = (select categoryid from Category where CategoryFriendlyName= 'UMB Underwriter')
DECLARE @DocumentId int = (select documentId from Document where DocumentName= 'CT Notice of Nonrenewal-UMB')
DECLARE @ControlId int= (select controlId from Control where controlName='PLClaimViolationSection')

IF EXISTS (select * from DocumentControl where documentId = @DocumentId and ControlId=@ControlId)
BEGIN
    PRINT 'Control already exists for the document CT Notice of Nonrenewal-UMB for the Category UMB Underwriter.'
END
ELSE
BEGIN
  
	INSERT INTO DocumentControl  ([ControlId],[DocumentId],[ControlOrder],[CreatedBy],[CreatedDateTime])
	VALUES(@ControlId,@DocumentId,150,SUSER_SNAME(),GETDATE())

	PRINT 'Successfully inserted the control for the document CT Notice of Nonrenewal-UMB for the Category UMB Underwriter.'
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 01/31/2025
-- Description:	CLAIM-11673 - 2219894885_FN_PA Threshold Denial to Clmt or Atty
-- =============================================

DECLARE @RuleName varchar(700) = 'GC_SetLtrValue_PAExplainLtr'
DECLARE @RuleName1 varchar(700) = 'GC_SetPipMedpaylmts_Rule'

DECLARE @RuleGroupId int = (SELECT [RuleGroupId] FROM [dbo].[RuleGroup] WHERE [RuleGroupName] = 'BusinessRule')

IF NOT EXISTS (SELECT * FROM [dbo].[Rule] WHERE [RuleName] = 'GC_SetLtrValue_PAExplainLtr')
BEGIN
	INSERT INTO [dbo].[Rule] ([RuleName], [RuleNameSpace], [RuleMethod], [ExecutionOrder], [EffectiveDate], [ExpirationDate], [CreatedBy], [CreatedDateTime], [RuleGroupId])
	VALUES (@RuleName, 'AdhocCorrespondenceEditor.Client.GC_SetLtrValue_PAExplainLtr_Rule', 'SetLtrValue', 2, DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 90, GETDATE()), SUSER_SNAME(), GETDATE(), @RuleGroupId),
	 (@RuleName1, 'AdhocCorrespondenceEditor.Client.GC_SetPipMedpaylmts_Rule', 'SetPipMedpaylmts', 1, DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 90, GETDATE()), SUSER_SNAME(), GETDATE(), @RuleGroupId)
END

DECLARE @RuleId int = (SELECT [RuleId] FROM [dbo].[Rule] WHERE [RuleName] = @RuleName)
DECLARE @RuleId1 int = (SELECT [RuleId] FROM [dbo].[Rule] WHERE [RuleName] = @RuleName1)

DECLARE @LOBId int = (SELECT [LOBId] FROM [dbo].[LOB] WHERE [LOBName] = 'GC')
DECLARE @CategoryId int = (SELECT [CategoryId] FROM [dbo].[Category] WHERE [CategoryName] = 'GC_PIP')
DECLARE @DocumentId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'PA Explain Ltr')

IF NOT EXISTS (SELECT * FROM [dbo].[RuleItem] WHERE [RuleId] = @RuleId AND [LobId] = @LOBId AND [CategoryId] = @CategoryId AND [DocumentId] = @DocumentId)
BEGIN
	INSERT INTO [dbo].[RuleItem] ([RuleId], [LobId], [CategoryId], [DocumentId], [CreatedBy], [CreatedDateTime])
	VALUES (@RuleId, @LOBId, @CategoryId, @DocumentId, SUSER_SNAME(), GETDATE()),
	 (@RuleId1, @LOBId, null, -999, SUSER_SNAME(), GETDATE())
END
GO

