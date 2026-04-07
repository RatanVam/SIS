Go
Declare @lobID int
select @lobID =  LOBId from LOB where LOBName = 'GC'
Declare @DocumentID int


IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'addNoCoverage' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'addNoCoverage','No Coverage',(SELECT top(1) DocumentId from Document where DocumentName = 'Blank Letter Template-Underwriting'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'addNoCoverage','No Coverage',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-General'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'addNoCoverage','No Coverage',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Lapse in Coverage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'addNoCoverage','No Coverage',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Pol Not in Force'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'addNoCoverage','No Coverage',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Veh Not Described on Policy'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'addNoCoverage','No Coverage',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Veh Removed Prior to Loss'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'addNoCoverage','No Coverage',(SELECT top(1) DocumentId from Document where DocumentName = 'No Coverage - Personal-Comm-Rental'),SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showCashValue' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse NJM Takes'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Setlmt Total Loss - NJM Take Veh'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Stlmnt TL Stolen Not Recovered'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'NY Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showCashValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'),SYSTEM_USER,SYSDATETIME())
End

 IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showOldDamageAmt' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showOldDamageAmt','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse NJM Takes'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showOldDamageAmt','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showOldDamageAmt','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Setlmt Total Loss - NJM Take Veh'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showOldDamageAmt','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showOldDamageAmt','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showOldDamageAmt','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Stlmnt TL Stolen Not Recovered'),SYSTEM_USER,SYSDATETIME())
End

 IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageSubTotal' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageSubTotal','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse NJM Takes'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageSubTotal','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageSubTotal','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Setlmt Total Loss - NJM Take Veh'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageSubTotal','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageSubTotal','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageSubTotal','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Stlmnt TL Stolen Not Recovered'),SYSTEM_USER,SYSDATETIME())
End

 IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showTaxAmount' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showTaxAmount','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse NJM Takes'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showTaxAmount','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showTaxAmount','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Setlmt Total Loss - NJM Take Veh'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showTaxAmount','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showTaxAmount','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showTaxAmount','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Stlmnt TL Stolen Not Recovered'),SYSTEM_USER,SYSDATETIME())
End


 IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageValue' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageValue','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME())
End

 IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvagePDDed' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvagePDDed','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse NJM Takes'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvagePDDed','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvagePDDed','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Setlmt Total Loss - NJM Take Veh'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvagePDDed','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvagePDDed','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvagePDDed','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Stlmnt TL Stolen Not Recovered'),SYSTEM_USER,SYSDATETIME())
End

 IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageOther' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageOther','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse NJM Takes'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageOther','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageOther','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Setlmt Total Loss - NJM Take Veh'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageOther','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageOther','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageOther','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Stlmnt TL Stolen Not Recovered'),SYSTEM_USER,SYSDATETIME())
End

 IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageNetSet' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageNetSet','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse NJM Takes'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageNetSet','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Right of Recourse Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageNetSet','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Setlmt Total Loss - NJM Take Veh'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageNetSet','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement TL Owner Keeps PA-OH-MD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageNetSet','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Settlement Total Loss Owner Keeps'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showSalvageNetSet','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Stlmnt TL Stolen Not Recovered'),SYSTEM_USER,SYSDATETIME())
End


IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageVehYear' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageVehYear','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'),SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageVehMake' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageVehMake','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'),SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageVehModel' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageVehModel','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'),SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showTotalLossEst' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showTotalLossEst','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'),SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showSalvageTypeLoss' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showSalvageTypeLoss','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'),SYSTEM_USER,SYSDATETIME())
End



