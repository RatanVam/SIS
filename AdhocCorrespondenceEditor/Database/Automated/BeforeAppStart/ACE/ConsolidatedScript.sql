-- =============================================
-- Author:		Ratan Mishra / 562371
-- Create date: 12/02/2025  MM/DD/YY
-- Description: Update Dropdown Values
              -- PLPC 30024 Update NJ DNR Notice Reasons & Template update for Ineligible Vehicles
-- =============================================
--==============UPDATE=======Ineligible Vehicle - Need to rename this value to Other Ineligible Vehicle

DECLARE @Configvalue varchar(200) = (select Configvalue  from Configuration where Configkey = 'reasonlist'
and documentid in (select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

DECLARE @DocumentDropdownLookupTypeId int = (select DocumentDropdownLookupTypeId from [dbo].[DocumentDropdownLookupType] 
where DocumentDropdownLookupTypeCode =@Configvalue
and DocumentId in ( select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

UPDATE  [dbo].[DocumentDropdownLookupItem] 
set DocumentDropdownLookupItemCode = 'Other - Ineligible Vehicles', DocumentDropdownLookupItemValue = 'Other - Ineligible Vehicles' 
where DocumentDropdownLookupItemCode in ('Other Ineligible Vehicles', 'Ineligible Vehicle')  and DocumentDropdownLookupItemTypeId = @DocumentDropdownLookupTypeId
Go

--========== DELETE=========Gray Market Vehicle - Need to remove this value from DB
DECLARE @Configvalue varchar(200) = (select Configvalue  from Configuration where Configkey = 'reasonlist'
and documentid in (select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

DECLARE @DocumentDropdownLookupTypeId int = (select DocumentDropdownLookupTypeId from [dbo].[DocumentDropdownLookupType] 
where DocumentDropdownLookupTypeCode =@Configvalue
and DocumentId in ( select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

declare @DocumentDropdownLookupitemid int = (select DocumentDropdownLookupitemid from [dbo].[DocumentDropdownLookupItem] where 
DocumentDropdownLookupItemvalue = 'Gray Market Vehicle' and DocumentDropdownLookupItemTypeId=@DocumentDropdownLookupTypeId)

Delete from dbo.DocumentDropdownChildControl where DocumentDropdownLookupItemid = @DocumentDropdownLookupitemid
Delete from dbo.DocumentDropdownLookupItem where DocumentDropdownLookupItemid = @DocumentDropdownLookupitemid
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 12/02/2025
-- Description: Add column PolicyType to table DenialReasonMap 
-- =============================================

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = N'PolicyType' AND Object_ID = Object_ID(N'DenialReasonMap'))
BEGIN
	ALTER TABLE [dbo].[DenialReasonMap]
	ADD [PolicyType] varchar(50)

	PRINT 'Successfully added PolicyType column to DenialReasonMap'
END
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 12/02/2025
-- Description: Alter stored proc GetDenialReasons to retrieve PolicyType
-- =============================================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[GetDenialReasons]
AS
BEGIN

	SET NOCOUNT ON;

	SELECT
		dm.[DenialReasonMapId],
		d.[DenialReasonKey],
		d.[DenialReasonValue],
		dm.[DocumentId],
		--dm.[DisplayOrder],
		dm.[PolicyForm],
		dm.[PolicyState],
		dm.[PolicyType],
		l.[LOBName]
	FROM
		[dbo].[DenialReasonMap] dm
		JOIN [dbo].[DenialReason] d on d.[DenialReasonId] = dm.[DenialReasonId]
		JOIN [dbo].[LOB] l on l.[LOBId] = dm.[LOBId]
	ORDER BY
		dm.[DocumentId],
		dm.[DisplayOrder]

END
GO

PRINT 'Successfully altered stored procedure GetDenialReasons'
GO

-- =============================================
-- Author:		John Ryan
-- Create date: 12/02/2025
-- Description: CLAIM-13873 Add Denial Reasons To Document Notice of Payment
-- =============================================

DECLARE @docId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Notice of Payment')
DECLARE @ctrl_GCDenialReason int = (SELECT [ControlId] FROM [dbo].[Control] WHERE [ControlName] = 'GCDenialReason')

IF NOT EXISTS (SELECT * FROM [dbo].[DocumentControl] WHERE [DocumentId] = @docId AND [ControlId] = @ctrl_GCDenialReason)
BEGIN
	INSERT INTO [dbo].[DocumentControl] ([DocumentId], [ControlId], [ControlOrder], [CreatedBy], [CreatedDateTime])
	VALUES (@docId, @ctrl_GCDenialReason, 350, SUSER_SNAME(), GETDATE())

	PRINT 'Successfully added GCDenialReason control to Notice of Payment page'
END

DECLARE @lobId int = (SELECT [LOBId] FROM [dbo].[LOB] WHERE [LOBName] = 'GC')
DECLARE @Settlement_NoDenialId int = (SELECT [DenialReasonId] FROM [dbo].[DenialReason] WHERE [DenialReasonKey] = 'Settlement-No Denial')
DECLARE @PolicyMatchingDenialId int = (SELECT [DenialReasonId] FROM [dbo].[DenialReason] WHERE [DenialReasonKey] = 'Policy Matching Denial')
DECLARE @PolicyGeneralPartialDenialId int = (SELECT [DenialReasonId] FROM [dbo].[DenialReason] WHERE [DenialReasonKey] = 'Policy General Partial Denial')
DECLARE @PolicyWearandTearDenialId int = (SELECT [DenialReasonId] FROM [dbo].[DenialReason] WHERE [DenialReasonKey] = 'Policy Wear and Tear Denial')

IF NOT EXISTS (SELECT * FROM [dbo].[DenialReasonMap] WHERE [DocumentId] = @docId)
BEGIN
	INSERT INTO [dbo].[DenialReasonMap] ([DenialReasonId], [DocumentId], [LOBId], [DisplayOrder], [CreatedBy], [CreatedDateTime], [PolicyType])
	VALUES
		(@PolicyGeneralPartialDenialId, @docId, @lobId, 100, SUSER_SNAME(), GETDATE(), 'Businessowners'),
		(@PolicyMatchingDenialId, @docId, @lobId, 200, SUSER_SNAME(), GETDATE(), 'Businessowners'),
		(@PolicyWearandTearDenialId, @docId, @lobId, 300, SUSER_SNAME(), GETDATE(), 'Businessowners'),
		(@Settlement_NoDenialId, @docId, @lobId, 400, SUSER_SNAME(), GETDATE(), 'Businessowners'),
		(@PolicyGeneralPartialDenialId, @docId, @lobId, 100, SUSER_SNAME(), GETDATE(), 'CommercialPackagePolicy'),
		(@PolicyMatchingDenialId, @docId, @lobId, 200, SUSER_SNAME(), GETDATE(), 'CommercialPackagePolicy'),
		(@PolicyWearandTearDenialId, @docId, @lobId, 300, SUSER_SNAME(), GETDATE(), 'CommercialPackagePolicy'),
		(@Settlement_NoDenialId, @docId, @lobId, 400, SUSER_SNAME(), GETDATE(), 'CommercialPackagePolicy')

		PRINT 'Successfully added denial reasons to Notice of Payment page'
END

IF NOT EXISTS (SELECT * FROM [dbo].[Configuration] WHERE [ConfigKey] = 'GC_DocumentsExcludedBy_BOP_CPP')
BEGIN
	INSERT INTO [dbo].[Configuration] ([LOBId], [ConfigKey], [ConfigValue], [CreatedBy], [CreatedDateTime])
	VALUES (@lobId, 'GC_DocumentsExcludedBy_BOP_CPP', CAST(@docId as varchar), SUSER_SNAME(), GETDATE())

	PRINT 'Successfully added config key GC_DocumentsExcludedBy_BOP_CPP'
END
GO

-- =============================================
-- Author:		Aarish G
-- Create date: 12/19/2025
-- Description: CLAIM-13891 Add Denial Reasons To Document Denial-No Peril Coverage
-- =============================================

DECLARE @docId int = (SELECT [DocumentId] FROM [dbo].[Document] WHERE [DocumentName] = 'Denial-No Peril Coverage')
DECLARE @lobId int = (SELECT [LOBId] FROM [dbo].[LOB] WHERE [LOBName] = 'GC')

IF NOT EXISTS(SELECT [DenialReasonId] FROM [dbo].[DenialReason] WHERE [DenialReasonKey] = 'Loss Assessment Exclusions')
BEGIN
	INSERT INTO [dbo].DenialReason([DenialReasonKey], [DenialReasonValue], [CreatedBy], [CreatedDateTime])
	VALUES ('Loss Assessment Exclusions', 'Loss Assessment Exclusions', SUSER_SNAME(), GETDATE())
	PRINT 'Successfully added Loss Assessment Exclusion to Denial-No Peril Coverage page'
END

DECLARE @Lossexclusion int = (SELECT [DenialReasonId] FROM [dbo].[DenialReason] WHERE [DenialReasonKey] = 'Loss Assessment Exclusions')

IF NOT EXISTS (SELECT * FROM [dbo].[DenialReasonMap] WHERE [DocumentId] = @docId and [DenialReasonId] = @Lossexclusion)
BEGIN
	INSERT INTO [dbo].[DenialReasonMap] ([DenialReasonId], [DocumentId], [LOBId], [DisplayOrder], [CreatedBy], [CreatedDateTime], PolicyForm)
	VALUES
		(@Lossexclusion, @docId, @lobId, 700, SUSER_SNAME(), GETDATE(), 'HO3'),
		(@Lossexclusion, @docId, @lobId, 700, SUSER_SNAME(), GETDATE(), 'HO5'),
		(@Lossexclusion, @docId, @lobId, 700, SUSER_SNAME(), GETDATE(), 'HO6')
	
	;WITH OrderedReasons AS
	(
	   SELECT
		   drm.DenialReasonMapId,
		   ROW_NUMBER() OVER (
			   PARTITION BY drm.PolicyForm
			   ORDER BY dr.DenialReasonKey ASC
		   ) * 100 AS NewDisplayOrder
	   FROM [dbo].[DenialReasonMap] drm
	   INNER JOIN [dbo].[DenialReason] dr
		   ON drm.DenialReasonId = dr.DenialReasonId
	   WHERE drm.DocumentId = @docId
		 AND drm.PolicyForm IN ('HO3', 'HO5', 'HO6')
	)
	UPDATE drm
	SET DisplayOrder = o.NewDisplayOrder
	FROM [dbo].[DenialReasonMap] drm
	INNER JOIN OrderedReasons o
	   ON drm.DenialReasonMapId = o.DenialReasonMapId;

	PRINT 'Successfully added denial reasons to Denial-No Peril Coverage page'
END
GO

--===============================================================
-- Author: Sreedhar
-- Description: BC Blank letter Email option
--==============================================================
declare  @ctrlEmail int,@docTemplate int, @lobId Int

Select @ctrlEmail=  ControlId from [dbo].[Control] where ControlName='EmailwCheckbox'
Select @docTemplate =  DocumentId from [dbo].[Document] where DocumentName='PL BC Blank Letter Template'
SELECT @lobId = [LOBId] FROM [dbo].[LOB]  where LOBName='BC-PA'


IF  EXISTS ( SELECT 1 FROM [dbo].[DocumentControl] WHERE DocumentId = @docTemplate )
BEGIN

IF NOT EXISTS ( SELECT 1 FROM [dbo].[DocumentControl] WHERE DocumentId = @docTemplate AND ControlId = @ctrlEmail)
BEGIN
 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@docTemplate,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null)
END
END