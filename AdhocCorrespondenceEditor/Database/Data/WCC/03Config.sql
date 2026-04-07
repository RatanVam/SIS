declare @LOBId int =(select LOBId from LOB where LOBName = 'WCC')

if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='WCCAuthorRoles')
insert into Configuration (LOBId,ConfigKey,ConfigValue,CreatedBy,CreatedDateTime)
values
(@LOBId,'WCCAuthorRoles','Actuarial Representative,Adjuster,Administrative Services Representative,\
API Service Account,Attorney,Attorney of Record,Awards Rep,Batch Script User,Bill Processor,\
Bill Processor - Create Expense Payments,Case Management Rep,ClaimCenter Administrator,\
Claims Association,Claims Supervisor,Conversion User,Data Change Admin,EFT Editor,\
FNOL Rep,General Accounting Representative,Indexing Representative,Integration Admin,\
Internal Audit Representative,IT Production Support,Litigation Support, LSNTL User,\
Manual Check creator,Matter Creator,Medical Services,Message Viewer,MSA Stop_Void,\
MSP Gatekeeper,Negative Payment Creator,Negative Time Tracker,Part II Lawsuit Representative,\
Payment Auditor,Provider Services Rep,Provider Services Representative,Reserve Rep,Reserves Rep,Reserves- Viewer,RPO Editor,Rule Admin,SIU Rep,SOAP User,\
Statistical Representative,Statistical Representative (Edit),Subrogation Rep,Superuser,\
Supervisor,Supervisor - EDMA,Supervisor- Administrative Services,Supervisor- Internal Audit,\
Supervisor- Reserves,Support Staff,Time Tracker Administrator,Time Tracker User,Time Tracker Viewer,\
Trusted for Sensitive Claims,Underwriting Representative,User Admin,Utilization Review Rep,\
Viewer,WCC CC Administrator',SUSER_SNAME(),GETDATE())


if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='WCCAttnRoles')
insert into Configuration (LOBId,ConfigKey,ConfigValue,CreatedBy,CreatedDateTime)
values
(@LOBId,'WCCAttnRoles','Agent,Alternate Contact,Arbitrator,Assistant Surgeon,Carrier,\
Case Management Company,Check Payee,Claimant,Claimant Dependent,Co-defendant,\
Co-Surgeon,Collection Agency,Contact At Firm,Defendant,Diagnostic Testing Facility,\
DME Vendor,Doctor,Employer,External Subrogation Firm,Former Agent,Former Check Payee,\
Former Insured,Former Policy Holder,Former Underwriter,Garnishment Beneficiary,\
Garnishment Recipient,Guardian,Hospital,Industrial Medicine Facility,Injured Party,\
Insured,Judge,Law Enforcement Agency,Lienholder,Main Contact,Medical Personnel,\
Medical Practice,Nurse Case Manager,Occupational Therapist,Occupational Therapy Facility,\
Other,Outside Counsel/Attorney,Outside Investigator,Outside Law Firm,Owner,Passenger,\
Petitioners Attorney,Petitioners Law Firm,Pharmacy,Physical Therapist,Physical Therapy Facility,\
Plaintiff,Policy Contact,Policy holder,Recovery Payer,Rehabilitation Facility,\
Reporter,State Agency,Supervisor,Surgeon,Transportation Provider,Underwriter,\
Vendor,Venue,Witness',SUSER_SNAME(),GETDATE())

DECLARE @Hosp_Doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Hospital Record Request')
DECLARE @Addj_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Adjournment Request')
DECLARE @Affidavit INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Affidavit')
DECLARE @Certification INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Certification')
DECLARE @CIni_PDoc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='CP Answer Initial')
DECLARE @CPReop_Doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='CP Answer Reopener')
DECLARE @Generic_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Generic Order')
DECLARE @inter_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Interrogatories Formalized')
DECLARE @Occu_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Occupational Interrogatories')
DECLARE @subst_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Substitution of Attorney')

if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='ShowInRe')
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values
(@LOBId,'ShowInRe','false',@Hosp_Doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@Addj_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@Affidavit,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@Certification,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@CIni_PDoc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@CPReop_Doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@Generic_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@inter_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@Occu_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInRe','false',@subst_doc,SUSER_SNAME(),GETDATE())



DECLARE @request_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Request for Records Inspection')

if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='ShowClaimPetNumText')
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values
(@LOBId,'ShowClaimPetNumText','true',@request_doc,SUSER_SNAME(),GETDATE())


