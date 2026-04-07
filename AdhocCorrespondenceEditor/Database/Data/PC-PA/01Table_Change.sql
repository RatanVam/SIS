-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	Fixing existing table. We dont need this column.
-- =============================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[Configuration] ALTER COLUMN [ConfigValue] varchar(MAX)

GO

IF OBJECT_ID('uq_DocumentDropdownChildControl') IS NOT NULL 
ALTER TABLE [dbo].[DocumentDropdownChildControl] drop constraint [uq_DocumentDropdownChildControl];
  

/****** Object:  Index [uq_LOBPrinter]    Script Date: 1/23/2024 4:01:25 PM ******/
IF OBJECT_ID('uq_DocumentDropdownChildControl_new') IS  NULL 
ALTER TABLE [dbo].[DocumentDropdownChildControl] ADD  CONSTRAINT [uq_DocumentDropdownChildControl_new] UNIQUE NONCLUSTERED 
(
	[DocumentId] ASC,
	[DocumentDropdownLookupItemId] ASC,
	[ControlId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


ALTER TABLE [dbo].[DocumentDropdownLookupItem] ALTER COLUMN [DocumentDropdownLookupItemCode] varchar(150)
ALTER TABLE [dbo].[DocumentDropdownLookupItem] ALTER COLUMN [DocumentDropdownLookupItemValue] varchar(150)

IF NOT EXISTS(SELECT *
          FROM   INFORMATION_SCHEMA.COLUMNS
          WHERE  TABLE_NAME = 'DocumentDropdownLookupItem'
                 AND COLUMN_NAME = 'DocumentDropdownLookupItemAdditionalValue') 
ALTER TABLE [dbo].[DocumentDropdownLookupItem] ADD [DocumentDropdownLookupItemAdditionalValue] varchar(100)