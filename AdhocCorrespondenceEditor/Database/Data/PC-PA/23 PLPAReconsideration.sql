Go
Declare @ReconsiderationReasonsMD varchar(50) = 'reasonReconsiderationListMD'
Declare @ReconsiderationReasons varchar(50) = 'reasonReconsiderationList'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'Termination Cover Letter')

IF EXISTS (SELECT * from [Configuration] where ConfigKey = @ReconsiderationReasonsMD and DocumentId = @documentID1)
return

INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,@ReconsiderationReasons,@ReconsiderationReasons,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,@ReconsiderationReasonsMD,@ReconsiderationReasonsMD,SYSTEM_USER,SYSDATETIME(),@documentID1)

Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@ReconsiderationReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@lobID,@ReconsiderationReasonsMD,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReconsiderationReasonsID integer
Select @ReconsiderationReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @ReconsiderationReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Driving Record','Driving Record',@ReconsiderationReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Requested Info','Requested Info',@ReconsiderationReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Prior Balance','Prior Balance',@ReconsiderationReasonsID,300,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReconsiderationMDReasonsID integer
Select @ReconsiderationMDReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @ReconsiderationReasonsMD and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Requested Info','Requested Info',@ReconsiderationMDReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Prior Balance','Prior Balance',@ReconsiderationMDReasonsID,200,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPAReconsiderationDriverChildControl',SUSER_SNAME(),GETDATE(),null,null),
('PCPAPriorPolicyInfoChildControl',SUSER_SNAME(),GETDATE(),null,null)
  
Declare @ctrlDriverChildControl int,@ctrlriorPolicyChildControl int, @DrivingRecord int, @PriorBalance int, @PriorBalanceMD int
Select @ctrlDriverChildControl = ControlId from [dbo].[Control] where ControlName='PCPAReconsiderationDriverChildControl'
Select @ctrlriorPolicyChildControl = ControlId from [dbo].[Control] where ControlName='PCPAPriorPolicyInfoChildControl'

Select @DrivingRecord=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@ReconsiderationReasons and DocumentDropdownLookupItemCode='Driving Record'
Select @PriorBalance=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@ReconsiderationReasons and DocumentDropdownLookupItemCode='Prior Balance'
 Select @PriorBalanceMD=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@ReconsiderationReasonsMD and DocumentDropdownLookupItemCode='Prior Balance'

INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@DrivingRecord,@ctrlDriverChildControl,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@PriorBalance,@ctrlriorPolicyChildControl,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@PriorBalanceMD,@ctrlriorPolicyChildControl,SUSER_SNAME(),GETDATE(),null,null)