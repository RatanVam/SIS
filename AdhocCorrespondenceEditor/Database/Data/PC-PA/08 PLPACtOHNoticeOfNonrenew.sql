Go
Declare @lobID integer
Declare @documentID1 int,@documentID2 int
Declare @NoticeofNonrenewalReasonsOH varchar(50) = 'NoticeofNonrenewalReasonsOH'
Declare @NoticeofNonrenewalReasonsCT varchar(50) = 'NoticeofNonrenewalReasonsCT'
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
select @documentID1  =  DocumentID from Document where DocumentName = 'OH Notice of Nonrenewal-Auto'
select @documentID2  =  DocumentID from Document where DocumentName = 'CT Notice of Nonrenewal-Auto'
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonList' and [ConfigValue] = @NoticeofNonrenewalReasonsOH and DocumentID = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@NoticeofNonrenewalReasonsOH,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'reasonList',@NoticeofNonrenewalReasonsCT,SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'Intentionally Caused Comp Loss','* Claim Date',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Cooperation-Duties after Accident','* Claim Date',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Cooperation-Claim Reimbursement','* Event Date',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Intentionally Caused Comp Loss','* Claim Date',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'Cooperation-Duties after Accident','* Claim Date',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'Cooperation-Claim Reimbursement','* Event Date',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'Driving Record-At Fault Accidents','ShowClaimViolation,ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Driving Record-All Other Claims','ShowClaimViolation,ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Driving Record-Motor Vehicle History','ShowClaimViolation,ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'At-fault accident/Violations','ShowClaimViolation,ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'Driving Record-At Fault Accidents','ShowClaimViolation,ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'Driving Record-All Other Claims','ShowClaimViolation,ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'Driving Record-Motor Vehicle History','ShowClaimViolation,ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID2)


 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@NoticeofNonrenewalReasonsOH,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@lobID,@NoticeofNonrenewalReasonsCT,null,null,SUSER_SNAME(),GETDATE(),null,null)


Declare @NoticeofNonrenewalReasonsID integer
Select @NoticeofNonrenewalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NoticeofNonrenewalReasonsOH
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Vehicle Ownership/Registration','Veh Ownership Registration',@NoticeofNonrenewalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Garage Location','Garage Location',@NoticeofNonrenewalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Residency','Residency',@NoticeofNonrenewalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Licensing Requirements','Drivers License Permit',@NoticeofNonrenewalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-At Fault Accidents','Driving Record At Fault Accidents',@NoticeofNonrenewalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-All Other Claims','Driving Record All Other Claims',@NoticeofNonrenewalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-Motor Vehicle History','Driving Record Motor Vehicle History',@NoticeofNonrenewalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Intentionally Caused Comp Loss','Intentionally Caused Comp Loss',@NoticeofNonrenewalReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Physical Damage Inspection','Physical Damage Inspection',@NoticeofNonrenewalReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Info','Cooperation UW Info',@NoticeofNonrenewalReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Duties after Accident','Cooperation Duties After Acc',@NoticeofNonrenewalReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Claim Reimbursement','Cooperation Claim Reimburse',@NoticeofNonrenewalReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Other-Fraud','Other Fraud',@NoticeofNonrenewalReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),
('Other-Outstanding Balance','Other Outstanding Balance',@NoticeofNonrenewalReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),
('Other-RSA','Other RSA',@NoticeofNonrenewalReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null),
('Other-Ineligible Vehicles','Other Ineligible Vehicle',@NoticeofNonrenewalReasonsID,1600,SUSER_SNAME(),GETDATE(),null,null),
('Transfer of Interest','Transfer of Interest',@NoticeofNonrenewalReasonsID,1700,SUSER_SNAME(),GETDATE(),null,null),
('Mental Physical Impairment','Mental Physical Impairment',@NoticeofNonrenewalReasonsID,1800,SUSER_SNAME(),GETDATE(),null,null),
('Threatened Bodily Harm','Threatened Bodily Harm',@NoticeofNonrenewalReasonsID,1900,SUSER_SNAME(),GETDATE(),null,null),
('At-fault accident/Violations','At-fault accident/Violations',@NoticeofNonrenewalReasonsID,2000,SUSER_SNAME(),GETDATE(),null,null)


