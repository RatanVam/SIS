USE [ACE]
GO

/****** Object:  Table [dbo].[WebServices]    Script Date: 6/22/2023 9:50:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.WebService', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[WebService](
	[WebServiceId] [int] IDENTITY(1,1) NOT NULL,
	[LOBId] int NULL,
	[Environment] [varchar](50) NULL,
	[URLType] [varchar](50) NULL,
	[Environment] [varchar](50) NULL,
	[URL] [varchar](500) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [PK_WebService] PRIMARY KEY CLUSTERED 
(
	[WebServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[WebService]  WITH CHECK ADD  CONSTRAINT [FK_WebService_LOB] FOREIGN KEY([LOBId])
REFERENCES [dbo].[LOB] ([LOBId])


ALTER TABLE [dbo].[WebService] CHECK CONSTRAINT [FK_WebService_LOB]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store actual web service pointers for PDS/BDS/CDS based on region and LOB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebService'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


