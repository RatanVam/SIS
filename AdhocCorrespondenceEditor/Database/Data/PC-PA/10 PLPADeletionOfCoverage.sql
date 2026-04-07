Go
Declare @lobID integer
Declare @documentID1 int,@documentID2 int,@documentID3 int
Declare @DeletionCoverageReasonNJ varchar(50) = 'DeletionCoverageReasonNJ'
Declare @DeletionCoverageReasonOH varchar(50) = 'DeletionCoverageReasonOH'
Declare @DeletionCoverageReasonMD varchar(50) = 'DeletionCoverageReasonMD'
Declare @DeletionTypeMD varchar(50) = 'DeletionTypeMD'
Declare @InspectionReasonMD varchar(50) = 'InspectionReasonMD'
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
select @documentID1  =  DocumentID from Document where DocumentName = 'Deletion of Coverage-Auto'
select @documentID2  =  DocumentID from Document where DocumentName = 'OH Deletion of Coverage-Auto'
select @documentID3  =  DocumentID from Document where DocumentName = 'Reduction of Coverage-Deletion of Cov'
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonList' and [ConfigValue] = @DeletionCoverageReasonNJ and DocumentID = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@DeletionCoverageReasonNJ,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'reasonList',@DeletionCoverageReasonOH,SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'reasonList',@DeletionCoverageReasonMD,SYSTEM_USER,SYSDATETIME(),@documentID3),
	 (@lobid,'DeletionType',@DeletionTypeMD,SYSTEM_USER,SYSDATETIME(),@documentID3),
	 (@lobid,'InspectionReason',@InspectionReasonMD,SYSTEM_USER,SYSDATETIME(),@documentID3)

 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@DeletionCoverageReasonNJ,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@lobID,@DeletionCoverageReasonOH,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@lobID,@DeletionCoverageReasonMD,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@lobID,@DeletionTypeMD,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@lobID,@InspectionReasonMD,null,null,SUSER_SNAME(),GETDATE(),null,null)


Declare @DeletionCoverageReasonID int
Select @DeletionCoverageReasonID  = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @DeletionCoverageReasonNJ and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,DocumentDropdownLookupItemAdditionalValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Business Use','Business Use','vehicle',@DeletionCoverageReasonID,100,SUSER_SNAME(),GETDATE(),null,null),
('Driver(s) and Vehicle(s)','Drivers and Vehicles','both',@DeletionCoverageReasonID,200,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Ownership and Garage Location','Vehicle Ownership and Garage Location','vehicle',@DeletionCoverageReasonID,300,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Ownership','Vehicle Ownership','vehicle',@DeletionCoverageReasonID,400,SUSER_SNAME(),GETDATE(),null,null),
('Unsafe Vehicle','Unsafe Vehicle','vehicle',@DeletionCoverageReasonID,500,SUSER_SNAME(),GETDATE(),null,null),
('Commercial Vehicle','Commercial Vehicle','vehicle',@DeletionCoverageReasonID,600,SUSER_SNAME(),GETDATE(),null,null),
('Driver Not a Resident','Driver Not a Resident','vehicle',@DeletionCoverageReasonID,700,SUSER_SNAME(),GETDATE(),null,null),
('Driver With Own Insurance','Driver With Own Insurance','driver',@DeletionCoverageReasonID,800,SUSER_SNAME(),GETDATE(),null,null)


Select @DeletionCoverageReasonID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @DeletionCoverageReasonOH and DocumentId = @documentID2
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,DocumentDropdownLookupItemAdditionalValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Business Use OH','Business Use OH','vehicle',@DeletionCoverageReasonID,100,SUSER_SNAME(),GETDATE(),null,null),
('Driver(s) and Vehicle(s) OH','Driver(s) and Vehicle(s) OH','both',@DeletionCoverageReasonID,200,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Ownership and Garage Location OH','Vehicle Ownership and Garage Location OH','vehicle',@DeletionCoverageReasonID,300,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Ownership OH','Vehicle Ownership OH','vehicle',@DeletionCoverageReasonID,400,SUSER_SNAME(),GETDATE(),null,null),
('Physical Damage Inspection OH','Physical Damage Inspection OH','vehicle',@DeletionCoverageReasonID,500,SUSER_SNAME(),GETDATE(),null,null),
('Commercial Vehicle OH','Commercial Vehicle OH','vehicle',@DeletionCoverageReasonID,600,SUSER_SNAME(),GETDATE(),null,null),
('Driver Not a Resident OH','Driver Not a Resident OH','driver',@DeletionCoverageReasonID,700,SUSER_SNAME(),GETDATE(),null,null)


Select @DeletionCoverageReasonID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @DeletionCoverageReasonMD and DocumentId = @documentID3
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,DocumentDropdownLookupItemAdditionalValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Business Use','Business Use','vehicle',@DeletionCoverageReasonID,100,SUSER_SNAME(),GETDATE(),null,null),
('Driver(s) and Vehicle(s)','Driver and Vehicle','both',@DeletionCoverageReasonID,200,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Ownership and Garage Location','Vehicle Ownership and Garage Location','vehicle',@DeletionCoverageReasonID,300,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Ownership','Vehicle Ownership','vehicle',@DeletionCoverageReasonID,400,SUSER_SNAME(),GETDATE(),null,null),
('Physical Damage Inspection','Physical Damage Inspection','vehicle',@DeletionCoverageReasonID,500,SUSER_SNAME(),GETDATE(),null,null),
('Commercial Vehicle','Commercial Vehicle','vehicle',@DeletionCoverageReasonID,600,SUSER_SNAME(),GETDATE(),null,null),
('Driver Not a Resident','Driver Not a Resident','driver',@DeletionCoverageReasonID,700,SUSER_SNAME(),GETDATE(),null,null)

