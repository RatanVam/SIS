
--phase 1 controls

IF not exists (select * from Control where ControlName like 'GCAddresseeOneAndTwo%')
INSERT into dbo.Control (
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values
('GCAddresseeOneAndTwo',SUSER_SNAME(),GETDATE(),null,null),
('GCAddrOneandTwowGreetingName',SUSER_SNAME(),GETDATE(),null,null),
('GCAttnyNmAndAddress',SUSER_SNAME(),GETDATE(),null,null),
('GCAuthor',SUSER_SNAME(),GETDATE(),null,null),
('GCBatchControls',SUSER_SNAME(),GETDATE(),null,null),
('GCClaimantName',SUSER_SNAME(),GETDATE(),null,null),
('GCClaimantNmAndAddress',SUSER_SNAME(),GETDATE(),null,null),
('GCClaimantNmContactsOne',SUSER_SNAME(),GETDATE(),null,null),
('GCDeceasedPolName',SUSER_SNAME(),GETDATE(),null,null),
('GCExposureNameAndType',SUSER_SNAME(),GETDATE(),null,null),
('GCProviderName',SUSER_SNAME(),GETDATE(),null,null),
('GCReSection',SUSER_SNAME(),GETDATE(),null,null),
('GCSubroCarrier',SUSER_SNAME(),GETDATE(),null,null),
('GCVehicle',SUSER_SNAME(),GETDATE(),null,null)

--phase 2 controls
IF not exists (select * from Control where ControlName like 'GCAdjusterName')
INSERT into dbo.Control (
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values
('GCAdjusterName',SUSER_SNAME(),GETDATE(),null,null),
('GCAppForBenefits',SUSER_SNAME(),GETDATE(),null,null),
('GCAuditDelayList',SUSER_SNAME(),GETDATE(),null,null),
('GCBatch',SUSER_SNAME(),GETDATE(),null,null),
('GCClaimantNameContactsTwo',SUSER_SNAME(),GETDATE(),null,null),
('GCExpoNmAndTypewPrecertId',SUSER_SNAME(),GETDATE(),null,null),
('GCExposureNmAndTypewPrecertId',SUSER_SNAME(),GETDATE(),null,null),
('GCHealthBenefitsList',SUSER_SNAME(),GETDATE(),null,null),
('GCIcdCodeFiveTextboxes',SUSER_SNAME(),GETDATE(),null,null),
('GCImeParagraph ',SUSER_SNAME(),GETDATE(),null,null),
('GCOverpaymentReasonAndOther',SUSER_SNAME(),GETDATE(),null,null),
('GCOverpaymentType',SUSER_SNAME(),GETDATE(),null,null),
('GCParagraph',SUSER_SNAME(),GETDATE(),null,null),
('GCPhysicianName',SUSER_SNAME(),GETDATE(),null,null),
('GCPhysicianNmAndAddress',SUSER_SNAME(),GETDATE(),null,null),
('GCPipDeductibileValue',SUSER_SNAME(),GETDATE(),null,null),
('GCReasonBenefitsList',SUSER_SNAME(),GETDATE(),null,null),
('GCTreatmentDates',SUSER_SNAME(),GETDATE(),null,null)

--phase 3 controls
IF not exists (select * from Control where ControlName like 'GCLienholderName')
INSERT into dbo.Control (
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values
('GCLienholderName',SUSER_SNAME(),GETDATE(),null,null),
('GCLienholderNmAddress',SUSER_SNAME(),GETDATE(),null,null),
('GCMortgagee',SUSER_SNAME(),GETDATE(),null,null),
('GCNjmHiredName',SUSER_SNAME(),GETDATE(),null,null),
('GCOutOfPocketRental',SUSER_SNAME(),GETDATE(),null,null),
('GCParentsAndMinorNames',SUSER_SNAME(),GETDATE(),null,null),
('GCPayeeName',SUSER_SNAME(),GETDATE(),null,null),
('GCSupervisorName',SUSER_SNAME(),GETDATE(),null,null),
('GCTortfeasorNameAndInsured',SUSER_SNAME(),GETDATE(),null,null),
('GCTortfeasorName',SUSER_SNAME(),GETDATE(),null,null),
('GCVehicleOwnerAndAddress',SUSER_SNAME(),GETDATE(),null,null),
('GCVehicleOwnerAndInsurance',SUSER_SNAME(),GETDATE(),null,null),
('GCVehShopName',SUSER_SNAME(),GETDATE(),null,null)

--phase 4 controls
IF not exists (select * from Control where ControlName like 'GCPrimaryAddressee')
INSERT into dbo.Control (
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values
	('GCPrimaryAddressee',SUSER_SNAME(),GETDATE(),null,null),
('GCSubroParty',SUSER_SNAME(),GETDATE(),null,null),
('GCAgencyNameAndAddress',SUSER_SNAME(),GETDATE(),null,null),
('GCClaimantMultiName',SUSER_SNAME(),GETDATE(),null,null)