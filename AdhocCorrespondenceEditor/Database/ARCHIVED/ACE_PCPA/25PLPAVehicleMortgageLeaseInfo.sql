Go
Declare @InsuredVehicleFinancelDetails varchar(50) = 'InsuredVehicleFinancelDetails'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1 int = (select DocumentID from Document where DocumentName = 'Vehicle Coverage Verification-PC')


IF EXISTS (SELECT * from [Configuration] where ConfigKey = @InsuredVehicleFinancelDetails and DocumentId = @documentID1)
return

INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,@InsuredVehicleFinancelDetails,@InsuredVehicleFinancelDetails,SYSTEM_USER,SYSDATETIME(),@documentID1)

 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@InsuredVehicleFinancelDetails,null,null,SUSER_SNAME(),GETDATE(),null,null)


Declare @InsuredVehicleID integer
Select @InsuredVehicleID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @InsuredVehicleFinancelDetails and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Owned','Owned',@InsuredVehicleID,100,SUSER_SNAME(),GETDATE(),null,null),
('Financed','Finance',@InsuredVehicleID,200,SUSER_SNAME(),GETDATE(),null,null),
('Leased and No Additional Insured','Lease',@InsuredVehicleID,300,SUSER_SNAME(),GETDATE(),null,null),
('Lease and Additional Insured','Additional',@InsuredVehicleID,400,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPAVehicleFinanceChildControl',SUSER_SNAME(),GETDATE(),null,null), 
	('PCPAVehicleLeaseChildControl',SUSER_SNAME(),GETDATE(),null,null) , 
	('PCPAVehicleAdditionalInsuredChildControl',SUSER_SNAME(),GETDATE(),null,null) 
 

Declare @ctrlVehicleFinance int, @ctrlVehicleLease int,@ctrlVehicleAdditionalInsured int
Select @ctrlVehicleFinance=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleFinanceChildControl' 
Select @ctrlVehicleLease=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleLeaseChildControl'
Select @ctrlVehicleAdditionalInsured=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleAdditionalInsuredChildControl'


Declare @Financed int ,  @Lease int, @LeaseAndAdditional int


Select @Financed=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where
 DocumentDropdownLookupTypeCode=@InsuredVehicleFinancelDetails and DocumentDropdownLookupItemCode='Financed'
Select @Lease=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where 
DocumentDropdownLookupTypeCode=@InsuredVehicleFinancelDetails and DocumentDropdownLookupItemCode='Leased and No Additional Insured'
Select @LeaseAndAdditional=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where
 DocumentDropdownLookupTypeCode=@InsuredVehicleFinancelDetails and DocumentDropdownLookupItemCode='Lease and Additional Insured'

INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@Financed,@ctrlVehicleFinance,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@Lease,@ctrlVehicleLease,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@LeaseAndAdditional,@ctrlVehicleLease,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@LeaseAndAdditional,@ctrlVehicleAdditionalInsured,SUSER_SNAME(),GETDATE(),null,null)