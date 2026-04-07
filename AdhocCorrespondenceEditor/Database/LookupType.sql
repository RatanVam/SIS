USE [ACE]
GO

/****** Object:  Table [dbo].[LookupType]    Script Date: 6/19/2023 2:40:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.LookupType', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[LookupType](
	[LookupTypeId] [int] IDENTITY(1,1) NOT NULL,
	[LookupTypeValue] Varchar(50) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [UC_OtheLookupTypeID] PRIMARY KEY CLUSTERED 
(
	[LookupTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store static look up type used by look up items for ICE UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LookupType'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


