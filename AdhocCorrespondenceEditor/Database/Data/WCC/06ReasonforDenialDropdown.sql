Go

Declare @reasonsDenialWCC varchar(50) = 'reasonsDenialWCC'

Declare @lobID int =(select LOBId from LOB where LOBName = 'WCC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsDenialWCC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsDenialWCC,@reasonsDenialWCC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsDenialWCC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsDenialWCC,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsDenialWCC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('not causally related to WC inj','not causally related to WC inj',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('not clinically supported','not clinically supported',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('treatment not consistent','treatment not consistent',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('medical necessity of further tx','medical necessity of further tx',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('lack of updated med doc','lack of updated med doc',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null)

End