Select @DeletionCoverageReasonID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @DeletionTypeMD and DocumentId = @documentID3
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,DocumentDropdownLookupItemAdditionalValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Driver Only','Driver Only','driver',@DeletionCoverageReasonID,100,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Only','Vehicle Only','vehicle',@DeletionCoverageReasonID,200,SUSER_SNAME(),GETDATE(),null,null),
('Driver and Vehicle','Driver and Vehicle','both',@DeletionCoverageReasonID,300,SUSER_SNAME(),GETDATE(),null,null)

Select @DeletionCoverageReasonID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @InspectionReasonMD and DocumentId = @documentID3
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,DocumentDropdownLookupItemAdditionalValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Material Damage','Material Damage','vehicle',@DeletionCoverageReasonID,100,SUSER_SNAME(),GETDATE(),null,null),
('Unsafe Condition','Unsafe Condition','vehicle',@DeletionCoverageReasonID,200,SUSER_SNAME(),GETDATE(),null,null),
('Not Private Passenger','Not Private Passenger','vehicle',@DeletionCoverageReasonID,300,SUSER_SNAME(),GETDATE(),null,null)

--------------------Deletion of Coverage-Auto	----------------------

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
	  ('PCPADriverChkboxChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCPAVehicleChkboxChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCPAZInspectionReasonChildControl',SUSER_SNAME(),GETDATE(),null,null)

Declare @ctrlVehicle int, @ctrlDriver int, @ctrlInspection int
Select @ctrlVehicle=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleChkboxChildControl'
Select @ctrlDriver=  ControlId from [dbo].[Control] where ControlName='PCPADriverChkboxChildControl'
Select @ctrlInspection=  ControlId from [dbo].[Control] where ControlName='PCPAZInspectionReasonChildControl'


Declare @BusinessUse int, @DriverVehicle int, @VehicleOwnershipGarage int, @VehicleOwnership int, 
@UnsafeVehicle int, @CommercialVehicle int, @DriverNotResident int, @DriverOwnInsurance int, @PhysicalDamageInspection  int

Select @BusinessUse= DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Business Use'
Select @DriverVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Driver(s) and Vehicle(s)'
Select @VehicleOwnershipGarage=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Vehicle Ownership and Garage Location'
Select @VehicleOwnership=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Vehicle Ownership'
Select @UnsafeVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Unsafe Vehicle'
Select @CommercialVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Commercial Vehicle'
Select @DriverNotResident=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Driver Not a Resident'
Select @DriverOwnInsurance=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonNJ and  DocumentDropdownLookupItemCode ='Driver With Own Insurance'


INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@BusinessUse,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverVehicle,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicleOwnershipGarage,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicleOwnership,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@UnsafeVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@CommercialVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverNotResident,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverOwnInsurance,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null)

---------------------------OH Deletion of Coverage-Auto--------------------

Select @BusinessUse= DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonOH and  DocumentDropdownLookupItemCode ='Business Use OH'
Select @DriverVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonOH and  DocumentDropdownLookupItemCode ='Driver(s) and Vehicle(s) OH'
Select @VehicleOwnershipGarage=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonOH and  DocumentDropdownLookupItemCode ='Vehicle Ownership and Garage Location OH'
Select @VehicleOwnership=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonOH and  DocumentDropdownLookupItemCode ='Vehicle Ownership OH'
Select @PhysicalDamageInspection=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonOH and  DocumentDropdownLookupItemCode ='Physical Damage Inspection OH'
Select @CommercialVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonOH and  DocumentDropdownLookupItemCode ='Commercial Vehicle OH'
Select @DriverNotResident=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonOH and  DocumentDropdownLookupItemCode ='Driver Not a Resident OH'



INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID2,@BusinessUse,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@DriverVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@DriverVehicle,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@VehicleOwnershipGarage,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@VehicleOwnership,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@PhysicalDamageInspection,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@CommercialVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@DriverNotResident,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null)




------------------------Reduction of Coverage-Deletion of Cov---------------------------


Declare @DriverOnly int, @VehicleOnly int, @DriverandVehicle int
Select @DriverOnly= DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionTypeMD and  DocumentDropdownLookupItemCode ='Driver Only'
Select @VehicleOnly=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionTypeMD and  DocumentDropdownLookupItemCode ='Vehicle Only'
Select @DriverandVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionTypeMD and  DocumentDropdownLookupItemCode ='Driver and Vehicle'

Select @BusinessUse= DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonMD and  DocumentDropdownLookupItemCode ='Business Use'
Select @DriverVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonMD and  DocumentDropdownLookupItemCode ='Driver(s) and Vehicle(s)'
Select @VehicleOwnershipGarage=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonMD and  DocumentDropdownLookupItemCode ='Vehicle Ownership and Garage Location'
Select @VehicleOwnership=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonMD and  DocumentDropdownLookupItemCode ='Vehicle Ownership'
Select @PhysicalDamageInspection= DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonMD and  DocumentDropdownLookupItemCode ='Physical Damage Inspection'
Select @CommercialVehicle=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonMD and  DocumentDropdownLookupItemCode ='Commercial Vehicle'
Select @DriverNotResident=DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and
DocumentDropdownLookupTypeCode=@DeletionCoverageReasonMD and  DocumentDropdownLookupItemCode ='Driver Not a Resident'
INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID3,@DriverOnly,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID3,@VehicleOnly,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID3,@DriverandVehicle,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID3,@DriverandVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@BusinessUse,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@DriverVehicle,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@DriverVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@VehicleOwnershipGarage,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@VehicleOwnership,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@PhysicalDamageInspection,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@PhysicalDamageInspection,@ctrlInspection,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@CommercialVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@DriverNotResident,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null)








