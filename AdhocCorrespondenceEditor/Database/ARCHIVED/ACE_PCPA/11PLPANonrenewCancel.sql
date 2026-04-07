Go
Declare @lobID integer
Declare @documentID1 int,@documentID2 int
Declare @NonrenewalCancelReasons varchar(50) = 'NonrenewalCancelReasons'
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
select @documentID1  =  DocumentID from Document where DocumentName = 'PENN Termination Notice'
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonList' and [ConfigValue] = @NonrenewalCancelReasons and DocumentID = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@NonrenewalCancelReasons,SYSTEM_USER,SYSDATETIME(),@documentID1)


 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@NonrenewalCancelReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)


Declare @NoticeofNonrenewalReasonsID integer
Select @NoticeofNonrenewalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NonrenewalCancelReasons
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Registration/Garage Location', 'Registration/Garage Location',@NoticeofNonrenewalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),												
('Residency', 'Residency',@NoticeofNonrenewalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),														
('Licensing Requirements', 'Licensing Requirements',@NoticeofNonrenewalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),														
('Driving Record-At-Fault Accidents', 'Driving Record-At-Fault Accidents',@NoticeofNonrenewalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),														
('Driving Rec Motor Veh Viols/points w/in 24 mos', 'Driving Rec Motor Veh Viols/points w/in 24 mos',@NoticeofNonrenewalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),														
('Driving Rec Motor Veh Viol/points/susp/serious w/in 36 mos','Driving Rec Motor Veh Viol/points/susp/serious w/in 36 mos',@NoticeofNonrenewalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),		
('Intentionally Caused Comprehensive Loss', 'Intentionally Caused Comprehensive Loss',@NoticeofNonrenewalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),		
('Physical Damage Inspection', 'Physical Damage Inspection',@NoticeofNonrenewalReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),		
('Renewal Notice', 'Renewal Notice',@NoticeofNonrenewalReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),		
('Cooperation', 'Cooperation',@NoticeofNonrenewalReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),		
('Other-Criminal Offense fine >$100 for auto insur fraud','Other-Criminal Offense fine >$100 for auto insur fraud',@NoticeofNonrenewalReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),		
('Other-Fraud', 'Other-Fraud',@NoticeofNonrenewalReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),		
('Other-Prior Balance', 'Other-Prior Balance',@NoticeofNonrenewalReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),		
('Other-Abusive Behavior', 'Other-Abusive Behavior',@NoticeofNonrenewalReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),		
('Other-Roadside Abuse', 'Other-Roadside Abuse',@NoticeofNonrenewalReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null),		
('Other-Elig Vehicle', 'Other-Elig Vehicle',@NoticeofNonrenewalReasonsID,1600,SUSER_SNAME(),GETDATE(),null,null),		
('Other-Mental/Phys Impairment', 'Other-Mental/Phys Impairment',@NoticeofNonrenewalReasonsID,1700,SUSER_SNAME(),GETDATE(),null,null),		
('Death of Insured', 'Death of Insured',@NoticeofNonrenewalReasonsID,1800,SUSER_SNAME(),GETDATE(),null,null),		
('NI DL Susp or Revoked', 'NI DL Susp or Revoked',@NoticeofNonrenewalReasonsID,1900,SUSER_SNAME(),GETDATE(),null,null),		
('Fraud', 'Fraud',@NoticeofNonrenewalReasonsID,2000,SUSER_SNAME(),GETDATE(),null,null),		
('Eligibility for Application-60 day cancel', 'Eligibility for Application-60 day cancel',@NoticeofNonrenewalReasonsID,2100,SUSER_SNAME(),GETDATE(),null,null),		
('Licensing Requirement-60 day cancel', 'Licensing Requirement-60 day cancel',@NoticeofNonrenewalReasonsID,2200,SUSER_SNAME(),GETDATE(),null,null),		
('Registration Garage Location-60 day cancel', 'Registration Garage Location-60 day cancel',@NoticeofNonrenewalReasonsID,2300,SUSER_SNAME(),GETDATE(),null,null),		
('Driving Record At-Fault Accidents-60 day cancel',	'Driving Record At-Fault Accidents-60 day cancel',@NoticeofNonrenewalReasonsID,2400,SUSER_SNAME(),GETDATE(),null,null),		
('Driving Rec Motor Veh Violtns Cont 24 Mon-60 day cancel','Driving Rec Motor Veh Violtns Cont 24 Mon-60 day cancel',@NoticeofNonrenewalReasonsID,2500,SUSER_SNAME(),GETDATE(),null,null),		
('Driving Rec Motor Veh Violtns 36 Mon-60 day cancel', 'Driving Rec Motor Veh Violtns 36 Mon-60 day cancel',@NoticeofNonrenewalReasonsID,2600,SUSER_SNAME(),GETDATE(),null,null),		
('Driving Rec At-Fault Acc and Violation-60 day cancel','Driving Rec At-Fault Acc and Violation-60 day cancel',@NoticeofNonrenewalReasonsID,2700,SUSER_SNAME(),GETDATE(),null,null),		
('Insurance History Lapse in Coverage-60 day cancel', 'Insurance History Lapse in Coverage-60 day cancel',@NoticeofNonrenewalReasonsID,2800,SUSER_SNAME(),GETDATE(),null,null),		
('Insurance hist first Term Cnc Non-Pay-60 day cancel','Insurance hist first Term Cnc Non-Pay-60 day cancel',@NoticeofNonrenewalReasonsID,2900,SUSER_SNAME(),GETDATE(),null,null),		
('Insurance History Prior Balance Due-60 day cancel', 'Insurance History Prior Balance Due-60 day cancel',@NoticeofNonrenewalReasonsID,3000,SUSER_SNAME(),GETDATE(),null,null),		
('Information-60 day cancel', 'Information-60 day cancel',@NoticeofNonrenewalReasonsID,3100,SUSER_SNAME(),GETDATE(),null,null),		
('Other Criminal Off Convctn Civ-Ad Fine Fraud-60 day cancel','Other Criminal Off Convctn Civ-Ad Fine Fraud-60 day cancel',@NoticeofNonrenewalReasonsID,3200,SUSER_SNAME(),GETDATE(),null,null),		
('Other Fraud-60 day cancel','Other Fraud-60 day cancel',@NoticeofNonrenewalReasonsID,3300,SUSER_SNAME(),GETDATE(),null,null)		


Declare @ctrlVehicle int
Select @ctrlVehicle=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleChildControl'


--"Physical Damage Inspection","Other-Ineligible Vehicles
Declare @PhyDamInspRecItemId int 

Select @PhyDamInspRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@NonrenewalCancelReasons and DocumentDropdownLookupItemCode='Physical Damage Inspection'


INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@PhyDamInspRecItemId,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null)