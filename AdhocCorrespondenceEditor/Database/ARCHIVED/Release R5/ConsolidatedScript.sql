-- ***************************************************************************
-- PLPC-19082 - Lienholder Rescission Letter | ACE UI changes to generate new form
-- Author: Sandeep Telang	Date: August 5, 2024
-- ***************************************************************************

-- First check if the document already exists. If so, then print and exit out
IF EXISTS(SELECT * FROM [dbo].[Document] WHERE [DocumentFriendlyName] = 'Lienholder Rescission Letter')
BEGIN
	PRINT 'Document ''Lienholder Rescission Letter'' already exists.'
	RETURN
END

BEGIN TRY

BEGIN TRANSACTION

	-- ******** Document Table ********
	Declare @DocumentID int

	-- Document Table
	INSERT INTO [dbo].[Document](
				[DocumentName]
			   ,[DocumentFriendlyName]
			   ,[IsDocumentActive]
			   ,[BaseState]
			   ,[JldFilePath]
			   ,[DocumentType]
			   ,[CreatedBy]
			   ,[CreatedDateTime]
			   )
		 SELECT 
			   'Lienholder Notice for Rescission-Auto' AS [DocumentName]
			   , 'Lienholder Rescission Letter' AS [DocumentFriendlyName]
			   , 1 AS [IsDocumentActive]
			   , NULL AS BaseState
			   ,'companyRoot:S:Production://Templates/PolicyCenterAuto/Lienholder Notice for Rescission-Auto.jld' AS [JldFilePath]
			   ,'POLDOC  Correspondence' AS DocumentType
			   , '602096' AS CreatedBy
			   , GETDATE() AS CreatedDateTime

	SET @DocumentID = SCOPE_IDENTITY()

	--PRINT 'xxx DocumentID: ' + Convert(varchar, @DocumentID) + 'xxx'

	-- ******** DocumentControl Table ********

	-- Find the ControlId values
	Declare @PrinterControlId int = (SELECT ControlId FROM Control WHERE CONTROLNAME = 'PrinterDropdown')
	Declare @PLAddrControlId int = (SELECT ControlId FROM Control WHERE CONTROLNAME = 'PLAddrNmOneTwoThreewGreetNm')
	Declare @PLPAVehicleControlId int = (SELECT ControlId FROM Control WHERE CONTROLNAME = 'PLPAVehicleDropdown')


	-- Printer dropdown
	INSERT INTO [dbo].[DocumentControl]([DocumentId],[ControlId],[ControlOrder],[CreatedBy],[CreatedDateTime])
		 SELECT @DocumentID AS DocumentId, @PrinterControlId AS ControlId, 400 AS ControlOrder, '602096' AS CreatedBy, GETDATE() AS CreatedDateTime

	-- PLAddrNmOneTwoThreewGreetNm
	INSERT INTO [dbo].[DocumentControl]([DocumentId],[ControlId],[ControlOrder],[CreatedBy],[CreatedDateTime])
		 SELECT @DocumentID AS DocumentId, @PLAddrControlId AS ControlId, 100 AS ControlOrder, '602096' AS CreatedBy, GETDATE() AS CreatedDateTime

	-- PLPAVehicleDropdown
	INSERT INTO [dbo].[DocumentControl]([DocumentId],[ControlId],[ControlOrder],[CreatedBy],[CreatedDateTime])
		 SELECT @DocumentID AS DocumentId, @PLPAVehicleControlId AS ControlId, 200 AS ControlOrder, '602096' AS CreatedBy, GETDATE() AS CreatedDateTime

	-- ******** CategoryDocument Table ********
	INSERT INTO [dbo].[CategoryDocument]
	([DocumentId],[CategoryId],[DocumentOrder],[EffectiveDate],[ExpirationDate],[CreatedBy],[CreatedDateTime])
		 SELECT @DocumentID AS DocumentId 
				, (select CategoryId from category where CategoryFriendlyName = 'Auto Renewal Underwriter') AS CategoryId
				, 1 AS DocumentOrder
				, DATEADD(YEAR,-1,GETDATE()) AS EffectiveDate
				, DATEADD(YEAR,90,GETDATE()) AS ExpirationDate
				, '602096' AS CreatedBy
				, GETDATE() AS CreatedDateTime

	COMMIT TRANSACTION
           
	PRINT 'Document ''Lienholder Rescission Letter'' added successfully.'

END TRY
BEGIN CATCH
	
	-- RAISEERROR
	DECLARE @ErrorMessage NVARCHAR(2048), @ErrorProcedure SYSNAME, @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @ErrorLine INT
	SELECT @ErrorProcedure = ERROR_PROCEDURE(), @ErrorMessage = ERROR_MESSAGE(), @ErrorNumber = ERROR_NUMBER(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()
	SELECT @ErrorMessage = '[' + ISNULL(@ErrorProcedure,'') + ', line: ' + CAST(ISNULL(@ErrorLine,'') AS VARCHAR(50)) +	', errno: ' + CAST(ISNULL(@ErrorNumber,'') AS VARCHAR(50)) + ']. '+ ISNULL(@ErrorMessage,'') 

	PRINT ERROR_MESSAGE() 
	PRINT 'Script failed while adding document ''Lienholder Rescission Letter'' . Rollback executed.'

	ROLLBACK TRANSACTION

	-- RAISEERROR
	RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState) 

END CATCH;

GO

-- ***************************************************************************
-- PLPC-19081: Script to add Letter Date control to Lienholder Recision Letter
-- Author: Sandeep Telang	Date: September 09, 2024
-- ***************************************************************************

Declare @DocumentID int

-- First check if the document already exists. If so, then grab the DocumentID
IF EXISTS(SELECT * FROM [dbo].[Document] WHERE [DocumentFriendlyName] = 'Lienholder Rescission Letter')
BEGIN
	SELECT @DocumentID = DocumentId FROM [dbo].[Document] WHERE [DocumentFriendlyName] = 'Lienholder Rescission Letter'
END
ELSE
BEGIN
	PRINT 'Document ''Lienholder Rescission Letter'' does not exist.'
	RETURN
END

-- Find the ControlId values
Declare @LetterDateControlId int = (SELECT ControlId FROM Control WHERE CONTROLNAME = 'LetterDatePicker')

-- LetterDate datepicker
IF EXISTS(SELECT * FROM [dbo].[DocumentControl] WHERE DocumentId = @DocumentID AND [ControlId] = @LetterDateControlId)
BEGIN
	PRINT 'LetterDatePicker control for ''Lienholder Rescission Letter'' already exist.'
END
ELSE
BEGIN
	INSERT INTO [dbo].[DocumentControl]([DocumentId],[ControlId],[ControlOrder],[CreatedBy],[CreatedDateTime])
		 SELECT @DocumentID AS DocumentId, @LetterDateControlId AS ControlId, 300 AS ControlOrder, '602096' AS CreatedBy, GETDATE() AS CreatedDateTime

	PRINT 'LetterDatePicker control for ''Lienholder Rescission Letter'' added successfully.'

END

GO

