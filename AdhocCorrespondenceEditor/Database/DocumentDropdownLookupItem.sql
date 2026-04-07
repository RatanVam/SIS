USE ACE
GO

/****** Object:  Table [dbo].[LookupItem]    Script Date: 6/19/2023 2:43:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.DocumentDropdownLookupItem', N'U') IS NULL
BEGIN

CREATE TABLE [dbo].[DocumentDropdownLookupItem](
	[DocumentDropdownLookupItemId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentDropdownLookupItemCode] [varchar](50) NOT NULL,
	[DocumentDropdownLookupItemValue] [varchar](75) NULL,
	[DocumentDropdownLookupItemTypeId] [int] NOT NULL,
	[DocumentDropdownLookupItemOrder] [int] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [UC_DocumentDropdownLookupItem] PRIMARY KEY CLUSTERED 
(
	[DocumentDropdownLookupItemId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[DocumentDropdownLookupItem]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDropdownLookupItem_Type] FOREIGN KEY([DocumentDropdownLookupItemTypeId])
REFERENCES [dbo].[DocumentDropdownLookupType] ([DocumentDropdownLookupTypeId])


ALTER TABLE [dbo].[DocumentDropdownLookupItem] CHECK CONSTRAINT [FK_DocumentDropdownLookupItem_Type]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store static look up items which are used in ICE UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentDropdownLookupItem'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


