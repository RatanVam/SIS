-- =============================================
-- Script Number:		0001
-- Author:		<Ketheneni, Sandhya>
-- Create date: <03/05/2024>
-- Description:	PLLPC-18701 SP 3027 - New PL Contact us Letter - create new document in ACE - UMB
-- =============================================
BEGIN TRY
 BEGIN TRANSACTION
	IF NOT EXISTS (Select DocumentId from Document where DocumentFriendlyName = 'PL Contact us-UMB')
		Begin
			Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
			CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
			Values
			('PL Contact us-UMB','PL Contact us-UMB',1,null,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/PL Contact us-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null)
		End

	DECLARE @UMBContactUsDoc int = (Select DocumentId from [dbo].[Document] where DocumentName='PL Contact us-UMB')
	DECLARE @UMBUnderCategory int = (Select CategoryId from Category where CategoryFriendlyName = 'UMB Underwriter')

	IF NOT EXISTS (Select * from [CategoryDocument] where DocumentId = @UMBContactUsDoc)
		Begin
			INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
			VALUES
			(@UMBContactUsDoc,@UMBUnderCategory,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
		End

	DECLARE @UsMailControl int = (select controlid from Control where ControlName = 'UsMailCheckbox')
	DECLARE @PrinterControl int = (select controlid from Control where ControlName = 'PrinterDropdownwCheckbox')
	DECLARE @PcHoDwUmbAddressControl int = (select controlid from Control where ControlName = 'PLAddrNmOneTwoThreewGreetNm')
	DECLARE @SelectCommunicationControl int = (select controlid from Control where ControlName = 'SelectCommunicationSection') 

	IF NOT EXISTS (Select * from [DocumentControl] where DocumentId = @UMBContactUsDoc)
		Begin
			INSERT [dbo].[DocumentControl] (
				   [DocumentId]
				  ,[ControlId]
				  ,[ControlOrder]
				  ,[CreatedBy]
				  ,[CreatedDateTime]
				  ,[UpdatedBy]
				  ,[UpdatedDateTime])
			VALUES
			(@UMBContactUsDoc,@PcHoDwUmbAddressControl,100,SUSER_SNAME(),GETDATE(),null,null),
			(@UMBContactUsDoc,@SelectCommunicationControl,200,SUSER_SNAME(),GETDATE(),null,null),
			(@UMBContactUsDoc,@UsMailControl,300,SUSER_SNAME(),GETDATE(),null,null),
			(@UMBContactUsDoc,@PrinterControl,400,SUSER_SNAME(),GETDATE(),null,null)
		End

 COMMIT TRANSACTION
 Print 'PL Contact us-UMB document inserted successfully.'
END TRY
BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(2048), @ErrorProcedure SYSNAME, @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @ErrorLine INT
	-- RAISEERROR
	SELECT @ErrorProcedure = ERROR_PROCEDURE(), @ErrorMessage = ERROR_MESSAGE(), @ErrorNumber = ERROR_NUMBER(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()
	SELECT @ErrorMessage = '[' + ISNULL(@ErrorProcedure,'') + ', line: ' + CAST(ISNULL(@ErrorLine,'') AS VARCHAR(50)) +	', errno: ' + CAST(ISNULL(@ErrorNumber,'') AS VARCHAR(50)) + ']. '+ ISNULL(@ErrorMessage,'') 

	PRINT ERROR_MESSAGE() 
	PRINT 'Script failed for Insert new document named PL Contact us-UMB. Rollback executed.'

	ROLLBACK TRANSACTION

	-- RAISEERROR
	RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState) 
END CATCH;
go

-- =============================================
-- Script Number:		0002
-- Author:		<Ketheneni, Sandhya>
-- Create date: <03/05/2024>
-- Description:	PLLPC-18700 SP 3027 - New PL Contact us Letter - create new document in ACE - DW
-- =============================================
BEGIN TRY
 BEGIN TRANSACTION
	IF NOT EXISTS (Select DocumentId from Document where DocumentFriendlyName = 'PL Contact us-DW')
		Begin
			Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
			CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
			Values
			('PL Contact us-DW','PL Contact us-DW',1,null,'companyRoot:S:Production://Templates/PolicyCenterDwelling/PL Contact us-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null)
		End

	DECLARE @DWContactUsDoc int = (Select DocumentId from [dbo].[Document] where DocumentName='PL Contact us-DW')
	DECLARE @DWUnderCategory int = (Select CategoryId from Category where CategoryFriendlyName = 'DW Underwriter')

	IF NOT EXISTS (Select * from [CategoryDocument] where DocumentId = @DWContactUsDoc)
		Begin
			INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
			VALUES
			(@DWContactUsDoc,@DWUnderCategory,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
		End

	DECLARE @UsMailControl int = (select controlid from Control where ControlName = 'UsMailCheckbox')
	DECLARE @PrinterControl int = (select controlid from Control where ControlName = 'PrinterDropdownwCheckbox')
	DECLARE @PcHoDwUmbAddressControl int = (select controlid from Control where ControlName = 'PLAddrNmOneTwoThreewGreetNm')
	DECLARE @SelectCommunicationControl int = (select controlid from Control where ControlName = 'SelectCommunicationSection') 

	IF NOT EXISTS (Select * from [DocumentControl] where DocumentId = @DWContactUsDoc)
		Begin
			INSERT [dbo].[DocumentControl] (
				   [DocumentId]
				  ,[ControlId]
				  ,[ControlOrder]
				  ,[CreatedBy]
				  ,[CreatedDateTime]
				  ,[UpdatedBy]
				  ,[UpdatedDateTime])
			VALUES
			(@DWContactUsDoc,@PcHoDwUmbAddressControl,100,SUSER_SNAME(),GETDATE(),null,null),
			(@DWContactUsDoc,@SelectCommunicationControl,200,SUSER_SNAME(),GETDATE(),null,null),
			(@DWContactUsDoc,@UsMailControl,300,SUSER_SNAME(),GETDATE(),null,null),
			(@DWContactUsDoc,@PrinterControl,400,SUSER_SNAME(),GETDATE(),null,null)
		End

 COMMIT TRANSACTION
 Print 'PL Contact us-DW document inserted successfully.'
END TRY
BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(2048), @ErrorProcedure SYSNAME, @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @ErrorLine INT
	-- RAISEERROR
	SELECT @ErrorProcedure = ERROR_PROCEDURE(), @ErrorMessage = ERROR_MESSAGE(), @ErrorNumber = ERROR_NUMBER(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()
	SELECT @ErrorMessage = '[' + ISNULL(@ErrorProcedure,'') + ', line: ' + CAST(ISNULL(@ErrorLine,'') AS VARCHAR(50)) +	', errno: ' + CAST(ISNULL(@ErrorNumber,'') AS VARCHAR(50)) + ']. '+ ISNULL(@ErrorMessage,'') 

	PRINT ERROR_MESSAGE() 
	PRINT 'Script failed for Insert new document named PL Contact us-DW. Rollback executed.'

	ROLLBACK TRANSACTION

	-- RAISEERROR
	RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState) 
END CATCH;
Go
---- =============================================
---- Script Number:		0003
---- Author:		<Ketheneni, Sandhya>
---- Create date: <03/05/2024>
---- Description:	PLLPC-18699 SP 3027 - New PL Contact us Letter - create new document in ACE - HO
---- =============================================
BEGIN TRY
 BEGIN TRANSACTION
	IF NOT EXISTS (Select DocumentId from Document where DocumentFriendlyName = 'PL Contact us-HO')
		Begin
			Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
			CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
			Values
			('PL Contact us-HO','PL Contact us-HO',1,null,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/PL Contact us-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null)
		End

	DECLARE @HOContactUsDoc int = (Select DocumentId from [dbo].[Document] where DocumentName='PL Contact us-HO')
	DECLARE @HOUnderCategory int = (Select CategoryId from Category where CategoryFriendlyName = 'HO Underwriter')

	IF NOT EXISTS (Select * from [CategoryDocument] where DocumentId = @HOContactUsDoc)
		Begin
			INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
			VALUES
			(@HOContactUsDoc,@HOUnderCategory,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)
		End

	DECLARE @UsMailControl int = (select controlid from Control where ControlName = 'UsMailCheckbox')
	DECLARE @PrinterControl int = (select controlid from Control where ControlName = 'PrinterDropdownwCheckbox')
	DECLARE @PcHoDwUmbAddressControl int = (select controlid from Control where ControlName = 'PLAddrNmOneTwoThreewGreetNm')
	DECLARE @SelectCommunicationControl int = (select controlid from Control where ControlName = 'SelectCommunicationSection') 

	IF NOT EXISTS (Select * from [DocumentControl] where DocumentId = @HOContactUsDoc)
		Begin
			INSERT [dbo].[DocumentControl] (
				   [DocumentId]
				  ,[ControlId]
				  ,[ControlOrder]
				  ,[CreatedBy]
				  ,[CreatedDateTime]
				  ,[UpdatedBy]
				  ,[UpdatedDateTime])
			VALUES
			(@HOContactUsDoc,@PcHoDwUmbAddressControl,100,SUSER_SNAME(),GETDATE(),null,null),
			(@HOContactUsDoc,@SelectCommunicationControl,200,SUSER_SNAME(),GETDATE(),null,null),
			(@HOContactUsDoc,@UsMailControl,300,SUSER_SNAME(),GETDATE(),null,null),
			(@HOContactUsDoc,@PrinterControl,400,SUSER_SNAME(),GETDATE(),null,null)
		End

 COMMIT TRANSACTION
 Print 'PL Contact us-HO document inserted successfully.'
END TRY
BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(2048), @ErrorProcedure SYSNAME, @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @ErrorLine INT
	-- RAISEERROR
	SELECT @ErrorProcedure = ERROR_PROCEDURE(), @ErrorMessage = ERROR_MESSAGE(), @ErrorNumber = ERROR_NUMBER(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()
	SELECT @ErrorMessage = '[' + ISNULL(@ErrorProcedure,'') + ', line: ' + CAST(ISNULL(@ErrorLine,'') AS VARCHAR(50)) +	', errno: ' + CAST(ISNULL(@ErrorNumber,'') AS VARCHAR(50)) + ']. '+ ISNULL(@ErrorMessage,'') 

	PRINT ERROR_MESSAGE() 
	PRINT 'Script failed for Insert new document named PL Contact us-HO. Rollback executed.'

	ROLLBACK TRANSACTION

	-- RAISEERROR
	RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState) 
END CATCH;
GO

-- =============================================
-- Script Number:		0004
-- Author:		<Ketheneni, Sandhya>
-- Create date: <03/07/2024>
-- Description:	BIL-3848 SP5164-Enable Email Functionality for Manual Invoices in ACE -Adhoc Document - PL Manual Invoice -PL
-- =============================================
BEGIN TRY
 Declare @ManualInvDoc int = (select DocumentId from Document where DocumentFriendlyName  ='Manual Invoice' and  DocumentType='POLDOC  Correspondence')
Declare @EmailwCheckBoxId int = (select ControlId from Control where ControlName = 'EmailwCheckbox')

 BEGIN TRANSACTION

IF NOT EXISTS (Select * from [DocumentControl] where DocumentId = @ManualInvDoc and ControlId = @EmailwCheckBoxId)
		Begin
			INSERT [dbo].[DocumentControl] (
				   [DocumentId]
				  ,[ControlId]
				  ,[ControlOrder]
				  ,[CreatedBy]
				  ,[CreatedDateTime]
				  ,[UpdatedBy]
				  ,[UpdatedDateTime])
			VALUES
			(@ManualInvDoc,@EmailwCheckBoxId,300,SUSER_SNAME(),GETDATE(),null,null)
		End
		
 COMMIT TRANSACTION
 Print 'EmailControl added to Manual Invoice document.'
END TRY
BEGIN CATCH
	DECLARE @ErrorMessage NVARCHAR(2048), @ErrorProcedure SYSNAME, @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @ErrorLine INT
	-- RAISEERROR
	SELECT @ErrorProcedure = ERROR_PROCEDURE(), @ErrorMessage = ERROR_MESSAGE(), @ErrorNumber = ERROR_NUMBER(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()
	SELECT @ErrorMessage = '[' + ISNULL(@ErrorProcedure,'') + ', line: ' + CAST(ISNULL(@ErrorLine,'') AS VARCHAR(50)) +	', errno: ' + CAST(ISNULL(@ErrorNumber,'') AS VARCHAR(50)) + ']. '+ ISNULL(@ErrorMessage,'') 

	PRINT ERROR_MESSAGE() 
	PRINT 'Script failed to add EmailControl to Manual Invoice document. Rollback executed.'

	ROLLBACK TRANSACTION

	-- RAISEERROR
	RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState) 
END CATCH;

-- =============================================
-- Script Number:		0005
-- Author:		<Ketheneni, Sandhya>
-- Create date: <03/07/2024>
-- Description:	BIL-3848 SP5164-Enable Email Functionality for Manual Invoices in ACE -Adhoc Document - PL Manual Invoice -PL
-- =============================================	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   procedure  [dbo].[GetConfigurationLookup] 
AS
BEGIN

	SET NOCOUNT ON;

	select   
	  [LOBId],
	  [DocumentId] ,
      [ConfigKey],
      [ConfigValue],
      [LOBName]
	   from (select *, ROW_NUMBER() over(partition by cf.configKey, cf.lobid, cf.DocumentId order by cf.lobid desc,cf.Type) as rowNumber 
from 
((select lob.LOBId,lob.LOBName,cfg.ConfigKey,Cfg.ConfigValue,cfg.DocumentId, 'NotNull' as Type from Lob 
join Configuration cfg
on lob.LOBId = cfg.LOBId)

union

(select lob.LOBId,lob.LOBName,cfg.ConfigKey,Cfg.ConfigValue,cfg.DocumentId,'Null' as type from LOB 
cross join 
(select * from Configuration
where lobid is null) as cfg )) as cf) as cfg
where rowNumber = 1
END
Go
-- =============================================
-- Script Number:		0005
-- Author:		<Ketheneni, Sandhya>
-- Create date: <03/07/2024>
-- Description:	BIL-3848 SP5164-Enable Email Functionality for Manual Invoices in ACE -Adhoc Document - PL Manual Invoice -PL
-- =============================================	
Declare @ClientRule int = (Select RuleGroupId from RuleGroup where RuleGroupName='ClientRule')
IF NOT EXISTS (SELECT * from [Rule] where RuleName = 'BC_PA_SetEmailControlVisibility')
INSERT INTO [dbo].[Rule]
           ([RuleName]
           ,[RuleNameSpace]
           ,[RuleMethod]
		   ,[RuleGroupId]
           ,[ExecutionOrder]
           ,[EffectiveDate]
           ,[ExpirationDate]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[UpdatedBy]
           ,[UpdatedDateTime])
     VALUES
           ('BC_PA_SetEmailControlVisibility'
           ,'AdhocCorrespondenceEditor.Client.BCPAUiRule'
           ,'SetEmailControlVisibility'
		   ,@ClientRule
           ,1
        ,DATEADD(YEAR,-1,GETDATE())
		,DATEADD(YEAR,90,GETDATE())
		,SUSER_SNAME()
		,GETDATE()
		,null
		,null)

declare @RuleId int = (select RuleId from [Rule] where RuleName = 'BC_PA_SetEmailControlVisibility')
declare @LOBId int = (select LOBId from LOB where LOBName = 'BC-PA')
declare @DocumentId int = (select DocumentId from Document where DocumentFriendlyName  ='Manual Invoice' and  DocumentType='POLDOC  Correspondence')
declare @CategoryId int = (select CategoryId from Category where CategoryFriendlyName = 'General')



IF NOT EXISTS (SELECT * from [RuleItem] where RuleId = @RuleId and CategoryId = @CategoryId and LobId=@LOBId and DocumentId= @DocumentId)
INSERT INTO [dbo].[RuleItem] (RuleId,LobId,CategoryId, DocumentId,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleId,@LOBId ,@CategoryId ,@DocumentId,SUSER_SNAME(),GETDATE(),null,null)


IF NOT EXISTS (SELECT * from Configuration where LOBId is null)
  insert into Configuration (LOBId, ConfigKey,ConfigValue,CreatedDateTime,CreatedBy) values 
  (null,'EMAIL_FROM','DoNotReply@njm.com',GETDATE(),SUSER_SNAME()),
  (@LOBID,'EMAIL_BODY','The information you have requested is attached',GETDATE(),SUSER_SNAME()),
  (@LOBID,'EMAIL_SUBJECT','Requested NJM {0} Information',GETDATE(),SUSER_SNAME())