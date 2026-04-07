-- =============================================
-- Author:		John Ryan
-- Create date: 02/25/2025
-- Description:	CLAIM-12180 - 2253544419_FN_Longworth Ltr 1 - Investigate Further Updates
-- =============================================

IF NOT EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'BI Request to Settle - Investigate Further')
BEGIN
	UPDATE [dbo].[Document]
	SET
		[DocumentName] = 'BI Request to Settle - Investigate Further',
		[DocumentFriendlyName] = 'BI Request to Settle - Investigate Further',
		[JldFilePath] = 'companyRoot:S:Production://Templates/GeneralClaims/BI Request to Settle - Investigate Further.jld',
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE [DocumentName] = 'Longworth Ltr 1-Investigate Further'
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 02/25/2025
-- Description:	CLAIM-12181 - 2253546926_FN_Longworth Ltr 2 - UIM Denial
-- =============================================

IF NOT EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'BI Request to Settle - UIM Denial')
BEGIN
	UPDATE [dbo].[Document]
	SET
		[DocumentName] = 'BI Request to Settle - UIM Denial',
		[DocumentFriendlyName] = 'BI Request to Settle - UIM Denial',
		[JldFilePath] = 'companyRoot:S:Production://Templates/GeneralClaims/BI Request to Settle - UIM Denial.jld',
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE [DocumentName] = 'Longworth Ltr 2-UIM Denial'
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 02/25/2025
-- Description:	CLAIM-12182 - 2253547969_FN_Longworth Ltr 3 - Acceptance
-- =============================================

IF NOT EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'BI Request to Settle - Acceptance')
BEGIN
	UPDATE [dbo].[Document]
	SET
		[DocumentName] = 'BI Request to Settle - Acceptance',
		[DocumentFriendlyName] = 'BI Request to Settle - Acceptance',
		[JldFilePath] = 'companyRoot:S:Production://Templates/GeneralClaims/BI Request to Settle - Acceptance.jld',
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE [DocumentName] = 'Longworth Ltr 3-Acceptance'
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 02/25/2025
-- Description:	CLAIM-12183 - 2253554361_FN_Removal of MD Acceptance to Consent to Settlement Offer Letter
-- =============================================

IF EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'MD Acceptance to Consent to Settlement Offer' AND [IsDocumentActive] = 1)
BEGIN
	UPDATE [dbo].[Document]
	SET
		[IsDocumentActive] = 0,
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE [DocumentName] = 'MD Acceptance to Consent to Settlement Offer'

	DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'MD Acceptance to Consent to Settlement Offer')
	DECLARE @CatId int = (SELECT [CategoryId] FROM [dbo].[Category] WHERE [CategoryName] = 'GC_BODILY_INJURY')

	UPDATE [dbo].[CategoryDocument]
	SET
		[ExpirationDate] = '02/25/2025',
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE
		[DocumentId] = @DocId
		AND [CategoryId] = @CatId
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 02/25/2025
-- Description:	CLAIM-12184 - 2253554769_FN_Remove MD Refusal to Consent to Settlement Offer Letter
-- =============================================

