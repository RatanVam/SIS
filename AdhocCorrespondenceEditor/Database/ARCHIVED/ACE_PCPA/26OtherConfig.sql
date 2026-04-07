Go
Declare @lobID int,@lobIDUMB int,@documentID1 int,@documentID2 int,@documentID3 int,@documentIDCardTemp int
Declare @documentIDCardOH int,@documentIDCardPA int,@documentIDCardNJ int,@documentIDCardCT int,@documentIDCardMD int
Declare @documentIDResidentCoverage int,@documentIDVerificationofCoverage int, @documentIDNB60DayDeclineCancel int, @documentIDNJDeclineLtrAuto int
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
select @lobIDUMB =  LOBId from LOB where LOBName = 'PC-UMB'
select @documentID1  =  DocumentID from Document where DocumentName = 'MD NB 45 Day Decline-Cancel'
select @documentID2  =  DocumentID from Document where DocumentName = 'UM-UIM Form'
select @documentID3  =  DocumentID from Document where DocumentName = 'UM-UIM Form 2'

select @documentIDCardOH  =  DocumentID from Document where DocumentName = 'NJM OH ID Card-PC'
select @documentIDCardPA =  DocumentID from Document where DocumentName = 'NJM PA ID Card-PC'
select @documentIDCardNJ  =  DocumentID from Document where DocumentName = 'NJM NJ ID Card-PC'
select @documentIDCardCT  =  DocumentID from Document where DocumentName = 'NJM CT ID Card-PC'
select @documentIDCardMD  =  DocumentID from Document where DocumentName = 'NJM MD ID Card-PC'
select @documentIDCardTemp  =  DocumentID from Document where DocumentName = 'NJM NJ Temporary ID Card'

select @documentIDResidentCoverage =  DocumentID from Document where DocumentName = 'Non-Relative Resident Coverage'
select @documentIDVerificationofCoverage  =  DocumentID from Document where DocumentName = 'Verification of Coverage'
select @documentIDNB60DayDeclineCancel =  DocumentID from Document where DocumentName = 'NB 60 Day Decline-Cancel'
select @documentIDNJDeclineLtrAuto  =  DocumentID from Document where DocumentName = 'NJ Decline Ltr-Auto'
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'showIDCardAddress' and [DocumentId] = @documentIDCardOH)
return


INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'isRequired','false',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'showIDCardAddress','true',SYSTEM_USER,SYSDATETIME(),@documentIDCardOH),
	 (@lobid,'showIDCardAddress','true',SYSTEM_USER,SYSDATETIME(),@documentIDCardPA),
	 (@lobid,'showIDCardAddress','true',SYSTEM_USER,SYSDATETIME(),@documentIDCardNJ),
	 (@lobid,'showIDCardAddress','true',SYSTEM_USER,SYSDATETIME(),@documentIDCardCT),
	 (@lobid,'showIDCardAddress','true',SYSTEM_USER,SYSDATETIME(),@documentIDCardMD),
	 (@lobid,'showIDCardAddress','true',SYSTEM_USER,SYSDATETIME(),@documentIDCardTemp),
	 (@lobid,'maxRecords','5',SYSTEM_USER,SYSDATETIME(),@documentIDResidentCoverage),
	 (@lobid,'maxRecords','3',SYSTEM_USER,SYSDATETIME(),@documentIDVerificationofCoverage),
	 (@lobid,'showSpecialControls','False',SYSTEM_USER,SYSDATETIME(),@documentIDVerificationofCoverage),
	 (@lobid,'singleRecord','true',SYSTEM_USER,SYSDATETIME(),@documentIDNB60DayDeclineCancel),
	 (@lobid,'singleRecord','true',SYSTEM_USER,SYSDATETIME(),@documentIDNJDeclineLtrAuto)

	 INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'cutoffDate','7/1/2024',SYSTEM_USER,SYSDATETIME()),
	 (@lobIDUMB,'plDriver','Policy Driver,Driver',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'plDriver','Policy Driver',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'spousePartnerName','Secondary Named Insured',SYSTEM_USER,SYSDATETIME())

	 INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'DocumentExcludeListInRange',@documentID2,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'DocumentExcludeListOutofRange',@documentID3,SYSTEM_USER,SYSDATETIME())


INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobIDUMB,'Driving Record-At Fault Accidents','ShowClaimViolation',SYSTEM_USER,SYSDATETIME()),
	 (@lobIDUMB,'Driving Record-All Other Claims','ShowClaimViolation',SYSTEM_USER,SYSDATETIME()),
	 (@lobIDUMB,'Driving Record-Motor Vehicle History','ShowClaimViolation',SYSTEM_USER,SYSDATETIME()),
	 (@lobIDUMB,'At-fault accident/Violations','ShowClaimViolation',SYSTEM_USER,SYSDATETIME()),
	 (@lobIDUMB,'Auto-Driving Record','ShowClaimViolation',SYSTEM_USER,SYSDATETIME())

