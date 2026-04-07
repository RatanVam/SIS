-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 20-Oct-2023
-- Description:	Fixing existing table. We dont need this column.
-- =============================================
USE ACE
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE dbo.[DocumentDropdownLookupType] ALTER COLUMN DocumentDirection varchar(50) NULL;

ALTER TABLE dbo.[DocumentDropdownLookupItem] Add InspireTag varchar(150);

GO

ALTER TABLE dbo.[Configuration]  Add DocumentId int;


ALTER TABLE [dbo].[Configuration]
ADD CONSTRAINT FK_Configuration_Document FOREIGN KEY (DocumentId)
  REFERENCES [dbo].Document(DocumentId)

go


ALTER TABLE [ACE].[dbo].[LOBPrinter] drop constraint [uq_LOBPrinter];
  

ALTER TABLE dbo.[LOBPrinter] Add  CategoryId int;
ALTER TABLE dbo.[LOBPrinter]  Add DocumentId int;


ALTER TABLE [dbo].[LOBPrinter]
ADD CONSTRAINT FK_LobPrinter_Category FOREIGN KEY (CategoryId)
  REFERENCES [dbo].[Category](CategoryId)

ALTER TABLE [dbo].[LOBPrinter]
ADD CONSTRAINT FK_LobPrinter_Document FOREIGN KEY (DocumentId)
  REFERENCES [dbo].Document(DocumentId)


Go

/****** Object:  Index [uq_LOBPrinter]    Script Date: 1/23/2024 4:01:25 PM ******/
ALTER TABLE [dbo].[LOBPrinter] ADD  CONSTRAINT [uq_LOBPrinter_new] UNIQUE NONCLUSTERED 
(
	[LOBId] ASC,
	[CategoryId] ASC,
	[PrinterId] ASC,
	[DocumentId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO




IF OBJECT_ID(N'dbo.DocumentDropdownChildControl', N'U') IS  NULL
BEGIN

CREATE TABLE [dbo].[DocumentDropdownChildControl](
	[DocumentDropdownChildControlId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] int NOT NULL,
	[DocumentDropdownLookupItemId] int NOT NULL,
	[ControlId]  int NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDateTime] [smalldatetime] NOT NULL,
	[UpdatedBy] [varchar](50)  NULL,
	[UpdatedDateTime] [smalldatetime] NULL,

 CONSTRAINT [PK_DocumentDropdownChildControl] PRIMARY KEY CLUSTERED 
(
	[DocumentDropdownChildControlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_DocumentDropdownChildControl] UNIQUE NONCLUSTERED 
(
	[DocumentId] ASC,
	[DocumentDropdownLookupItemId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[DocumentDropdownChildControl]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDropdownChildControl_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
ALTER TABLE [dbo].[DocumentDropdownChildControl] CHECK CONSTRAINT [FK_DocumentDropdownChildControl_Document]

ALTER TABLE [dbo].[DocumentDropdownChildControl]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDropdownChildControl_Control] FOREIGN KEY([ControlId])
REFERENCES  [dbo].[Control] ([ControlId])
ALTER TABLE [dbo].[DocumentDropdownChildControl] CHECK CONSTRAINT [FK_DocumentDropdownChildControl_Control]

ALTER TABLE [dbo].[DocumentDropdownChildControl]  WITH CHECK ADD  CONSTRAINT [FK_DocumentDropdownChildControl_LokupItem] FOREIGN KEY([DocumentDropdownLookupItemId])
REFERENCES  [dbo].[DocumentDropdownLookupItem] ([DocumentDropdownLookupItemId])
ALTER TABLE [dbo].[DocumentDropdownChildControl] CHECK CONSTRAINT [FK_DocumentDropdownChildControl_LokupItem]




EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store inspire categories specific to each line of business' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentDropdownChildControl'
PRINT 'Table Created'
END

ELSE
PRINT 'Table alredy exist'