IF EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'MD Refusal to Consent to Settlement Offer' AND [IsDocumentActive] = 1)
BEGIN
	UPDATE [dbo].[Document]
	SET
		[IsDocumentActive] = 0,
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE [DocumentName] = 'MD Refusal to Consent to Settlement Offer'

	DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'MD Refusal to Consent to Settlement Offer')
	DECLARE @CatId int = (SELECT [CategoryId] FROM [dbo].[Category] WHERE [CategoryName] = 'GC_BODILY_INJURY')

	UPDATE [dbo].[CategoryDocument]
	SET
		[ExpirationDate] = '02/25/2025',
		[UpdatedBy] = SUSER_SNAME(),
		[UpdatedDateTime] = GETDATE()
	WHERE
		[DocumentId] = @DocId
		AND [CategoryId] = @CatId
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 03/04/2025
-- Description:	CLAIM-12175 - 2253549289_FN_Right of Recourse Owner Keeps
-- =============================================

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Right of Recourse Owner Keeps')
DECLARE @CtrlId int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCVehicle')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @DocId AND [ControlId] = @CtrlId)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CtrlId, 450, SUSER_SNAME(), GETDATE())
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 03/04/2025
-- Description:	CLAIM-12176 - 2253548472_FN_Right of Recourse NJM Takes
-- =============================================

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Right of Recourse NJM Takes')
DECLARE @CtrlId int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCVehicle')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @DocId AND [ControlId] = @CtrlId)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CtrlId, 450, SUSER_SNAME(), GETDATE())
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 03/04/2025
-- Description:	CLAIM-12177 - 2253549155_FN_Settlement TL Owner Keeps PA-OH-MD
-- =============================================

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Settlement TL Owner Keeps PA-OH-MD')
DECLARE @CtrlId int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCVehicle')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @DocId AND [ControlId] = @CtrlId)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CtrlId, 450, SUSER_SNAME(), GETDATE())
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 03/04/2025
-- Description:	CLAIM-12178 - 2253550844_FN_Settlement Total Loss Owner Keeps
-- =============================================

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Settlement Total Loss Owner Keeps')
DECLARE @CtrlId int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCVehicle')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @DocId AND [ControlId] = @CtrlId)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CtrlId, 450, SUSER_SNAME(), GETDATE())
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 03/04/2025
-- Description:	CLAIM-12179 - 2253553022_FN_Setlmt Total Loss - NJM Take Veh
-- =============================================

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Setlmt Total Loss - NJM Take Veh')
DECLARE @CtrlId int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCVehicle')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @DocId AND [ControlId] = @CtrlId)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CtrlId, 450, SUSER_SNAME(), GETDATE())
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 03/11/2025
-- Description:	CLAIM-12286 - 2259983169_FN_New PIP Ltr-Delay Investigation General
-- =============================================

DECLARE @CatId int = (SELECT [CategoryId] FROM [dbo].[Category] WHERE [CategoryName] = 'GC_PIP')

IF NOT EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'Delay Investigation General')
BEGIN
	INSERT INTO [dbo].[Document] ([DocumentName], [DocumentFriendlyName], [IsDocumentActive], [JldFilePath], [DocumentType], [CreatedBy], [CreatedDateTime])
	VALUES ('Delay Investigation General', 'Delay Investigation General', 1, 'companyRoot:S:Production://Templates/GeneralClaims/Delay Investigation General.jld', 'GCOM  Correspondence Out', SUSER_SNAME(), GETDATE())
END

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Delay Investigation General')

IF NOT EXISTS (SELECT * FROM [dbo].[CategoryDocument] WHERE [DocumentId] = @DocId)
BEGIN
	INSERT INTO [dbo].[CategoryDocument] ([DocumentId], [CategoryId], [DocumentOrder], [EffectiveDate], [ExpirationDate], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CatId, 1, DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 90, GETDATE()), SUSER_SNAME(), GETDATE())
END

DECLARE @CtrlId_ExposureInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCExposureNameAndType')
DECLARE @CtrlId_Addressee int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCAddrOneandTwowGreetingName')
DECLARE @CtrlId_Author int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCAuthor')
DECLARE @CtrlId_ReSection int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCReSection')
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
		(@DocId, @CtrlId_Select, 500, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_PrintServices, 600, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_PrinterInformation, 700, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Email, 800, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_FaxInformation, 900, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_CCSection, 1000, SUSER_SNAME(), GETDATE())
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 03/12/2025
-- Description:	CLAIM-12287 - 2259979044_FN_New PIP Ltr-Delay Investigation Specific Request
-- =============================================

DECLARE @CatId int = (SELECT [CategoryId] FROM [dbo].[Category] WHERE [CategoryName] = 'GC_PIP')