Declare @NoticeofNonrenewalReasonsCTID integer
Select @NoticeofNonrenewalReasonsCTID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NoticeofNonrenewalReasonsCT
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Vehicle Ownership/Registration','Veh Ownership Registration',@NoticeofNonrenewalReasonsCTID,100,SUSER_SNAME(),GETDATE(),null,null),
('Garage Location','Garage Location',@NoticeofNonrenewalReasonsCTID,200,SUSER_SNAME(),GETDATE(),null,null),
('Residency','Residency',@NoticeofNonrenewalReasonsCTID,300,SUSER_SNAME(),GETDATE(),null,null),
('Licensing Requirements','Drivers License Permit',@NoticeofNonrenewalReasonsCTID,400,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-At Fault Accidents','Driving Record At Fault Accidents',@NoticeofNonrenewalReasonsCTID,500,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-All Other Claims','Driving Record All Other Claims',@NoticeofNonrenewalReasonsCTID,600,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-Motor Vehicle History','Driving Record Motor Vehicle History',@NoticeofNonrenewalReasonsCTID,700,SUSER_SNAME(),GETDATE(),null,null),
('Intentionally Caused Comp Loss','Intentionally Caused Comp Loss',@NoticeofNonrenewalReasonsCTID,800,SUSER_SNAME(),GETDATE(),null,null),
('Physical Damage Inspection','Physical Damage Inspection',@NoticeofNonrenewalReasonsCTID,900,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Info','Cooperation UW Info',@NoticeofNonrenewalReasonsCTID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Duties after Accident','Cooperation Duties After Acc',@NoticeofNonrenewalReasonsCTID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Cooperation-Claim Reimbursement','Cooperation Claim Reimburse',@NoticeofNonrenewalReasonsCTID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Other-Fraud','Other Fraud',@NoticeofNonrenewalReasonsCTID,1300,SUSER_SNAME(),GETDATE(),null,null),
('Other-Outstanding Balance','Other Outstanding Balance',@NoticeofNonrenewalReasonsCTID,1400,SUSER_SNAME(),GETDATE(),null,null),
('Other-RSA','Other RSA',@NoticeofNonrenewalReasonsCTID,1500,SUSER_SNAME(),GETDATE(),null,null),
('Other-Ineligible Vehicles','Other Ineligible Vehicle',@NoticeofNonrenewalReasonsCTID,1600,SUSER_SNAME(),GETDATE(),null,null),
('Transfer of Interest','Transfer of Interest',@NoticeofNonrenewalReasonsCTID,1700,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
	  ('PCPAVehicleChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCPADriverChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCPAEventClaimDateChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCPAClueRefNoChildControl',SUSER_SNAME(),GETDATE(),null,null) 

Declare @ctrlVehicle int, @ctrlDriver int,@ctrlEventClaimDate int,@ctrlClueRefNo int
Select @ctrlVehicle=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleChildControl'
Select @ctrlDriver=  ControlId from [dbo].[Control] where ControlName='PCPADriverChildControl'
Select @ctrlEventClaimDate=  ControlId from [dbo].[Control] where ControlName='PCPAEventClaimDateChildControl'
Select @ctrlClueRefNo=  ControlId from [dbo].[Control] where ControlName='PCPAClueRefNoChildControl'

--"Physical Damage Inspection","Other-Ineligible Vehicles
Declare @PhyDamInspRecItemId int ,  @OtherIneligibleVehRecItemId int
--"Residency",  "Licensing Requirements"
Declare @ResidencyRecItemId int ,  @LicensingReqRecItemId int
--Vehicle Ownership/Registration
Declare @VehOwnershipRegRecItemId int , @AtfaultaccidentViolationsRecItemId int
--Intentionally Caused Comp Loss, Cooperation-Duties after Accident, Cooperation-Claim Reimbursement
Declare @IntentCausedCompLossRecItemId int ,  @CoopDutiesAccRecItemId int, @CoopClaimReimbRecItemId int
--Driving Record-At Fault Accidents" , "Driving Record-All Other Claims" , "Driving Record-Motor Vehicle History" , 
Declare @DrivingRecordFaultAccRecItemId int ,  @DrivingRecordClaimsItemId int, @DrivingRecordMotorVehicleHistoryRecItemId int

Select @PhyDamInspRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Physical Damage Inspection'



Select @OtherIneligibleVehRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Other-Ineligible Vehicles'

Select @ResidencyRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Residency'

Select @LicensingReqRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Licensing Requirements'


Select @VehOwnershipRegRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Vehicle Ownership/Registration'

Select @IntentCausedCompLossRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Intentionally Caused Comp Loss'

Select @CoopDutiesAccRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Cooperation-Duties after Accident'

Select @CoopClaimReimbRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Cooperation-Claim Reimbursement'

Select @DrivingRecordFaultAccRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Driving Record-At Fault Accidents'

Select @DrivingRecordClaimsItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Driving Record-All Other Claims'

Select @DrivingRecordMotorVehicleHistoryRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='Driving Record-Motor Vehicle History'

Select @AtfaultaccidentViolationsRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsOH and DocumentDropdownLookupItemCode='At-fault accident/Violations'



INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@PhyDamInspRecItemId,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@OtherIneligibleVehRecItemId,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@ResidencyRecItemId,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@LicensingReqRecItemId,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehOwnershipRegRecItemId,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@VehOwnershipRegRecItemId,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@IntentCausedCompLossRecItemId,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@CoopDutiesAccRecItemId,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@CoopClaimReimbRecItemId,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DrivingRecordFaultAccRecItemId,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DrivingRecordClaimsItemId,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@DrivingRecordMotorVehicleHistoryRecItemId,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@AtfaultaccidentViolationsRecItemId,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null)


Select @PhyDamInspRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Physical Damage Inspection'

Select @OtherIneligibleVehRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Other-Ineligible Vehicles'

Select @ResidencyRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Residency'

Select @LicensingReqRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Licensing Requirements'


Select @VehOwnershipRegRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Vehicle Ownership/Registration'

Select @IntentCausedCompLossRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Intentionally Caused Comp Loss'

Select @CoopDutiesAccRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Cooperation-Duties after Accident'

Select @CoopClaimReimbRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Cooperation-Claim Reimbursement'

Select @DrivingRecordFaultAccRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Driving Record-At Fault Accidents'

Select @DrivingRecordClaimsItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Driving Record-All Other Claims'

Select @DrivingRecordMotorVehicleHistoryRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NoticeofNonrenewalReasonsCT and DocumentDropdownLookupItemCode='Driving Record-Motor Vehicle History'


INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID2,@PhyDamInspRecItemId,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@OtherIneligibleVehRecItemId,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@ResidencyRecItemId,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@LicensingReqRecItemId,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@VehOwnershipRegRecItemId,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@VehOwnershipRegRecItemId,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IntentCausedCompLossRecItemId,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@CoopDutiesAccRecItemId,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@CoopClaimReimbRecItemId,@ctrlEventClaimDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@DrivingRecordFaultAccRecItemId,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@DrivingRecordClaimsItemId,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@DrivingRecordMotorVehicleHistoryRecItemId,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null)

