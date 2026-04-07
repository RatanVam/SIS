

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class GCUserEntity : ClaimsOutputBase
    {
        public Address? PrimaryAddresseeAddress { get; set; } // PRI_ADDRESSEE_NAME
        public string SecondaryAddressee { get; set; } // SEC_ADDRESSEE_NAME
        public Address? AttorneyNameAndAddress { get; set; } // ATTNY_NAME_AUTO
        public string GreetingType { get; set; } //GRTG_TYPLST
        public string GreetingValue { get; set; } //GRTG_VAL
        public string AttentionType { get; set; } //ATTN_TYPLST
        public string AttentionValue { get; set; } //ATTN_VAL
        public AuthorDetails? AuthorDetails { get; set; } // AUTHOR_NAME
        public bool OnlyCertifiedMailIndicator { get; set; }
        public List<string> ClaimantNames { get; set; } //CLMT_NAME_
        public Address? ClaimantNameAddress { get; set; } //CLMT_NAME
        public DateTime? ClaimantNameAddressDOB { get; set; } //CLMT_NAME

        public string ClaimantNameContact { get; set; } // CLMT_NAME_CONTACT
        public string DeceasedpolicyHolderNAME { get; set; } // DECEASED_POL_HLD_NAME
        public string DenialReason { get; set; } // Denial_Reason
        public string ProviderName { get; set; } // PROVIDER
        public string SubroCarrierName { get; set; } // SUBRO_CARRIER_NAME
        public GCVehicle Vehicle { get; set; } //VEH_YR
        public GCVehicle VehicleClaimant { get; set; } //CLMT_VEH_YR

        public ReSection ReSectionDetails { get; set; } //NJM_RE_OPT
        public GCExposure ExposureDetails { get; set; } //EXPOSURE_NAME

        // Phase 2

        public string AdjusterName { get; set; } // ADJUSTERS_NAME
        public string AdjusterExt { get; set; } // ADJUSTERS_EXT
        public Address? ApplicantBenefits { get; set; } //APPLICANT_BENEFITS_NAME
        public Dictionary<string, bool> AuditDelayLst { get; set; } = new(); //ADMSN_DISCHRG_SUMM to COG_THERAPY_NOTES
        public string MiscExplanation { get; set; } // MISC_EXPLANATION

        public string ClaimantNameCompany { get; set; } // COMPANY_NAME_CONTACT_IF_NEEDED
        public string ClaimantNameContact2 { get; set; } // CLMT_NAME_CONTACT_2

        public Precert PrecertDetails { get; set; } //PRECERT_CODE_REC 

        public PrecertCompleteDetails PrecertDetailsComplete { get; set; } //PRECERT_CODE_REC

        public List<string> HealthBenefits { get; set; }//HEALTH_BEN_NOT_PROVIDED_REC
        public List<string> ImeParagraphs { get; set; }//CLMT_REQ_MRI to CHIRO_ONLY
        public List<string> ICDCodes { get; set; }//ICD9_CODE_

        public List<string> OverpaymentReason { get; set; }//OVERPYMNT_REASON
        public string OverpaymentReasonOther { get; set; }// OTH_OVERPYMNT_REASON

        public List<OverPayCheck> OverPayCheck { get; set; }// MULTI_OVERPAYMENT_REC

        public string PaymentType { get; set; }
        public Dictionary<string, bool> Paragraphs { get; set; }//TOX_PRESUMP_CHKBOX
        public string NotcausallyrelatedOther { get; set; }//NOT_CAUS_REL_OTHER_VALUE
        public string OtherDetails { get; set; }//OTHER_DETAILS1_VALUE
        public DateTime? BenefitsTerminationDate { get; set; }//BENEFITS_TERM_DT
        public string AdditionalMedicalDocumentation { get; set; }//ADDTL_MED_DOC_VALUE
        public string IMEPhysicianName { get; set; } // IME_PHYS_NAME

        public Address? PhysicianNmAndAddress { get; set; } // TRTNG_PHYS_NAME
        public string PIPData { get; set; } // PIP_DED

        //Phase 3

        public string LienholderName { get; set; } //LIENHOLDER_NAME
        public string MortgageeName { get; set; } //MORTGAGEE
        public Address? NjmHiredName { get; set; } //NJM_HIRED_IA_NAME

        public string ParentName1 { get; set; } //PARENT_NM
        public string ParentName2 { get; set; } //PARENT_NM_2
        public Address? MinorDetails { get; set; } //MINOR_NM
        public string PayeeName { get; set; } //PAYEE
        public string SupervisorName { get; set; } //SUPERVISOR_NM
        public string TortfeasorName { get; set; } //TORTFEASOR_NM
        public string TortfeasorNameInsCar { get; set; } //TORTFEASOR_INS_CAR
        public Address? VehicleOwnerAndAddress { get; set; } // VEH_OWNER_REC //VEH_OWN_NM //NJM_CC_OPT
        public bool NJMCCOpt { get; set; } //NJM_CC_OPT 
        public string VehicleOwnerName { get; set; } //VEH_OWN_NM
        public string VehicleOwnerAndInsuranceName { get; set; } //VEH_OWN_INS
        public string VehShopName { get; set; } //VEH_SHOP_NAME
        public Address? AgencyNameAndAddress { get; set; } // AGENCY_NAME,  NJM_CC_OPT
        public string SubroPartyName { get; set; } //ADVERSE_SUBRO_PTY
        public string PrimaryAddressee { get; set; } //PRI_ADDRESSEE_NAME
        public bool? OutOfPocketRental { get; set; } //OOP_RENTAL_INCLUDED
        public string SendLtrTo { get; set; }//SENDING_LTR_TO
        public SpecificRequiredInformation? SpecificRequiredInformation { get; set; }
    }

    public class AuthorDetails : Address
    {
        public string AuthorTitle { get; set; }
        public bool AuthorExecInd { get; set; }
        public string AuthorUID { get; set; }
        public string AuthorUIDArch { get; set; }
        public string AdjDirectDial { get; set; }
    }

    public class GCVehicle
    {
        public string Year { get; set; } //VEH_YR
        public string Make { get; set; } //VEH_MK
        public string Model { get; set; } //VEH_MDL
        public string VIN { get; set; } //VEH_VIN

    }

    public class GCExposure
    {
        public string Name { get; set; } // EXPOSURE_NAME
        public string ClaimentID { get; set; } // CLMT_ID
        public string ExposureType { get; set; } // EXPOSURE_TYPE
        public int? ExposureNumber { get; set; } // EXPOSURE_NUM
        public string JurisdictionState { get; set; } // JURISDICTION_STATE_AUTO
        public string Deductible { get; set; } // POL_DED_AUTO
        public string txtCashValue { get; set; } // VEH_ACTUAL_CASH_VAL
        public string OldDamageAmt { get; set; } // VEH_OLD_DAMAGE_AMT
        public string SalvageSubTotal { get; set; } // SALV_SUB_TOTL
        public string TaxAmount { get; set; } // TAX_AMT
        public string SalvageValue { get; set; } //SALV_VALUE
        public string SalvagePDDed { get; set; } //SALV_PD_DED
        public string SalvageOther { get; set; } //SALV_OTHER
        public string SalvageNetSet { get; set; } //SALV_NET_SETTL
        public string SalvageVehYear { get; set; } //SALV_VEH_YEAR
        public string SalvageVehMake { get; set; } //SALV_VEH_MAKE
        public string SalvageVehModel { get; set; } //SALV_VEH_MODEL
        public string TotalLossEst { get; set; } //TOTL_LOSS_EST_AMT
        public string SalvageTypeLoss { get; set; } //SALV_TYPE_LOSS
        public bool Represented { get; set; } //REPRESENT_STATUS

    }

    public class PrecertCompleteDetails : Precert
    {

        public string ProviderSys { get; set; } //PROVIDER_SYS

        public string providerPhn { get; set; } //PROVIDER_PHONE
        public string TreatmntStatus { get; set; } //DETMNTN_OB_KW
        public DateTime ServiceDate { get; set; } //SERVICE_DT_CAL

        public List<Determint> Determints { get; set; } // DETERMNT_ID_REC
    }

    public class Determint //DETERMNT_ID_REC
    {
        public int TotalTreatmentsApproved { get; set; } //TOTAL_TREAT_APPR
        public string TreatmentReason { get; set; } //TRMNT_REASON
        public string TreatmentStatus { get; set; } //TRMNT_STATUS
        public bool PresentStatus { get; set; } //APPEAL_STATUS
        public string Code { get; set; } //DETERMNT_CODE

        public List<Procedure> Procedures { get; set; }    //PROCEDURE_CODE_REC
    }

    public class Procedure //PROCEDURE_CODE_REC
    {
        public string StartCode { get; set; } //PRECERT_START_CODE
        public string EndCode { get; set; } //PRECERT_END_CODE
        public string DeterminationId { get; set; } //DETERMNT_CODE_PROC
        public string PrecertificationId { get; set; } //PRECERT_ID_PROC
        public string UserDefinedGroup { get; set; } //PRECERT_USER_DEF_GROUP
    }

    public class Precert //PRECERT_CODE_REC
    {
        public string ID { get; set; }  // PRECERT_ID
        public string OBKW { get; set; } //PRECERT_ID_OB_KW
        public DateTime StartDate { get; set; } //PRECERT_START_DATE
        public DateTime EndDate { get; set; } //PRECERT_END_DATE
    }

    public class ReSection
    {
        public string LossLocation { get; set; } // Loss Location:
        public string YourClaimNo { get; set; } //
        public string YourPolicyNo { get; set; } //
        public string YourInsured { get; set; } //
        public string YourClient { get; set; } //
        public string CaseCaption { get; set; } //
        public string YourFileNo { get; set; } //
        public string DateofService { get; set; } //
        public string Claimant { get; set; } //Claimant
    }

    public class SpecificRequiredInformation
    {
        public bool CompletedAffidavitOfNoInsurance { get; set; } //COMP_AONI
        public bool CompletedPipApplication { get; set; } //COMP_PIP_APP
        public bool IdentificationDocuments { get; set; } //ID_DOCS
        public bool MarriageLicense { get; set; } //MARRIAGE_LICENSE
        public bool ProofOfResidency { get; set; } //PROOF_OF_RESIDENCY
    }
}
