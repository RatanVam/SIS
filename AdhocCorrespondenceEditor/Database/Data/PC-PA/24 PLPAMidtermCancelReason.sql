Go

Declare @MidtermCancelReasons varchar(50) = 'MidtermCancelReasons'
Declare @MidtermViolationReasons varchar(50) = 'MidtermViolationReasons'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'Midterm Cancel')

IF EXISTS (SELECT * from [Configuration] where ConfigKey = @MidtermCancelReasons and DocumentId = @documentID1)
return

INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@MidtermCancelReasons,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'reasonViolationList',@MidtermViolationReasons,SYSTEM_USER,SYSDATETIME(),@documentID1)

	 

 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@MidtermCancelReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@lobID,@MidtermViolationReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)


Declare @MidtermCancelReasonsID integer
Select @MidtermCancelReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @MidtermCancelReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Lic/Reg Susp-Named Insured','Lic/Reg Susp-Named Insured',@MidtermCancelReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Serious Violation','Serious Violation',@MidtermCancelReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Operating w/o Liability Ins','Operating w/o Liability Ins',@MidtermCancelReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Evidence Exists','Evidence Exists',@MidtermCancelReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Misrepresentation','Misrepresentation',@MidtermCancelReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('60 Day Decline-Cancel','60 Day Decline-Cancel',@MidtermCancelReasonsID,600,SUSER_SNAME(),GETDATE(),null,null)

Select @MidtermCancelReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @MidtermViolationReasons and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('DUI','DUI',@MidtermCancelReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Chemical Test Refusal','Chemical Test Refusal',@MidtermCancelReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Vehicular Homicide','Vehicular Homicide',@MidtermCancelReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Driving While Suspended','Driving While Suspended',@MidtermCancelReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Driving w/o Liability Insurance','Driving w/o Liability Insurance',@MidtermCancelReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Misrepresentation of Insurance Cov','Misrepresentation of Insurance Cov',@MidtermCancelReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Reckless Driving','Reckless Driving',@MidtermCancelReasonsID,700,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPALicenseSuspendedDateChildControl',SUSER_SNAME(),GETDATE(),null,null), 
	('PCPAViolationReasonChildControl',SUSER_SNAME(),GETDATE(),null,null) , 
	('PCPAOperatingDateChildControl',SUSER_SNAME(),GETDATE(),null,null) 
 

Declare @ctrlLicenseSuspendedDate int, @ctrlDriver int,@ctrlViolation int, @ctrlOperatingDate int
Select @ctrlDriver=  ControlId from [dbo].[Control] where ControlName='PCPADriverChildControl' -- Already Exist
Select @ctrlLicenseSuspendedDate=  ControlId from [dbo].[Control] where ControlName='PCPALicenseSuspendedDateChildControl'
Select @ctrlViolation=  ControlId from [dbo].[Control] where ControlName='PCPAViolationReasonChildControl'
Select @ctrlOperatingDate=  ControlId from [dbo].[Control] where ControlName='PCPAOperatingDateChildControl'

Declare @LicRegSuspNamedInsured int ,  @SeriousViolation int, @EvidenceExists int


Select @LicRegSuspNamedInsured=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Lic/Reg Susp-Named Insured'
Select @SeriousViolation=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and 
DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Serious Violation'
Select @EvidenceExists=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentId = @documentID1 and
 DocumentDropdownLookupTypeCode=@MidtermCancelReasons and DocumentDropdownLookupItemCode='Evidence Exists'

INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@LicRegSuspNamedInsured,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@LicRegSuspNamedInsured,@ctrlLicenseSuspendedDate,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@SeriousViolation,@ctrlViolation,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@EvidenceExists,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@EvidenceExists,@ctrlOperatingDate,SUSER_SNAME(),GETDATE(),null,null)