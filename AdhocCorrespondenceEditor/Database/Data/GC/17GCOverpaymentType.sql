Go

Declare @typeOverpaymentGC varchar(50) = 'typeOverpaymentGC'
Declare @lobID int =(select LOBId from LOB where LOBName = 'GC')
Declare @ReasonsID int 

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @typeOverpaymentGC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@typeOverpaymentGC,@typeOverpaymentGC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @typeOverpaymentGC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@typeOverpaymentGC,null,null,SUSER_SNAME(),GETDATE(),null,null)


Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @typeOverpaymentGC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,DocumentDropdownLookupItemAdditionalValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Single Overpayment','Single Overpayment','True',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Multiple Overpayments','Multiple Overpayments','False',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null)
End
