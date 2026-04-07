Go
Declare @CliamAccidentDetails varchar(50) = 'reasonClaimAccList'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
IF EXISTS (SELECT * from [Configuration] where ConfigKey = @CliamAccidentDetails and @lobID = @lobID)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@CliamAccidentDetails,@CliamAccidentDetails,SYSTEM_USER,SYSDATETIME())
 
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@CliamAccidentDetails,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare  @ReasonsID int  = (Select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @CliamAccidentDetails)
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Driver Name','DriverNmCheck',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Police Report','PoliceReportCheck',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Insurance Letter','InsLtrCheck',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null)

