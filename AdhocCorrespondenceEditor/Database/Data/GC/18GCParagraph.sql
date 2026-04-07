Go

Declare @reasonsParagraphGC varchar(50) = 'reasonsParagraphGC'
Declare @lobID int =(select LOBId from LOB where LOBName = 'GC')
Declare @ReasonsID integer


IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsParagraphGC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsParagraphGC,@reasonsParagraphGC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsParagraphGC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsParagraphGC,null,null,SUSER_SNAME(),GETDATE(),null,null)


Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsParagraphGC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Toxicology Presumptive','','TOX_PRESUMP_CHKBOX',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Toxicology Confirmatory','','TOX_CONFIRM_CHKBOX',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Pursuant to a Physician Review','','PURSUANT_PHYS_REV_CHKBOX',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Not clinically supported as Med Nec','','NOT_CLIN_SUPP_CHKBOX',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Not causally related - Other','','NOT_CAUS_REL_OTHER_VALUE',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Not in accordance with Care Paths or accepted standard','','NOT_IN_ACCORD_CHKBOX',@ReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Med treatment/testing based on IME','','MED_TRMNT_BASED_IME_CHKBOX',@ReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Diagnosis not previously claimed','','DIAG_NOT_PREV_CLAIMED_CHKBOX',@ReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Lack of updated medical documentation','','LACK_UPDATED_MED_DOC_CHKBOX',@ReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Req treatment/test/DME med unnecess or not supp','','REQ_TRMNT_MED_UNNECSS_CHKBOX',@ReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Submitted med doc does not supp req treatment/testing/DME','','SUB_MED_DOC_NOT_SUPP_TRMNT_CHKBOX',@ReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Unable to causally relate current diagnosis to MVA','','UNABLE_CAS_REL_TO_MVA_CHKBOX',@ReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Lack of conservative care to support medical necessity','','LACK_CONSRV_CARE_SUPP_MED_CHKBOX',@ReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),
('Treatment not consistent with diagnosis','','TRMNT_NOT_CONSIST_W_DIAG_CHKBOX',@ReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),
('Additional medicals/results required','','ADDTL_MED_RESULTS_REQ_CHKBOX',@ReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null),
('Other details','','OTHER_DETAILS1_VALUE',@ReasonsID,1600,SUSER_SNAME(),GETDATE(),null,null),
('Benefits Termination Date','','BENEFITS_TERM_DT',@ReasonsID,1700,SUSER_SNAME(),GETDATE(),null,null),
('Lack of legible med documentation','','LACK_OF_LEG_MED_DOC_CHKBOX',@ReasonsID,1800,SUSER_SNAME(),GETDATE(),null,null),
('Lack of current PT Rx/re-eval','','LACK_OF_CURR_PT_CHKBOX',@ReasonsID,1900,SUSER_SNAME(),GETDATE(),null,null),
('Testing not reimbursable','','TEST_NOT_REIMBURSE_CHKBOX',@ReasonsID,2000,SUSER_SNAME(),GETDATE(),null,null),
('Failure to submit to IME','','FAIL_TO_SUBMIT_IME_CHKBOX',@ReasonsID,2100,SUSER_SNAME(),GETDATE(),null,null),
('Policy Limits Exhausted','','POL_LIMITS_EXHAUST_CHKBOX',@ReasonsID,2200,SUSER_SNAME(),GETDATE(),null,null),
('Additional Medical Documentation','','ADDTL_MED_DOC_VALUE',@ReasonsID,2300,SUSER_SNAME(),GETDATE(),null,null),
('Pursuant to N.J.A.C. 11:3-4 et seq','','PURSUANT_TO_NJAC_CHKBOX',@ReasonsID,2400,SUSER_SNAME(),GETDATE(),null,null),
('Pursuant to the NJ PIP Fee Schedule','','PURSUANT_NJ_PIP_FEE_SCH',@ReasonsID,2500,SUSER_SNAME(),GETDATE(),null,null),
('Health Insurance Primary','','HLTH_INS_PRI_CHKBOX',@ReasonsID,2600,SUSER_SNAME(),GETDATE(),null,null),
('Eligibility','','ELIGIBILITY_CHKBOX',@ReasonsID,2700,SUSER_SNAME(),GETDATE(),null,null),
('Funds','','FUNDS_CHKBOX',@ReasonsID,2800,SUSER_SNAME(),GETDATE(),null,null),
('DME','','DME',@ReasonsID,2900,SUSER_SNAME(),GETDATE(),null,null)
End

