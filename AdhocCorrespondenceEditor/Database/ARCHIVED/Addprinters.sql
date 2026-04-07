
DECLARE @GCLOBId int = (select lobId from dbo.LOB where LOBName = 'GC')
	DECLARE @WCCCLOBId int = (select lobId from dbo.LOB where LOBName = 'WCC')
	DECLARE @PL_PC_DW_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-DW')
	DECLARE @PL_PC_HO_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-HO')
	DECLARE @PL_PC_PA_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-PA')
	DECLARE @PL_PC_UMB_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-UMB')

DECLARE @CL_BC_PA_LOBId int = (select lobId from dbo.LOB where LOBName = 'BC-PA')
DECLARE @CL_BC_WCU_LOBId int = (select lobId from dbo.LOB where LOBName = 'BC-WCU')
DECLARE @CL_PC_BOP_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-BOP')
DECLARE @CL_PC_CA_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-CA')
DECLARE @CL_PC_CGL_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-CGL')
DECLARE @CL_PC_CUMB_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-CUMB')
DECLARE @CL_PC_DW_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-DW')
DECLARE @CL_PC_HO_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-HO')
DECLARE @CL_PC_MULTI_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-MULTI')
DECLARE @CL_PC_UMB_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-UMB')
DECLARE @CL_PC_WCU_LOBId int = (select lobId from dbo.LOB where LOBName = 'PC-WCU')


	

   declare @Printers table (PrinterName varchar(75), PrinterCode varchar(50), LOBId int)
   insert into @Printers values ( 'PRT_GC_PMFP1','PRT_GC_PMFP1',@GCLOBId),
   ( 'PRT_GC_PCLRMFP2','PRT_GC_PCLRMFP2',@GCLOBId),
   ( 'PRT_MSA_PMFP3','PRT_MSA_PMFP3',@GCLOBId),
   ( 'PRT_MSA_PMFP3','PRT_MSA_PMFP3',@WCCCLOBId),
   ( 'PRT_PL_PCLRMFP1','PRT_PL_PCLRMFP1',@PL_PC_DW_LOBId),
   ( 'PRT_PL_PCLRMFP1','PRT_PL_PCLRMFP1',@PL_PC_HO_LOBId),
   ( 'PRT_PL_PCLRMFP1','PRT_PL_PCLRMFP1',@PL_PC_PA_LOBId),
   ( 'PRT_PL_PCLRMFP1','PRT_PL_PCLRMFP1',@PL_PC_UMB_LOBId),
   ( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_BC_PA_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_BC_WCU_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_BOP_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_CA_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_CGL_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_CUMB_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_DW_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_HO_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_MULTI_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_UMB_LOBId),
( 'PRT_CL_PCLRMFP1','PRT_CL_PCLRMFP1',@CL_PC_WCU_LOBId)

declare @PrinterName varchar(75),
@PrinterCode varchar(50), @LobId int

DECLARE db_cursor CURSOR FOR 
SELECT  *
FROM @Printers 

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @PrinterName,@PrinterCode,@LobId

WHILE @@FETCH_STATUS = 0  
BEGIN  
    IF NOT EXISTS(select PrinterId from dbo.Printer where PrinterName = @PrinterName and PrinterCode = @PrinterCode)
	begin
	insert into dbo.Printer (PrinterName,PrinterCode,IsPrinterActive,CreatedBy,CreatedDateTime)
	values (@PrinterName,@PrinterCode,1,SUSER_SNAME(),GETDATE())
	print @PrinterName + ' - printer inserted successfully'
	end
	else
	print @PrinterName+' - printer already exists'

	DECLARE @printerId int = (select printerId from dbo.Printer where PrinterName = @PrinterName and PrinterCode=@PrinterCode)
	DECLARE @printerOrder int = (select max(printerOrder) from dbo.LOBPrinter where LOBId = @LobId)

	IF NOT EXISTS(select PrinterId from dbo.LOBPrinter where PrinterId = @printerId and LOBId = @LobId)
	Begin
	INSERT INTO dbo.LOBPrinter (PrinterId, LOBId,PrinterOrder,EffectiveDate,ExpirationDate,CategoryId,DocumentId,CreatedBy,CreatedDateTime)
	VALUES (@printerId, @LobId, @printerOrder,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),null,null, SUSER_SNAME(),GETDATE())
	print @PrinterName + ' mapping done successfully'
	end
	else
	print @PrinterName + ' mapping already exists'
   FETCH NEXT FROM db_cursor INTO  @PrinterName,@PrinterCode,@LobId 	 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor