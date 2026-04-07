Go
Declare @lobID int
select @lobID =  LOBId from LOB where LOBName = 'GC'
Declare @DocumentID int

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','True',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'lblInsuredVehicle','Vehicle:',SYSTEM_USER,SYSDATETIME())
End



select @DocumentID =  DocumentId from Document where DocumentName = 'Appraisal Request'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'lblInsuredVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'lblInsuredVehicle','Insured''s Vehicle:',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Towing Appraiser Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Denial Partial- Auto'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Basic No Ordinance Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Basic with Ordinance Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'NJTPK-GSP Tow Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Towing No Breakdown-Appraiser Combo Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Towing No Breakdown Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Notification of Salvage Facility'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Towing Reimbursement Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'State Police Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Abandonment Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Auth for Salv Tow Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Limited Power of Attorney'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End


select @DocumentID =  DocumentId from Document where DocumentName = 'Ltr of Authorization'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'No Financial Interest Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Notarized Mileage Error Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Out of State Facility Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'No Coverage - Personal-Comm-Rental'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Towing Consent reimbursement Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Towing Protest Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showClaimantVehicle' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showClaimantVehicle','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showInsuredVehicle','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

--added by Sreedhar below scripts
select @DocumentID =  DocumentId from Document where DocumentName = 'Additional Information Form'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showPrimaryAddress' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showPrimaryAddress','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Title Transfer Request Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showPrimaryAddress' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showPrimaryAddress','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
