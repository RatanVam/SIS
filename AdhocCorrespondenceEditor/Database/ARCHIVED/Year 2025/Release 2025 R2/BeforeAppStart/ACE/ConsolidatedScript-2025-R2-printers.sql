-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	SP to insert printer
-- =============================================
CREATE OR ALTER PROCEDURE dbo.InsertPrinter
@PrinterName varchar(75),
@PrinterCode varchar(50),
@UserId varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(select PrinterId from dbo.Printer where PrinterName = @PrinterName and PrinterCode = @PrinterCode)
	insert into dbo.Printer (PrinterName,PrinterCode,IsPrinterActive,CreatedBy,CreatedDateTime)
	values (@PrinterName,@PrinterCode,1,@UserId,GETDATE())
END
GO

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	SP to update printerName and code
-- =============================================
CREATE OR ALTER PROCEDURE dbo.UpdatePrinter
@PrinterId int,
@PrinterName varchar(75),
@PrinterCode varchar(50),
@UserId varchar(50)
AS
BEGIN

UPDATE dbo.Printer
set PrinterName=@PrinterName,
PrinterCode=@PrinterCode,
UpdatedBy=@UserId,
UpdatedDateTime=GETDATE()
WHERE PrinterId= @PrinterId
END

GO

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/15/2024
-- Description:	SP to delete printer(update expiration date)
-- =============================================
CREATE OR ALTER PROCEDURE dbo.DeletePrinter
@LOBPrinterId int,
@UserId varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	update LOBPrinter
	set  ExpirationDate = DATEADD(YEAR,-100,ExpirationDate),
	UpdatedBy=@UserId,
	UpdatedDateTime=GETDATE()
	where LOBPrinterId=@LOBPrinterId
	
END
GO


-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	SPto insert printer and its map
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertPrinterMap]
@PrinterName varchar(75),
@PrinterCode varchar(50),
@LOBName varchar(100),
@UserId varchar(50),
@CategoryId int = null,
@DocumentId int = null
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS(select PrinterId from dbo.Printer where PrinterName = @PrinterName and PrinterCode = @PrinterCode)
	insert into dbo.Printer (PrinterName,PrinterCode,IsPrinterActive,CreatedBy,CreatedDateTime)
	values (@PrinterName,@PrinterCode,1,@UserId,GETDATE())

	DECLARE @LOBId int = (select lobId from dbo.LOB where LOBName = @LOBName)
	DECLARE @printerId int = (select top 1 printerId from dbo.Printer where PrinterName = @PrinterName and PrinterCode=@PrinterCode)
	DECLARE @printerOrder int = (select max(printerOrder) from dbo.LOBPrinter where LOBId = @LOBId)
	DECLARE @currentDate datetime
	SELECT @currentDate = GETDATE()

	IF NOT EXISTS(select PrinterId from dbo.LOBPrinter where PrinterId = @printerId and LOBId = @LOBId)
	INSERT INTO dbo.LOBPrinter (PrinterId, LOBId,PrinterOrder,EffectiveDate,ExpirationDate,CategoryId,DocumentId,CreatedBy,CreatedDateTime)
	VALUES (@printerId, @LOBId, @printerOrder,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),@CategoryId,@DocumentId, @UserId,GETDATE())
	ELSE
	 BEGIN
	 IF EXISTS (select PrinterId from dbo.LOBPrinter where PrinterId = @printerId and LOBId = @LOBId  
	 and ((@CategoryId is null and CategoryId is null) or CategoryId = @CategoryId)
	 and ((@DocumentId is null and DocumentId is null) or DocumentId = @DocumentId)
	 and @currentDate not between EffectiveDate AND ExpirationDate)
		UPDATE dbo.LOBPrinter set ExpirationDate=DATEADD(YEAR,100,GETDATE()),
		 UpdatedBy=@UserId,UpdatedDateTime=GETDATE()
		where PrinterId = @printerId and LOBId = @LOBId and 
		((@CategoryId is null and CategoryId is null) or CategoryId = @CategoryId)
		and ((@DocumentId is null and DocumentId is null) or DocumentId = @DocumentId)
	 ELSE IF NOT EXISTS (select PrinterId from dbo.LOBPrinter where PrinterId = @printerId and LOBId = @LOBId  
	 and ((@CategoryId is null and CategoryId is null) or CategoryId = @CategoryId)
	 and ((@DocumentId is null and DocumentId is null) or DocumentId = @DocumentId)
	 and @currentDate between EffectiveDate AND ExpirationDate)
		INSERT INTO dbo.LOBPrinter (PrinterId, LOBId,PrinterOrder,EffectiveDate,ExpirationDate,CategoryId,DocumentId,CreatedBy,CreatedDateTime)
		VALUES (@printerId, @LOBId, @printerOrder,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),@CategoryId,@DocumentId, @UserId,GETDATE())
	END
END
GO

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/24/2024
-- Description:	SP to update categoryId and documentid in LOBPrintertable
-- =============================================
ALTER   PROCEDURE [dbo].[UpdatePrinterMap]
@LOBPrinterId int,
@UserId varchar(50),
@CategoryId int = null,
@DocumentId int = null
AS
BEGIN

UPDATE dbo.LOBPrinter
set CategoryId=@CategoryId,
DocumentId = @DocumentId,
UpdatedBy=@UserId,
UpdatedDateTime=GETDATE()
WHERE LOBPrinterId= @LOBPrinterId
END

