Go
Declare @lobID integer
Declare @documentID1 int,@documentID2 int
Declare @NoticeofNonrenewalReasons varchar(50) = 'NoticeofNonrenewalReasons'
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
select @documentID1  =  DocumentID from Document where DocumentName = 'Notice of Nonrenewal-Auto'
select @documentID2  =  DocumentID from Document where DocumentName = 'MD Notice of Nonrenewal'
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonList' and [ConfigValue] = @NoticeofNonrenewalReasons and DocumentID = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@NoticeofNonrenewalReasons,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'reasonList',@NoticeofNonrenewalReasons,SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'IIG3-Cooperation-Claim Reimbursement','* Event Date',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'Cooperation-Duties after Acc','* Claim Date',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Cooperation-Claim Reimb','* Event Date',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Additional DNR-Evidence Exists','* Event Date',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'HideControl','True',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'IIC1a-Driving Record-At Fault Accidents','True',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'IIC1b-Driving Record-All Other Claims','True',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'IIC2a-Driving Record-Motor Vehicle History','True',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'IIC3-Claims and Violations','True',SYSTEM_USER,SYSDATETIME(),@documentID2)





 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@NoticeofNonrenewalReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@lobID,@NoticeofNonrenewalReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)



Declare @NoticeofNonrenewalReasonsID integer
Select @NoticeofNonrenewalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NoticeofNonrenewalReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Gar Loc-Veh Not at Pol Addr','Moved Out of State',@NoticeofNonrenewalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Ownership/Reg','Veh Ownership Registration',@NoticeofNonrenewalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Disposed of Only Vehicle','Disposed of Only Veh',@NoticeofNonrenewalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Residency','Residency',@NoticeofNonrenewalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Driver''s License/Permit','Drivers License Permit',@NoticeofNonrenewalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Underwriting Threshold','Underwriting Threshold',@NoticeofNonrenewalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-Suspended','Driving Record Suspended',@NoticeofNonrenewalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-UW Info','Cooperation UW Info',@NoticeofNonrenewalReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Duties after Acc','Cooperation Duties after Acc',@NoticeofNonrenewalReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Claim Reimb','Cooperation Claim Reimburse',@NoticeofNonrenewalReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Abusive Beh','Cooperation Abusive Behavior',@NoticeofNonrenewalReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-RSA','Cooperation Roadside Assist',@NoticeofNonrenewalReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Physical Damage Inspection','Physical Damage Inspection',@NoticeofNonrenewalReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),
('Civil/Admin Penalty','Civil or Admin Penalty',@NoticeofNonrenewalReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),
('Previous SIU Invest','Previous SIU Investigation',@NoticeofNonrenewalReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null),
('Previous Coop DNR','Previous Cooperation DNR',@NoticeofNonrenewalReasonsID,1600,SUSER_SNAME(),GETDATE(),null,null),
('Previous 2% DNR','Previous 2 DNR',@NoticeofNonrenewalReasonsID,1700,SUSER_SNAME(),GETDATE(),null,null),
('Criminal Offense','Criminal Offense',@NoticeofNonrenewalReasonsID,1800,SUSER_SNAME(),GETDATE(),null,null),
('Ineligible Vehicle','Ineligible Vehicle',@NoticeofNonrenewalReasonsID,1900,SUSER_SNAME(),GETDATE(),null,null),
('Gray Market Vehicle','Gray Market Vehicle',@NoticeofNonrenewalReasonsID,2000,SUSER_SNAME(),GETDATE(),null,null),
('Additional Nonrenewals','Additional Nonrenewals',@NoticeofNonrenewalReasonsID,2100,SUSER_SNAME(),GETDATE(),null,null),
('Additional DNR-Evidence Exists','Additional DNR-Evidence Exists',@NoticeofNonrenewalReasonsID,2200,SUSER_SNAME(),GETDATE(),null,null),									
('Additional DNR-Driving Record','Additional DNR-Driving Record',@NoticeofNonrenewalReasonsID,2300,SUSER_SNAME(),GETDATE(),null,null),											
('Additional DNR-Prior Balance','Additional DNR-Prior Balance',@NoticeofNonrenewalReasonsID,2400,SUSER_SNAME(),GETDATE(),null,null)

