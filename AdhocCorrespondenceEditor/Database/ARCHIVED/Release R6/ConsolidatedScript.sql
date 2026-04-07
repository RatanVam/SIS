SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	Get Printer list from printer table
-- =============================================
CREATE OR ALTER PROCEDURE dbo.GetPrinter
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [PrinterId]
      ,[PrinterCode]
      ,[PrinterName]
	  ,[IsPrinterActive]
	  FROM [dbo].[Printer]
END
GO

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	add categoryFriendlyName and documentFriendlyName to [GetPrinterLookupData] SP
-- =============================================
ALTER   procedure  [dbo].[GetPrinterLookupData] 
AS
BEGIN

	SET NOCOUNT ON;
	Declare @currentDate datetime
	SELECT @currentDate = GETDATE()
	--printer lookup data
	SELECT 
		lobprin.LOBPrinterId,
		prin.PrinterId,
		prin.PrinterName,
		prin.PrinterCode,
		prin.IsPrinterActive,
		lobprin.LOBId,
		lobprin.CategoryId,
		cat.CategoryFriendlyName,
		lobprin.DocumentId,
		doc.DocumentFriendlyName,
		lobprin.PrinterOrder,
		lob.LOBName,
		lob.LOBType
	FROM 	[dbo].[Printer] prin
	JOIN  [dbo].[LOBPrinter] lobprin
	ON prin.PrinterId = lobprin.PrinterId
	JOIN [dbo].[LOB] lob
	ON lob.LOBId = lobprin.LOBId
	LEFT JOIN [dbo].[Category] cat
	on cat.CategoryId=lobprin.CategoryId
	LEFT JOIN [dbo].[Document] doc
	on doc.DocumentId=lobprin.DocumentId
	WHERE @currentDate between EffectiveDate AND ExpirationDate
	ORDER BY lobprin.PrinterOrder
END
GO


-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/15/2024
-- Description:	SP to delete printer(update expiration date)
-- =============================================
CREATE OR ALTER PROCEDURE dbo.DeletePrinter
@LOBPrinterId int
AS
BEGIN
	
	SET NOCOUNT ON;
	update LOBPrinter
	set  ExpirationDate = DATEADD(YEAR,-100,ExpirationDate),
	UpdatedBy=SUSER_SNAME(),
	UpdatedDateTime=GETDATE()
	where LOBPrinterId=@LOBPrinterId
	
END
GO

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	SPto insert printer and its map
-- =============================================
CREATE OR ALTER PROCEDURE dbo.InsertPrinterMap
@PrinterName varchar(75),
@PrinterCode varchar(50),
@LOBName varchar(100),
@CategoryId int = null,
@DocumentId int = null
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(select PrinterId from dbo.Printer where PrinterName = @PrinterName and PrinterCode = @PrinterCode)
	insert into dbo.Printer (PrinterName,PrinterCode,IsPrinterActive,CreatedBy,CreatedDateTime)
	values (@PrinterName,@PrinterCode,1,SUSER_SNAME(),GETDATE())

	DECLARE @LOBId int = (select lobId from dbo.LOB where LOBName = @LOBName)
	DECLARE @printerId int = (select top 1 printerId from dbo.Printer where PrinterName = @PrinterName and PrinterCode=@PrinterCode)
	DECLARE @printerOrder int = (select max(printerOrder) from dbo.LOBPrinter where LOBId = @LOBId)
	DECLARE @currentDate datetime
	SELECT @currentDate = GETDATE()

	IF NOT EXISTS(select PrinterId from dbo.LOBPrinter where PrinterId = @printerId and LOBId = @LOBId)
	INSERT INTO dbo.LOBPrinter (PrinterId, LOBId,PrinterOrder,EffectiveDate,ExpirationDate,CategoryId,DocumentId,CreatedBy,CreatedDateTime)
	VALUES (@printerId, @LOBId, @printerOrder,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),@CategoryId,@DocumentId, SUSER_SNAME(),GETDATE())
	ELSE
	 BEGIN
	 IF EXISTS (select PrinterId from dbo.LOBPrinter where PrinterId = @printerId and LOBId = @LOBId  
	 and ((@CategoryId is null and CategoryId is null) or CategoryId = @CategoryId)
	 and ((@DocumentId is null and DocumentId is null) or DocumentId = @DocumentId)
	 and @currentDate not between EffectiveDate AND ExpirationDate)
		UPDATE dbo.LOBPrinter set ExpirationDate=DATEADD(YEAR,100,GETDATE()),
		 UpdatedBy=SUSER_SNAME(),UpdatedDateTime=GETDATE()
		where PrinterId = @printerId and LOBId = @LOBId and 
		((@CategoryId is null and CategoryId is null) or CategoryId = @CategoryId)
		and ((@DocumentId is null and DocumentId is null) or DocumentId = @DocumentId)
	 ELSE IF NOT EXISTS (select PrinterId from dbo.LOBPrinter where PrinterId = @printerId and LOBId = @LOBId  
	 and ((@CategoryId is null and CategoryId is null) or CategoryId = @CategoryId)
	 and ((@DocumentId is null and DocumentId is null) or DocumentId = @DocumentId)
	 and @currentDate between EffectiveDate AND ExpirationDate)
		INSERT INTO dbo.LOBPrinter (PrinterId, LOBId,PrinterOrder,EffectiveDate,ExpirationDate,CategoryId,DocumentId,CreatedBy,CreatedDateTime)
		VALUES (@printerId, @LOBId, @printerOrder,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),@CategoryId,@DocumentId, SUSER_SNAME(),GETDATE())
	END
