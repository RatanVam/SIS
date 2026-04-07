Go
Declare @ClaimOnPolicyReasons varchar(50) = 'reasonList'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'Verification of Coverage')

IF EXISTS (SELECT * from [Configuration] where ConfigKey = @ClaimOnPolicyReasons and DocumentId = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@ClaimOnPolicyReasons,SYSTEM_USER,SYSDATETIME(),@documentID1)

Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@ClaimOnPolicyReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @SeparationReasonsID integer
Select @SeparationReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @ClaimOnPolicyReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('No Claims on Policy','None',@SeparationReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Policy with Claim','Policy Claim',@SeparationReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Policy with Claim-Driver(s)','Driver Claim',@SeparationReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Policy with Claim-Vehicle','Vehicle Claim',@SeparationReasonsID,400,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPAClaimOnPolicyChildControl',SUSER_SNAME(),GETDATE(),null,null)
  
Declare @ctrlChildControl int, @PolicyClaim int, @DriverClaim int, @VehicleClaim int
Select @ctrlChildControl = ControlId from [dbo].[Control] where ControlName='PCPAClaimOnPolicyChildControl'

Select @PolicyClaim=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@ClaimOnPolicyReasons and DocumentDropdownLookupItemCode='Policy with Claim'
Select @DriverClaim=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@ClaimOnPolicyReasons and DocumentDropdownLookupItemCode='Policy with Claim-Driver(s)'
 Select @VehicleClaim=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@ClaimOnPolicyReasons and DocumentDropdownLookupItemCode='Policy with Claim-Vehicle'

INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@PolicyClaim,@ctrlChildControl,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverClaim,@ctrlChildControl,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicleClaim,@ctrlChildControl,SUSER_SNAME(),GETDATE(),null,null)