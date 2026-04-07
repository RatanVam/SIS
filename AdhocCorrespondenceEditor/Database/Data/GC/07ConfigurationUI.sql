Go
Declare @lobID int
select @lobID =  LOBId from LOB where LOBName = 'GC'
Declare @DocumentID int

select @DocumentID =  DocumentId from Document where DocumentName = 'Impound Facility No Storage Fees'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'NJMCCOpt' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'NJMCCOpt','true',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'userRoles' and ConfigValue = 'User')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'userRoles','User',SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'lienholderRoles' and ConfigValue = 'Lienholder')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'lienholderRoles','Lienholder',SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'organizationContactRoles' and ConfigValue = 'OrganizationContact')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'organizationContactRoles','OrganizationContact',SYSTEM_USER,SYSDATETIME())
End
-------------GCAddresseeOneAndTwo---------------
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'primaryRolesExcept' and ConfigValue = 'User,OrganizationContact')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'primaryRolesExcept','User,OrganizationContact',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'secondaryRolesExcept' and ConfigValue = 'User')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'secondaryRolesExcept','User',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'otherRoles' and ConfigValue = 'Other')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'otherRoles','Other',SYSTEM_USER,SYSDATETIME())
End

-------------GCAttnyNmAndAddress---------------
--SELECT * from [Configuration] where ConfigKey = 'authorRoles' and ConfigValue = 'User'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'authorRoles' and ConfigValue = 'User')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'authorRoles','User',SYSTEM_USER,SYSDATETIME())
End

-------------GCBatchControls---------------
select @DocumentID =  DocumentId from Document where DocumentName = 'New York Denial'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'batchLableName' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'batchLableName','Certified Mail',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'batchLableName','Print Services',null,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'onlyCertifiedMailIndicator' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'onlyCertifiedMailIndicator','true',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'NY Fire District Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'onlyCertifiedMailIndicator' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'onlyCertifiedMailIndicator','true',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'isCertifiedMailIndicator' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'isCertifiedMailIndicator','true',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

-------------GCClaimantName---------------
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'claimantRoles' and ConfigValue = 'Claimant')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'claimantRoles','Claimant',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and [LOBId] = @lobID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','1',SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Status Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','4',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Representation Acknowledged'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','5',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'New Adjuster Status'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','5',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'PIP Subro Response'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','5',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Wage Loss Check'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','5',@DocumentID,SYSTEM_USER,SYSDATETIME())
End


select @DocumentID =  DocumentId from Document where DocumentName = 'Bill by Date CPT'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','3',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Combined CPT and W9 Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','3',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'SIU Referral-PIP Eligibility'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','3',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'SIU Referral-PIP-BI-MUD'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','3',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'UM-UIM Release and Trust BI'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','1',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'UM-UIM Release and Trust BI-PD'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','1',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'UM-UIM Release and Trust PD'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'noofClaimants' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'noofClaimants','1',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

-------------------GCClaimantNmAndAddress------------
select @DocumentID =  DocumentId from Document where DocumentName = 'Death Explain Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'hideClaimantAddress' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'hideClaimantAddress','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'DE Explain Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'hideClaimantAddress' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'hideClaimantAddress','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

-------------------GCClaimantNmContactsOne------------
select @DocumentID =  DocumentId from Document where DocumentName = 'Payoff LOG Request Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'primaryRolesExcept' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'primaryRolesExcept','User',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'HO Pub Adj Rep Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'isClaimantNameContactRequired' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'isClaimantNameContactRequired','true',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

declare @lobGC int

Select @lobGC=  lobId from dbo.LOB where LOBName='GC'

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'CLM_FK' and [LOBId] = @lobGC )
begin
 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobGC,'CLM_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobGC,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobGC,'CLM_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobGC,'ARCHIVE_IND',null,SUSER_SNAME(),GETDATE(),null,null)
End