END
GO

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	SP to update categoryId and documentid in LOBPrintertable
-- =============================================
CREATE OR ALTER PROCEDURE dbo.UpdatePrinterMap
@LOBPrinterId int,
@CategoryId int = null,
@DocumentId int = null
AS
BEGIN

UPDATE dbo.LOBPrinter
set CategoryId=@CategoryId,
DocumentId = @DocumentId,
UpdatedBy=SUSER_SNAME(),
UpdatedDateTime=GETDATE()
WHERE LOBPrinterId= @LOBPrinterId
END

GO

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	insert supportedLOBToShowAdminColumn config 
-- =============================================
IF NOT EXISTS (select * from Configuration where ConfigKey = 'supportedLOBToShowAdminColumn')
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime)
values ('supportedLOBToShowAdminColumn','PC-PA,PC-DW,PC-UMB,PC-HO',null,SUSER_SNAME(),GETDATE())


-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	Add LOBAdmingroups column and update its values
-- =============================================
IF COL_LENGTH('LOB','LOBAdmingroups') IS NULL
	alter table LOB
	add LOBAdmingroups varchar(max)
Go

IF @@SERVERNAME = 'SQLP09AGBUS9,54931'
 BEGIN
	update LOB set LOBAdmingroups = 'ACE_ADMIN_PROD,ACE_ADMINCC_PROD'
	where LOBName in ('GC' ,'WCC')
	update LOB set LOBAdmingroups = 'ACE_ADMIN_PROD,ACE_ADMINBC_PROD'
	where LOBName in ('BC-PA', 'BC-WCU')
	update LOB set LOBAdmingroups = 'ACE_ADMIN_PROD,ACE_ADMINPC_PROD'
	where LOBName in ('PC-BOP','PC-CA','PC-CGL','PC-CUMB',
	'PC-DW','PC-HO','PC-MULTI','PC-PA','PC-UMB','PC-WCU')
	 END
ELSE
update LOB set LOBAdmingroups = 'ACE_ADMIN_NONPROD'
GO

-- =============================================
-- Author:		Sandhya Kethenei
-- Create date: 10/24/2024
-- Description:	update SP to get [LOBAdmingroups] column
-- =============================================
ALTER   procedure  [dbo].[GetLOB] 
AS
BEGIN

	SET NOCOUNT ON;

	--LOB
	SELECT 
	  [LOBId],
      [LOBName],
      [LOBType],
	  [LOBAdmingroups]
	  FROM [dbo].[LOB]
END

Go
