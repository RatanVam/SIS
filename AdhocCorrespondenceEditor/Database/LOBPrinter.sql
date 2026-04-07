USE [ACE]
GO

/****** Object:  Table [dbo].[LOBPrinter]    Script Date: 6/26/2023 9:06:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.LOBPrinter', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[LOBPrinter](
	[LOBPrinterId] [int] IDENTITY(1,1) NOT NULL,
	[LOBId] [int] NOT NULL,
	[PrinterId] [int] NOT NULL,
	[PrinterOrder] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,

 CONSTRAINT [PK_LOBPrinter] PRIMARY KEY CLUSTERED 
(
	[LOBPrinterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_LOBPrinter] UNIQUE NONCLUSTERED 
(
	[LOBId] ASC,
	[PrinterId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[LOBPrinter]  WITH CHECK ADD  CONSTRAINT [FK_LOBPrinter_Printers] FOREIGN KEY([LOBId])
REFERENCES [dbo].[LOB] ([LOBId])


ALTER TABLE [dbo].[LOBPrinter] CHECK CONSTRAINT [FK_LOBPrinter_Printers]


ALTER TABLE [dbo].[LOBPrinter]  WITH CHECK ADD  CONSTRAINT [FK_LOBPrinter_PrinterLookupItem] FOREIGN KEY([PrinterId])
REFERENCES [dbo].[Printer] ([PrinterId])


ALTER TABLE [dbo].[LOBPrinter] CHECK CONSTRAINT [FK_LOBPrinter_PrinterLookupItem]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store mapping for ICE UI between documents and controls' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOBPrinter'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'

