Go

Declare @reasonsOverpayment varchar(50) = 'reasonsOverpayment'

Declare @lobID int =(select LOBId from LOB where LOBName = 'GC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsOverpayment  and LOBId = @lobID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsOverpayment,@reasonsOverpayment,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsOverpayment )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsOverpayment,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsOverpayment
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Duplicate payment','Duplicate payment',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Incorrect provider','Incorrect provider',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Overpayment','Overpayment',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Overpayment of contract amount','Overpayment of contract amount',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Statute of Limitation expired','Statute of Limitation expired',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Treatment not related to injury','Treatment not related to injury',@ReasonsID,600,SUSER_SNAME(),GETDATE(),null,null)
End