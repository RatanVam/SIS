/****** Script for SelectTopNRows command from SSMS  ******/

  Declare @documentID int = -999 
  Declare @lobID integer
  Declare @CancelWithdrawalReasons varchar(50) = 'CancelWithdrawalReasons'
  Declare @UnderlyingPolicy varchar(50) = 'UnderlyingPolicy'
  Declare @AdverseDataSourc varchar(50) = 'AdverseDataSourc'
  Declare @MidtermCancelReasons varchar(50) = 'MidtermCancelReasons'
  Declare @MidtermCancelPolicy varchar(50) = 'MidtermCancelPolicy'
  Declare @NonrenewalReasons varchar(50) = 'NonrenewalReasons'


  Declare @NoticeofNonrenewalReasons varchar(50) = 'NoticeofNonrenewalReasons'
  Declare @MidtermCancellationReasons varchar(50) = 'MidtermCancellationReasons'
  Declare @NonrenewalWithdrawalReasons varchar(50) = 'NonrenewalWithdrawalReasons'

  select @lobID =  LOBId from LOB where LOBName = 'PC-UMB'

 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID,@lobID,@CancelWithdrawalReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@UnderlyingPolicy,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@AdverseDataSourc,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@MidtermCancelReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@MidtermCancelPolicy,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@NonrenewalReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@NoticeofNonrenewalReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@MidtermCancellationReasons,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@NonrenewalWithdrawalReasons,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @CancelWithdrawalReasonsID integer
Select @CancelWithdrawalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @CancelWithdrawalReasons
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,InspireTag)
Values
('Driving Record','Driving Record',@CancelWithdrawalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null,null),
('No Longer Licensed','No Longer Licensed',@CancelWithdrawalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null,null),
('Obtained Underlying Policies','Obtained Underlying Policies',@CancelWithdrawalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null,null),
('Inspection','Inspection',@CancelWithdrawalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null,null),
('Geographic','Geographic',@CancelWithdrawalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null,null),
('Claims-No Longer in Household','Claims-No Longer in Household',@CancelWithdrawalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null,null),
('Renewed in Error','Renewed in Error',@CancelWithdrawalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null,null),
('Reconsideration','Reconsideration',@CancelWithdrawalReasonsID,800,SUSER_SNAME(),GETDATE(),null,null,null)


Declare @UnderlyingPolicyID integer
Select @UnderlyingPolicyID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @UnderlyingPolicy

insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,InspireTag)
Values
('an Automobile','an Automobile',@UnderlyingPolicyID,100,SUSER_SNAME(),GETDATE(),null,null,null),
('a Homeowner','a Homeowner',@UnderlyingPolicyID,200,SUSER_SNAME(),GETDATE(),null,null,null),
('an Automobile and/or a Homeowner','an Automobile and/or a Homeowner',@UnderlyingPolicyID,300,SUSER_SNAME(),GETDATE(),null,null,null)



Declare @AdverseDataSourcID integer
Select @AdverseDataSourcID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @AdverseDataSourc

insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,InspireTag)
Values
('MVR','MVR',@AdverseDataSourcID,100,SUSER_SNAME(),GETDATE(),null,null,null),
('CLUE','CLUE',@AdverseDataSourcID,200,SUSER_SNAME(),GETDATE(),null,null,null),
('NJM','NJM',@AdverseDataSourcID,300,SUSER_SNAME(),GETDATE(),null,null,null),
('CUST','CUST',@AdverseDataSourcID,400,SUSER_SNAME(),GETDATE(),null,null,null)


--
Declare @MidtermCancelReasonsID integer
Select @MidtermCancelReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @MidtermCancelReasons
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,InspireTag)
Values
('Driving Record','Driving Record',@MidtermCancelReasonsID,100,SUSER_SNAME(),GETDATE(),null,null,null),
('No Underlying Policy','No Underlying Policy',@MidtermCancelReasonsID,200,SUSER_SNAME(),GETDATE(),null,null,null),
('Inspection-Property','Inspection-Property',@MidtermCancelReasonsID,300,SUSER_SNAME(),GETDATE(),null,null,null),
('Inspection-Vacant Land','Inspection-Vacant Land',@MidtermCancelReasonsID,400,SUSER_SNAME(),GETDATE(),null,null,null),
('Geographic','Geographic',@MidtermCancelReasonsID,500,SUSER_SNAME(),GETDATE(),null,null,null),
('Claims','Claims',@MidtermCancelReasonsID,600,SUSER_SNAME(),GETDATE(),null,null,null)


