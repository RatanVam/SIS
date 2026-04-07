USE [ACE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.Rule', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[Rule](
	[RuleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[IsActive] [bit] NOT NULL DEFAULT (0),
	[NameSpace] [varchar](250) NOT NULL,
	[MethodName] [varchar](100) NOT NULL

 CONSTRAINT [PK_T_Rules] PRIMARY KEY CLUSTERED 
(
	[RuleId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

PRINT '[Rule] Table Created'
END

ELSE
PRINT '[Rule] Table alredy exist'

GO



IF OBJECT_ID(N'dbo.RuleExecution', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[RuleExecution](
	[RuleExecutionId] [int] IDENTITY(1,1) NOT NULL,
	[LOBId] [int] NOT NULL,
	[CategoryId] [int]  NULL,
	[DocumentId] [int]  NULL,
	[ExecutionOrder] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,

 CONSTRAINT [PK_RuleExecution] PRIMARY KEY CLUSTERED 
(
	[RuleExecutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[RuleExecution]  WITH CHECK ADD  CONSTRAINT [FK_LOB_RuleExecution] FOREIGN KEY([LOBId])
REFERENCES [dbo].[LOB] ([LOBId])
ALTER TABLE [dbo].[RuleExecution] CHECK CONSTRAINT [FK_LOB_RuleExecution]

ALTER TABLE [dbo].[RuleExecution]  WITH CHECK ADD  CONSTRAINT [FK_Category_RuleExecution] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ALTER TABLE [dbo].[RuleExecution] CHECK CONSTRAINT [FK_Category_RuleExecution]

ALTER TABLE [dbo].[RuleExecution]  WITH CHECK ADD  CONSTRAINT [FK_Document_RuleExecution] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
ALTER TABLE [dbo].[RuleExecution] CHECK CONSTRAINT [FK_Document_RuleExecution]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store Rules between LOB ,documents and categories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RuleExecution'

PRINT '[RuleExecution] Table Created'
END
ELSE
PRINT '[RuleExecution] Table already exist'

GO

-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	<Description,,>
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