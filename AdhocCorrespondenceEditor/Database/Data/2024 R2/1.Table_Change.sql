-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	Fixing existing table. We dont need this column.
-- =============================================
USE ACE
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE dbo.[Configuration] ALTER COLUMN LOBId int NULL;


GO

IF OBJECT_ID(N'dbo.RuleGroup', N'U') IS  NULL
BEGIN

CREATE TABLE [dbo].[RuleGroup](
	[RuleGroupId] [int] IDENTITY(1,1) NOT NULL,
	[RuleGroupName] [varchar](700) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL

 CONSTRAINT [PK_T_RuleGroup] PRIMARY KEY CLUSTERED 
(
	[RuleGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_RuleGroup] UNIQUE NONCLUSTERED 
(
	[RuleGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store inspire Rule specific to each line of business' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RuleGroup'
PRINT 'Rule Group Table Created'
END

ELSE
PRINT 'Rule Group Table alredy exist'

ALTER TABLE dbo.[Rule]  Add RuleGroupId int;


ALTER TABLE [dbo].[Rule]
ADD CONSTRAINT FK_Rule_RuleGroup FOREIGN KEY (RuleGroupId)
  REFERENCES [dbo].RuleGroup(RuleGroupId)

go

