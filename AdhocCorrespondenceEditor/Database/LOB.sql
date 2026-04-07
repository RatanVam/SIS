USE [ACE]
GO

/****** Object:  Table [dbo].[LOB]    Script Date: 6/22/2023 9:25:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.LOB', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[LOB](
	[LOBId] [int] IDENTITY(1,1) NOT NULL,
	[LOBName] [varchar](100) NULL,
	[LOBType] [varchar](100) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [PK_LOB] PRIMARY KEY CLUSTERED 
(
	[LOBId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store line of business' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOB'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