IF NOT EXISTS (SELECT * FROM [dbo].[Document] WHERE [DocumentName] = 'Delay Investigation Specific Request')
BEGIN
	INSERT INTO [dbo].[Document] ([DocumentName], [DocumentFriendlyName], [IsDocumentActive], [JldFilePath], [DocumentType], [CreatedBy], [CreatedDateTime])
	VALUES ('Delay Investigation Specific Request', 'Delay Investigation Specific Request', 1, 'companyRoot:S:Production://Templates/GeneralClaims/Delay Investigation Specific Request.jld', 'GCOM  Correspondence Out', SUSER_SNAME(), GETDATE())
END

DECLARE @DocId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Delay Investigation Specific Request')

IF NOT EXISTS (SELECT * FROM [dbo].[CategoryDocument] WHERE [DocumentId] = @DocId)
BEGIN
	INSERT INTO [dbo].[CategoryDocument] ([DocumentId], [CategoryId], [DocumentOrder], [EffectiveDate], [ExpirationDate], [CreatedBy], [CreatedDateTime])
	VALUES (@DocId, @CatId, 1, DATEADD(YEAR, -1, GETDATE()), DATEADD(YEAR, 90, GETDATE()), SUSER_SNAME(), GETDATE())
END

IF NOT EXISTS (SELECT * FROM [dbo].[Control] WHERE [ControlName] = 'GCSpecificRequiredInformation')
BEGIN
	INSERT INTO [dbo].[Control] ([ControlName], [CreatedBy], [CreatedDateTime])
	VALUES ('GCSpecificRequiredInformation', SUSER_SNAME(), GETDATE())
END

DECLARE @CtrlId_ExposureInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCExposureNameAndType')
DECLARE @CtrlId_Addressee int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCAddrOneandTwowGreetingName')
DECLARE @CtrlId_Author int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCAuthor')
DECLARE @CtrlId_ReSection int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCReSection')
DECLARE @CtrlId_SpecificRequiredInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCSpecificRequiredInformation')
DECLARE @CtrlId_Select int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'SelectCommunicationSection')
DECLARE @CtrlId_PrintServices int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCBatchControls')
DECLARE @CtrlId_PrinterInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'PrinterDropdownwCheckbox')
DECLARE @CtrlId_Email int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'WCCEmail')
DECLARE @CtrlId_FaxInformation int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'ClaimsFax')
DECLARE @CtrlId_CCSection int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'ClaimsCcBcc')
--DECLARE @CtrlId_ClaimantName int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCClaimantName')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @DocId)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES
		(@DocId, @CtrlId_ExposureInformation, 100, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Addressee, 200, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Author, 300, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_ReSection, 400, SUSER_SNAME(), GETDATE()),
		--(@DocId, @CtrlId_ClaimantName, 450, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_SpecificRequiredInformation, 500, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Select, 600, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_PrintServices, 700, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_PrinterInformation, 800, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_Email, 900, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_FaxInformation, 1000, SUSER_SNAME(), GETDATE()),
		(@DocId, @CtrlId_CCSection, 1100, SUSER_SNAME(), GETDATE())
END

DECLARE @LobId int = (SELECT [LOBId] FROM [dbo].[LOB] WHERE [LOBName] = 'GC')

IF NOT EXISTS (SELECT * FROM [dbo].[Configuration] WHERE [DocumentId] = @DocId AND [ConfigKey] = 'DocumentOtherType1')
BEGIN
	INSERT INTO [dbo].[Configuration] ([LOBId], [ConfigKey], [ConfigValue], [CreatedBy], [CreatedDateTime], [DocumentId])
	VALUES (@LobId, 'DocumentOtherType1', 'GLGL  Affidavit', SUSER_SNAME(), GETDATE(), @DocId)
END

IF NOT EXISTS (SELECT * FROM [dbo].[Configuration] WHERE [DocumentId] = @DocId AND [ConfigKey] = 'DocumentOtherType2')
BEGIN
	INSERT INTO [dbo].[Configuration] ([LOBId], [ConfigKey], [ConfigValue], [CreatedBy], [CreatedDateTime], [DocumentId])
	VALUES (@LobId, 'DocumentOtherType2', 'MGEN  PIP Application', SUSER_SNAME(), GETDATE(), @DocId)
END
GO