--,,,,
Declare @MidtermCancelPolicyID integer
Select @MidtermCancelPolicyID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @MidtermCancelPolicy
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,InspireTag)
Values
('Personal Automobile policy','Personal Automobile policy',@MidtermCancelPolicyID,100,SUSER_SNAME(),GETDATE(),null,null,null),
('Commercial Automobile policy','Commercial Automobile policy',@MidtermCancelPolicyID,200,SUSER_SNAME(),GETDATE(),null,null,null),
('Property policy','Property policy',@MidtermCancelPolicyID,300,SUSER_SNAME(),GETDATE(),null,null,null),
('Personal Automobile and Property policies','Personal Automobile and Property policies',@MidtermCancelPolicyID,400,SUSER_SNAME(),GETDATE(),null,null,null),
('Commercial Automobile and Property policies','Commercial Automobile and Property policies',@MidtermCancelPolicyID,500,SUSER_SNAME(),GETDATE(),null,null,null)

--Driving Record,No Underlying Policy,Inspection,Geographic,Claims (HO, UMB)
Declare @NonrenewalReasonsID integer
Select @NonrenewalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NonrenewalReasons
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,InspireTag)
Values
('Driving Record','Driving Record',@NonrenewalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null,null),
('No Underlying Policy','No Underlying Policy',@NonrenewalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null,null),
('Inspection','Inspection',@NonrenewalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null,null),
('Geographic','Geographic',@NonrenewalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null,null),
('Claims (HO, UMB)','Claims (HO, UMB)',@NonrenewalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null,null)



