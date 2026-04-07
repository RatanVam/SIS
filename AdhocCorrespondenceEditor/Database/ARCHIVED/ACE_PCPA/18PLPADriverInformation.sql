Go
Declare @reasonAddDriverInfo varchar(50) = 'reasonAddDriverInfo'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
IF EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonAddDriverInfo and @lobID = @lobID)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonAddDriverInfo,@reasonAddDriverInfo,SYSTEM_USER,SYSDATETIME())
 
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonAddDriverInfo,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare  @ReasonsID int  = (Select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonAddDriverInfo)
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Name','NameInd',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Gender','GenderInd',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Date Of Birth','DateOfBirthInd',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('License Number','LicenseNumberInd',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('License State','LicenseStateInd',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Date First Licensed','DateFirstLicensedInd',@ReasonsID,600,SUSER_SNAME(),GETDATE(),null,null)

