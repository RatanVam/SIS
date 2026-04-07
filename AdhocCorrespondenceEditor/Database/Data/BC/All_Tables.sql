USE ACE
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.Rule', N'U') IS  NULL
BEGIN

CREATE TABLE [dbo].[Rule](
	[RuleId] [int] IDENTITY(1,1) NOT NULL,
	[RuleName] [varchar](700) NOT NULL,
	--[RuleType] [varchar](50) DEFAULT 'STATIC' NOT NULL,
	[RuleKey] [varchar](500) NOT NULL,
	[RuleResult] [varchar](500) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL

 CONSTRAINT [PK_T_Rule] PRIMARY KEY CLUSTERED 
(
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_Rule] UNIQUE NONCLUSTERED 
(
	[RuleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store inspire Rule specific to each line of business' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rule'
PRINT 'Rule Table Created'
END

ELSE
PRINT 'Rule Table alredy exist'


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.RuleItem', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[RuleItem](
	[RuleItemId] [int] IDENTITY(1,1) NOT NULL,
	[RuleId] [int]  NOT NULL,
	[LobId] [int] NOT NULL,
	[CategoryId] [int]  NULL,
	[DocumentId] [int]  NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [PK_RuleItem] PRIMARY KEY CLUSTERED 
(
	[RuleItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_RuleItem] UNIQUE NONCLUSTERED 
(
	[RuleItemId] ASC,
	[LobId] ASC,
	[CategoryId] ASC,
	[DocumentId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[RuleItem]  WITH CHECK ADD  CONSTRAINT [FK_RuleItem_Lob] FOREIGN KEY([LobId])
REFERENCES [dbo].[Lob] ([LobId])
ALTER TABLE [dbo].[RuleItem] CHECK CONSTRAINT [FK_RuleItem_Lob]


ALTER TABLE [dbo].[RuleItem]  WITH CHECK ADD  CONSTRAINT [FK_RuleItem_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ALTER TABLE [dbo].[RuleItem] CHECK CONSTRAINT [FK_RuleItem_Category]

ALTER TABLE [dbo].[RuleItem]  WITH CHECK ADD  CONSTRAINT [FK_RuleItem_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
ALTER TABLE [dbo].[DocumentControl] CHECK CONSTRAINT [FK_RuleItem_Document]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store mapping for ICE UI between documents and controls' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RuleItem'
PRINT 'RuleItem Table Created'
END

ELSE
PRINT 'RuleItem Table alredy exist'

