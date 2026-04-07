USE [ACE]
GO

/****** Object:  Table [dbo].[DocumentControl]    Script Date: 6/22/2023 9:34:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.DocumentControl', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[DocumentControl](
	[DocumentControlId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[ControlId] [int] NOT NULL,
	[ControlOrder] [int] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [PK_DocumentControl] PRIMARY KEY CLUSTERED 
(
	[DocumentControlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_DocumentControl] UNIQUE NONCLUSTERED 
(
	[DocumentId] ASC,
	[ControlId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[DocumentControl]  WITH CHECK ADD  CONSTRAINT [FK_DocumentControl_Controls] FOREIGN KEY([ControlId])
REFERENCES [dbo].[Control] ([ControlId])


ALTER TABLE [dbo].[DocumentControl] CHECK CONSTRAINT [FK_DocumentControl_Controls]


ALTER TABLE [dbo].[DocumentControl]  WITH CHECK ADD  CONSTRAINT [FK_DocumentControl_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])


ALTER TABLE [dbo].[DocumentControl] CHECK CONSTRAINT [FK_DocumentControl_Document]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store mapping for ICE UI between documents and controls' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentControl'
PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'



