

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class WCCUserEntity : ClaimsOutputBase
    {

        public Address AttorneyDetails { get; set; } //MatterCounselNJMAttorneyName //NJM_ATTORNEY_SYS
        public bool AttorneyDetailsMatterCounsel { get; set; }//MatterCounselNJMAttorneyName
        public Address ClaimantAttorneyDetails { get; set; }  //CLMT_ATTORNEY_NAME 
        public List<Address> ProviderDetails { get; set; } //MULTIPLE_PROVIDER //PROVIDER_NM_MULTI
        public Address Provider { get; set; } //PROVIDER
        public Address ProviderName { get; set; } //PROVIDER_NAME
        public string OutsideLawFirmName { get; set; } //OUTSD_LAW_FIRM_NAME
        public string ClaimantName { get; set; } //CLMT_NAME
        public string LawFirmName { get; set; } //LAW_FIRM
        public List<string> Interrogatories { get; set; } //INTERR_RCVR
        public Address AttorneyNameAndAddress { get; set; }  //OUTSD_ATTORNEY_NAME
        public string PolicyNum { get; set; } //RE_OPT_VAL - Policy Number
        public string MPCapplicant { get; set; } //MPC_APPLICANT
        public string ClaimPetNum { get; set; } //RE_OPT_VAL  -Claim Petition Number
        public string StateNum { get; set; } //RE_OPT_VAL -  State ID Number
        public string DocketNum { get; set; }//RE_OPT_VAL - Docket Number
        public string ListDate { get; set; }//RE_OPT_VAL - Listing Date
        public string NYWCBnum { get; set; }//RE_OPT_VAL -  NY WCB Number
        public string RefNum { get; set; }//RE_OPT_VAL - Reference Number
        public string CMSCaseCtrl { get; set; } //CMS_CASE_CNTRL_NO
        public string DocType { get; set; } //OUTBND_DOCTYPE
        public List<string> ClaimPetNumList { get; set; }//CLM_PETITION_NO
        public string ClaimPetNumText { get; set; }//CLM_PET_NUM_MANUAL
        public Author AuthorDetails { get; set; }
        public Addressee primaryAddressee { get; set; }
        public string secondaryAddresseeName { get; set; } //SEC_ADDRESSEE_NAME
        public Greeting Greeting { get; set; }
        public LegalDetails LegalInfo  { get; set; }

        //Phase 2
        public Address RoleAutherAddressee { get; set; } //PRI_ADDRESSEE_NAME //PRI_ADDRESSEE_PHN_NUM
        public Address AdjrCaseMngrDetails { get; set; } //ADJ_AND_CASE_MGR_NAME
        public Address NurseCaseMngrDetails { get; set; } //NURSE_CASE_MGR_NM
        public string BoardWNumber { get; set; } //BOARD_W_NUMBER
        public Address DoctorDetails { get; set; } //PHYS_NAME //PHYS_ADDR_1//PHYS_COUNTRY//CLMT_PHYS_NM //PHYS_PHN etc
        public bool SpecailDoctorDetails { get; set; } //CLMT_PHYS_NM
        public string RecipientCC { get; set; } //CC_RECIPIENT2
        public string ToWCC { get; set; } //TO_WCC
        public List<string> ReasonsForDenial { get; set; } //REASON_DENIAL
        public Addressee ExamInfo { get; set; } //SNE_NAME//SNE_ST_ADDR_1 //SNE_ATTN_TYPLST//SNE_ATTN_VAL

        public bool ClaimPetitionNumber { get; set; } // For Claim Petition Numbers

        //Phase 3

        public Address ReferredDetails { get; set; } //REFERRED_BY
        public string PrecertID { get; set; }
        public PrecertInformation PrecertDetails { get; set; } //ADMISS_STATUS
        public List<CharDetails> CharDetailsList { get; set; } // NJM_CHART_DATA
        public Address PayableToDetails { get; set; }  //CHK_PAYABLE_TO MAIL_TO_ADDR1 
        public List<Address> FiveProviderDetails { get; set; } //WCCFiveProviderNmAndAddress //PROVIDER //PROV_ST_ADDR1 //PROV_CTY //PROVIDER_PHN_NUM
        public string ClaimantDependent { get; set; }//CLMT_DEPENDENT_SYS
        public string GuardianName { get; set; }//GUARDIAN_NM
        public string SurgeryCommentsAdditionalInformation  { get; set; } // SURGERY_COMMENTS_ADDL_INFO
        public Dictionary<string,bool> SurgicalLst { get; set; } //WccSurgicalCheckboxLst NOT_CLINIC_SUP_MED_NECESSARY to LACK_CONSERV_CARE_SUP_MED_NECESSITY
        public List<DME> DMEs { get; set; } //DME
        public Address HospitalDetails { get; set; } //HOSP_NAME
        public Address Witness { get; set; } //WITNESS_NAME WITNESS_PHN
        public List<string> CheckAmount { get; set; } //CHK_AMT_ //CHK_AMT_1
        public PhysicalTherapyDetails PhysicalTherapyInfo { get; set; } //PHYSICAL_THERAPY
        public List<string> AdditionalTreatment { get; set; } //INFO_ADD_TRTMNT
        public string AdditionalTreatmentOther { get; set; } //INFO_ADD_TRTMNT Other
        public string ALLLawFirmName { get; set; } //ALL_LAW_FIRMS

        public List<string> OverPaymentReason { get; set; } //OVERPYMNT_REASON
        public string OverPaymentOther { get; set; } //OTH_OVERPYMNT_REASON Other
        public string OverPaymentType { get; set; }//OVERPYMNT_TYPE
        public List<OverPayCheck> OverPayCheck { get; set; } //MULTI_OVERPAYMENT_REC
        public double TotalCheckAmount { get; set; }//TOT_CHK_AMT

        public DateTime? DateOfService { get; set; }//DT_OF_SERVICE
        public DateTime? TimeOfService { get; set; }  //EXAM_TIME

        //CLMT_EXAM_DAY


    }

    public class Greeting
    {
        public string Type { get; set; }//GRTG_TYPLST
        public string Value { get; set; }//GRTG_VAL
    }

    public class Addressee
    {
        public string Name { get; set; } //PRI_ADDRESSEE_NAME
        public Address Address { get; set; }
        //PRI_ADDRESSEE_ADDR_1
        //PRI_ADDRESSEE_ADDR_2
        //PRI_ADDRESSEE_ADDR_3
        //PRI_ADDRESSEE_CTY
        //PRI_ADDRESSEE_ST
        //PRI_ADDRESSEE_ZIP
        //PRI_ADDRESSEE_POSTNET_INFO
        //PRI_ADDRESSEE_COUNTRY
        public Attention Attention { get; set; }
    }

    public class Attention
    {
        public string Type { get; set; }//ATTN_TYPLST
        public string Value { get; set; }//ATTN_VAL

    }

    public class Author
    {
        public string CompletedName { get; set; } //AUTH_NAME_CLOSING_FOR_MANUAL
        public string Name { get; set; } //AUTHOR_NAME
        public string Email { get; set; } //AUTHOR_EMAIL
        public string Fax { get; set; }//AUTHOR_FAX
        public string Title { get; set; }//AUTHOR_TITL
        public string WorkPhn { get; set; }//AUTHOR_WORK_PHN
        public string WorkExt { get; set; }//AUTHOR_WORK_EXT
        public string Creds { get; set; }//AUTHOR_CREDS
        public string ExecInd { get; set; }//AUTHOR_EXEC_IND
        public string Uid { get; set; }//AUTHOR_UID
        public string Uid_Arch { get; set; }//AUTHOR_UID_ARCH
    }
 
    public class CCAddress
    {
        public string Addr1 { get; set; }//CC_ADDRESSEE_ADDR_1;
        public string Addr2 { get; set; }//CC_ADDRESSEE_ADDR_2
        public string City { get; set; }//CC_ADDRESSEE_CTY
        public string State { get; set; }//CC_ADDRESSEE_ST
        public string Zip { get; set; }//CC_ADDRESSEE_ZIP
        public string PostNet { get; set; }//CC_ADDRESSEE_POSTNET_INFO
    }


    public class LegalDetails
    {
        public string CourtAddress { get; set; } //COURT_ADDRESS_1
        public string CourtCity { get; set; } //COURT_CITY
        public string CourtZipCode { get; set; } //COURT_ZIP
        public string CourtHearingTime { get; set; } //HEARING_TIME
        public string CourtResponseTime { get; set; } //RESPONSE_TIME
        public string CourtJudgeName { get; set; } //JUDGE_NAME
        public string CourtHearingMonth { get; set; } //HEARING_MONTH
        public string CourHearingDay { get; set; } //HEARING_DAY
        public string CourtHearingYear { get; set; } //HEARING_YR
        public string CourtCourtDayWeek { get; set; } //COURT_DAY
        public DateTime? CourtDate { get; set; } //COURT_DATE
        public DateTime? CourtResponseDate { get; set; } //RESPONSE_DATE
    }

    public class PrecertInformation
    {
        public string PreCertificationNumbe { get; set; } //Used for getting all the Procedures for this Precert. [Inspire builder need to use it.]
        public string AdmissionStatus { get; set; } //ADMISS_STATUS
        public string ProvidertaxNumber { get; set; } //PROVIDE_TAX_ID_AUTO
        public string PreSurgeryDate { get; set; } //SURGERY_DT
        public string PreAuthorizedStatus { get; set; } //SURGERY_STATUS
        public string ProviderName { get; set; } //PROVIDER_NAME
        public string FacilityName { get; set; } //FACIL_NAME

        public List<PrecertProcedures> PrecertProcedureList { get; set; } = new (); //PROCEDURE
    }

    public class PrecertProcedures
    {
        public string AssistantType { get; set; } //ASSIST_TYPE
        public string CoSurgeonStatus { get; set; } //COSURG_STATUS
        public string ProcedureCode { get; set; } //PROCED_CODES
        public string AssistantStatus { get; set; } //ASSIST_STATUS
    }

    public class CharDetails
    {
        public string Chartlable { set; get; } //CHART_TITLE
        public List<string> Lable { set; get; } = new List<string>(); //CHART_LABEL
        public List<string> Value { set; get; } = new List<string>();// CHART_VALUE
    }

    public class DME
    {
        public string DMENotes { get; set; }//DME_NOTES
        public string EquipmentDetails { get; set; }//EQUIP_DETAILS
        public string EquipmentStatus { get; set; }//EQUIP_STATUS
    }

    public class PhysicalTherapyDetails//PHYSICAL_THERAPY
    {
        public string Service { get; set; }//SERVICE", ServiceT
        public string PrimaryBodyPart { get; set; }// PRIMARY_BODY_PART"
        public string DetailedBodyPart { get; set; }// DETAILED_BODY_PART
        public string Cerrification { get; set; }//CERTIFICATION", Ce
        public string RequestedVisits { get; set; }//REQUESTED_VISITS",
        public string TotalVisits { get; set; }//TOTAL_VISITS", Tot
        public string AutherNumberVisits { get; set; }//AUTH_NUM_VISITS", 
        public string AprovalStatus { get; set; }// APPROVAL_STATUS", 
        public string DiagnosisCode { get; set; }//DIAGNOSIS_CODE", D
    }

}
