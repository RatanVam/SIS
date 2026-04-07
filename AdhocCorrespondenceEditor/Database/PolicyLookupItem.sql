USE ACE
GO

/****** Object:  Table [dbo].[LookupItem]    Script Date: 6/19/2023 2:43:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.PolicyLookupItem', N'U') IS NULL
BEGIN

CREATE TABLE [dbo].[PolicyLookupItem](
	[PolicyLookupItemId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyLookupItemCode] [varchar](50) NOT NULL,
	[PolicyLookupItemValue] [varchar](75) NULL,
	[LookupTypeId] [int] NOT NULL,
	[PolicyLookupItemOrder] [int] NOT NULL,
	[IsPolicyLookupItemActive] bit NOT NULL DEFAULT 1,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [UC_PolicyLookupItem] PRIMARY KEY CLUSTERED 
(
	[PolicyLookupItemID] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[PolicyLookupItem]  WITH CHECK ADD  CONSTRAINT [FK_T_PolicyLookupItem_T_LookupType] FOREIGN KEY([LookupTypeId])
REFERENCES [dbo].[LookupType] ([LookupTypeId])


ALTER TABLE [dbo].[PolicyLookupItem] CHECK CONSTRAINT [FK_T_PolicyLookupItem_T_LookupType] 


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store static look up items which are used in ICE UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PolicyLookupItem'
PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'



