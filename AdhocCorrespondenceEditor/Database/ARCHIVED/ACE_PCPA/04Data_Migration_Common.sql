SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS ( SELECT 1 FROM [dbo].[Category] WHERE CategoryName = 'PL_POLICY_AUDIT_AUTO' )
BEGIN
Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 

('PL_POLICY_AUDIT_AUTO',		'Auto Policy Audit',		1,SUSER_SNAME(),GETDATE(),null,null),
('PL_RENEWALS_UNDERWRITER_AUTO',	'Auto Renewal Underwriter',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_UNDERWRITING_AUTO',	'Auto Underwriter',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_OFF_CALL_PROCESSING_AUTO',	'Auto Off Call Processing',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_GENERAL_AUTO',	'Auto General',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_MAILER_SHEET_AUTO',	'PL Multiline',	1,SUSER_SNAME(),GETDATE(),null,null)

END

GO



declare @lobHome int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int,@cat_PC_5 int,@cat_PC_6 int


Select @lobHome=  lobId from dbo.LOB where LOBName='PC-PA'

Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_POLICY_AUDIT_AUTO'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_RENEWALS_UNDERWRITER_AUTO'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_AUTO'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PL_OFF_CALL_PROCESSING_AUTO'
Select @cat_PC_5=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_AUTO'
Select @cat_PC_6=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_AUTO'

