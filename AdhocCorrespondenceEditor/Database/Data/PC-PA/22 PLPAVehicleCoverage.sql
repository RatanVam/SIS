Declare @CoverageReasons varchar(50) = 'coverageReasonList'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'Verification of Coverage')

IF EXISTS (SELECT * from [Configuration] where ConfigKey = @CoverageReasons and DocumentId = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,@CoverageReasons,@CoverageReasons,SYSTEM_USER,SYSDATETIME(),@documentID1)

Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@CoverageReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @CoverageReasonsID integer
Select @CoverageReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @CoverageReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Driver(s) On/Off Policy (No Lapse)-Effective Date','Driver No Lapse Date',@CoverageReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle On/Off Policy (No Lapse)-Effective Date','Vehicle No Lapse Date',@CoverageReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Driver(s) On/Off Policy (No Lapse)-Years Insured','Driver No Lapse Years',@CoverageReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle On/Off Policy (No Lapse)-Years Insured','Vehicle No Lapse Years',@CoverageReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Driver(s) On/Off Policy (Lapse)','Driver Lapse',@CoverageReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle On/Off Policy (Lapse)','Vehicle Claim',@CoverageReasonsID,600,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPACoverateThreeDriverChildControl',SUSER_SNAME(),GETDATE(),null,null),
('PCPACoverateVehicleChildControl',SUSER_SNAME(),GETDATE(),null,null),
('PCPACoverateNoofYearsChildControl',SUSER_SNAME(),GETDATE(),null,null),
('PCPACancellDateChildControl',SUSER_SNAME(),GETDATE(),null,null)
  

Declare @ctrlChildControl1 int, @ctrlChildControl2 int, @ctrlChildControl3 int, @ctrlChildControl4 int
Declare @DriverLapesDate int, @VehicalLapesDate int, @DriverLapesYear int, @VehicalLapesYear int, @DriverLapes int, @VehicalLapes int
Select @ctrlChildControl1 = ControlId from [dbo].[Control] where ControlName='PCPACoverateThreeDriverChildControl'
Select @ctrlChildControl2 = ControlId from [dbo].[Control] where ControlName='PCPACoverateVehicleChildControl'
Select @ctrlChildControl3 = ControlId from [dbo].[Control] where ControlName='PCPACoverateNoofYearsChildControl'
Select @ctrlChildControl4 = ControlId from [dbo].[Control] where ControlName='PCPACancellDateChildControl'

Select @DriverLapesDate=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@CoverageReasons and DocumentDropdownLookupItemCode='Driver(s) On/Off Policy (No Lapse)-Effective Date'
Select @VehicalLapesDate=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@CoverageReasons and DocumentDropdownLookupItemCode='Vehicle On/Off Policy (No Lapse)-Effective Date'
 Select @DriverLapesYear=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@CoverageReasons and DocumentDropdownLookupItemCode='Driver(s) On/Off Policy (No Lapse)-Years Insured'
 Select @VehicalLapesYear=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@CoverageReasons and DocumentDropdownLookupItemCode='Vehicle On/Off Policy (No Lapse)-Years Insured'
Select @DriverLapes=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@CoverageReasons and DocumentDropdownLookupItemCode='Driver(s) On/Off Policy (Lapse)'
 Select @VehicalLapes=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@CoverageReasons and DocumentDropdownLookupItemCode='Vehicle On/Off Policy (Lapse)'
INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@DriverLapesDate,@ctrlChildControl1,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicalLapesDate,@ctrlChildControl2,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverLapesYear,@ctrlChildControl1,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverLapesYear,@ctrlChildControl3,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicalLapesYear,@ctrlChildControl2,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicalLapesYear,@ctrlChildControl3,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverLapes,@ctrlChildControl1,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DriverLapes,@ctrlChildControl4,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicalLapes,@ctrlChildControl2,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicalLapes,@ctrlChildControl4,SUSER_SNAME(),GETDATE(),null,null)