Declare @NoticeofNonrenewalReasonsID integer
Select @NoticeofNonrenewalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NoticeofNonrenewalReasons
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Auto-No NJM Auto Policy','No Underlying Auto Policy','NO_UND_AUTO_POL',@NoticeofNonrenewalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Property-No NJM Property Policy','No Underlying Property Policy','NO_UNDERLYING_PROPERTY_POLICY',@NoticeofNonrenewalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Property-Non-Residential','Property Non Residential','PROPERTY_NON_RESIDENTIAL',@NoticeofNonrenewalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Property-More than 4 Families/2 Roomers','Property More 4 Fam 2 Room','PROPERTY_MORE_4_FAM_2_ROOM',@NoticeofNonrenewalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Property-Business Use','Property Business Use','PROPERTY_BUSINESS_USE',@NoticeofNonrenewalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Property-Farm Use','Property Farm Use','PROPERTY_FARM_USE',@NoticeofNonrenewalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Property-Rental Properties','Property Rental Properties','PROPERTY_RENTAL_PROPERTIES',@NoticeofNonrenewalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Property-Animal Caused Damages','Property Animal Caused Damages','PROPERTY_ANIMAL_CAUSED_DAMAGES',@NoticeofNonrenewalReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Property-Animal Breeding or Boarding','Property Animal Breeding Boarding','PROPERTY_ANIMAL_BREEDING_BOARDING',@NoticeofNonrenewalReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Property-Damage Not Repaired','Property Damage Not Repaired','PROPERTY_DAMAGE_NOT_REPAIRED',@NoticeofNonrenewalReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Property-Unsecured Pool','Property Unsecured Pool','PROPERTY_UNSECURED_POOL',@NoticeofNonrenewalReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Property-Evidence of Neglect','Property Evidence of Neglect','PROPERTY_EVIDENCE_OF_NEGLECT',@NoticeofNonrenewalReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Failure to Provide Underwriting Information','Failure Provide UW Info','FAILURE_PROVIDE_UW_INFO',@NoticeofNonrenewalReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),
('Moral Hazard-Destruction of Property','Moral Hazard Destruction of Property','MORAL_HAZARD_DESTRUCTION_OF_PROPERTY',@NoticeofNonrenewalReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),
('Moral Hazard-Increases Probability of Loss','Moral Hazard Increased Probability of Loss','MORAL_HAZARD_INCREASED_PROBABILITY_OF_LOSS',@NoticeofNonrenewalReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null),
('Fraud/Misrepresentation During Application Process','Fraud Misrepresentation','FRAUD_MISREPRESENTATION',@NoticeofNonrenewalReasonsID,1600,SUSER_SNAME(),GETDATE(),null,null),
('Insurability of Risk','Insurability of Risk','INSURABILITY_OF_RISK',@NoticeofNonrenewalReasonsID,1700,SUSER_SNAME(),GETDATE(),null,null),
('Lack of Cooperation','Lack of Cooperation','LACK_OF_COOPERATION',@NoticeofNonrenewalReasonsID,1800,SUSER_SNAME(),GETDATE(),null,null),
('Fraud','Fraud','FRAUD',@NoticeofNonrenewalReasonsID,1900,SUSER_SNAME(),GETDATE(),null,null),
('Failure to Comply with Regulations','Failure Comply w Reg','FAILURE_COMPLY_W_REG',@NoticeofNonrenewalReasonsID,2000,SUSER_SNAME(),GETDATE(),null,null),
('Substantial Change or Increased Hazard','Substantial Change Inc Hazard','SUBSTANTIAL_CHANGE_INC_HAZARD',@NoticeofNonrenewalReasonsID,2100,SUSER_SNAME(),GETDATE(),null,null),
('Negligence','Negligence','NEGLIGENCE',@NoticeofNonrenewalReasonsID,2200,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-At Fault Accidents','Driving Record-At Fault Accidents',null,@NoticeofNonrenewalReasonsID,2300,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-All Other Claims','Driving Record All Other Claims',null,@NoticeofNonrenewalReasonsID,2400,SUSER_SNAME(),GETDATE(),null,null),
('Driving Record-Motor Vehicle History','Driving Record Motor Vehicle History',null,@NoticeofNonrenewalReasonsID,2500,SUSER_SNAME(),GETDATE(),null,null),
('At-fault accident/Violations','At-fault accident/Violations',null,@NoticeofNonrenewalReasonsID,2600,SUSER_SNAME(),GETDATE(),null,null),
('Free Form Entry','Free Form Indicator',null,@NoticeofNonrenewalReasonsID,2700,SUSER_SNAME(),GETDATE(),null,null)