IF NOT EXISTS ( SELECT 1 FROM [dbo].[LOBCategory] WHERE CategoryId = @cat_PC_1 )
BEGIN
INSERT INTO [dbo].[LOBCategory]
	  ([LOBId]
      ,[CategoryId]
      ,[CategoryOrder]
	  ,[CategoryGroups]
	  ,[EffectiveDate]
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])

  VALUES
	(@lobHome,@cat_PC_1,10,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_Auto_PolicyAudit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_2,20,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_Auto_RenewalUW',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_3,30,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_Auto_UW',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_4,40,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_Auto_OffCallProc',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_5,50,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_Auto_General',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_6,60,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_MailerSheet',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)
END

IF NOT EXISTS ( SELECT 1 FROM [dbo].[Control] WHERE ControlName = 'PCPACoverageEffectiveDatePicker' )
BEGIN
INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 
	      --phase 3 controls

		('PCPACoverageEffectiveDatePicker',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAAddedPIPs',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAClaimAccidentInfo',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAClaimOnPolicy',SUSER_SNAME(),GETDATE(),null,null),
		('PLPACsfBlankPrefilled',SUSER_SNAME(),GETDATE(),null,null),
		('PLPACsfEffective',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAVerificationOfCoverage',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAProofofCoverageOtherDriver',SUSER_SNAME(),GETDATE(),null,null),
		('PLPADriverInformation',SUSER_SNAME(),GETDATE(),null,null),
		('PLPADrivingWhileSuspended',SUSER_SNAME(),GETDATE(),null,null),
		('PLPADrivingUnderInfluence',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAFinanceVehicle',SUSER_SNAME(),GETDATE(),null,null),
		('PLPALeaseVehicle',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAOutofStateLicenseDriver',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAMidtermCancelReason',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAOtherResidentsInHouse',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAReinstatedCanceledDate',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAPurchaseOrderVehicle',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAReconsideration',SUSER_SNAME(),GETDATE(),null,null),
		('PLPARegisterVehicle',SUSER_SNAME(),GETDATE(),null,null),
		('PLPASeparationDivorceInfo',SUSER_SNAME(),GETDATE(),null,null),
		('PLPASpousePartnerName',SUSER_SNAME(),GETDATE(),null,null),
		('PLPATitleVehicle',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAVehicleMortgageLeaseInfo',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAVehicleCoverage',SUSER_SNAME(),GETDATE(),null,null),
		('PLPAVehicleAddlInfo',SUSER_SNAME(),GETDATE(),null,null),
		  --phase 3 ends here

		  ('PLPAClueReferenceNum',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPACtMidtermCancelReason',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPACtOHNoticeOfNonrenew',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPADeletionOfCoverage',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAIdCardControl',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAInvalidLicenseDriver',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPALicenseSuspendedDriverInfo',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAMvrReferenceNums',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPANonrenewCancel',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPANoticeNonrenew',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAReason',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAServiceEvent',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAVehicleCheckboxs',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAVehicleDropdown',SUSER_SNAME(),GETDATE(),null,null),
		  ('PLPAVehicleInfoCheckboxs',SUSER_SNAME(),GETDATE(),null,null),
		 -- ('PLClaimViolationSection',SUSER_SNAME(),GETDATE(),null,null),
          ('PLPAAddresseeNameOneAndTwoNotReq',SUSER_SNAME(),GETDATE(),null,null)
END
GO


IF NOT EXISTS ( SELECT 1 FROM [dbo].[Document] WHERE DocumentName = 'PL Contact us-Auto' )
BEGIN
Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values

('PL Contact us-Auto','PL Contact us-Auto','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/PL Contact us-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('A-614x','UIM Rejection Form','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/A-614x.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('A-619x','UM Rejection Form','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/A-619x.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Added PIP Listed on Policy','Added PIP Listed on Policy','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Added PIP Listed on Policy.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Added PIP Not on Policy','Added PIP Not on Policy','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Added PIP Not on Policy.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Additional Info Submission-Auto','Additional Info Submission-Auto','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Additional Info Submission-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Additional Info-Auto','Additional Info-Auto','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Additional Info-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Additional Underwriting Info-Auto','Additional Underwriting Info-Auto','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Additional Underwriting Info-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Audit Letter-Auto','Audit Letter-Auto','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Audit Letter-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Balance Due-Beyond 60 days','Balance Due-Beyond 60 days','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Balance Due-Beyond 60 days.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Balance Due-Submission','Balance Due-Submission','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Balance Due-Submission.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Balance Due-Within 60 days','Balance Due-Within 60 days','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Balance Due-Within 60 days.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Bind Pending CSF','Bind Pending CSF','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Bind Pending CSF.jld','POLDOC  CSF',SUSER_SNAME(),GETDATE(),null,null),
('Cancellation Withdrawal-Auto','Cancellation Withdrawal-Auto','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Cancellation Withdrawal-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Continuing Education GS Discount','Continuing Education GS Discount','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Continuing Education GS Discount.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Coverage Change Form','Coverage Change Form','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/Coverage Change Form.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CSF-No Signature','CSF-No Signature','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/CSF-No Signature.jld','POLDOC  CSF',SUSER_SNAME(),GETDATE(),null,null),
('Currently Suspended','Currently Suspended','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Currently Suspended.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Customization and Electronic','Customization and Electronic','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Customization and Electronic.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('DD-DI Disc-Need AI','DD-DI Disc-Need AI','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/DD-DI Disc-Need AI.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('DD-DI Disc-Not Eligible','DD-DI Disc-Not Eligible','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/DD-DI Disc-Not Eligible.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Deletion of Coverage-Auto','Deletion of Coverage-Auto','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Deletion of Coverage-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('DT-GS Discount-Need AI','DT-GS Discount-Need AI','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/DT-GS Discount-Need AI.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('DT-GS Discount-Not Eligible','DT-GS Discount-Not Eligible','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/DT-GS Discount-Not Eligible.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Estate of Request','Estate of Request','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Estate of Request.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Future Cancellation Ltr-Auto','Future Cancellation Ltr-Auto','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Future Cancellation Ltr-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Future Termination Ltr-Auto','Future Termination Ltr-Auto','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Future Termination Ltr-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Garage Location','Garage Location','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Garage Location.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('GS-DT-DD Discounts','GS-DT-DD Discounts','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/GS-DT-DD Discounts.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Hidden Driver-Final','Hidden Driver-Final','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Hidden Driver-Final.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Hidden Driver-Initial','Hidden Driver-Initial','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Hidden Driver-Initial.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Lienholder Notice of Cancel-DNR','Lienholder Notice of Cancel-DNR','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Lienholder Notice of Cancel-DNR.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MEBO-Additional Info NJ','MEBO-Additional Info NJ','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/MEBO-Additional Info NJ.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Midterm Cancel','Midterm Cancel','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Midterm Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NB 60 Day Decline-CNC Bind Pend CSF','NB 60 Day Decline-CNC Bind Pend CSF','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/NB 60 Day Decline-CNC Bind Pend CSF.jld','POLDOC  CSF',SUSER_SNAME(),GETDATE(),null,null),
('NJM NJ ID Card-PC','NJM NJ ID Card','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/NJM NJ ID Card-PC.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJM NJ Standard CSF','NJM NJ Standard CSF','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/NJM NJ Standard CSF.jld','POLDOC  CSF',SUSER_SNAME(),GETDATE(),null,null),
('NJM PA ID Card-PC','NJM PA ID Card','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/NJM PA ID Card-PC.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Non-Relative Resident Coverage','Non-Relative Resident Coverage','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Non-Relative Resident Coverage.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Nonrenewal Withdrawal-Auto','Nonrenewal Withdrawal-Auto','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Nonrenewal Withdrawal-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Notice of Nonrenewal-Auto','Notice of Nonrenewal-Auto','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Notice of Nonrenewal-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Out of State or Intl DL','Out of State or Intl DL','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Out of State or Intl DL.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Bound Pending Forms','PENN Bound Pending Forms','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/PENN Bound Pending Forms.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Physical Damage Change','Physical Damage Change','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Physical Damage Change.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PIP Primary to NJM Due to Loss','PIP Primary to NJM Due to Loss','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/PIP Primary to NJM Due to Loss.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL Mailer Sheet','PL Mailer Sheet','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/PL Mailer Sheet.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('POA-Guardian-Trust','POA-Guardian-Trust','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/POA-Guardian-Trust.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Rental Vehicle Verification-PC','Rental Vehicle Verification','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Rental Vehicle Verification-PC.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Return Original Documents','Return Original Documents','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Return Original Documents.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Roadside Warning 1','Roadside Warning 1','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Roadside Warning 1.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Roadside Warning 2','Roadside Warning 2','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Roadside Warning 2.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Termination Cover Letter','Termination Cover Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Termination Cover Letter.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Termination-NJ Named Insd Not Elig','Termination-NJ Named Insd Not Elig','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Termination-NJ Named Insd Not Elig.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Third Party Application','Third Party Application','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Third Party Application.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Third Party Designee Add-Delete','Third Party Designee Add-Delete','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Third Party Designee Add-Delete.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Tort Notice with Premiums','Tort Notice with Premiums','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/Tort Notice with Premiums.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Total Loss','Total Loss','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Total Loss.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Transfer of Interest','Transfer of Interest','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Transfer of Interest.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Uninsured-Underinsured Motor Change','Uninsured-Underinsured Motor Change','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Uninsured-Underinsured Motor Change.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Vehicle Coverage Verification-PC','Vehicle Coverage Verification','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Vehicle Coverage Verification-PC.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Lienholder Notice of Withdrawal','Lienholder Notice of Withdrawal','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Lienholder Notice of Withdrawal.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Named Driver Exclusion App','Named Driver Exclusion App','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Named Driver Exclusion App.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NB 60 Day Decline-Cancel','NB 60 Day Decline-Cancel','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/NB 60 Day Decline-Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJ Decline Ltr-Auto','NJ Decline Ltr-Auto','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/NJ Decline Ltr-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('One Named Insured-Separation','One Named Insured-Separation','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/One Named Insured-Separation.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Bound Pending PSF','PENN Bound Pending PSF','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/PENN Bound Pending PSF.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Refusal to Write','PENN Refusal to Write','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/PENN Refusal to Write.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL Blank Letter Template','PL Blank Letter Template','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/PL Blank Letter Template.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Proof of Ownership','Proof of Ownership','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Proof of Ownership.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Underwriting Reinstate','Underwriting Reinstate','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Underwriting Reinstate.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Verification of Coverage','Verification of Coverage','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Verification of Coverage.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Termination Notice','PENN Termination Notice','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/PENN Termination Notice.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Delete Driver Improvement','Delete Driver Improvement','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/Delete Driver Improvement.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Informed Consent Form','Informed Consent Form','1','CT','companyRoot:S:Production://Templates/PolicyCenterAuto/Informed Consent Form.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJM CT ID Card-PC','NJM CT ID Card','1','CT','companyRoot:S:Production://Templates/PolicyCenterAuto/NJM CT ID Card-PC.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Decline Ltr-Auto','CT Decline Ltr','1','CT','companyRoot:S:Production://Templates/PolicyCenterAuto/CT Decline Ltr-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Midterm Cancel','CT Midterm Cancel','1','CT','companyRoot:S:Production://Templates/PolicyCenterAuto/CT Midterm Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT NB 60 Day Decline-Cancel','CT NB 60 Day Decline-Cancel','1','CT','companyRoot:S:Production://Templates/PolicyCenterAuto/CT NB 60 Day Decline-Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Notice of Nonrenewal-Auto','CT Notice of Nonrenewal','1','CT','companyRoot:S:Production://Templates/PolicyCenterAuto/CT Notice of Nonrenewal-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJM NJ Temporary ID Card','NJM NJ Temporary ID Card','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/NJM NJ Temporary ID Card.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJM OH ID Card-PC','NJM OH ID Card','1','OH','companyRoot:S:Production://Templates/PolicyCenterAuto/NJM OH ID Card-PC.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH Deletion of Coverage-Auto','OH Deletion of Coverage-Auto','1','OH','companyRoot:S:Production://Templates/PolicyCenterAuto/OH Deletion of Coverage-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH NB 90 Day Decline-Cancel','OH NB 90 Day Decline-Cancel','1','OH','companyRoot:S:Production://Templates/PolicyCenterAuto/OH NB 90 Day Decline-Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH Notice of Nonrenewal-Auto','OH Notice of Nonrenewal','1','OH','companyRoot:S:Production://Templates/PolicyCenterAuto/OH Notice of Nonrenewal-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH Midterm Cancel','OH Midterm Cancel','1','OH','companyRoot:S:Production://Templates/PolicyCenterAuto/OH Midterm Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Two Named Insured-Separation','Two Named Insured-Separation','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Two Named Insured-Separation.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Premium Attributable to Insurance Score Notice','Premium Attributable to Insurance Score Notice','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/Premium Attributable to Insurance Score Notice.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PIP Waiver','PIP Waiver','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/PIP Waiver.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('UM-UIM Form','UM-UIM Form','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/UM-UIM Form.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJM MD ID Card-PC','NJM MD ID Card','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/NJM MD ID Card-PC.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('No Loss Reinstate Due to Non-Pay','No Loss Reinstate Due to Non-Pay','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/No Loss Reinstate Due to Non-Pay.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Discovery of Material Risk Factor During UW Period','Discovery of Material Risk Factor During UW Period','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/Discovery of Material Risk Factor During UW Period.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Reduction of Coverage-Deletion of Cov','Reduction of Coverage-Deletion of Cov','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/Reduction of Coverage-Deletion of Cov.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Reduction of Coverage-Roadside Assistance','Reduction of Coverage-Roadside Assistance','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/Reduction of Coverage-Roadside Assistance.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD NB 45 Day Decline-Cancel','MD NB 45 Day Decline-Cancel','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/MD NB 45 Day Decline-Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Notice of Nonrenewal','MD Notice of Nonrenewal','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/MD Notice of Nonrenewal.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Midterm Cancel','MD Midterm Cancel','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/MD Midterm Cancel.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Decline Ltr-Auto','MD Decline Ltr','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/MD Decline Ltr-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN UM-UIM Coverage Selection Form','PENN UM-UIM Coverage Selection Form','1','PA','companyRoot:S:Production://Templates/PolicyCenterAuto/PENN UM-UIM Coverage Selection Form.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Rescission Ltr-Auto','MD Rescission Ltr','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/MD Rescission Ltr-Auto.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Rescission Ltr-Misrep','Rescission Ltr-Misrep','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterAuto/Rescission Ltr-Misrep.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Rescission Ltr-Returned Payment','Rescission Ltr-Returned Payment','1','NJ','companyRoot:S:Production://Templates/PolicyCenterAuto/Rescission Ltr-Returned Payment.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('UM-UIM Form 2','UM-UIM Form 2','1','MD','companyRoot:S:Production://Templates/PolicyCenterAuto/UM-UIM Form 2.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null)

END

go



declare @lobHome int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int, @cat_PC_5 int,@cat_PC_6 int


Select @lobHome=  lobId from dbo.LOB where LOBName='PC-PA'


Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_POLICY_AUDIT_AUTO'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_RENEWALS_UNDERWRITER_AUTO'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_AUTO'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PL_OFF_CALL_PROCESSING_AUTO'
Select @cat_PC_5=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_AUTO'
Select @cat_PC_6=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_AUTO'


declare
@doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int,@doc6 int,  @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int,@doc29 int ,@doc30 int,
@doc31 int, @doc32 int, @doc33 int, @doc34 int, @doc35 int, @doc36 int, @doc37 int, @doc38 int,@doc39 int ,@doc40 int,

@doc41 int, @doc42 int, @doc43 int, @doc44 int, @doc45 int,@doc46 int,  @doc47 int, @doc48 int, @doc49 int, 
@doc50 int, @doc51 int, @doc52 int, @doc53 int, @doc54 int, @doc55 int, @doc56 int, @doc57 int, @doc58 int, @doc59 int, 
@doc60 int, @doc61 int, @doc62 int, @doc63 int, @doc64 int, @doc65 int, @doc66 int, @doc67 int, @doc68 int,@doc69 int ,@doc70 int,
@doc71 int, @doc72 int, @doc73 int, @doc74 int, @doc75 int, @doc76 int, @doc77 int, @doc78 int,@doc79 int ,@doc80 int,@doc81 int,

@doc82 int, @doc83 int, @doc84 int, @doc85 int,@doc86 int,  @doc87 int, @doc88 int, @doc89 int, 
@doc90 int, @doc91 int, @doc92 int, @doc93 int, @doc94 int, @doc95 int, @doc96 int, @doc97 int, @doc98 int, @doc99 int,

@doc100 int, @doc101 int, @doc102 int, @doc103 int,

@doc104 int, @doc105 int, @doc106 int, @doc107 int, @doc108 int, @doc109 int, @doc110 int, @doc111 int, @doc112 int, @doc113 int,
@doc114 int, @doc115 int, @doc116 int, @doc117 int, @doc118 int, @doc119 int, @doc120 int, @doc121 int, @doc122 int, @doc123 int,
@doc124 int, @doc125 int, @doc126 int, @doc127 int, @doc128 int, @doc129 int, @doc130 int, @doc131 int, @doc132 int, @doc133 int,
@doc134 int, @doc135 int, @doc136 int, @doc137 int, @doc138 int, @doc139 int, @doc140 int, @doc141 int, @doc142 int, @doc143 int



Select @doc1 =  DocumentId from [dbo].[Document] where DocumentName='A-614x'
Select @doc2 =  DocumentId from [dbo].[Document] where DocumentName='A-619x'
Select @doc3 =  DocumentId from [dbo].[Document] where DocumentName='Added PIP Listed on Policy'
Select @doc4 =  DocumentId from [dbo].[Document] where DocumentName='Added PIP Not on Policy'
Select @doc5 =  DocumentId from [dbo].[Document] where DocumentName='Additional Info Submission-Auto'
Select @doc6 =  DocumentId from [dbo].[Document] where DocumentName='Additional Info-Auto'
Select @doc7 =  DocumentId from [dbo].[Document] where DocumentName='Additional Underwriting Info-Auto'
Select @doc8 =  DocumentId from [dbo].[Document] where DocumentName='Audit Letter-Auto'
Select @doc9 =  DocumentId from [dbo].[Document] where DocumentName='Balance Due-Beyond 60 days'
Select @doc10 =  DocumentId from [dbo].[Document] where DocumentName='Balance Due-Submission'
Select @doc11 =  DocumentId from [dbo].[Document] where DocumentName='Balance Due-Within 60 days'
Select @doc12 =  DocumentId from [dbo].[Document] where DocumentName='Bind Pending CSF'
Select @doc13 =  DocumentId from [dbo].[Document] where DocumentName='Cancellation Withdrawal-Auto'
Select @doc14 =  DocumentId from [dbo].[Document] where DocumentName='Continuing Education GS Discount'
Select @doc15 =  DocumentId from [dbo].[Document] where DocumentName='Coverage Change Form'
Select @doc16 =  DocumentId from [dbo].[Document] where DocumentName='CSF-No Signature'
Select @doc17 =  DocumentId from [dbo].[Document] where DocumentName='Currently Suspended'
Select @doc18 =  DocumentId from [dbo].[Document] where DocumentName='Customization and Electronic'
Select @doc19 =  DocumentId from [dbo].[Document] where DocumentName='DD-DI Disc-Need AI'
Select @doc20 =  DocumentId from [dbo].[Document] where DocumentName='DD-DI Disc-Not Eligible'
Select @doc21 =  DocumentId from [dbo].[Document] where DocumentName='Deletion of Coverage-Auto'
Select @doc22 =  DocumentId from [dbo].[Document] where DocumentName='DT-GS Discount-Need AI'
Select @doc23 =  DocumentId from [dbo].[Document] where DocumentName='DT-GS Discount-Not Eligible'
Select @doc24 =  DocumentId from [dbo].[Document] where DocumentName='Estate of Request'
Select @doc25 =  DocumentId from [dbo].[Document] where DocumentName='Future Cancellation Ltr-Auto'
Select @doc26 =  DocumentId from [dbo].[Document] where DocumentName='Future Termination Ltr-Auto'
Select @doc27 =  DocumentId from [dbo].[Document] where DocumentName='Garage Location'
Select @doc28 =  DocumentId from [dbo].[Document] where DocumentName='GS-DT-DD Discounts'
Select @doc29 =  DocumentId from [dbo].[Document] where DocumentName='Hidden Driver-Final'
Select @doc30 =  DocumentId from [dbo].[Document] where DocumentName='Hidden Driver-Initial'
Select @doc31 =  DocumentId from [dbo].[Document] where DocumentName='Lienholder Notice of Cancel-DNR'
Select @doc32 =  DocumentId from [dbo].[Document] where DocumentName='MEBO-Additional Info NJ'
Select @doc33 =  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancel'
Select @doc34 =  DocumentId from [dbo].[Document] where DocumentName='NB 60 Day Decline-CNC Bind Pend CSF'
Select @doc35 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ ID Card-PC'
Select @doc36 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ Standard CSF'
Select @doc37 =  DocumentId from [dbo].[Document] where DocumentName='NJM PA ID Card-PC'
Select @doc38 =  DocumentId from [dbo].[Document] where DocumentName='Non-Relative Resident Coverage'
Select @doc39 =  DocumentId from [dbo].[Document] where DocumentName='Nonrenewal Withdrawal-Auto'
Select @doc40 =  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal-Auto'
Select @doc41 =  DocumentId from [dbo].[Document] where DocumentName='Out of State or Intl DL'
Select @doc42 =  DocumentId from [dbo].[Document] where DocumentName='PENN Bound Pending Forms'
Select @doc43 =  DocumentId from [dbo].[Document] where DocumentName='Physical Damage Change'
Select @doc44 =  DocumentId from [dbo].[Document] where DocumentName='PIP Primary to NJM Due to Loss'
Select @doc45 =  DocumentId from [dbo].[Document] where DocumentName='PL Mailer Sheet'
Select @doc46 =  DocumentId from [dbo].[Document] where DocumentName='POA-Guardian-Trust'
Select @doc47 =  DocumentId from [dbo].[Document] where DocumentName='Rental Vehicle Verification-PC'
Select @doc48 =  DocumentId from [dbo].[Document] where DocumentName='Return Original Documents'
Select @doc49 =  DocumentId from [dbo].[Document] where DocumentName='Roadside Warning 1'
Select @doc50 =  DocumentId from [dbo].[Document] where DocumentName='Roadside Warning 2'
Select @doc51 =  DocumentId from [dbo].[Document] where DocumentName='Termination Cover Letter'
Select @doc52 =  DocumentId from [dbo].[Document] where DocumentName='Termination-NJ Named Insd Not Elig'
Select @doc53 =  DocumentId from [dbo].[Document] where DocumentName='Third Party Application'
Select @doc54 =  DocumentId from [dbo].[Document] where DocumentName='Third Party Designee Add-Delete'
Select @doc55 =  DocumentId from [dbo].[Document] where DocumentName='Tort Notice with Premiums'
Select @doc56 =  DocumentId from [dbo].[Document] where DocumentName='Total Loss'
Select @doc57 =  DocumentId from [dbo].[Document] where DocumentName='Transfer of Interest'
Select @doc58 =  DocumentId from [dbo].[Document] where DocumentName='Uninsured-Underinsured Motor Change'
Select @doc59 =  DocumentId from [dbo].[Document] where DocumentName='Vehicle Coverage Verification-PC'
Select @doc60 =  DocumentId from [dbo].[Document] where DocumentName='Lienholder Notice of Withdrawal'
Select @doc61 =  DocumentId from [dbo].[Document] where DocumentName='Named Driver Exclusion App'
Select @doc62 =  DocumentId from [dbo].[Document] where DocumentName='NB 60 Day Decline-Cancel'
Select @doc63 =  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-Auto'
Select @doc64 =  DocumentId from [dbo].[Document] where DocumentName='One Named Insured-Separation'
Select @doc65 =  DocumentId from [dbo].[Document] where DocumentName='PENN Bound Pending PSF'
Select @doc66 =  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write'
Select @doc67 =  DocumentId from [dbo].[Document] where DocumentName='PL Blank Letter Template'
Select @doc68 =  DocumentId from [dbo].[Document] where DocumentName='Proof of Ownership'
Select @doc69 =  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate'
Select @doc70 =  DocumentId from [dbo].[Document] where DocumentName='Verification of Coverage'
Select @doc71 =  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice'
Select @doc72 =  DocumentId from [dbo].[Document] where DocumentName='Delete Driver Improvement'
Select @doc73 =  DocumentId from [dbo].[Document] where DocumentName='Informed Consent Form'
Select @doc74 =  DocumentId from [dbo].[Document] where DocumentName='NJM CT ID Card-PC'
Select @doc75 =  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-Auto'
Select @doc76 =  DocumentId from [dbo].[Document] where DocumentName='CT Midterm Cancel'
Select @doc77 =  DocumentId from [dbo].[Document] where DocumentName='CT NB 60 Day Decline-Cancel'
Select @doc78 =  DocumentId from [dbo].[Document] where DocumentName='CT Notice of Nonrenewal-Auto'
Select @doc79 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ Temporary ID Card'
Select @doc80 =  DocumentId from [dbo].[Document] where DocumentName='NJM OH ID Card-PC'
Select @doc81 =  DocumentId from [dbo].[Document] where DocumentName='OH Deletion of Coverage-Auto'
Select @doc82 =  DocumentId from [dbo].[Document] where DocumentName='OH NB 90 Day Decline-Cancel'
Select @doc83 =  DocumentId from [dbo].[Document] where DocumentName='OH Notice of Nonrenewal-Auto'
Select @doc84 =  DocumentId from [dbo].[Document] where DocumentName='OH Midterm Cancel'
Select @doc85 =  DocumentId from [dbo].[Document] where DocumentName='Two Named Insured-Separation'
Select @doc86 =  DocumentId from [dbo].[Document] where DocumentName='Premium Attributable to Insurance Score Notice'
Select @doc87 =  DocumentId from [dbo].[Document] where DocumentName='PIP Waiver'
Select @doc88 =  DocumentId from [dbo].[Document] where DocumentName='UM-UIM Form'
Select @doc89 =  DocumentId from [dbo].[Document] where DocumentName='NJM MD ID Card-PC'
Select @doc90 =  DocumentId from [dbo].[Document] where DocumentName='No Loss Reinstate Due to Non-Pay'
Select @doc91 =  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period'
Select @doc92 =  DocumentId from [dbo].[Document] where DocumentName='Reduction of Coverage-Deletion of Cov'
Select @doc93 =  DocumentId from [dbo].[Document] where DocumentName='Reduction of Coverage-Roadside Assistance'
Select @doc94 =  DocumentId from [dbo].[Document] where DocumentName='MD NB 45 Day Decline-Cancel'
Select @doc95 =  DocumentId from [dbo].[Document] where DocumentName='MD Notice of Nonrenewal'
Select @doc96 =  DocumentId from [dbo].[Document] where DocumentName='MD Midterm Cancel'
Select @doc97 =  DocumentId from [dbo].[Document] where DocumentName='MD Decline Ltr-Auto'
Select @doc98 =  DocumentId from [dbo].[Document] where DocumentName='PENN UM-UIM Coverage Selection Form'
Select @doc99 =  DocumentId from [dbo].[Document] where DocumentName='MD Rescission Ltr-Auto'

Select @doc100 =  DocumentId from [dbo].[Document] where DocumentName='Rescission Ltr-Misrep'
Select @doc101 =  DocumentId from [dbo].[Document] where DocumentName='Rescission Ltr-Returned Payment'
Select @doc102 =  DocumentId from [dbo].[Document] where DocumentName='UM-UIM Form 2'
Select @doc103 =  DocumentId from [dbo].[Document] where DocumentName='PL Contact us-Auto'

IF NOT EXISTS ( SELECT 1 FROM [dbo].[CategoryDocument] WHERE DocumentId = @doc103 )
BEGIN
INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES


(@doc103,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

--policy audit auto
(@doc8,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc53,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc54,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

--PL_RENEWALS_UNDERWRITER_AUTO --27 docs
(@doc13,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc49,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc50,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc51,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc52,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc57,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc72,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc76,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc78,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc81,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc83,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc84,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc92,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc93,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc95,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc96,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc100,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc101,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),


--PL_OFF_CALL_PROCESSING_AUTO

(@doc3,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc42,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc43,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc44,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc48,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc56,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc58,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

--PL_MAILER_SHEET_AUTO
(@doc45,@cat_PC_6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),


--PL_UNDERWRITING_AUTO
(@doc5,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc60,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc61,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc64,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc65,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc66,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc67,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc69,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc71,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc82,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc85,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc86,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc91,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc99,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

--PL_GENERAL_AUTO
(@doc1,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc46,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc47,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc55,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc73,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc74,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc79,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc80,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc87,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc88,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc89,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc90,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc98,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc102,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

END

GO



declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int,@doc6 int,  @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int,@doc29 int ,@doc30 int,
@doc31 int, @doc32 int, @doc33 int, @doc34 int, @doc35 int, @doc36 int, @doc37 int, @doc38 int,@doc39 int ,@doc40 int,@doc41 int

, @doc42 int, @doc43 int, @doc44 int, @doc45 int,@doc46 int,  @doc47 int, @doc48 int, @doc49 int, 
@doc50 int, @doc51 int, @doc52 int, @doc53 int, @doc54 int, @doc55 int, @doc56 int, @doc57 int, @doc58 int, @doc59 int, 
@doc60 int, @doc61 int, @doc62 int, @doc63 int, @doc64 int, @doc65 int, @doc66 int, @doc67 int, @doc68 int,@doc69 int ,@doc70 int,
@doc71 int, @doc72 int, @doc73 int, @doc74 int, @doc75 int, @doc76 int, @doc77 int, @doc78 int,@doc79 int ,@doc80 int,@doc81 int,

@doc82 int, @doc83 int, @doc84 int, @doc85 int,@doc86 int,  @doc87 int, @doc88 int, @doc89 int, 
@doc90 int, @doc91 int, @doc92 int, @doc93 int, @doc94 int, @doc95 int, @doc96 int, @doc97 int, @doc98 int, @doc99 int,

@doc100 int, @doc101 int, @doc102 int, @doc103 int


Select @doc1 =  DocumentId from [dbo].[Document] where DocumentName='A-614x'
Select @doc2 =  DocumentId from [dbo].[Document] where DocumentName='A-619x'
Select @doc3 =  DocumentId from [dbo].[Document] where DocumentName='Added PIP Listed on Policy'
Select @doc4 =  DocumentId from [dbo].[Document] where DocumentName='Added PIP Not on Policy'
Select @doc5 =  DocumentId from [dbo].[Document] where DocumentName='Additional Info Submission-Auto'
Select @doc6 =  DocumentId from [dbo].[Document] where DocumentName='Additional Info-Auto'
Select @doc7 =  DocumentId from [dbo].[Document] where DocumentName='Additional Underwriting Info-Auto'
Select @doc8 =  DocumentId from [dbo].[Document] where DocumentName='Audit Letter-Auto'
Select @doc9 =  DocumentId from [dbo].[Document] where DocumentName='Balance Due-Beyond 60 days'
Select @doc10 =  DocumentId from [dbo].[Document] where DocumentName='Balance Due-Submission'
Select @doc11 =  DocumentId from [dbo].[Document] where DocumentName='Balance Due-Within 60 days'
Select @doc12 =  DocumentId from [dbo].[Document] where DocumentName='Bind Pending CSF'
Select @doc13 =  DocumentId from [dbo].[Document] where DocumentName='Cancellation Withdrawal-Auto'
Select @doc14 =  DocumentId from [dbo].[Document] where DocumentName='Continuing Education GS Discount'
Select @doc15 =  DocumentId from [dbo].[Document] where DocumentName='Coverage Change Form'
Select @doc16 =  DocumentId from [dbo].[Document] where DocumentName='CSF-No Signature'
Select @doc17 =  DocumentId from [dbo].[Document] where DocumentName='Currently Suspended'
Select @doc18 =  DocumentId from [dbo].[Document] where DocumentName='Customization and Electronic'
Select @doc19 =  DocumentId from [dbo].[Document] where DocumentName='DD-DI Disc-Need AI'
Select @doc20 =  DocumentId from [dbo].[Document] where DocumentName='DD-DI Disc-Not Eligible'
Select @doc21 =  DocumentId from [dbo].[Document] where DocumentName='Deletion of Coverage-Auto'
Select @doc22 =  DocumentId from [dbo].[Document] where DocumentName='DT-GS Discount-Need AI'
Select @doc23 =  DocumentId from [dbo].[Document] where DocumentName='DT-GS Discount-Not Eligible'
Select @doc24 =  DocumentId from [dbo].[Document] where DocumentName='Estate of Request'
Select @doc25 =  DocumentId from [dbo].[Document] where DocumentName='Future Cancellation Ltr-Auto'
Select @doc26 =  DocumentId from [dbo].[Document] where DocumentName='Future Termination Ltr-Auto'
Select @doc27 =  DocumentId from [dbo].[Document] where DocumentName='Garage Location'
Select @doc28 =  DocumentId from [dbo].[Document] where DocumentName='GS-DT-DD Discounts'
Select @doc29 =  DocumentId from [dbo].[Document] where DocumentName='Hidden Driver-Final'
Select @doc30 =  DocumentId from [dbo].[Document] where DocumentName='Hidden Driver-Initial'
Select @doc31 =  DocumentId from [dbo].[Document] where DocumentName='Lienholder Notice of Cancel-DNR'
Select @doc32 =  DocumentId from [dbo].[Document] where DocumentName='MEBO-Additional Info NJ'
Select @doc33 =  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancel'
Select @doc34 =  DocumentId from [dbo].[Document] where DocumentName='NB 60 Day Decline-CNC Bind Pend CSF'
Select @doc35 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ ID Card-PC'
Select @doc36 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ Standard CSF'
Select @doc37 =  DocumentId from [dbo].[Document] where DocumentName='NJM PA ID Card-PC'
Select @doc38 =  DocumentId from [dbo].[Document] where DocumentName='Non-Relative Resident Coverage'
Select @doc39 =  DocumentId from [dbo].[Document] where DocumentName='Nonrenewal Withdrawal-Auto'
Select @doc40 =  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal-Auto'
Select @doc41 =  DocumentId from [dbo].[Document] where DocumentName='Out of State or Intl DL'
Select @doc42 =  DocumentId from [dbo].[Document] where DocumentName='PENN Bound Pending Forms'
Select @doc43 =  DocumentId from [dbo].[Document] where DocumentName='Physical Damage Change'
Select @doc44 =  DocumentId from [dbo].[Document] where DocumentName='PIP Primary to NJM Due to Loss'
Select @doc45 =  DocumentId from [dbo].[Document] where DocumentName='PL Mailer Sheet'
Select @doc46 =  DocumentId from [dbo].[Document] where DocumentName='POA-Guardian-Trust'
Select @doc47 =  DocumentId from [dbo].[Document] where DocumentName='Rental Vehicle Verification-PC'
Select @doc48 =  DocumentId from [dbo].[Document] where DocumentName='Return Original Documents'
Select @doc49 =  DocumentId from [dbo].[Document] where DocumentName='Roadside Warning 1'
Select @doc50 =  DocumentId from [dbo].[Document] where DocumentName='Roadside Warning 2'
Select @doc51 =  DocumentId from [dbo].[Document] where DocumentName='Termination Cover Letter'
Select @doc52 =  DocumentId from [dbo].[Document] where DocumentName='Termination-NJ Named Insd Not Elig'
Select @doc53 =  DocumentId from [dbo].[Document] where DocumentName='Third Party Application'
Select @doc54 =  DocumentId from [dbo].[Document] where DocumentName='Third Party Designee Add-Delete'
Select @doc55 =  DocumentId from [dbo].[Document] where DocumentName='Tort Notice with Premiums'
Select @doc56 =  DocumentId from [dbo].[Document] where DocumentName='Total Loss'
Select @doc57 =  DocumentId from [dbo].[Document] where DocumentName='Transfer of Interest'
Select @doc58 =  DocumentId from [dbo].[Document] where DocumentName='Uninsured-Underinsured Motor Change'
Select @doc59 =  DocumentId from [dbo].[Document] where DocumentName='Vehicle Coverage Verification-PC'
Select @doc60 =  DocumentId from [dbo].[Document] where DocumentName='Lienholder Notice of Withdrawal'
Select @doc61 =  DocumentId from [dbo].[Document] where DocumentName='Named Driver Exclusion App'
Select @doc62 =  DocumentId from [dbo].[Document] where DocumentName='NB 60 Day Decline-Cancel'
Select @doc63 =  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-Auto'
Select @doc64 =  DocumentId from [dbo].[Document] where DocumentName='One Named Insured-Separation'
Select @doc65 =  DocumentId from [dbo].[Document] where DocumentName='PENN Bound Pending PSF'
Select @doc66 =  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write'
Select @doc67 =  DocumentId from [dbo].[Document] where DocumentName='PL Blank Letter Template'
Select @doc68 =  DocumentId from [dbo].[Document] where DocumentName='Proof of Ownership'
Select @doc69 =  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate'
Select @doc70 =  DocumentId from [dbo].[Document] where DocumentName='Verification of Coverage'
Select @doc71 =  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice'
Select @doc72 =  DocumentId from [dbo].[Document] where DocumentName='Delete Driver Improvement'
Select @doc73 =  DocumentId from [dbo].[Document] where DocumentName='Informed Consent Form'
Select @doc74 =  DocumentId from [dbo].[Document] where DocumentName='NJM CT ID Card-PC'
Select @doc75 =  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-Auto'
Select @doc76 =  DocumentId from [dbo].[Document] where DocumentName='CT Midterm Cancel'
Select @doc77 =  DocumentId from [dbo].[Document] where DocumentName='CT NB 60 Day Decline-Cancel'
Select @doc78 =  DocumentId from [dbo].[Document] where DocumentName='CT Notice of Nonrenewal-Auto'
Select @doc79 =  DocumentId from [dbo].[Document] where DocumentName='NJM NJ Temporary ID Card'
Select @doc80 =  DocumentId from [dbo].[Document] where DocumentName='NJM OH ID Card-PC'
Select @doc81 =  DocumentId from [dbo].[Document] where DocumentName='OH Deletion of Coverage-Auto'
Select @doc82 =  DocumentId from [dbo].[Document] where DocumentName='OH NB 90 Day Decline-Cancel'
Select @doc83 =  DocumentId from [dbo].[Document] where DocumentName='OH Notice of Nonrenewal-Auto'
Select @doc84 =  DocumentId from [dbo].[Document] where DocumentName='OH Midterm Cancel'
Select @doc85 =  DocumentId from [dbo].[Document] where DocumentName='Two Named Insured-Separation'
Select @doc86 =  DocumentId from [dbo].[Document] where DocumentName='Premium Attributable to Insurance Score Notice'
Select @doc87 =  DocumentId from [dbo].[Document] where DocumentName='PIP Waiver'
Select @doc88 =  DocumentId from [dbo].[Document] where DocumentName='UM-UIM Form'
Select @doc89 =  DocumentId from [dbo].[Document] where DocumentName='NJM MD ID Card-PC'
Select @doc90 =  DocumentId from [dbo].[Document] where DocumentName='No Loss Reinstate Due to Non-Pay'
Select @doc91 =  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period'
Select @doc92 =  DocumentId from [dbo].[Document] where DocumentName='Reduction of Coverage-Deletion of Cov'
Select @doc93 =  DocumentId from [dbo].[Document] where DocumentName='Reduction of Coverage-Roadside Assistance'
Select @doc94 =  DocumentId from [dbo].[Document] where DocumentName='MD NB 45 Day Decline-Cancel'
Select @doc95 =  DocumentId from [dbo].[Document] where DocumentName='MD Notice of Nonrenewal'
Select @doc96 =  DocumentId from [dbo].[Document] where DocumentName='MD Midterm Cancel'
Select @doc97 =  DocumentId from [dbo].[Document] where DocumentName='MD Decline Ltr-Auto'
Select @doc98 =  DocumentId from [dbo].[Document] where DocumentName='PENN UM-UIM Coverage Selection Form'
Select @doc99 =  DocumentId from [dbo].[Document] where DocumentName='MD Rescission Ltr-Auto'

Select @doc100 =  DocumentId from [dbo].[Document] where DocumentName='Rescission Ltr-Misrep'
Select @doc101 =  DocumentId from [dbo].[Document] where DocumentName='Rescission Ltr-Returned Payment'
Select @doc102 =  DocumentId from [dbo].[Document] where DocumentName='UM-UIM Form 2'
Select @doc103 =  DocumentId from [dbo].[Document] where DocumentName='PL Contact us-Auto'

--Controls

declare  @ctrlEmail int, @ctrlFax int, @ctrlAddress int, @ctrlPrinter int, @ctrlSelectCommn int
declare  @ctrlAddtCheckbox int, @ctrlAdd123 int, @ctrlAd123NotRq int, @ctrl123greet int
declare  @ctrlMPrinterCheck int, @ctrlMail int,@ctrlLetter int, @ctrlDrpGreet int
declare @ctrlAdd61 int,@ctrlNo61 int,@ctrlDec61 int,@ctrlUpdate int,@ctrlAdditional int,@PLDriverSection int;
declare @PLPAAddedPIPs						int,
 @PLPAClaimAccidentInfo				int,
 @PLPAClaimOnPolicy					int,
 @PLPACsfBlankPrefilled				int,
 @PLPACsfEffective					int,
 @PLPAVerificationOfCoverage		int,
 @PLPAProofofCoverageOtherDriver	int,
@PLPADriverInformation				int,
@PLPADrivingWhileSuspended			int,
@PLPADrivingUnderInfluence			int,
@PLPAFinanceVehicle					int,
@PLPALeaseVehicle					int,
@PLPAOutofStateLicenseDriver		int,
@PLPAMidtermCancelReason			int,
@PLPAOtherResidentsInHouse			int,
@PLPAReinstatedCanceledDate			int,
@PLPAPurchaseOrderVehicle			int,
@PLPAReconsideration				int,
@PLPARegisterVehicle				int,
@PLPASeparationDivorceInfo			int,
@PLPASpousePartnerName				int,
@PLPATitleVehicle					int,
@PLPAVehicleMortgageLeaseInfo		int,
@PLPAVehicleCoverage				int,
@PLPAVehicleAddlInfo				int,
@PCUMBAddtlPolNumCheckboxwCheckboxLst int, @PCPACoverageEffectiveDatePicker int

declare @PLClaimViolationSection int, @PLPAClueReferenceNum int,@PLPACtMidtermCancelReason int,@PLPACtOHNoticeOfNonrenew int,@PLPADeletionOfCoverage int,@PLPAIdCardControl
int,@PLPAInvalidLicenseDriver int,@PLPALicenseSuspendedDriverInfo int,@PLPAMvrReferenceNums int,@PLPANonrenewCancel int,@PLPANoticeNonrenew int,@PLPAReason int,@PLPAServiceEvent int,@PLPAVehicleCheckboxs int,@PLPAVehicleDropdown int,@PLPAVehicleInfoCheckboxs int;

Select @ctrlSelectCommn=  ControlId from [dbo].[Control] where ControlName='SelectCommunicationSection'

Select @ctrlEmail=  ControlId from [dbo].[Control] where ControlName='EmailwCheckbox'
Select @ctrlFax=  ControlId from [dbo].[Control] where ControlName='FaxwCheckbox'
Select @ctrlMPrinterCheck=  ControlId from [dbo].[Control] where ControlName='PrinterDropdownwCheckbox'
Select @ctrlMail=  ControlId from [dbo].[Control] where ControlName='UsMailCheckbox'
Select @ctrlPrinter=  ControlId from [dbo].[Control] where ControlName='PrinterDropdown'
Select @ctrlLetter=  ControlId from [dbo].[Control] where ControlName=    'LetterDatePicker'

Select @ctrlAdd123=  ControlId from [dbo].[Control] where ControlName='PLAddresseeNameOneTwoAndThree'
Select @ctrlAd123NotRq=  ControlId from [dbo].[Control] where ControlName='PLPAAddresseeNameOneAndTwoNotReq'
Select @ctrl123greet=  ControlId from [dbo].[Control] where ControlName='PLAddrNmOneTwoThreewGreetNm'

Select @PLPAClueReferenceNum=  ControlId from [dbo].[Control] where ControlName='PLPAClueReferenceNum'
Select @PLPACtMidtermCancelReason=  ControlId from [dbo].[Control] where ControlName='PLPACtMidtermCancelReason'
Select @PLPACtOHNoticeOfNonrenew=  ControlId from [dbo].[Control] where ControlName='PLPACtOHNoticeOfNonrenew'
Select @PLPADeletionOfCoverage=  ControlId from [dbo].[Control] where ControlName='PLPADeletionOfCoverage'
Select @PLPAIdCardControl=  ControlId from [dbo].[Control] where ControlName='PLPAIdCardControl'
Select @PLPAInvalidLicenseDriver=  ControlId from [dbo].[Control] where ControlName='PLPAInvalidLicenseDriver'
Select @PLPALicenseSuspendedDriverInfo=  ControlId from [dbo].[Control] where ControlName='PLPALicenseSuspendedDriverInfo'
Select @PLPAMvrReferenceNums=  ControlId from [dbo].[Control] where ControlName='PLPAMvrReferenceNums'
Select @PLPANonrenewCancel=  ControlId from [dbo].[Control] where ControlName='PLPANonrenewCancel'
Select @PLPANoticeNonrenew=  ControlId from [dbo].[Control] where ControlName='PLPANoticeNonrenew'
Select @PLPAReason=  ControlId from [dbo].[Control] where ControlName='PLPAReason'
Select @PLPAServiceEvent=  ControlId from [dbo].[Control] where ControlName='PLPAServiceEvent'
Select @PLPAVehicleCheckboxs=  ControlId from [dbo].[Control] where ControlName='PLPAVehicleCheckboxs'
Select @PLPAVehicleDropdown=  ControlId from [dbo].[Control] where ControlName='PLPAVehicleDropdown'
Select @PLPAVehicleInfoCheckboxs=  ControlId from [dbo].[Control] where ControlName='PLPAVehicleInfoCheckboxs'
select @PLClaimViolationSection = ControlId from [dbo].[Control] where ControlName='PLClaimViolationSection'
select @PLDriverSection = ControlId from [dbo].[Control] where ControlName='PLDriverSection'


--phase 3
Select @PLPAAddedPIPs=  ControlId from [dbo].[Control] where ControlName='PLPAAddedPIPs'
Select @PLPAClaimAccidentInfo=  ControlId from [dbo].[Control] where ControlName='PLPAClaimAccidentInfo'
Select @PLPAClaimOnPolicy=  ControlId from [dbo].[Control] where ControlName='PLPAClaimOnPolicy'
Select @PLPACsfBlankPrefilled=  ControlId from [dbo].[Control] where ControlName='PLPACsfBlankPrefilled'
Select @PLPACsfEffective=  ControlId from [dbo].[Control] where ControlName='PLPACsfEffective'
Select @PLPAVerificationOfCoverage=  ControlId from [dbo].[Control] where ControlName='PLPAVerificationOfCoverage'
Select @PLPAProofofCoverageOtherDriver=  ControlId from [dbo].[Control] where ControlName='PLPAProofofCoverageOtherDriver'
Select @PLPADriverInformation=  ControlId from [dbo].[Control] where ControlName='PLPADriverInformation'
Select @PLPADrivingWhileSuspended=  ControlId from [dbo].[Control] where ControlName='PLPADrivingWhileSuspended'
Select @PLPADrivingUnderInfluence=  ControlId from [dbo].[Control] where ControlName='PLPADrivingUnderInfluence'
Select @PLPAFinanceVehicle=  ControlId from [dbo].[Control] where ControlName='PLPAFinanceVehicle'
Select @PLPALeaseVehicle=  ControlId from [dbo].[Control] where ControlName='PLPALeaseVehicle'
Select @PLPAOutofStateLicenseDriver=  ControlId from [dbo].[Control] where ControlName='PLPAOutofStateLicenseDriver'
Select @PLPAMidtermCancelReason=  ControlId from [dbo].[Control] where ControlName='PLPAMidtermCancelReason'
Select @PLPAOtherResidentsInHouse=  ControlId from [dbo].[Control] where ControlName='PLPAOtherResidentsInHouse'
Select @PLPAReinstatedCanceledDate=  ControlId from [dbo].[Control] where ControlName='PLPAReinstatedCanceledDate'
Select @PLPAPurchaseOrderVehicle=  ControlId from [dbo].[Control] where ControlName='PLPAPurchaseOrderVehicle'
Select @PLPAReconsideration=  ControlId from [dbo].[Control] where ControlName='PLPAReconsideration'
Select @PLPARegisterVehicle=  ControlId from [dbo].[Control] where ControlName='PLPARegisterVehicle'
Select @PLPASeparationDivorceInfo=  ControlId from [dbo].[Control] where ControlName='PLPASeparationDivorceInfo'
Select @PLPASpousePartnerName=  ControlId from [dbo].[Control] where ControlName='PLPASpousePartnerName'
Select @PLPATitleVehicle=  ControlId from [dbo].[Control] where ControlName='PLPATitleVehicle'
Select @PLPAVehicleMortgageLeaseInfo=  ControlId from [dbo].[Control] where ControlName='PLPAVehicleMortgageLeaseInfo'
Select @PLPAVehicleCoverage=  ControlId from [dbo].[Control] where ControlName='PLPAVehicleCoverage'
Select @PLPAVehicleAddlInfo=  ControlId from [dbo].[Control] where ControlName='PLPAVehicleAddlInfo'
select @PCUMBAddtlPolNumCheckboxwCheckboxLst = ControlId from [dbo].[Control] where ControlName='PCUMBAddtlPolNumCheckboxwCheckboxLst'
select @PCPACoverageEffectiveDatePicker = ControlId from [dbo].[Control] where ControlName='PCPACoverageEffectiveDatePicker'

--phase 3 ends
IF NOT EXISTS ( SELECT 1 FROM [dbo].[DocumentControl] WHERE DocumentId = @doc13 )
BEGIN

 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

--phase 3 begins


(@doc13,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlSelectCommn,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlMail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlMPrinterCheck,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlEmail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlFax,800,SUSER_SNAME(),GETDATE(),null,null),


(@doc59,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@PCPACoverageEffectiveDatePicker,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@PLPAVehicleMortgageLeaseInfo,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@ctrlSelectCommn,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@ctrlMail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@ctrlMPrinterCheck,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@ctrlEmail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc59,@ctrlFax,800,SUSER_SNAME(),GETDATE(),null,null),

(@doc6,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@PLPAVehicleAddlInfo,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@PLPADriverInformation,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlSelectCommn,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlMail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlMPrinterCheck,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlEmail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlFax,800,SUSER_SNAME(),GETDATE(),null,null),


(@doc35,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@PLPAVehicleCheckboxs,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc63,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@PLPALicenseSuspendedDriverInfo,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@PLPAInvalidLicenseDriver,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@PLPADrivingWhileSuspended,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@PLClaimViolationSection,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@PLPAMvrReferenceNums,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@PLPAClueReferenceNum,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@ctrlSelectCommn,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@ctrlMail,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@ctrlMPrinterCheck,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@ctrlEmail,1100,SUSER_SNAME(),GETDATE(),null,null),
(@doc63,@ctrlFax,1200,SUSER_SNAME(),GETDATE(),null,null),

(@doc62,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPALicenseSuspendedDriverInfo,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPAInvalidLicenseDriver,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPADrivingWhileSuspended,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLClaimViolationSection,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPAMvrReferenceNums,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPAClueReferenceNum,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPAFinanceVehicle,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPALeaseVehicle,1100,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPARegisterVehicle,1200,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@PLPATitleVehicle,1300,SUSER_SNAME(),GETDATE(),null,null),
(@doc62,@ctrlPrinter,1400,SUSER_SNAME(),GETDATE(),null,null),

(@doc85,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc85,@PLPASpousePartnerName,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc85,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc85,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc85,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc85,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc85,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc79,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc79,@PLPAVehicleCheckboxs,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc79,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc79,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc79,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc79,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc70,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@PLPAVehicleCoverage,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@PLPAReinstatedCanceledDate,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@PLPAClaimOnPolicy,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@PLPAVerificationOfCoverage,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@ctrlSelectCommn,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@ctrlMail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@ctrlMPrinterCheck,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@ctrlEmail,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc70,@ctrlFax,1100,SUSER_SNAME(),GETDATE(),null,null),

(@doc68,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@PLPALeaseVehicle,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@PLPARegisterVehicle,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@PLPATitleVehicle,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@PLPAPurchaseOrderVehicle,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@ctrlSelectCommn,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@ctrlMail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@ctrlMPrinterCheck,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@ctrlEmail,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc68,@ctrlFax,1100,SUSER_SNAME(),GETDATE(),null,null),

(@doc64,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc64,@PLPASeparationDivorceInfo,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc64,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc64,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc64,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc64,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc64,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc60,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc60,@PLPAVehicleDropdown,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc60,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc60,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc60,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc60,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc60,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc57,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc57,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc57,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc56,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc56,@PLPAVehicleDropdown,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc56,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc56,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc56,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc56,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc56,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc53,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc53,@PCUMBAddtlPolNumCheckboxwCheckboxLst,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc53,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc53,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc53,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc53,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc53,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc52,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc52,@PLPASpousePartnerName,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc52,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc51,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc51,@PLPAReconsideration,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc51,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc43,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc43,@PLPAVehicleCheckboxs,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc43,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc43,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc43,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc43,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc43,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc41,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@PLPAOutofStateLicenseDriver,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc40,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@PLPANoticeNonrenew,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@PLClaimViolationSection,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@PLPAMvrReferenceNums,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlPrinter,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc38,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@PLPAVerificationOfCoverage,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc36,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@PLPACsfEffective,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@PLPACsfBlankPrefilled,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlSelectCommn,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlMail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlMPrinterCheck,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlEmail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlFax,800,SUSER_SNAME(),GETDATE(),null,null),


(@doc34,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc33,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@PLPAMidtermCancelReason,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@PLClaimViolationSection,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@PLPAClueReferenceNum,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@PLPAMvrReferenceNums,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlPrinter,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc31,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@PLPAVehicleDropdown,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc30,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc29,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc27,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@PLPAVehicleDropdown,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc26,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@PLClaimViolationSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc25,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@PLPADrivingUnderInfluence,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc23,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc22,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc21,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@PLPADeletionOfCoverage,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc20,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc19,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc17,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),


(@doc14,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),


(@doc7,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@PLPAFinanceVehicle,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@PLPALeaseVehicle,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@PLPARegisterVehicle,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@PLPATitleVehicle,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@PLPAClaimAccidentInfo,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@PLPAProofofCoverageOtherDriver,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@PLPAOtherResidentsInHouse,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlSelectCommn,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMail,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMPrinterCheck,1100,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlEmail,1200,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlFax,1300,SUSER_SNAME(),GETDATE(),null,null),

(@doc3,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@PLPAAddedPIPs,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),


(@doc4,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@PLDriverSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc5,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@PLPAFinanceVehicle,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@PLPALeaseVehicle,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@PLPARegisterVehicle,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@PLPATitleVehicle,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@PLPAClaimAccidentInfo,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@PLPAProofofCoverageOtherDriver,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@PLPAOtherResidentsInHouse,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlMail,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlMPrinterCheck,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlEmail,1100,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlFax,1200,SUSER_SNAME(),GETDATE(),null,null),


--phase 3 ends Here





--phase 2 missed

(@doc78,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc78,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc78,@PLPACtOHNoticeOfNonrenew,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc78,@PLClaimViolationSection,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc78,@PLPAMvrReferenceNums,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc78,@ctrlPrinter,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc83,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc83,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc83,@PLPACtOHNoticeOfNonrenew,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc83,@PLClaimViolationSection,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc83,@PLPAMvrReferenceNums,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc83,@ctrlPrinter,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc97,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@PLClaimViolationSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@PLPAClueReferenceNum,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@PLPAInvalidLicenseDriver,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@PLPALicenseSuspendedDriverInfo,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@PLPAMvrReferenceNums,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@ctrlSelectCommn,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@ctrlMail,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@ctrlMPrinterCheck,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@ctrlEmail,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc97,@ctrlFax,1100,SUSER_SNAME(),GETDATE(),null,null),

(@doc75,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@PLPAInvalidLicenseDriver,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@PLClaimViolationSection,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@PLPAClueReferenceNum,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@PLPAMvrReferenceNums,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@PLPALicenseSuspendedDriverInfo,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@ctrlSelectCommn,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@ctrlMail,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@ctrlMPrinterCheck,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@ctrlEmail,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc75,@ctrlFax,1100,SUSER_SNAME(),GETDATE(),null,null),

(@doc99,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc99,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc99,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc80,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc80,@PLPAVehicleCheckboxs,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc80,@ctrlSelectCommn,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc80,@ctrlMail,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc80,@ctrlMPrinterCheck,900,SUSER_SNAME(),GETDATE(),null,null),


(@doc89,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc89,@PLPAIdCardControl,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc89,@PLPAVehicleCheckboxs,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc89,@ctrlSelectCommn,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc89,@ctrlMail,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc89,@ctrlMPrinterCheck,900,SUSER_SNAME(),GETDATE(),null,null),

(@doc1,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc2,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc37,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@PLPAVehicleCheckboxs,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@ctrlSelectCommn,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@ctrlMail,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@ctrlMPrinterCheck,900,SUSER_SNAME(),GETDATE(),null,null),

(@doc74,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc74,@PLPAVehicleCheckboxs,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc74,@ctrlSelectCommn,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc74,@ctrlMail,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc74,@ctrlMPrinterCheck,900,SUSER_SNAME(),GETDATE(),null,null),


--end of phase2 missed
--phase 2

(@doc15,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc76,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc76,@PLPACtMidtermCancelReason,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc76,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc76,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc77,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@PLPAInvalidLicenseDriver,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@PLClaimViolationSection,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@PLPAClueReferenceNum,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@PLPAMvrReferenceNums,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@PLPALicenseSuspendedDriverInfo,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@PLPAVehicleInfoCheckboxs,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc77,@ctrlPrinter,900,SUSER_SNAME(),GETDATE(),null,null),

(@doc72,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc72,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc72,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc72,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc72,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc72,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc91,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc91,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc91,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc91,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc91,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc73,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc73,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc73,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc73,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc73,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc73,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc96,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc96,@PLPAReason,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc96,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc96,@PLPAMvrReferenceNums,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc96,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc94,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@PLPAInvalidLicenseDriver,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@PLClaimViolationSection,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@PLPAClueReferenceNum,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@PLPAMvrReferenceNums,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@PLPALicenseSuspendedDriverInfo,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@PLPAVehicleDropdown,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@PLDriverSection,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc94,@ctrlPrinter,1000,SUSER_SNAME(),GETDATE(),null,null),

(@doc95,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc95,@PLPANoticeNonrenew,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc95,@PLClaimViolationSection,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc95,@PLPAMvrReferenceNums,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc95,@ctrlLetter,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc95,@ctrlPrinter,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc90,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc90,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc90,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc90,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc90,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc90,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc81,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc81,@PLPADeletionOfCoverage,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc81,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc81,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc84,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc84,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc84,@PLPAReason,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc84,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc82,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc82,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc82,@PLPAReason,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc82,@PLClaimViolationSection,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc82,@PLPAMvrReferenceNums,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc82,@ctrlPrinter,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc42,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc42,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc42,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc42,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc42,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc42,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc65,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc65,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc65,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc65,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc65,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc65,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc66,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc66,@PLPAMvrReferenceNums,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc66,@PLPAClueReferenceNum,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc66,@ctrlSelectCommn,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc66,@ctrlMail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc66,@ctrlMPrinterCheck,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc71,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc71,@PLPANonrenewCancel,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc71,@PLPAMvrReferenceNums,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc71,@PLPAClueReferenceNum,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc71,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc98,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc98,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc98,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc98,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc98,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc98,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc87,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc87,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc87,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc87,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc87,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc87,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc86,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc86,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc86,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc86,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc86,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc86,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc92,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc92,@PLPADeletionOfCoverage,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc92,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc92,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc93,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc93,@PLPAServiceEvent,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc93,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc93,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc55,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc55,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc55,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc55,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc55,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc55,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc88,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc88,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc88,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc88,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc88,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc88,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc102,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc102,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc102,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc102,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc102,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc102,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),
--phase 2 ends


--phase 1 Begins
(@doc8,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc9,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc10,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc11,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc12,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc16,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc18,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc24,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc28,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc32,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc61,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc61,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc61,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc61,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc61,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc61,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc39,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc44,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc44,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc44,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc44,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc44,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc44,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc67,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc67,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc67,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc67,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc67,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc67,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc45,@ctrlAd123NotRq,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc45,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc46,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc46,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc46,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc46,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc46,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc46,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc100,@ctrlAd123NotRq,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc100,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc101,@ctrlAd123NotRq,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc101,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc48,@ctrlAd123NotRq,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc48,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc49,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc49,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc49,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc49,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc49,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc49,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc50,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc50,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc50,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc50,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc50,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc50,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc54,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc54,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc54,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc54,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc54,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc54,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc69,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc69,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc69,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc69,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc69,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc69,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc58,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc58,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc58,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc58,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc58,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc58,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc47,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc47,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc47,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc47,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc47,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc47,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc103,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc103,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc103,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc103,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null)
--phase 1 Ends Here
END
GO


declare @lobIdPa int,@lobHome int, @lob int

Select @lobHome=  lobId from dbo.LOB where LOBName='PC-PA'

IF NOT EXISTS ( SELECT 1 FROM [dbo].[Configuration] WHERE LOBId = @lobHome AND  ConfigKey = 'PRINT_IND_NO')
BEGIN
 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobHome,'PRINT_IND_NO','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'POL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'EMAIL_FROM','DoNotReply@njm.com',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'EMAIL_BODY','homeowner',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'EMAIL_SUBJECT','Requested NJM Automobile Information',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'POL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'ARCHIVE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'PRINT_IND','DEPT',SUSER_SNAME(),GETDATE(),null,null)

END
GO