if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='ShowInBody')
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values
(@LOBId,'ShowInBody','true',@request_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@Addj_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@Affidavit,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@Certification,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@CIni_PDoc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@CPReop_Doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@Generic_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@inter_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@Occu_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@subst_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ShowInBody','true',@Hosp_Doc,SUSER_SNAME(),GETDATE())

go

declare @LOBId int =(select LOBId from LOB where LOBName = 'WCC')
DECLARE @correct_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Correct Carrier')

declare @Adjournment_Request int = (select documentid from document where documentfriendlyname='Adjournment Request')
declare @Affidavit int = (select documentid from document where documentfriendlyname='Affidavit')
declare @Amended_Order int = (select documentid from document where documentfriendlyname='Amended Order')
declare @Certification int = (select documentid from document where documentfriendlyname='Certification')
declare @Closing_Letter int = (select documentid from document where documentfriendlyname='Closing Letter')
declare @Conflict_of_Interest int = (select documentid from document where documentfriendlyname='Conflict of Interest')
declare @Correct_Carrier_to_PA int = (select documentid from document where documentfriendlyname='Correct Carrier to PA')
declare @Demand_for_Medical int = (select documentid from document where documentfriendlyname='Demand for Medical')
declare @Dependency_Interrogatories int = (select documentid from document where documentfriendlyname='Dependency Interrogatories')
declare @Generic_Legal_Document int = (select documentid from document where documentfriendlyname='Generic Legal Document')
declare @Generic_Order int = (select documentid from document where documentfriendlyname='Generic Order')
declare @Impleader_Int_Cover_Ltr_w_Form int = (select documentid from document where documentfriendlyname='Impleader Int Cover Ltr w Form')
declare @Int_to_Policyholder_Cov_Ltr_w_Form int = (select documentid from document where documentfriendlyname='Int to Policyholder Cov Ltr w Form')
declare @Motion_Dismiss_Lack_of_Pros int = (select documentid from document where documentfriendlyname='Motion Dismiss Lack of Pros')
declare @Motion_Dismiss_UW int = (select documentid from document where documentfriendlyname='Motion Dismiss UW')
declare @Motion_for_Temp_and_Med_Benefits int = (select documentid from document where documentfriendlyname='Motion for Temp and Med Benefits')
declare @Motion_in_Opp_to_Motion_to_Re int = (select documentid from document where documentfriendlyname='Motion in Opp to Motion to Re')
declare @Motion_to_Compel_Ans_Special_Rogs int = (select documentid from document where documentfriendlyname='Motion to Compel Ans Special Rogs')
declare @Motion_to_Implead int = (select documentid from document where documentfriendlyname='Motion to Implead')
declare @Motion_Generic int = (select documentid from document where documentfriendlyname='Motion-Generic')
declare @MP_Answer_to_Rogs int = (select documentid from document where documentfriendlyname='MP Answer to Rogs')
declare @Occupational_Interrogatories int = (select documentid from document where documentfriendlyname='Occupational Interrogatories')
declare @Regular_Interrogatories int = (select documentid from document where documentfriendlyname='Regular Interrogatories')
declare @Reopener_Interrogatories int = (select documentid from document where documentfriendlyname='Re-opener Interrogatories')
declare @Subpoena_Ad_Testificandum int = (select documentid from document where documentfriendlyname='Subpoena Ad Testificandum')
declare @Subpoena_Duces_Tecum int = (select documentid from document where documentfriendlyname='Subpoena Duces Tecum')
declare @Substitution_of_Attorney int = (select documentid from document where documentfriendlyname='Substitution of Attorney')
--declare @Supplemental_Interrogatories int = (select documentid from document where documentfriendlyname='Supplemental Interrogatories')

if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='ReRequired')
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values
(@LOBId,'ReRequired','true',@correct_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Adjournment_Request,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Affidavit,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Amended_Order,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Certification,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Closing_Letter,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Conflict_of_Interest,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Correct_Carrier_to_PA,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Demand_for_Medical,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Dependency_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Generic_Legal_Document,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Generic_Order,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Impleader_Int_Cover_Ltr_w_Form,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Int_to_Policyholder_Cov_Ltr_w_Form,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Motion_Dismiss_Lack_of_Pros,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Motion_Dismiss_UW,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Motion_for_Temp_and_Med_Benefits,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Motion_in_Opp_to_Motion_to_Re,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Motion_to_Compel_Ans_Special_Rogs,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Motion_to_Implead,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Motion_Generic,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@MP_Answer_to_Rogs,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Occupational_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Regular_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Reopener_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Subpoena_Ad_Testificandum,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Subpoena_Duces_Tecum,SUSER_SNAME(),GETDATE()),
(@LOBId,'ReRequired','true',@Substitution_of_Attorney,SUSER_SNAME(),GETDATE())
--(@LOBId,'ReRequired','true',@Supplemental_Interrogatories,SUSER_SNAME(),GETDATE())



