namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.GC
{
    public class GCInspireEntity : InspireBase
    {
        public CUSTOMER_DATA CustomerData { get; set; } = new CUSTOMER_DATA();
    }


    // NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
    
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class CUSTOMER_DATA
    {

        private CUSTOMER_DATARECORD_DELIM rECORD_DELIMField = new CUSTOMER_DATARECORD_DELIM();       
        public CUSTOMER_DATARECORD_DELIM RECORD_DELIM
        {
            get
            {
                return this.rECORD_DELIMField;
            }
            set
            {
                this.rECORD_DELIMField = value;
            }
        }
    }

    
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIM
    {

        private CUSTOMER_DATARECORD_DELIMNJM_CLAIM_REC nJM_CLAIM_RECField = new CUSTOMER_DATARECORD_DELIMNJM_CLAIM_REC();

        private List<CUSTOMER_DATARECORD_DELIMENDRS_NUM_W_ED_DT_REC> eNDRS_NUM_W_ED_DT_RECField = new List<CUSTOMER_DATARECORD_DELIMENDRS_NUM_W_ED_DT_REC>();

        private List<CUSTOMER_DATARECORD_DELIMHSB_END_REC> eHSBNDRS_NUM_W_ED_DT_RECField = new List<CUSTOMER_DATARECORD_DELIMHSB_END_REC>();
        
        private List<CUSTOMER_DATARECORD_DELIMNJM_RE_OPT> nJM_RE_OPTField = new List<CUSTOMER_DATARECORD_DELIMNJM_RE_OPT>();

        private List<CUSTOMER_DATARECORD_DELIMNJM_CC_OPT> nJM_CC_OPTField = new List<CUSTOMER_DATARECORD_DELIMNJM_CC_OPT>();

        private List<CUSTOMER_DATARECORD_DELIMHEALTH_BEN_NOT_PROVIDED_REC> hEALTH_BEN_NOT_PROVIDED_RECField = new List<CUSTOMER_DATARECORD_DELIMHEALTH_BEN_NOT_PROVIDED_REC>();
        private CUSTOMER_DATARECORD_DELIMSALVAGE_REP dATARECORD_DELIMSALVAGE_REP = new CUSTOMER_DATARECORD_DELIMSALVAGE_REP();


        private List<CUSTOMER_DATARECORD_DELIMVEHICLE_DESC> nJM_Vehicle_DescField = new List<CUSTOMER_DATARECORD_DELIMVEHICLE_DESC>();

        private List<GC_DATARECORD_OVER_PAYMENT_REC_DATA> nJM_OverPaymentField = new List<GC_DATARECORD_OVER_PAYMENT_REC_DATA>();

        private GC_DATARECORD_PRECERT_CODE_REC nJM_Pre_Cert_Rec = new GC_DATARECORD_PRECERT_CODE_REC();
        
        private List<GC_DATARECORD_DETERMNT_ID_REC> nJM_Detement_Cert_Rec = new List<GC_DATARECORD_DETERMNT_ID_REC>();
        
        private List<GC_DATARECORD_PROCEDURE_CODE_REC> nJM_Procedure_Cert_Rec = new List<GC_DATARECORD_PROCEDURE_CODE_REC>();

        private List<GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC> nJM_Multi_Overpayment_Rec = new List<GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC>();

        private GC_DATARECORD_VEHICLE_OWNER_REC nJM_vEHICLE_oWNER_Rec = new GC_DATARECORD_VEHICLE_OWNER_REC();
        

        public CUSTOMER_DATARECORD_DELIMNJM_CLAIM_REC NJM_CLAIM_REC
        {
            get
            {
                return this.nJM_CLAIM_RECField;
            }
            set
            {
                this.nJM_CLAIM_RECField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ENDRS_NUM_W_ED_DT_REC")]
        public List<CUSTOMER_DATARECORD_DELIMENDRS_NUM_W_ED_DT_REC> ENDRS_NUM_W_ED_DT_REC
        {
            get
            {
                return this.eNDRS_NUM_W_ED_DT_RECField;
            }
            set
            {
                this.eNDRS_NUM_W_ED_DT_RECField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("HSB_END_REC")]
        public List<CUSTOMER_DATARECORD_DELIMHSB_END_REC> HSB_END_REC
        {
            get
            {
                return this.eHSBNDRS_NUM_W_ED_DT_RECField;
            }
            set
            {
                this.eHSBNDRS_NUM_W_ED_DT_RECField = value;
            }
        }




        [System.Xml.Serialization.XmlElementAttribute("SALVAGE_REP")]

        public CUSTOMER_DATARECORD_DELIMSALVAGE_REP SALVAGE_REP
        {
            get
            {
                return this.dATARECORD_DELIMSALVAGE_REP;
            }
            set
            {
                this.dATARECORD_DELIMSALVAGE_REP = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("VEH_DESC")]
        public List<CUSTOMER_DATARECORD_DELIMVEHICLE_DESC> VEH_DESC
        {
            get
            {
                return this.nJM_Vehicle_DescField;
            }
            set
            {
                this.nJM_Vehicle_DescField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("NJM_RE_OPT")]
        public List<CUSTOMER_DATARECORD_DELIMNJM_RE_OPT> NJM_RE_OPT
        {
            get
            {
                return this.nJM_RE_OPTField;
            }
            set
            {
                this.nJM_RE_OPTField = value;
            }
        }
  
        [System.Xml.Serialization.XmlElementAttribute("NJM_CC_OPT")]
        public List<CUSTOMER_DATARECORD_DELIMNJM_CC_OPT> NJM_CC_OPT
        {
            get
            {
                return this.nJM_CC_OPTField;
            }
            set
            {
                this.nJM_CC_OPTField = value;
            }
        }
   
        [System.Xml.Serialization.XmlElementAttribute("HEALTH_BEN_NOT_PROVIDED_REC")]
        public List<CUSTOMER_DATARECORD_DELIMHEALTH_BEN_NOT_PROVIDED_REC> HEALTH_BEN_NOT_PROVIDED_REC
        {
            get
            {
                return this.hEALTH_BEN_NOT_PROVIDED_RECField;
            }
            set
            {
                this.hEALTH_BEN_NOT_PROVIDED_RECField = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("OVERPAYMENT_PARENT_REC")]
        public List<GC_DATARECORD_OVER_PAYMENT_REC_DATA> OVERPAYMENT_PARENT_REC
        {
            get
            {
                return this.nJM_OverPaymentField;
            }
            set
            {
                this.nJM_OverPaymentField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("PRECERT_CODE_REC")]
        public GC_DATARECORD_PRECERT_CODE_REC PRECERT_CODE_REC
        {
            get
            {
                return this.nJM_Pre_Cert_Rec;
            }
            set
            {
                this.nJM_Pre_Cert_Rec = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("DETERMNT_ID_REC")]
        public List<GC_DATARECORD_DETERMNT_ID_REC> DETERMNT_ID_REC
        {
            get
            {
                return this.nJM_Detement_Cert_Rec;
            }
            set
            {
                this.nJM_Detement_Cert_Rec = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("VEH_OWNER_REC")]
        public GC_DATARECORD_VEHICLE_OWNER_REC VEH_OWNER_REC
        {
            get
            {
                return this.nJM_vEHICLE_oWNER_Rec;
            }
            set
            {
                this.nJM_vEHICLE_oWNER_Rec = value;
            }
        }
        

        [System.Xml.Serialization.XmlElementAttribute("PROCEDURE_CODE_REC")]
        public List<GC_DATARECORD_PROCEDURE_CODE_REC> PROCEDURE_CODE_REC
        {
            get
            {
                return this.nJM_Procedure_Cert_Rec;
            }
            set
            {
                this.nJM_Procedure_Cert_Rec = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("MULTI_OVERPAYMENT_REC")]
        public List<GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC> MULTI_OVERPAYMENT_REC
        {
            get
            {
                return this.nJM_Multi_Overpayment_Rec;
            }
            set
            {
                this.nJM_Multi_Overpayment_Rec = value;
            }
        }
        
    }

    
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMNJM_CLAIM_REC
    {

        public string CLM_PK
        {
            get;set;            
        }
       
        public string SRC_SYS
        {
                get; set;
        }
        
        public string POL_ST
        {
            get; set;
        }
        
        public string POL_NO
        {
            get; set;
        }
        
        public string POL_TYPE
        {
            get; set;
        }
        public string LOC_STATE
        { get; set; }

        public string CLM_NO
        {
            get; set;
        }
        
        public string INS_POL_HLD_NAME_1
        {
            get; set;
        }
       
        public string INS_POL_HLD_NAME_2
        {
            get; set;
        }
        public string INS_POL_HLD_NAME_3
        {
            get; set;
        }
    public string CLM_LOSS_ST
        {
            get; set;
        }
        public string CLM_LOSS_ADDR_1
        {
            get; set;
        }
        public string CLM_LOSS_ADDR_2
        {
            get; set;
        }
        public string CLM_LOSS_ADDR_3
        {
            get; set;
        }
        public string CLM_LOSS_CTY
        {
            get; set;
        }

        public string INS_ST
        {
            get; set;
        }
        
        public string FIRST_INS_ADDR
        {
            get; set;
        }
        public string FIRST_INS_ADDR_2
        {
            get; set;
        }
        public string INSD_MAIN_CNTCT_NAME
        {
            get; set;
        }
        public string CLMT_BIRTH_DT
        {
            get; set;
        }
        

        public string FIRST_INS_CTY
        {
            get; set;
        }
        
        public string FIRST_INS_ST
        {
            get; set;
        }
        
        public string FIRST_INS_ZIP
        {
            get; set;
        }

        public string POLICYFORM
        {
            get;set;
        }

        public string HOMEOWNERS_DED
        {
            get; set;
        }

        public string LOC_OF_LOSS_SYS
        {
            get; set;
        }
        
        public string JURISDICTION_STATE_AUTO
        {
            get; set;
        }
        public string COVERAGE_TYPE_PIP
        {
            get; set;
        }
        public string VEH_ST
        {
            get; set;
        }        
        public string COVERAGE_TYPE_MEDPAY
        {
            get; set;
        }
        public string INSD_EMAIL
        {
            get; set;
        }
        public string MedPay_Policy_Limit
        {
            get; set;
        }
        
        public string MED_EXPENSE_LIMIT_PER_PERSON
        {
            get; set;
        }
        
        public string INCOME_CONT_WEEKLY
        {
            get; set;
        }
        
        public string INCOME_CONT_MAX
        {
            get; set;
        }
        
        public string ESSENTIAL_SERV_DAILY_LMT
        {
            get; set;
        }
        
        public string ESSENTIAL_SERV_MAX_LMT
        {
            get; set;
        }
        
        public string DEATH_BENEFITS_LMT
        {
            get; set;
        }
        
        public string FUNERAL_BENEFITS_LMT
        {
            get; set;
        }
        
        public string DEATH_WAGE_EXCLUSION
        {
            get; set;
        }

        public string CLMT_MAX_WAGE_LOSS
        {
            get; set;
        }

        public string CLMT_MNTHLY_WAGE_LOSS
        {
            get; set;
        }

        public string COMB_1ST_PARTY_BEN
        {
            get; set;
        }

        public string DEATH_BENEFIT_AMT
        {
            get; set;
        }

        public string EXTRAORD_MED_EXP
        {
            get; set;
        }

        public string FUNERAL_EXP_AMT
        {
            get; set;
        }

        public string MED_EXPENSES
        {
            get; set;
        }

        public string TORT_OPT
        {
            get; set;
        }

        public string INBND_DOCTYPE
        {
            get; set;
        }
        
        public string LTR_CTGY
        {
            get; set;
        }
        
        public string LTR_NAME
        {
            get; set;
        }
        
        public string CURR_DT
        {
            get; set;
        }
        
        public string CLM_LOSS_DT
        {
            get; set;
        }
        
        public string CLM_LOSS_TIME
        {
            get; set;
        }
        
        public string TWO_WEEKS_AFTER_DOL
        {
            get; set;
        }
        
        public string ThreeYearExpirationDate
        {
            get; set;
        }
        
        public string AccidentDate_3Years
        {
            get; set;
        }
        
        public string ONE_YEAR_EXP_DT
        {
            get; set;
        }
        
        public string AccidentDate_1Year
        {
            get; set;
        }


        public string SENDING_LTR_TO
        {
            get; set;
        }


        public string CLM_RPT_DT_AUTO
        {
            get; set;
        }
        
        public string CREATOR_UID
        {
            get; set;
        }
        
        public string OUTBND_DOCTYPE
        {
            get; set;
        }
        
        public string CREATOR_INT
        {
            get; set;
        }
        
        public string INS_CO_NM
        {
            get; set;
        }
        
        public string INS_CO_ABBREV
        {
            get; set;
        }
        
        public string EXPOSURE_NAME
        {
            get; set;
        }
        
        public string CLMT_ID
        {
            get; set;
        }
        
        public string EXPOSURE_TYPE
        {
            get; set;
        }
        
        public string EXPOSURE_NUM
        {
            get; set;
        }
        public string POL_DED_AUTO
        {
            get; set;
        }
        public string VEH_ACTUAL_CASH_VAL
        {
            get; set;
        }
        public string VEH_OLD_DAMAGE_AMT
        {
            get; set;
        }
        public string SALV_SUB_TOTL
        {
            get; set;
        }
        public string TAX_AMT
        {
            get; set;
        }
        public string SALV_VALUE
        {
            get; set;
        }
        public string SALV_PD_DED
        {
            get; set;
        }
        public string SALV_OTHER
        {
            get; set;
        }
        public string SALV_NET_SETTL
        {
            get; set;
        }
        public string SALV_VEH_YEAR
        {
            get; set;
        }
        public string SALV_VEH_MAKE
        {
            get; set;
        }
        public string SALV_VEH_MODEL
        {
            get; set;
        }
        public string TOTL_LOSS_EST_AMT
        {
            get; set;
        }
        public string SALV_TYPE_LOSS
        {
            get; set;
        }
        public string PIP_MEDPAY_LIMITS
        {
            get; set;
        }

        public string REPRESENT_STATUS
        {
            get; set;
        }
        public string PRI_ADDRESSEE_NAME
        {
            get; set;
        }
        
        public string PRI_ADDRESSEE_ADDR_1
        {
            get; set;
        }
        
        public string PRI_ADDRESSEE_ADDR_2
        {
            get; set;
        }
        
        public string PRI_ADDRESSEE_ADDR_3
        {
            get; set;
        }
        
        public string PRI_ADDRESSEE_CTY
        {
            get; set;
        }
        
        public string PRI_ADDRESSEE_ST
        {
            get; set;
        }
        
        public string PRI_ADDRESSEE_ZIP
        {
            get; set;
        }
        
        public string PRI_ADDRESSEE_POSTNET_INFO
        {
            get; set;
        }
        public string ATTNY_NAME_AUTO
        {
            get; set;
        }
        public string ATTNY_ST_ADDR1_AUTO
        {
            get; set;
        }
        public string ATTNY_ST_ADDR2_AUTO
        {
            get; set;
        }
        public string ATTNY_CTY_AUTO
        {
            get; set;
        }
        public string ATTNY_ST_AUTO
        {
            get; set;
        }
        public string ATTNY_ZIP_AUTO
        {
            get; set;
        }

        public string SEC_ADDRESSEE_NAME
        {
            get; set;
        }
        
        public string GRTG_TYPLST
        {
            get; set;
        }
        
        public string GRTG_VAL
        {
            get; set;
        }
        public string ATTN_TYPLST
        {
            get; set;
        }
        public string ATTN_VAL
        {
            get; set;
        }
        public string CLMT_NAME_CONTACT
        {
            get; set;
        }
        public string DECEASED_POL_HLD_NAME
        {
            get; set;
        }
        public string PROVIDER
        {
            get; set;
        }
        public string SUBRO_CARRIER_NAME
        {
            get; set;
        }


        public string AUTHOR_NAME
        {
            get; set;
        }
        
        public string AUTHOR_EMAIL
        {
            get; set;
        }
        
        public string AUTHOR_FAX
        {
            get; set;
        }
        
        public string AUTHOR_TITL
        {
            get; set;
        }
        
        public string AUTHOR_WORK_PHN
        {
            get; set;
        }
        public string AUTHOR_WORK_EXT
        {
            get; set;
        }
        public string AUTHOR_CREDS
        {
            get; set;
        }
        public string ADJUSTER_DIRECT_DIAL
        {
            get; set;
        }
        public string AUTHOR_EXEC_IND
        {
            get; set;
        }
        
        public string AUTHOR_UID
        {
            get; set;
        }
        
        public string AUTHOR_UID_ARCH
        {
            get; set;
        }
        
        public string CLMT_NAME
        {
            get; set;
        }
        
        public string CLMT_ST_ADDR1_AUTO
        {
            get; set;
        }
        
        public string CLMT_ST_ADDR2_AUTO
        {
            get; set;
        }
        
        public string CLMT_CTY_AUTO
        {
            get; set;
        }
        
        public string CLMT_ST_AUTO
        {
            get; set;
        }
        
        public string CLMT_ZIP_AUTO
        {
            get; set;
        }
        public string CLMT_NAME_1
        {
            get; set;
        }
        public string CLMT_NAME_2
        {
            get; set;
        }
        public string CLMT_NAME_3
        {
            get; set;
        }
        public string CLMT_NAME_4
        {
            get; set;
        }
        public string CLMT_NAME_5
        {
            get; set;
        }


        public string CLMT_DOB
        {
            get; set;
        }
        
        public string CERT_MAIL_IND
        {
            get; set;
        }
        
        public string PRINT_IND
        {
            get; set;
        }
        public string ARCHIVE_IND
        {
            get; set;
        }
        

        public string PRINTER_NAME
        {
            get; set;
        }
        
        public string EMAIL_FROM
        {
            get; set;
        }
        
        public string EMAIL_SUBJECT
        {
            get; set;
        }
        
        public string EMAIL_TO
        {
            get; set;
        }
        
        public string NJM_ENCRYPT
        {
            get; set;
        }
        
        public string EMAIL_IND
        {
            get; set;
        }
        
        public string FAX_SUBJECT
        {
            get; set;
        }
        
        public string FAX_TO
        {
            get; set;
        }
        
        public string FAX_FROM
        {
            get; set;
        }
        
        public string FAX_IND
        {
            get; set;
        }

        public string CLMT_VEH_YR
        {
            get; set;
        }

        public string CLMT_VEH_MK
        {
            get; set;
        }

        public string CLMT_VEH_MDL
        {
            get; set;
        }

        public string CLMT_VEH_VIN
        {
            get; set;
        }
        public string VEH_YR
        {
            get; set;
        }
        public string VEH_MK
        {
            get; set;
        }
        public string VEH_MDL
        {
            get; set;
        }
        public string VEH_VIN
        {
            get; set;
        }
        public string ADDTL_MED_DOC_VALUE
        {
            get; set;
        }
        public string OTHER_DETAILS1_VALUE
        {
            get; set;
        }
        public string NOT_CAUS_REL_OTHER_VALUE
        {
            get; set;
        }
        public string OTH_OVERPYMNT_REASON
        {
            get; set;
        }
        public string CLMT_NAME_CONTACT_2
        {
            get; set;
        }
        public string COMPANY_NAME_CONTACT_IF_NEEDED
        {
            get; set;
        }
        public string MISC_EXPLANATION
        {
            get; set;
        }
        public string ADJUSTERS_EXT
        {
            get; set;
        }
        public string ADJUSTERS_NAME
        {
            get; set;
        }
        public string IME_PHYS_NAME
        {
            get; set;
        }
        public string PIP_DED
        {
            get; set;
        }
        public string BENEFITS_TERM_DT
        {
            get; set;
        }
        public string OVERPYMNT_TYPE
        {
            get; set;
        }
        
        public string ICD9_CODE_1
        {
            get; set;
        }
        public string ICD9_CODE_2
        {
            get; set;
        }
        public string ICD9_CODE_3
        {
            get; set;
        }
        public string ICD9_CODE_4
        {
            get; set;
        }
        public string ICD9_CODE_5
        {
            get; set;
        }

        public string APPLICANT_BENEFITS_NAME
        {
            get; set;
        }
        public string APPLICANT_BENEFITS_ADDR_1
        {
            get; set;
        }
        public string APPLICANT_BENEFITS_ADDR_2
        {
            get; set;
        }
        public string APPLICANT_BENEFITS_CTY
        {
            get; set;
        }
        public string APPLICANT_BENEFITS_ST
        {
            get; set;
        }
        public string APPLICANT_BENEFITS_ZIP
        {
            get; set;
        }

        public string TRTNG_PHYS_NAME
        {
            get; set;
        }
        public string TRTNG_PHYS_ST_ADDR1
        {
            get; set;
        }
        public string TRTNG_PHYS_ST_ADDR2
        {
            get; set;
        }
        public string TRTNG_PHYS_CTY
        {
            get; set;
        }
        public string TRTNG_PHYS_ST
        {
            get; set;
        }
        public string TRTNG_PHYS_ZIP
        {
            get; set;
        }
        public string CHIRO_ONLY
        {
            get; set;
        }
        public string NEC_MED_DME
        {
            get; set;
        }
        public string CPT_CODES_SUB
        {
            get; set;
        }
        public string NO_CLINICAL_SUPPORT
        {
            get; set;
        }
        public string CONTINUE_ACUPUNCT
        {
            get; set;
        }
        public string REQ_COMPLE_ACUPUNCT
        {
            get; set;
        }
        public string EVAL_AND_ADDRESS
        {
            get; set;
        }
        public string MED_REQ
        {
            get; set;
        }
        public string SURGICAL_TRMNT
        {
            get; set;
        }
        public string INTERVENT_TRMNT
        {
            get; set;
        }
        public string CONSERVE_TRMNT
        {
            get; set;
        }
        public string REQ_FURTHER_TRMNT
        {
            get; set;
        }
        public string CLMT_REQ_EDX
        {
            get; set;
        }
        public string CLMT_REQ_MRI
        {
            get; set;
        }
        public string COG_THERAPY_NOTES
        {
            get; set;
        }
        public string SPEECH_THERAPY_NOTES
        {
            get; set;
        }
        public string OCCPTNL_THERAPY_NOTES
        {
            get; set;
        }
        public string NURSE_NOTES
        {
            get; set;
        }
        public string LAB_STUDIES
        {
            get; set;
        }
        public string MEDICATION_REC
        {
            get; set;
        }
        public string AMB_CALL_RPT_MICU
        {
            get; set;
        }
        public string CONSULTATION_RPT
        {
            get; set;
        }
        public string OPER_RPT
        {
            get; set;
        }
        public string ANEST_TIME_SHEET
        {
            get; set;
        }
        public string ALL_MRI_CT_SCAN_XRAY_ULTRA
        {
            get; set;
        }
        public string ER_REC
        {
            get; set;
        }
        public string PHYS_ORDER_PROG_NOTES
        {
            get; set;
        }
        public string PHYSICAL_THERAPY_TRTMNT_REC
        {
            get; set;
        }
        public string ADMSN_DISCHRG_SUMM
        {
            get; set;
        }
        public string VEH_SHOP_NAME
        {
            get; set;
        }
        public string VEH_OWN_INS
        {
            get; set;
        }
        public string VEH_OWN_NM
        {
            get; set;
        }
        public string NJM_CC_OPT 
        {
            get; set;
        }
        public string TORTFEASOR_INS_CAR
        {
            get; set;
        }
        public string TORTFEASOR_NM
        {
            get; set;
        }
        public string SUPERVISOR_NM
        {
            get; set;
        }
        public string PAYEE
        {
            get; set;
        }
        public string PARENT_NM_2
        {
            get; set;
        }
        public string PARENT_NM
        {
            get; set;
        }
        public string MORTGAGEE
        {
            get; set;
        }
        public string LIENHOLDER_NAME
        {
            get; set;
        }
        public string ADVERSE_SUBRO_PTY
        {
            get; set;
        }
        public string OOP_RENTAL_INCLUDED
        {
            get; set;
        }
        public string NJM_HIRED_IA_NAME
        {
            get; set;
        }
        public string NJM_HIRED_IA_EMAIL
        {
            get; set;
        }
        public string NJM_HIRED_IA_PHONE
        {
            get; set;
        }
        public string MINOR_NM
        {
            get; set;
        }
        public string MINOR_ADDR
        {
            get; set;
        }
        public string MINOR_ADDR_2
        {
            get; set;
        }
        public string MINOR_ADDR_CTY
        {
            get; set;
        }
        public string MINOR_ADDR_ST
        {
            get; set;
        }
        public string MINOR_ADDR_ZIP
        {
            get; set;
        }
        public string AGENCY_NAME
        {
            get; set;
        }
        public string TOX_PRESUMP_CHKBOX
        {
            get; set;
        }
        public string TOX_CONFIRM_CHKBOX
        {
            get; set;
        }
        public string PURSUANT_PHYS_REV_CHKBOX
        {
            get; set;
        }
        public string NOT_CLIN_SUPP_CHKBOX
        {
            get; set;
        }
        public string NOT_IN_ACCORD_CHKBOX
        {
            get; set;
        }
        public string MED_TRMNT_BASED_IME_CHKBOX
        {
            get; set;
        }
        public string DIAG_NOT_PREV_CLAIMED_CHKBOX
        {
            get; set;
        }
        public string LACK_UPDATED_MED_DOC_CHKBOX
        {
            get; set;
        }
        public string REQ_TRMNT_MED_UNNECSS_CHKBOX
        {
            get; set;
        }
        public string SUB_MED_DOC_NOT_SUPP_TRMNT_CHKBOX
        {
            get; set;
        }
        public string UNABLE_CAS_REL_TO_MVA_CHKBOX
        {
            get; set;
        }
        public string LACK_CONSRV_CARE_SUPP_MED_CHKBOX
        {
            get; set;
        }
        public string TRMNT_NOT_CONSIST_W_DIAG_CHKBOX
        {
            get; set;
        }
        public string ADDTL_MED_RESULTS_REQ_CHKBOX
        {
            get; set;
        }
        public string LACK_OF_LEG_MED_DOC_CHKBOX
        {
            get; set;
        }
        public string LACK_OF_CURR_PT_CHKBOX
        {
            get; set;
        }
        public string TEST_NOT_REIMBURSE_CHKBOX
        {
            get; set;
        }
        public string FAIL_TO_SUBMIT_IME_CHKBOX
        {
            get; set;
        }
        public string POL_LIMITS_EXHAUST_CHKBOX
        {
            get; set;
        }
        public string PURSUANT_TO_NJAC_CHKBOX
        {
            get; set;
        }
        public string PURSUANT_NJ_PIP_FEE_SCH
        {
            get; set;
        }
        public string HLTH_INS_PRI_CHKBOX
        {
            get; set;
        }
        public string ELIGIBILITY_CHKBOX
        {
            get; set;
        }
        public string FUNDS_CHKBOX
        {
            get; set;
        }
        public string DME
        {
            get; set;
        }
        public string SERVICE_DT_CAL
        {
            get; set;
        }
        public string PRECERT_ID_OB_KW
        {
            get; set;
        }
        public string DETMNTN_OB_KW
        {
            get; set;
        }
        public string PROVIDER_PHONE
        {
            get; set;
        }
        public string PROVIDER_SYS
        {
            get; set;
        }
        public string PROOF_OF_RESIDENCY
        {
            get; set;
        }
        public string COMP_PIP_APP
        {
            get; set;
        }
        public string COMP_AONI
        {
            get; set;
        }
        public string ID_DOCS
        {
            get; set;
        }
        public string MARRIAGE_LICENSE
        {
            get; set;
        }
        public string DENIAL_REASON
        {
            get; set;
        }
    }


    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMENDRS_NUM_W_ED_DT_REC
    {      
        public string CLM_FK
        { get; set; }

        public string ENDRS_NUM_W_ED_DT
        { get; set; }

        public string ENDORSEMENT_NUMBER
        { get; set; }

        public string ENDORSEMENT_LIMIT
        { get; set; }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMHSB_END_REC
    {
        public string CLM_FK
        { get; set; }

        public string HSB_END
        { get; set; }
    }   


    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMNJM_RE_OPT
    {
        public string CLM_FK
        { get; set; }

        public string RE_OPT_NAME
        { get; set; }

        public string RE_OPT_VAL
        { get; set; }
    }

    
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMNJM_CC_OPT
    {      
        public string CLM_FK
        { get; set; }

        public string CC_REF
        { get; set; }

        public string CC_BCC_IND
        { get; set; }

        public string CC_ADDRESSEE_NAME
        { get; set; }

        public string CC_ADDRESSEE_ADDR_1
        { get; set; }

        public string CC_ADDRESSEE_ADDR_2
        { get; set; }

        public string CC_ADDRESSEE_CTY
        { get; set; }

        public string CC_ADDRESSEE_ST
        { get; set; }

        public string CC_ADDRESSEE_ZIP
        { get; set; }

        public string CC_ADDRESSEE_POSTNET_INFO
        { get; set; }
    }
    
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMHEALTH_BEN_NOT_PROVIDED_REC
    {
       
        public string HEALTH_BEN_NOT_PROVIDED
        { get; set; }


        public string CLM_FK
        { get; set; }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMSALVAGE_REP
    {
        private List<string> nJM_Salvage_REPField = new List<string>();

        [System.Xml.Serialization.XmlElementAttribute("SALVAGE_REP_NAME")]
        public List<string> SALVAGE_REP_NAME
        {
            get
            {
                return this.nJM_Salvage_REPField;
            }
            set
            {
                this.nJM_Salvage_REPField = value;
            }
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMVEHICLE_DESC
    {

        public string POL_FK
        { get; set; }
        public string VEH_VIN_IND
        { get; set; }
        public string VEH_FIN_IND
        { get; set; }
        public string VEH_LEASE_IND
        { get; set; }
        public string VEH_YR
        { get; set; }
        public string VEH_MK
        { get; set; }
        public string VEH_MDL
        { get; set; }
        public string VEH_VIN
        { get; set; }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class GC_DATARECORD_OVER_PAYMENT_REC_DATA
    {
        /// <remarks/>
        public string OVERPYMNT_REASON
        {
            get; set;
        }
        public string OTH_OVERPYMNT_REASON
        {
            get; set;
        }

        public string CLM_FK
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class GC_DATARECORD_DETERMNT_ID_REC
    {
        /// <remarks/>
        public string CLM_FK
        {
            get; set;
        }

        /// <remarks/>
        public string TOTAL_TREAT_APPR
        {
            get; set;
        }

        /// <remarks/>
        public string TRMNT_REASON
        {
            get; set;
        }

        /// <remarks/>
        public string TRMNT_STATUS
        {
            get; set;
        }

        /// <remarks/>
        public string APPEAL_STATUS
        {
            get; set;
        }

        /// <remarks/>
        public string DETERMNT_CODE
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class GC_DATARECORD_PRECERT_CODE_REC
    {
        public string CLM_FK
        {
            get;set;
        }

        /// <remarks/>
        public string PRECERT_ID
        {
            get; set;
        }
        /// <remarks/>
        public string PRECERT_START_DATE
        {
            get; set;
        }

        public string PRECERT_END_DATE
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class GC_DATARECORD_PROCEDURE_CODE_REC
    {

        /// <remarks/>
        public string PRECERT_START_CODE
        {
            get; set;
        }

        /// <remarks/>
        public string PRECERT_END_CODE
        {
            get; set;
        }

        /// <remarks/>
        public string CLM_FK
        {
            get; set;
        }

        /// <remarks/>
        public string DETERMNT_CODE_PROC
        {
            get; set;
        }

        /// <remarks/>
        public string PRECERT_ID_PROC
        {
            get; set;
        }

        /// <remarks/>
        public string PRECERT_USER_DEF_GROUP
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC
    {
        public string CHK_NO_MULTI
        {
            get; set;
        }
        public string CHK_DT_MULTI
        {
            get; set;
        }
        public string CHK_AMT_MULTI
        {
            get; set;
        }
        public string DT_SERVICE_MULTI
        {
            get; set;
        }
        public string CHK_OVERPYMT_AMT_MULTI
        {
            get; set;
        }
        public string CLM_FK
        {
            get; set;
        }
        public string TOT_CHK_AMT
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class GC_DATARECORD_VEHICLE_OWNER_REC
    {       
        public string VEH_OWNERS_NAME
        {
            get; set;
        }

        public string VEH_OWNERS_ADDR_1
        {
            get; set;
        }
        public string VEH_OWNERS_ADDR_2
        {
            get; set;
        }
        public string VEH_OWNERS_ADDR_3
        {
            get; set;
        }
        public string VEH_OWNERS_CTY
        {
            get; set;
        }
        public string VEH_OWNERS_ST
        {
            get; set;
        }
        public string VEH_OWNERS_ZIP
        {
            get; set;
        }
    }
}


