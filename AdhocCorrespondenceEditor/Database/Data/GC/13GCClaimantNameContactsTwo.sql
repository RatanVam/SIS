Go
Declare @lobID int
select @lobID =  LOBId from LOB where LOBName = 'GC'
Declare @DocumentID int

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'claimantContactTopLabel' and LOBId = @lobID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'claimantContactTopLabel','Claimant Name (Contacts Two)',SYSTEM_USER,SYSDATETIME()),
	  (@lobid,'claimantContactLabel','Claimant Name (Contacts Two)',SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Limited Power of Attorney'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'claimantContactTopLabel' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'claimantContactTopLabel','Company Name (Contact If Needed)',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	  (@lobid,'claimantContactLabel','Company Name (Contact If Needed):',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	  (@lobid,'companyNameContact','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'NY Provider Coverage Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'claimantContactTopLabel' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'claimantContactTopLabel','Claimant Name (System)',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	  (@lobid,'claimantContactLabel','Claimant Name (System):',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	  (@lobid,'claimantContact','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'ODS Explain Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'claimantContactTopLabel' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'claimantContactTopLabel','Claimant Name (System)',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	  (@lobid,'claimantContactLabel','Claimant Name (System):',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	  (@lobid,'claimantContact','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End