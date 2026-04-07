Go
Declare @MidtermCancelReasons varchar(50) = 'MidtermCancelReasons'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'OH NB 90 Day Decline-Cancel')
Declare @documentID2  int =  (select DocumentID from Document where DocumentName = 'MD Midterm Cancel')
Declare @documentID3  int =  (select DocumentID from Document where DocumentName = 'OH Midterm Cancel')
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonList' and [ConfigValue] = @MidtermCancelReasons and DocumentID = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@MidtermCancelReasons,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'reasonList',@MidtermCancelReasons,SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'reasonList',@MidtermCancelReasons,SYSTEM_USER,SYSDATETIME(),@documentID3),
	 (@lobid,'lable','OH NB 90 Day Decline-Cancel',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'lable','Midterm Cancel',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'lable','Midterm Cancel',SYSTEM_USER,SYSDATETIME(),@documentID3),
	 (@lobid,'subLable','90 Day Decline-Cancel',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'subLable','Midterm Cancel Reason',SYSTEM_USER,SYSDATETIME(),@documentID2),
	 (@lobid,'subLable','Midterm Cancel Reason',SYSTEM_USER,SYSDATETIME(),@documentID3),
	 (@lobid,'Claim/Violation/Restoration Info','ShowClaimViolation',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'MVR/CLUE Ref #','ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'IIIB4-License Registration Suspension/Revoked','ShowMVRReference',SYSTEM_USER,SYSDATETIME(),@documentID2)

	 

 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@MidtermCancelReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@lobID,@MidtermCancelReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@lobID,@MidtermCancelReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)


Declare @MidtermCancelReasonsID integer
Select @MidtermCancelReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @MidtermCancelReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Invalid License','Invalid License','INV_LIC_IND',@MidtermCancelReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Registration','Registration','REGSTR_IND',@MidtermCancelReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Registration-No Insurable Interest','Registration-No Insurable Interest','REGISTRATION_NO_INSURABLE_INTEREST_INDICATOR',@MidtermCancelReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Garage Location','Garage Location','GARAGE_LOC_IND',@MidtermCancelReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Claim/Violation/Restoration Info','Claim/Violation/Restoration Info','',@MidtermCancelReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('MVR/CLUE Ref #','MVR/CLUE Ref #','MVR_CLUE_REF_INDICATOR',@MidtermCancelReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('License Suspended','License Suspended','LIC_SUSP_IND',@MidtermCancelReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Inspection','Vehicle Inspection','VEH_INSPECT_IND',@MidtermCancelReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Insurance History-Prior Cancel for Non-Payment','Insurance History-Prior Cancel for Non-Payment','INSURANCE_HIST_PRIOR_CANCEL_NON_PAY_INDICATOR',@MidtermCancelReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Insurance History-Prior Balance Due','Insurance History-Prior Balance Due','INS_HIST_PRIOR_BAL_IND',@MidtermCancelReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Fraud','Fraud','FRAUD_IND',@MidtermCancelReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Ineligible Vehicle(s)','Ineligible Vehicle(s)','INELIGIBLE_VEH_IND',@MidtermCancelReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Lapse in Prior 6 Months','Lapse in Prior 6 Months','LapseinPrior6MonthsIndicator',@MidtermCancelReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null)