Declare @MidtermCancellationReasonsID integer
Select @MidtermCancellationReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @MidtermCancellationReasons
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Auto-No NJM Auto Policy','No Underlying Auto Policy','NO_UND_AUTO_POL',@MidtermCancellationReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Auto-Driving Record','Driver Records',null,@MidtermCancellationReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Property-No NJM Property Policy','No Underlying Property Policy','NO_UNDERLYING_PROPERTY_POLICY',@MidtermCancellationReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Property-Non-Residential','Property Non Residential','PROPERTY_NON_RESIDENTIAL',@MidtermCancellationReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Property-More than 4 Families/2 Roomers','Property More 4 Fam 2 Room','PROPERTY_MORE_4_FAM_2_ROOM',@MidtermCancellationReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Property-Business Use','Property Business Use','PROPERTY_BUSINESS_USE',@MidtermCancellationReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Property-Farm Use','Property Farm Use','PROPERTY_FARM_USE',@MidtermCancellationReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Property-Rental Properties','Property Rental Properties','PROPERTY_RENTAL_PROPERTIES',@MidtermCancellationReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Property-Animal Caused Damages','Property Animal Caused Damages','PROPERTY_ANIMAL_CAUSED_DAMAGES',@MidtermCancellationReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Property-Animal Breeding or Boarding','Property Animal Breeding Boarding','PROPERTY_ANIMAL_BREEDING_BOARDING',@MidtermCancellationReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Property-Damage Not Repaired','Property Damage Not Repaired','PROPERTY_DAMAGE_NOT_REPAIRED',@MidtermCancellationReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Property-Unsecured Pool','Property Unsecured Pool','PROPERTY_UNSECURED_POOL',@MidtermCancellationReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Property-Evidence of Neglect','Property Evidence of Neglect','PROPERTY_EVIDENCE_OF_NEGLECT',@MidtermCancellationReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),
('Failure to Provide Underwriting Information','Failure Provide UW Info','FAILURE_PROVIDE_UW_INFO',@MidtermCancellationReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),
('Moral Hazard-Destruction of Property','Moral Hazard Destruction of Property','MORAL_HAZARD_DESTRUCTION_OF_PROPERTY',@MidtermCancellationReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null),
('Moral Hazard-Increases Probability of Loss','Moral Hazard Increased Probability of Loss','MORAL_HAZARD_INCREASED_PROBABILITY_OF_LOSS',@MidtermCancellationReasonsID,1600,SUSER_SNAME(),GETDATE(),null,null),
('Fraud/Misrepresentation During Application Process','Fraud Misrepresentation','FRAUD_MISREPRESENTATION',@MidtermCancellationReasonsID,1700,SUSER_SNAME(),GETDATE(),null,null),
('Insurability of Risk','Insurability of Risk','INSURABILITY_OF_RISK',@MidtermCancellationReasonsID,1800,SUSER_SNAME(),GETDATE(),null,null),
('Lack of Cooperation','Lack of Cooperation','LACK_OF_COOPERATION',@MidtermCancellationReasonsID,1900,SUSER_SNAME(),GETDATE(),null,null),
('Fraud','Fraud','FRAUD',@MidtermCancellationReasonsID,2000,SUSER_SNAME(),GETDATE(),null,null),
('Failure to Comply with Regulations','Failure Comply w Reg','FAILURE_COMPLY_W_REG',@MidtermCancellationReasonsID,2100,SUSER_SNAME(),GETDATE(),null,null),
('Substantial Change or Increased Hazard','Substantial Change Inc Hazard','SUBSTANTIAL_CHANGE_INC_HAZARD',@MidtermCancellationReasonsID,2200,SUSER_SNAME(),GETDATE(),null,null),
('Negligence','Negligence','NEGLIGENCE',@MidtermCancellationReasonsID,2300,SUSER_SNAME(),GETDATE(),null,null),
('Suspended, revoked, expired DL','Suspended Expired Revoked','SuspendedExpiredRevoked',@MidtermCancellationReasonsID,2400,SUSER_SNAME(),GETDATE(),null,null),
('Free Form Entry','Free Form Indicator','FREE_FORM_IND',@MidtermCancellationReasonsID,2500,SUSER_SNAME(),GETDATE(),null,null)


Declare @NonrenewalWithdrawalReasonsID integer
Select @NonrenewalWithdrawalReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @NonrenewalWithdrawalReasons

insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,InspireTag)
Values
('Driving Record','Driving Record',@NonrenewalWithdrawalReasonsID,100,SUSER_SNAME(),GETDATE(),null,null,null),
('No Longer Licensed','No Longer Licensed',@NonrenewalWithdrawalReasonsID,200,SUSER_SNAME(),GETDATE(),null,null,null),
('Obtained Underlying Policies','Obtained Underlying Policies',@NonrenewalWithdrawalReasonsID,300,SUSER_SNAME(),GETDATE(),null,null,null),
('Inspection','Inspection',@NonrenewalWithdrawalReasonsID,400,SUSER_SNAME(),GETDATE(),null,null,null),
('Geographic','Geographic',@NonrenewalWithdrawalReasonsID,500,SUSER_SNAME(),GETDATE(),null,null,null),
('Claims-No Longer in Household','Claims-No Longer in Household',@NonrenewalWithdrawalReasonsID,600,SUSER_SNAME(),GETDATE(),null,null,null),
('Renewed in Error','Renewed in Error',@NonrenewalWithdrawalReasonsID,700,SUSER_SNAME(),GETDATE(),null,null,null),
('Reconsideration','Reconsideration',@NonrenewalWithdrawalReasonsID,800,SUSER_SNAME(),GETDATE(),null,null,null)





             