DECLARE @request_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Request for Records Inspection')

if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='BodyRequired')
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values
(@LOBId,'BodyRequired','true',@correct_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Adjournment_Request,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Affidavit,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Amended_Order,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Certification,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Closing_Letter,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Conflict_of_Interest,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Correct_Carrier_to_PA,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Demand_for_Medical,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Dependency_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Generic_Legal_Document,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Generic_Order,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Impleader_Int_Cover_Ltr_w_Form,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Int_to_Policyholder_Cov_Ltr_w_Form,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Motion_Dismiss_Lack_of_Pros,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Motion_Dismiss_UW,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Motion_for_Temp_and_Med_Benefits,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Motion_in_Opp_to_Motion_to_Re,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Motion_to_Compel_Ans_Special_Rogs,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Motion_to_Implead,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Motion_Generic,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@MP_Answer_to_Rogs,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Occupational_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Regular_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Reopener_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Subpoena_Ad_Testificandum,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Subpoena_Duces_Tecum,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@Substitution_of_Attorney,SUSER_SNAME(),GETDATE()),
--(@LOBId,'BodyRequired','true',@Supplemental_Interrogatories,SUSER_SNAME(),GETDATE()),
(@LOBId,'BodyRequired','true',@request_doc,SUSER_SNAME(),GETDATE())




DECLARE @motion_doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Motion for Temp and Med Benefits')

if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='OnlyOne')
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values
(@LOBId,'OnlyOne','true',@request_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'OnlyOne','true',@motion_doc,SUSER_SNAME(),GETDATE())

go


declare @LOBId int =(select LOBId from LOB where LOBName = 'WCC')
declare @Adjournment_Request_doc int = (select documentid from document where documentfriendlyname='Adjournment Request')
declare @CP_Answer_Initial int = (select documentid from document where documentfriendlyname='CP Answer Initial')
declare @CP_Answer_Reopener int = (select documentid from document where documentfriendlyname='CP Answer Reopener')
declare @Interro int = (select documentid from document where documentfriendlyname='Interrogatories Formalized')
declare @Occupation int = (select documentid from document where documentfriendlyname='Occupational Interrogatories')
declare @Substitution int = (select documentid from document where documentfriendlyname='Substitution of Attorney')
DECLARE @Hosp_Doc INT = (SELECT DOCUMENTID FROM DOCUMENT WHERE DocumentName='Hospital Record Request')
declare @Affidavit int = (select documentid from document where documentfriendlyname='Affidavit')
declare @Certification int = (select documentid from document where documentfriendlyname='Certification')
declare @Generic_Order int = (select documentid from document where documentfriendlyname='Generic Order')

if not exists (Select * from Configuration where LOBId= @LOBId and ConfigKey='OutputToRe')
insert into Configuration (LOBId,ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime)
values
(@LOBId,'OutputToRe','true',@Adjournment_Request_doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','true',@CP_Answer_Initial,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','true',@CP_Answer_Reopener,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','true',@Interro,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','true',@Occupation,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','true',@Substitution,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','false',@Hosp_Doc,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','false',@Affidavit,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','false',@Generic_Order,SUSER_SNAME(),GETDATE()),
(@LOBId,'OutputToRe','false',@Certification,SUSER_SNAME(),GETDATE())