Declare @GCCausallyRelatedOtherCtl varchar(50) = 'GCNotCausallyRelatedOtherChildControl'
Declare @GCOtherdetailsCtl varchar(50) = 'GCOtherdetailsChildControl'
Declare @GCAdditionalMedicalDocumentationCtl varchar(50) = 'GCAdditionalMedicalDocumentationChildControl'
Declare @GCBenefitsTerminationDate varchar(50) = 'GCBenefitsTerminationDateChildControl'

IF NOT EXISTS (SELECT * from [Control] where ControlName = @GCCausallyRelatedOtherCtl)
begin
INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
(@GCCausallyRelatedOtherCtl,SUSER_SNAME(),GETDATE(),null,null),
(@GCOtherdetailsCtl,SUSER_SNAME(),GETDATE(),null,null),
(@GCAdditionalMedicalDocumentationCtl,SUSER_SNAME(),GETDATE(),null,null),
(@GCBenefitsTerminationDate,SUSER_SNAME(),GETDATE(),null,null)
End

Declare @ctrlCausallyRelatedOthe int,@ctrlOtherdetails int,@ctrlAdditionalMedical int,@ctrlBenefitsTermination int
Declare @CausallyRelatedOther int, @Otherdetails int,@AdditionalMedical int, @BenefitsTermination int
Select @ctrlCausallyRelatedOthe = ControlId from [dbo].[Control] where ControlName=@GCCausallyRelatedOtherCtl
Select @ctrlOtherdetails = ControlId from [dbo].[Control] where ControlName=@GCOtherdetailsCtl
Select @ctrlAdditionalMedical = ControlId from [dbo].[Control] where ControlName=@GCAdditionalMedicalDocumentationCtl
Select @ctrlBenefitsTermination = ControlId from [dbo].[Control] where ControlName=@GCBenefitsTerminationDate

Select @CausallyRelatedOther=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentDropdownLookupTypeCode=@reasonsParagraphGC 
and DocumentDropdownLookupItemCode='Not causally related - Other'
Select @Otherdetails=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentDropdownLookupTypeCode=@reasonsParagraphGC 
and DocumentDropdownLookupItemCode='Other details'
Select @AdditionalMedical=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentDropdownLookupTypeCode=@reasonsParagraphGC 
and DocumentDropdownLookupItemCode='Additional Medical Documentation'
Select @BenefitsTermination=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId where DocumentDropdownLookupTypeCode=@reasonsParagraphGC 
and DocumentDropdownLookupItemCode='Benefits Termination Date'

Declare @documentID1 int = (select DocumentId from Document where DocumentName = 'DPR Response Form')
IF NOT EXISTS (SELECT * from [DocumentDropdownChildControl] where  DocumentId = @documentID1 and
DocumentDropdownLookupItemId = @CausallyRelatedOther)
begin
 INSERT [dbo].[DocumentDropdownChildControl](DocumentId,DocumentDropdownLookupItemId,ControlId,
											[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@CausallyRelatedOther,@ctrlCausallyRelatedOthe,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@Otherdetails,@ctrlOtherdetails,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@AdditionalMedical,@ctrlAdditionalMedical,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@BenefitsTermination,@ctrlBenefitsTermination,SUSER_SNAME(),GETDATE(),null,null)
End

select @documentID1 = DocumentId from Document where DocumentName = 'DPR Response Form IME'
IF NOT EXISTS (SELECT * from [DocumentDropdownChildControl] where  DocumentId = @documentID1 and
DocumentDropdownLookupItemId = @CausallyRelatedOther)
begin
 INSERT [dbo].[DocumentDropdownChildControl](
		DocumentId,	DocumentDropdownLookupItemId,ControlId,[CreatedBy],[CreatedDateTime]
      ,[UpdatedBy],[UpdatedDateTime] )values 
(@documentID1,@CausallyRelatedOther,@ctrlCausallyRelatedOthe,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@Otherdetails,@ctrlOtherdetails,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@AdditionalMedical,@ctrlAdditionalMedical,SUSER_SNAME(),GETDATE(),null,null), 
(@documentID1,@BenefitsTermination,@ctrlBenefitsTermination,SUSER_SNAME(),GETDATE(),null,null)
End