Go
Declare @reasonsHousehold varchar(50) = 'reasonsHousehold'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
IF EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsHousehold and @lobID = @lobID)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsHousehold,@reasonsHousehold,SYSTEM_USER,SYSDATETIME())
 
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsHousehold,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare  @ReasonsID int  = (Select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsHousehold)
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Driver Name','DriverNameInd',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null), 	
('Date Of Birth','DateOfBirth',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),	
('Marital Status','MaritalStatus',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null), 
('Relation to Applicant','RelationToApplicant',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Insurance Info','InsuranceInfo',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null), 
('License Info','LicenseInfo',@ReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Valid Licence Info','ValidLicenceInfo',@ReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Prior License Info','PriorLicenseInfo',@ReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Proof of Residency','ProofOfResidency',@ReasonsID,900,SUSER_SNAME(),GETDATE(),null,null)