Select @NoticeofNonrenewalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode  = @NoticeofNonrenewalReasons and DocumentId = @documentID2
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('IIA1-Vehicle Ownership/Registration','IIA1-Vehicle Ownership/Registration',@NoticeofNonrenewalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('IIA1-Garage Location','IIA1-Garage Location',@NoticeofNonrenewalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('IIA1-Disposed of Only Vehicle','IIA1-Disposed of Only Vehicle',@NoticeofNonrenewalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('IIA2-Residency','IIA2-Residency',@NoticeofNonrenewalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('IIB-Licensing Requirements','IIB-Licensing Requirements',@NoticeofNonrenewalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('IIC1a-Driving Record-At Fault Accidents','IIC1a-Driving Record-At Fault Accidents',@NoticeofNonrenewalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('IIC1b-Driving Record-All Other Claims','IIC1b-Driving Record-All Other Claims',@NoticeofNonrenewalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('IIC2a-Driving Record-Motor Vehicle History','IIC2a-Driving Record-Motor Vehicle History',@NoticeofNonrenewalReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('IIE-Intentionally Caused Comp Loss','IIE-Intentionally Caused Comp Loss',@NoticeofNonrenewalReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('IIF-Physical Damage Inspection','IIF-Physical Damage Inspection',@NoticeofNonrenewalReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('IIG1-Cooperation-Info','IIG1-Cooperation-Info',@NoticeofNonrenewalReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('IIG2-Cooperation-Duties after Accident','IIG2-Cooperation-Duties after Accident',@NoticeofNonrenewalReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('IIG3-Cooperation-Claim Reimbursement','IIG3-Cooperation-Claim Reimbursement',@NoticeofNonrenewalReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),
('IIH1-Other-Fraud','IIH1-Other-Fraud',@NoticeofNonrenewalReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),
('IIH2-Other-Outstanding Balance','IIH2-Other-Outstanding Balance',@NoticeofNonrenewalReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null),
('IIH3-Other-Ineligible Vehicles','IIH3-Other-Ineligible Vehicles',@NoticeofNonrenewalReasonsID,1600,SUSER_SNAME(),GETDATE(),null,null),
('IIH4-Threatened Bodily Harm','IIH4-Threatened Bodily Harm',@NoticeofNonrenewalReasonsID,1700,SUSER_SNAME(),GETDATE(),null,null),
('Transfer of Interest','Transfer of Interest',@NoticeofNonrenewalReasonsID,1800,SUSER_SNAME(),GETDATE(),null,null),
('II3-Mental Physical Impairment','II3-Mental Physical Impairment',@NoticeofNonrenewalReasonsID,1900,SUSER_SNAME(),GETDATE(),null,null),
('IIC3-Claims and Violations','IIC3-Claims and Violations',@NoticeofNonrenewalReasonsID,2000,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
	  ('PCPANJMClaimNumberChildControl',SUSER_SNAME(),GETDATE(),null,null) 

Declare @ctrlVehicle int, @ctrlDriver int,@ctrlEventClaimDate int,@ctrlClueRefNo int, @ctrlClaimNo int
Select @ctrlVehicle=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleChildControl'
Select @ctrlDriver=  ControlId from [dbo].[Control] where ControlName='PCPADriverChildControl'
Select @ctrlEventClaimDate=  ControlId from [dbo].[Control] where ControlName='PCPAEventClaimDateChildControl'
Select @ctrlClueRefNo=  ControlId from [dbo].[Control] where ControlName='PCPAClueRefNoChildControl'
Select @ctrlClaimNo=  ControlId from [dbo].[Control] where ControlName='PCPANJMClaimNumberChildControl'

--"Vehicle Ownership/Reg","Disposed of Only Vehicle
Declare @VehicleOwnershipReg int ,  @DisposedOnlyVehicle int
--"Physical Damage Inspection",  "Ineligible Vehicle", Additional DNR-Evidence Exists
Declare @PhysicalDamageInspection int ,  @IneligibleVehicle int, @AdditionalDNREvidenceExists int
--Gray Market Vehicle,Residency, Driving Record-Suspended, Civil/Admin Penalty
Declare @GrayMarketVehicle int,@Residency int ,  @DrivingRecordSuspended int, @CivilAdminPenalty int
--Previous SIU Invest,Previous Coop DNR,Previous 2% DNR,Criminal Offense, 
Declare @PreviousSIUInvest int ,  @PreviousCoopDNR int, @Previous2DNR int, @CriminalOffense int
--Cooperation-Duties after Acc, Cooperation-Claim Reimb, Underwriting Threshold
Declare @CooperationDutiesAfteAcc int, @CooperationClaimReimb int, @UnderwritingThreshold int
--Additional Nonrenewals,Additional DNR-Driving Record, Driver''s License/Permit'
Declare @AdditionalNonrenewals int, @AdditionalDNRDrivingRecord int, @DriverLicensePermit int


Select @VehicleOwnershipReg=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Vehicle Ownership/Reg'

Select @DisposedOnlyVehicle=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Disposed of Only Vehicle'

Select @PhysicalDamageInspection=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Physical Damage Inspection'

Select @IneligibleVehicle=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Ineligible Vehicle'

Select @AdditionalDNREvidenceExists=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Additional DNR-Evidence Exists'

Select @GrayMarketVehicle=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Gray Market Vehicle'
Select @Residency=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Residency'
Select @DriverLicensePermit=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Driver''s License/Permit'
Select @DrivingRecordSuspended=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Driving Record-Suspended'
Select @CivilAdminPenalty=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Civil/Admin Penalty'

Select @PreviousSIUInvest=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Previous SIU Invest'
Select @PreviousCoopDNR=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Previous Coop DNR'
Select @Previous2DNR=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Previous 2% DNR'
Select @CriminalOffense=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Criminal Offense'

Select @CooperationDutiesAfteAcc=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Cooperation-Duties after Acc'
Select @CooperationClaimReimb=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Cooperation-Claim Reimb'
Select @UnderwritingThreshold=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Underwriting Threshold'

Select @AdditionalNonrenewals=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Additional Nonrenewals'
Select @AdditionalDNRDrivingRecord=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='Additional DNR-Driving Record'

INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@VehicleOwnershipReg,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DisposedOnlyVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@PhysicalDamageInspection,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@IneligibleVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@GrayMarketVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehicleOwnershipReg,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@Residency,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@DriverLicensePermit,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null),  
(@documentID1,@DrivingRecordSuspended,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@CivilAdminPenalty,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@PreviousSIUInvest,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@PreviousCoopDNR,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@Previous2DNR,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@CriminalOffense,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@AdditionalDNREvidenceExists,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@CooperationDutiesAfteAcc,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@CooperationClaimReimb,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@AdditionalDNREvidenceExists,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@UnderwritingThreshold,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@DrivingRecordSuspended,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@AdditionalNonrenewals,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@AdditionalDNREvidenceExists,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@AdditionalDNRDrivingRecord,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null)



--IIA1-Vehicle Ownership/Registration, IIA1-Disposed of Only Vehicle, IIH3-Other-Ineligible Vehicles, IIF-Physical Damage Inspection
Declare @IIA1VehicleOwnershipRegistration int, @IIA1DisposedOnlyVehicle int, @IIH3OtherIneligibleVehicles int, 
@IIFPhysicalDamageInspection int
--IIA2-Residency, IIB-Licensing Requirements
Declare @IIA2Residency int, @IIBLicensingRequirements int
--IIG3-Cooperation-Claim Reimbursement, IIC3-Claims and Violations, IIC1a-Driving Record-At Fault Accidents
Declare @IIG3CooperationClaimReimbursement int, @IIC3ClaimsandViolations int, @IIC1aDrivingRecordAtFaultAccidents int
--IIC1b-Driving Record-All Other Claims, IIC2a-Driving Record-Motor Vehicle History, IIG2-Cooperation-Duties after Accident
Declare @IIC1bDrivingRecordAllOtherClaims int, @IIC2aDrivingRecordMotorVehicleHistory int, @IIG2CooperationDutiesAccident int

Select @IIA1VehicleOwnershipRegistration=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIA1-Vehicle Ownership/Registration'
 Select @IIA1DisposedOnlyVehicle=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIA1-Disposed of Only Vehicle'
 Select @IIH3OtherIneligibleVehicles=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIH3-Other-Ineligible Vehicles'
 Select @IIFPhysicalDamageInspection=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIF-Physical Damage Inspection'

 Select @IIA2Residency=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIA2-Residency'
 Select @IIBLicensingRequirements=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIB-Licensing Requirements'

	Select @IIG3CooperationClaimReimbursement=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIG3-Cooperation-Claim Reimbursement'
   Select @IIC3ClaimsandViolations=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIC3-Claims and Violations'
   Select @IIC1aDrivingRecordAtFaultAccidents=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIC1a-Driving Record-At Fault Accidents'

 	Select @IIC1bDrivingRecordAllOtherClaims=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIC1b-Driving Record-All Other Claims'
   Select @IIC2aDrivingRecordMotorVehicleHistory=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIC2a-Driving Record-Motor Vehicle History'
   Select @IIG2CooperationDutiesAccident=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and
 DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasons and DocumentDropdownLookupItemCode='IIG2-Cooperation-Duties after Accident'


 INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID2,@IIA1VehicleOwnershipRegistration,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIA1DisposedOnlyVehicle,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIH3OtherIneligibleVehicles,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIFPhysicalDamageInspection,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIA2Residency,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIBLicensingRequirements,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIA1VehicleOwnershipRegistration,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIG3CooperationClaimReimbursement,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIC3ClaimsandViolations,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@IIC1aDrivingRecordAtFaultAccidents,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@IIC1bDrivingRecordAllOtherClaims,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@IIC2aDrivingRecordMotorVehicleHistory,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@IIG2CooperationDutiesAccident,@ctrlClaimNo,SUSER_SNAME(),GETDATE(),null,null)


