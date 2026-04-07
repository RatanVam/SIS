Go

Declare @reasonsOverpaymentWCC varchar(50) = 'reasonsOverpaymentWCC'
Declare @typeOverpaymentWCC varchar(50) = 'typeOverpaymentWCC'
Declare @lobID int =(select LOBId from LOB where LOBName = 'WCC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsOverpaymentWCC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsOverpaymentWCC,@reasonsOverpaymentWCC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsOverpaymentWCC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsOverpaymentWCC,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsOverpaymentWCC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Duplicate payment','Duplicate payment',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Overpaid based on history','Overpaid based on history',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Overpaid agreement amount','Overpaid agreement amount',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Incorrect provider','Incorrect provider',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('NJM not the WC carrier','NJM not the Worker''s Compensation carrier',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('No provision for medical treatment','No provision for medical treatment',@ReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Service included within the global period','Service included within the global period',@ReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Statute has expired','Statute has expired',@ReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Treatment not authorized','Treatment not authorized',@ReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Treatment not related to injury','Treatment not related to injury',@ReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null)
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @typeOverpaymentWCC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@typeOverpaymentWCC,@typeOverpaymentWCC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @typeOverpaymentWCC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@typeOverpaymentWCC,null,null,SUSER_SNAME(),GETDATE(),null,null)


Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @typeOverpaymentWCC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Single Overpayment','Single Overpayment',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Multiple Overpayments','Multiple Overpayments',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null)
End

Declare @WCCOverpaymentChildControlC varchar(50) = 'WCCOverpaymentChildControl'

IF NOT EXISTS (SELECT * from [Control] where ControlName = 'WCCOverpaymentChildControl' )
begin
INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
(@WCCOverpaymentChildControlC,SUSER_SNAME(),GETDATE(),null,null)
End

Declare @ctrlChildControl1 int
Declare @SingleOverpayment int, @MultipleOverpayments int
Select @ctrlChildControl1 = ControlId from [dbo].[Control] where ControlName=@WCCOverpaymentChildControlC
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'Med Bill Paid in Error')
IF NOT EXISTS (SELECT * from [DocumentDropdownChildControl] where DocumentId = @documentID1 and DocumentDropdownLookupItemId =  @SingleOverpayment)
begin
Select @SingleOverpayment=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentDropdownLookupTypeCode=@typeOverpaymentWCC 
and DocumentDropdownLookupItemCode='Single Overpayment'
Select @MultipleOverpayments=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentDropdownLookupTypeCode=@typeOverpaymentWCC 
and DocumentDropdownLookupItemCode='Multiple Overpayments'
 INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@SingleOverpayment,@ctrlChildControl1,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@MultipleOverpayments,@ctrlChildControl1,SUSER_SNAME(),GETDATE(),null,null)

End