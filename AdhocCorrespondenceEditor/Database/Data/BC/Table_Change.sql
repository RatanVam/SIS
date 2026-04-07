-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	Fixing existing table. We dont need this column.
-- =============================================

ALTER TABLE [ACE].[dbo].[Configuration] drop constraint [FK_Doc_Configuration];
  
ALTER TABLE [ACE].[dbo].[Configuration]
DROP COLUMN IF EXISTS DocumentId

USE ACE
GO

CREATE OR ALTER procedure  [dbo].[GetConfigurationLookup] 
AS
BEGIN

	SET NOCOUNT ON;

	--LOB
	SELECT 		  
	  cfg.[LOBId],
	  null [DocumentId] ,
      [ConfigKey],
      [ConfigValue],
      [LOBName]
	  
	  FROM [dbo].configuration cfg
	  JOIN [dbo].[LOB] lob
	  ON lob.LOBId = cfg.LOBId

END