USE [ACE]
GO

/****** Object:  Table [dbo].[DocumentLog]    Script Date: 6/22/2023 9:35:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.DocumentLog', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[DocumentLog](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](500) NULL,
	[CreatedTime] [datetime] NULL,
	[LOBId] int NOT NULL,
	[LetterName] [varchar](500) NULL,
	[Payload] [xml] NULL,
	[PolicyNumber] [varchar](50) NULL,
	[Environment] [varchar](20) NULL,
	[BaseState] [varchar](20) NULL,
	[ClaimNumber] [varchar](50) NULL,
	[QuoteNumber] [varchar](50) NULL,
	[ProducerCode] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_DocumentLog] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE [dbo].[DocumentLog]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLog] FOREIGN KEY([LOBId])
REFERENCES [dbo].[LOB] ([LOBId])


ALTER TABLE [dbo].[DocumentLog] CHECK CONSTRAINT [FK_DocumentLog]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table track input request going to Interactive editor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentLog'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'


