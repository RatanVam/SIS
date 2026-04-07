USE [ACE]
GO

/****** Object:  Table [dbo].[CategoryDocument]    Script Date: 6/22/2023 9:34:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.CategoryDocument', N'U') IS NULL
BEGIN

CREATE TABLE [dbo].[CategoryDocument](
	[CategoryDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DocumentOrder] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
	
 CONSTRAINT [PK_CategoryDocument] PRIMARY KEY CLUSTERED 
(
	[CategoryDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_CategoryDocument] UNIQUE NONCLUSTERED 
(
	[DocumentId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[CategoryDocument]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDocument] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])


ALTER TABLE [dbo].[CategoryDocument] CHECK CONSTRAINT [FK_CategoryDocument]


ALTER TABLE [dbo].[CategoryDocument]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDocument_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])


ALTER TABLE [dbo].[CategoryDocument] CHECK CONSTRAINT [FK_CategoryDocument_Document]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store mapping for ICE UI between documents and controls' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryDocument'
PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


