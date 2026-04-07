USE [ACE]
GO
/****** Object:  StoredProcedure [dbo].[GetReferenceData]    Script Date: 7/17/2023 4:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER procedure  [dbo].[GetLOB] 
AS
BEGIN

	SET NOCOUNT ON;

	--LOB
	SELECT 
	  [LOBId],
      [LOBName],
      [LOBType]
	  FROM [dbo].[LOB]
END

GO

-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER procedure  [dbo].[GetCategory] 
AS
BEGIN

	SET NOCOUNT ON;
	Declare @currentDate datetime
	SELECT @currentDate = GETDATE()
	--Category
	SELECT	cat.CategoryId, 
			CategoryName,
			CategoryFriendlyName,
			IsCategoryActive,
			CategoryGroups,
			lob.LOBId,
			LOBName,
			LOBType
			CategoryOrder
	FROM [dbo].[Category] cat
	JOIN [dbo].[LOBCategory] lobcat
	ON cat.CategoryId = lobcat.CategoryId
	JOIN [dbo].[LOB] lob
	ON lob.LOBId = lobcat.LOBId
	WHERE @currentDate between EffectiveDate AND ExpirationDate
	ORDER BY lobcat.CategoryOrder 

END

GO


-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR Alter procedure  [dbo].[GetDocument] 
AS
BEGIN

	SET NOCOUNT ON;
	Declare @currentDate datetime
	SELECT @currentDate = GETDATE()
	--Documents
	SELECT 
		doc.DocumentId,
		DocumentName,
		DocumentFriendlyName,
		IsDocumentActive,
		BaseState,
		JldFilePath,
		DocumentType,
		DocumentOrder,
		cat.CategoryId,
		CategoryName,
		CategoryFriendlyName,
		IsCategoryActive
	FROM [dbo].[Document] doc
	JOIN [dbo].[CategoryDocument] catdoc
	ON doc.DocumentId = catdoc.DocumentId
	JOIN [dbo].[Category] cat
	ON catdoc.CategoryId= cat.CategoryId
	WHERE @currentDate between EffectiveDate AND ExpirationDate
	Order BY catdoc.DocumentOrder 


END

GO


-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER procedure  [dbo].[GetDocumentControl] 
AS
BEGIN

	SET NOCOUNT ON;

	--Document Controls
	SELECT 
		con.ControlId,
		con.ControlName,
		dc.DocumentControlId,
		dc.DocumentId,
		dc.ControlOrder 
	FROM DocumentControl dc
	JOIN Control con
	ON con.ControlId = dc.ControlId 
	ORDER by dc.ControlOrder

END

GO


-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER procedure  [dbo].[GetDocumentDropdownLookupData] 
AS
BEGIN

	SET NOCOUNT ON;


	--Generic lookup data
	SELECT 
       [DocumentId]
      ,dropdowntype.[LobId]
	  ,LOBName
      ,[DocumentDropdownLookupTypeCode]
      ,[DocumentDropdownLookupTypeLabelName]
      ,[DocumentDirection]
	  ,[DocumentDropdownLookupItemCode]
      ,[DocumentDropdownLookupItemValue]
      ,[DocumentDropdownLookupItemTypeId]
      ,[DocumentDropdownLookupItemOrder]

	FROM  [dbo].[DocumentDropdownLookupType] dropdowntype
	JOIN  [dbo].[DocumentDropdownLookupItem] dropdownlook
	ON dropdowntype.DocumentDropdownLookupTypeId = dropdownlook.DocumentDropdownLookupItemTypeId
	JOIN  [dbo].[LOB] lob
	ON lob.LOBId = dropdowntype.LobId

	ORDER BY DocumentId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupItemOrder
END

GO

-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER procedure  [dbo].[GetGenericLookupData] 
AS
BEGIN

	SET NOCOUNT ON;


	--Generic lookup data
	SELECT 
		gen.GenericLookupItemId,
		gen.GenericLookupItemCode,
		gen.GenericLookupItemValue,
		gen.IsGenericLookupItemActive,
		gen.GenericLookupItemOrder,
		gen.LookupTypeId,
		look.LookupTypeValue
	FROM  [dbo].[GenericLookupItem] gen
	JOIN  [dbo].[LookupType] look
	ON gen.LookupTypeId = look.LookupTypeId


END

GO


-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER  procedure  [dbo].[GetPolicyLookupData] 
AS
BEGIN

	SET NOCOUNT ON;


	--Policy lookup data
	SELECT 
		pol.PolicyLookupItemId,
		pol.PolicyLookupItemCode,
		pol.PolicyLookupItemValue,
		pol.IsPolicyLookupItemActive,
		pol.PolicyLookupItemOrder,
		pol.LookupTypeId,
		look.LookupTypeValue
	FROM  [dbo].[PolicyLookupItem] pol
	JOIN  [dbo].[LookupType] look
	ON pol.LookupTypeId = look.LookupTypeId
	ORDER BY PolicyLookupItemOrder


END

GO



-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
create OR ALTER procedure  [dbo].[GetPrinterLookupData] 
AS
BEGIN

	SET NOCOUNT ON;

	--printer lookup data
	SELECT 
		prin.PrinterId,
		prin.PrinterName,
		prin.PrinterCode,
		prin.IsPrinterActive,
		lobprin.LOBId,
		lobprin.PrinterOrder,
		lob.LOBName,
		lob.LOBType
	FROM 	[dbo].[Printer] prin
	JOIN  [dbo].[LOBPrinter] lobprin
	ON prin.PrinterId = lobprin.PrinterId
	JOIN [dbo].[LOB] lob
	ON lob.LOBId = lobprin.LOBId
	ORDER BY lobprin.PrinterOrder
END


GO


-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
 CREATE OR ALTER PROC  [dbo].[GetWebService] 

AS
BEGIN
	SET NOCOUNT ON;
		begin
			SELECT 
				WebServiceId,
				ws.LOBId,
				URL,
				Environment,
				URLType,
				LOBName,
				LOBType
			FROM Webservice ws
			JOIN [dbo].[LOB] lob
			ON ws.LOBId = lob.LOBId
		end
END

GO



-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 2023-09-06
-- Description:	Procedure to Insert Docoument Log
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertDocumentLog]
		@UserId varchar(15),
		@CreatedTime datetime,
		@Lob varchar(50),
		@LetterName varchar(150),
		@Payload XML,
		@PolicyNumber varchar(50),
		@Environment varchar(50),
		@BaseState varchar(50),
		@ClaimNumber varchar(50),
		@QuoteNumber varchar(50),
		@ProducerCode varchar(50),
		@AccountNumber varchar(50)
  AS
  BEGIN

		Declare @lobId int = 0
		SELECT @lobId = LOBId
		FROM LOB
		WHERE LOBName = @Lob

			INSERT INTO [dbo].[DocumentLog](
					 [UserId]
					,[CreatedTime]
					,[LOBId]
					,[LetterName]
					,[Payload]
					,[PolicyNumber]
					,[Environment]
					,[BaseState]
					,[ClaimNumber]
					,[QuoteNumber]
					,[ProducerCode]
					,[AccountNumber]
					,[CreatedBy]
					,[CreatedDateTime])

				VALUES	(
					@UserId,
					@CreatedTime,
					@lobId,
					@LetterName,
					@Payload,
					@PolicyNumber,
					@Environment,
					@BaseState,
					@ClaimNumber,
					@QuoteNumber,
					@ProducerCode,
					@AccountNumber,
					SUSER_SNAME(),
					GETDATE())
   END

   GO


   SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER procedure  [dbo].[GetConfigurationLookup] 
AS
BEGIN

	SET NOCOUNT ON;

	--LOB
	SELECT 		  
	  cfg.[LOBId],
	  [DocumentId],
      [ConfigKey],
      [ConfigValue],
      [LOBName]
	  
	  FROM [dbo].configuration cfg
	  JOIN [dbo].[LOB] lob
	  ON lob.LOBId = cfg.LOBId

END

