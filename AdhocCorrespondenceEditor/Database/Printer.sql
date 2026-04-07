USE [ACE]
GO

/****** Object:  Table [dbo].[Printer]    Script Date: 6/26/2023 10:00:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.Printer', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[Printer](
	[PrinterId] [int] IDENTITY(1,1) NOT NULL,
	[PrinterCode] [varchar](50) NOT NULL,
	[PrinterName] [varchar](75) NULL,
	[IsPrinterActive] [bit] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [UC_Printer] PRIMARY KEY CLUSTERED 
(
	[PrinterId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Printer] ADD  DEFAULT ((1)) FOR [IsPrinterActive]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store static look up items which are used in ICE UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Printer'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


