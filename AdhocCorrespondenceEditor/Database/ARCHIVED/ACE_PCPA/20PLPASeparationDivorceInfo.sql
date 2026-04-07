Go
Declare @SeparationReasons varchar(50) = 'SeparationReasons'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'One Named Insured-Separation')

IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonList' and DocumentId = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@SeparationReasons,SYSTEM_USER,SYSDATETIME(),@documentID1)

	  Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@SeparationReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @SeparationReasonsID integer
Select @SeparationReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @SeparationReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Cancel Policy','Cancel Policy',@SeparationReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Spouse With Car-Off At Renewal','Spouse With Car',@SeparationReasonsID,200,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPASeparationDivorceChildControl',SUSER_SNAME(),GETDATE(),null,null)
  
Declare @ctrlChildControl int, @CancelPolicy int, @SpouseWithCar int
Select @ctrlChildControl = ControlId from [dbo].[Control] where ControlName='PCPASeparationDivorceChildControl'

Select @CancelPolicy=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@SeparationReasons and DocumentDropdownLookupItemCode='Cancel Policy'
Select @SpouseWithCar=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@SeparationReasons and DocumentDropdownLookupItemCode='Spouse With Car-Off At Renewal'

INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@CancelPolicy,@ctrlChildControl,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@SpouseWithCar,@ctrlChildControl,SUSER_SNAME(),GETDATE(),null,null)