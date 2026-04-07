USE ACE
GO

/****** Object:  Table [dbo].[LookupItem]    Script Date: 6/19/2023 2:43:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.DocumentDropdownLookupType', N'U') IS NULL
BEGIN

CREATE TABLE [dbo].[DocumentDropdownLookupType](
	[DocumentDropdownLookupTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] int NOT NULL,
	[LobId] int NOT NULL,
	[DocumentDropdownLookupTypeCode] [varchar](50) NOT NULL,
	[DocumentDropdownLookupTypeLabelName] [varchar](50) NULL,
	[DocumentDirection] [Varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
	
	 CONSTRAINT [UC_DocumentDropdownLookupType] PRIMARY KEY CLUSTERED 
(
	[DocumentDropdownLookupTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]




ALTER TABLE [dbo].[DocumentDropdownLookupType]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDropdownLookupType_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])


ALTER TABLE [dbo].[DocumentDropdownLookupType] CHECK CONSTRAINT [FK_DocumentDropdownLookupType_Document]



ALTER TABLE [dbo].[DocumentDropdownLookupType]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDropdownLookupType_LOB] FOREIGN KEY([LOBId])
REFERENCES [dbo].[LOB] ([LOBId])


ALTER TABLE [dbo].[DocumentDropdownLookupType] CHECK CONSTRAINT [FK_DocumentDropdownLookupType_LOB]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store static look up items which are used in ICE UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentDropdownLookupType'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


