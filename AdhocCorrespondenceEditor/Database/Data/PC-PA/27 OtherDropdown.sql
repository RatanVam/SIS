Go
Declare @lobID int,@documentID1 int
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
Declare @NonrenewalCancelReasons varchar(50) = 'ServiceEventDescriptions'
select @documentID1  =  DocumentID from Document where DocumentName = 'Reduction of Coverage-Roadside Assistance'

IF EXISTS (SELECT * from [Configuration] where ConfigKey = @NonrenewalCancelReasons and [DocumentId] = @documentID1)
return

INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,@NonrenewalCancelReasons,@NonrenewalCancelReasons,SYSTEM_USER,SYSDATETIME(),@documentID1)

	  Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@NonrenewalCancelReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)
Declare @NoticeofNonrenewalReasonsID integer
Select @NoticeofNonrenewalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NonrenewalCancelReasons
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Tow', 'Tow',@NoticeofNonrenewalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),												
('Jump Start', 'Jump Start',@NoticeofNonrenewalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),														
('Flat Tire Change', 'Flat Tire Change',@NoticeofNonrenewalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),														
('Winch', 'Winch',@NoticeofNonrenewalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),														
('Fuel Delivery', 'Fuel Delivery',@NoticeofNonrenewalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),														
('Door Unlock','Door Unlock',@NoticeofNonrenewalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),		
('Service Event', 'Service Event',@NoticeofNonrenewalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null)