Select @MidtermCancelReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @MidtermCancelReasons and DocumentId = @documentID2
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('IIIB4-License Registration Suspension/Revoked','IIIB4-License Registration Suspension/Revoked','LICENSE_REGISTRATION_SUSPENSION_INDICATOR',@MidtermCancelReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('IIIB1-Fraud/ Concealment/Misrepresentation','IIIB1-Fraud/ Concealment/Misrepresentation','FraudConcealmentMisrepresentationIndicator',@MidtermCancelReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('IIIB2-Public Safety','IIIB2-Public Safety','PUBLIC_SAFETY_IND',@MidtermCancelReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('IIIB3-Change in Risk','IIIB3-Change in Risk','CHG_IN_RISK_IND',@MidtermCancelReasonsID,400,SUSER_SNAME(),GETDATE(),null,null)

Select @MidtermCancelReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode  = @MidtermCancelReasons and DocumentId = @documentID3
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('License Registration Suspension Revoked Expired','License Registration Suspension Revoked Expired','LICENSE_REGISTRATION_SUSPENSION_INDICATOR',@MidtermCancelReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Fraud Concealment Misrepresentation','Fraud Concealment Misrepresentation','FraudConcealmentMisrepresentationIndicator',@MidtermCancelReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Residency Registration State','Residency Registration State','ResidencyRegistrationStateIndicator',@MidtermCancelReasonsID,300,SUSER_SNAME(),GETDATE(),null,null)


INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPANDEOfferChildControl',SUSER_SNAME(),GETDATE(),null,null), 
	('PCPAMvrSuspendDateChildControl',SUSER_SNAME(),GETDATE(),null,null) 
 

Declare @ctrlVehicle int, @ctrlDriver int,@ctrlAMvrSuspendDat int,@ctrlClueRefNo int, @ctrlNDEOffer int
Select @ctrlVehicle=  ControlId from [dbo].[Control] where ControlName='PCPAVehicleChildControl'
Select @ctrlDriver=  ControlId from [dbo].[Control] where ControlName='PCPADriverChildControl'
Select @ctrlClueRefNo=  ControlId from [dbo].[Control] where ControlName='PCPAClueRefNoChildControl'
Select @ctrlAMvrSuspendDat=  ControlId from [dbo].[Control] where ControlName='PCPAMvrSuspendDateChildControl'
Select @ctrlNDEOffer=  ControlId from [dbo].[Control] where ControlName='PCPANDEOfferChildControl'

--"Registration", "Registration-No Insurable Interest","Garage Location",
Declare @Registration int ,  @RegistrationNoInsurableInterest int, @GarageLocation int
--"License Registration Suspension Revoked Expired","IIIB4-License Registration Suspension/Revoked", "Invalid License"
Declare @LicenseRegistrationSuspensionRevokedExpired int ,  @IIIB4LicenseRegistrationSuspensionRevoked int, @InvalidLicense int
--"License Suspended","MVR/CLUE Ref #",  'Lapse in Prior 6 Months'
Declare @LicenseSuspended int,@MVRCLUERef int ,@LapsePrior6Month int 

Select @Registration=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Registration'
Select @RegistrationNoInsurableInterest=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Registration-No Insurable Interest'
Select @GarageLocation=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Garage Location'

Select @LicenseRegistrationSuspensionRevokedExpired=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID3 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='License Registration Suspension Revoked Expired'
Select @IIIB4LicenseRegistrationSuspensionRevoked=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID2 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='IIIB4-License Registration Suspension/Revoked'
Select @InvalidLicense=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Invalid License'

Select @LicenseSuspended=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='License Suspended'
Select @MVRCLUERef=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='MVR/CLUE Ref #'
Select @LapsePrior6Month=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Lapse in Prior 6 Months'
INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@Registration,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@RegistrationNoInsurableInterest,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@GarageLocation,@ctrlVehicle,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@InvalidLicense,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@LicenseSuspended,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@LapsePrior6Month,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@LicenseSuspended,@ctrlNDEOffer,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@MVRCLUERef,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@IIIB4LicenseRegistrationSuspensionRevoked,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID2,@IIIB4LicenseRegistrationSuspensionRevoked,@ctrlAMvrSuspendDat,SUSER_SNAME(),GETDATE(),null,null),
(@documentID2,@IIIB4LicenseRegistrationSuspensionRevoked,@ctrlClueRefNo,SUSER_SNAME(),GETDATE(),null,null),
(@documentID3,@LicenseRegistrationSuspensionRevokedExpired,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID3,@LicenseRegistrationSuspensionRevokedExpired,@ctrlNDEOffer,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID3,@LicenseRegistrationSuspensionRevokedExpired,@ctrlAMvrSuspendDat,SUSER_SNAME(),GETDATE(),null,null)