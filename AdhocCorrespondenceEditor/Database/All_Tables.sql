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

PRINT 'lob Table Created'
END

ELSE
PRINT 'lob Table alredy exist'


USE [ACE_Dev]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 6/22/2023 9:28:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.Category', N'U') IS  NULL
BEGIN

CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](700) NOT NULL,
	[CategoryFriendlyName] [varchar](1000) NOT NULL,
	[IsCategoryActive] [bit] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,

 CONSTRAINT [PK_T_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_Category] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store inspire categories specific to each line of business' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category'
PRINT 'Category Table Created'
END

ELSE
PRINT 'Category Table alredy exist'



/****** Object:  Table [dbo].[Document]    Script Date: 6/22/2023 9:31:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.Document', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[Document](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [varchar](700) NOT NULL,
	[DocumentFriendlyName] [varchar](1000) NOT NULL,
	[IsDocumentActive] [bit] NOT NULL,
	[BaseState] [varchar](100) NULL,
	[JldFilePath] [varchar](1000) NOT NULL,
	[DocumentType] [varchar](500) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_Document] UNIQUE NONCLUSTERED 
(
	[DocumentName] ASC,
	[DocumentFriendlyName] ASC,
	[DocumentType]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store inspire ad-hoc template information for each category and lob' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Document'

PRINT 'Document Table Created'
END

ELSE
PRINT 'Document Table alredy exist'



/****** Object:  Table [dbo].[Control]    Script Date: 6/25/2023 8:20:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.Control', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[Control](
	[ControlId] [int] IDENTITY(1,1) NOT NULL,
	[ControlName] [varchar](1000) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime]  NULL,
 CONSTRAINT [PK_Controls] PRIMARY KEY CLUSTERED 
(
	[ControlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_Control] UNIQUE NONCLUSTERED 
(
	[ControlName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store ICE control metadata' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Control'

PRINT 'Control Table Created'
END

ELSE
PRINT 'Control Table alredy exist'


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

PRINT 'printer Table Created'
END

ELSE
PRINT 'printer Table alredy exist'




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

PRINT 'lookyptype Table Created'
END

ELSE
PRINT 'lookuptype Table alredy exist'



/****** Object:  Table [dbo].[LookupItem]    Script Date: 6/19/2023 2:43:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.PolicyLookupItem', N'U') IS NULL
BEGIN

CREATE TABLE [dbo].[PolicyLookupItem](
	[PolicyLookupItemId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyLookupItemCode] [varchar](50) NOT NULL,
	[PolicyLookupItemValue] [varchar](75) NULL,
	[LookupTypeId] [int] NOT NULL,
	[PolicyLookupItemOrder] [int] NOT NULL,
	[IsPolicyLookupItemActive] bit NOT NULL DEFAULT 1,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [UC_PolicyLookupItem] PRIMARY KEY CLUSTERED 
(
	[PolicyLookupItemID] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[PolicyLookupItem]  WITH CHECK ADD  CONSTRAINT [FK_T_PolicyLookupItem_T_LookupType] FOREIGN KEY([LookupTypeId])
REFERENCES [dbo].[LookupType] ([LookupTypeId])


ALTER TABLE [dbo].[PolicyLookupItem] CHECK CONSTRAINT [FK_T_PolicyLookupItem_T_LookupType] 


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store static look up items which are used in ICE UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PolicyLookupItem'
PRINT 'policyllokup Table Created'
END

ELSE
PRINT 'policyllokup Table alredy exist'



/****** Object:  Table [dbo].[LookupItem]    Script Date: 6/19/2023 2:43:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.GenericLookupItem', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[GenericLookupItem](
	[GenericLookupItemId] [int] IDENTITY(1,1) NOT NULL,
	[GenericLookupItemCode] [varchar](50) NOT NULL,
	[GenericLookupItemValue] [varchar](75) NULL,
	[LookupTypeId] [int] NOT NULL,
	[GenericLookupItemOrder] [int] NOT NULL,
	[IsGenericLookupItemActive] bit NOT NULL DEFAULT 1,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [UC_GenericLookupItem] PRIMARY KEY CLUSTERED 
(
	[GenericLookupItemId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[GenericLookupItem]  WITH CHECK ADD  CONSTRAINT [FK_T_GenericLookupItem_T_LookupType] FOREIGN KEY([LookupTypeId])
REFERENCES [dbo].[LookupType] ([LookupTypeId])


ALTER TABLE [dbo].[GenericLookupItem] CHECK CONSTRAINT [FK_T_GenericLookupItem_T_LookupType] 


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store static look up items which are used in ICE UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GenericLookupItem'

PRINT 'generallookup Table Created'
END

ELSE
PRINT 'generallookup Table alredy exist'



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

PRINT 'ws Table Created'
END

ELSE
PRINT 'ws Table alredy exist'


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

PRINT '[DocumentDropdownLookupType] Table Created'
END

ELSE
PRINT '[DocumentDropdownLookupType] Table alredy exist'



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

PRINT 'DocumentDropdownLookupItem Table Created'
END

ELSE
PRINT 'DocumentDropdownLookupItem Table alredy exist'


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

PRINT '[LOBPrinter] Table Created'
END

ELSE
PRINT '[LOBPrinter] Table alredy exist'



/****** Object:  Table [dbo].[LOBCategory]    Script Date: 6/22/2023 9:34:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'dbo.LOBCategory', N'U') IS NULL
BEGIN

CREATE TABLE [dbo].[LOBCategory](
	[LOBCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[LOBId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CategoryOrder]	[int] NOT NULL,
	[CategoryGroups] [varchar](max) NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
	
 CONSTRAINT [PK_LOBCategory] PRIMARY KEY CLUSTERED 
(
	[LOBCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_LOBCategory] UNIQUE NONCLUSTERED 
(
	[CategoryId] ASC,
	[LOBId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[LOBCategory]  WITH CHECK ADD  CONSTRAINT [FK_LOBCategory] FOREIGN KEY([LOBId])
REFERENCES [dbo].[LOB] ([LOBId])


ALTER TABLE [dbo].[LOBCategory] CHECK CONSTRAINT [FK_LOBCategory]


ALTER TABLE [dbo].[LOBCategory]  WITH CHECK ADD  CONSTRAINT [FK_LOBCategory_Cat] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])


ALTER TABLE [dbo].[LOBCategory] CHECK CONSTRAINT [FK_LOBCategory_Cat]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store mapping for ICE UI between documents and controls' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOBCategory'

PRINT '[LOBCategory] Table Created'
END

ELSE
PRINT '[LOBCategory] Table alredy exist'



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
PRINT 'CategoryDocument Table Created'
END

ELSE
PRINT 'CategoryDocument Table alredy exist'



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
PRINT 'DocumentControl Table Created'
END

ELSE
PRINT 'DocumentControl Table alredy exist'



/****** Object:  Table [dbo].[LOB]    Script Date: 6/22/2023 9:25:55 PM ******/
GO

IF OBJECT_ID(N'dbo.Configuration', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[Configuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LOBId] [int] NOT NULL,
	[DocumentId] [int] NULL,
	[ConfigKey] [varchar](100) NULL,
	[ConfigValue] [varchar](100) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [smalldatetime] NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[Configuration]  WITH CHECK ADD  CONSTRAINT [FK_LOB_Configuration] FOREIGN KEY([LOBId])
REFERENCES [dbo].[LOB] ([LOBId])

ALTER TABLE [dbo].[Configuration] CHECK CONSTRAINT [FK_LOB_Configuration]

ALTER TABLE [dbo].[Configuration]  WITH CHECK ADD  CONSTRAINT [FK_Doc_Configuration] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])

ALTER TABLE [dbo].[Configuration] CHECK CONSTRAINT [FK_Doc_Configuration]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store configuration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Configuration'

PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'





