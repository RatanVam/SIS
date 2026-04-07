Go

Declare @reasonsDMEWCC varchar(50) = 'reasonsDMEWCC'

Declare @lobID int =(select LOBId from LOB where LOBName = 'WCC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsDMEWCC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsDMEWCC,@reasonsDMEWCC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsDMEWCC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsDMEWCC,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsDMEWCC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Authorized','Authorized',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Denied','Denied',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Modified','Modified',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null)
End