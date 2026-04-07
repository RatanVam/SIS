namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL.PA
{
    public class PAInspireEntity : InspireBase
    {
        public CUSTOMER_DATA CustomerData { get; set; } = new CUSTOMER_DATA();
    }

    // NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
    /// <remarks/>
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

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIM
    {

        private CUSTOMER_DATARECORD_DELIMPOLICY_REC pOLICY_RECField = new CUSTOMER_DATARECORD_DELIMPOLICY_REC();

        private CUSTOMER_DATARECORD_DELIMLTR_NAME_REC lTR_NAME_RECField = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();

        private List<CUSTOMER_DATARECORD_DELIMLIC_SUSP> lIC_SUSPField = new List<CUSTOMER_DATARECORD_DELIMLIC_SUSP>();

        private List<CUSTOMER_DATARECORD_DELIMINVALID_DRV> iNVALID_DRVField = new List<CUSTOMER_DATARECORD_DELIMINVALID_DRV>();

        private List<CUSTOMER_DATARECORD_DELIMSUSP_DRV> sUSP_DRVField = new List<CUSTOMER_DATARECORD_DELIMSUSP_DRV>();

        private List<CUSTOMER_DATARECORD_DELIMACC_VIOL> aCC_VIOLField = new List<CUSTOMER_DATARECORD_DELIMACC_VIOL>();

        private List<CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC> pOL_DRVR_DESCField = new List<CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC>();

        private List<CUSTOMER_DATARECORD_DELIMVEH_DESC> vEH_DESCField = new List<CUSTOMER_DATARECORD_DELIMVEH_DESC>();

        private List<CUSTOMER_DATARECORD_DELIMSERVICE_EVNT> sERVICE_EVNTField = new List<CUSTOMER_DATARECORD_DELIMSERVICE_EVNT>();

        private List<CUSTOMER_DATARECORD_DELIMCLAIMS_POL> cLAIMS_POLField = new List<CUSTOMER_DATARECORD_DELIMCLAIMS_POL>();

        private List<CUSTOMER_DATARECORD_DELIMUM_W_STANDARD_UIM_COV> uM_W_STANDARD_UIM_COVField = new List<CUSTOMER_DATARECORD_DELIMUM_W_STANDARD_UIM_COV>();

        private List<CUSTOMER_DATARECORD_DELIMUM_W_UIM_CONVERSION_COV> uM_W_UIM_CONVERSION_COVField = new List<CUSTOMER_DATARECORD_DELIMUM_W_UIM_CONVERSION_COV>();

        private List<CUSTOMER_DATARECORD_DELIMID_CARD> cUSTOMER_DATARECORD_DELIMID_CARDs = new List<CUSTOMER_DATARECORD_DELIMID_CARD>();

        private List<CUSTOMER_DATARECORD_ACCIDENT_INFO> cUSTOMER_DATARECORD_ACCIDENT_Info = new List<CUSTOMER_DATARECORD_ACCIDENT_INFO>();

        private List<CUSTOMER_DATARECORD_REINSTATE_CANCEL> cUSTOMER_DATARECORD_REINST_CANCEL = new List<CUSTOMER_DATARECORD_REINSTATE_CANCEL>();

        private List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM> cUSTOMER_DATARECORD_AADITIONAL_POL = new List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM>();
        
        /// <remarks/>
        public CUSTOMER_DATARECORD_DELIMPOLICY_REC POLICY_REC
        {
            get
            {
                return this.pOLICY_RECField;
            }
            set
            {
                this.pOLICY_RECField = value;
            }
        }

        /// <remarks/>
        public CUSTOMER_DATARECORD_DELIMLTR_NAME_REC LTR_NAME_REC
        {
            get
            {
                return this.lTR_NAME_RECField;
            }
            set
            {
                this.lTR_NAME_RECField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("LIC_SUSP")]
        public List<CUSTOMER_DATARECORD_DELIMLIC_SUSP> LIC_SUSP
        {
            get
            {
                return this.lIC_SUSPField;
            }
            set
            {
                this.lIC_SUSPField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("INVALID_DRV")]
        public List<CUSTOMER_DATARECORD_DELIMINVALID_DRV> INVALID_DRV
        {
            get
            {
                return this.iNVALID_DRVField;
            }
            set
            {
                this.iNVALID_DRVField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("SUSP_DRV")]
        public List<CUSTOMER_DATARECORD_DELIMSUSP_DRV> SUSP_DRV
        {
            get
            {
                return this.sUSP_DRVField;
            }
            set
            {
                this.sUSP_DRVField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("ACC_VIOL")]
        public List<CUSTOMER_DATARECORD_DELIMACC_VIOL> ACC_VIOL
        {
            get
            {
                return this.aCC_VIOLField;
            }
            set
            {
                this.aCC_VIOLField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("POL_DRVR_DESC")]
        public List<CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC> POL_DRVR_DESC
        {
            get
            {
                return this.pOL_DRVR_DESCField;
            }
            set
            {
                this.pOL_DRVR_DESCField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("VEH_DESC")]
        public List<CUSTOMER_DATARECORD_DELIMVEH_DESC> VEH_DESC
        {
            get
            {
                return this.vEH_DESCField;
            }
            set
            {
                this.vEH_DESCField = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("SERVICE_EVNT")]
        public List<CUSTOMER_DATARECORD_DELIMSERVICE_EVNT> SERVICE_EVNT
        {
            get
            {
                return this.sERVICE_EVNTField;
            }
            set
            {
                this.sERVICE_EVNTField = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("CLAIMS_POL")]
        public List<CUSTOMER_DATARECORD_DELIMCLAIMS_POL> CLAIMS_POL
        {
            get
            {
                return this.cLAIMS_POLField;
            }
            set
            {
                this.cLAIMS_POLField = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("UM_W_STANDARD_UIM_COV")]
        public List<CUSTOMER_DATARECORD_DELIMUM_W_STANDARD_UIM_COV> UM_W_STANDARD_UIM_COV
        {
            get
            {
                return this.uM_W_STANDARD_UIM_COVField;
            }
            set
            {
                this.uM_W_STANDARD_UIM_COVField = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("UM_W_UIM_CONVERSION_COV")]
        public List<CUSTOMER_DATARECORD_DELIMUM_W_UIM_CONVERSION_COV> UM_W_UIM_CONVERSION_COV
        {
            get
            {
                return this.uM_W_UIM_CONVERSION_COVField;
            }
            set
            {
                this.uM_W_UIM_CONVERSION_COVField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ID_CARD")]
        public List<CUSTOMER_DATARECORD_DELIMID_CARD> ID_CARD
        {
            get
            {
                return this.cUSTOMER_DATARECORD_DELIMID_CARDs;
            }
            set
            {
                this.cUSTOMER_DATARECORD_DELIMID_CARDs = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ACC_INFO")]
        public List<CUSTOMER_DATARECORD_ACCIDENT_INFO> ACC_INFO
        {
            get
            {
                return this.cUSTOMER_DATARECORD_ACCIDENT_Info;
            }
            set
            {
                this.cUSTOMER_DATARECORD_ACCIDENT_Info = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("REINSTATE_CNCL_DT")]
        public List<CUSTOMER_DATARECORD_REINSTATE_CANCEL> REINSTATE_CNCL_DT
        {
            get
            {
                return this.cUSTOMER_DATARECORD_REINST_CANCEL;
            }
            set
            {
                this.cUSTOMER_DATARECORD_REINST_CANCEL = value;
            }
        }
        [System.Xml.Serialization.XmlElementAttribute("ADDL_POL_NUM")]
        public List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM> ADDL_POL_NUM
        {
            get
            {
                return this.cUSTOMER_DATARECORD_AADITIONAL_POL;
            }
            set
            {
                this.cUSTOMER_DATARECORD_AADITIONAL_POL = value;
            }
        }
        



    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMPOLICY_REC
    {
        public string POL_PK
        {
            get; set;
        }

        public string SRC_SYS
        {
            get; set;
        }

        public string POL_NO
        {
            get; set;
        }

        public string QUOTE_NUM
        {
            get; set;
        }

        public string POL_ST
        {
            get; set;
        }

        public string POL_STATUS
        {
            get; set;
        }

        public string PRIMARY_INS_POL_HLD_NAME_NO_PREFIX
        {
            get; set;
        }

        /// <remarks/>
        public string PRIMARY_INS_POL_HLD_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string SECONDARY_INS_POL_HLD_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string INS_ADDR_1
        {
            get; set;
        }

        /// <remarks/>
        public string INS_CTY
        {
            get; set;
        }

        /// <remarks/>
        public string INS_ST
        {
            get; set;
        }

        /// <remarks/>
        public string INS_ZIP
        {
            get; set;
        }

        /// <remarks/>
        public string POL_EFF_DT
        {
            get; set;
        }

        public string POL_EXP_DT
        {
            get; set;
        }

        /// <remarks/>
        public string COLL_DED
        {
            get; set;
        }

        /// <remarks/>
        public string OTH_THAN_COLL_DED
        {
            get; set;
        }

        /// <remarks/>
        public string LIAB_LMT
        {
            get; set;
        }
        public string LIAB_LMT_Split
        {
            get; set;
        }  

        /// <remarks/>
        public string TOT_BSC_PREM
        {
            get; set;
        }
        /// <remarks/>
        public string TOT_BSC_PREM_FULL_TORT
        {
            get; set;
        }
        /// <remarks/>
        public string UNINSD_MTRST_LMT
        {
            get; set;
        }
        public string UNINSD_MTRST_LMT_Split
        {
            get; set;
        }
     
        /// <remarks/>
        public string PIP_DED
        {
            get; set;
        }

        /// <remarks/>
        public string PIP_PRIMARY_PROV
        {
            get; set;
        }

        /// <remarks/>
        public string PIP_OPTION
        {
            get; set;
        }

        /// <remarks/>
        public string PIP_HIGHER_LMT
        {
            get; set;
        }

        /// <remarks/>
        public string PIP_MED_LMT
        {
            get; set;
        }
        public string SUPP_FMLY_MEMB_LIAB_COV_PREM
        {
            get; set;
        }
        

        /// <remarks/>
        public string TOT_ANNUAL_FULL_PIP_PREM
        {
            get; set;
        }

        /// <remarks/>
        public string WAIVED_PIP_PERCENT
        {
            get; set;
        }

        /// <remarks/>
        public string TOT_ANNUAL_WAIVED_PIP_PREM
        {
            get; set;
        }

        /// <remarks/>
        public string THRESH_OPTION
        {
            get; set;
        }

        /// <remarks/>
        public string HLTH_INS_PROV
        {
            get; set;
        }

        /// <remarks/>
        public string POL_GRP_CERT_NO
        {
            get; set;
        }

        /// <remarks/>
        public string SPOUSE_PARTNER_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string UM_LESS_THAN_LIAB_IND
        {
            get; set;
        }

        /// <remarks/>
        public string UIM_LESS_THAN_LIAB_IND
        {
            get; set;
        }
        /// <remarks/>
        public string Pol_Inception_Date
        {
            get; set;
        }
        /// <remarks/>
        public string POL_EVENT_CHANGE_EFF_DT
        {
            get; set;
        }

        /// <remarks/>
        public string EMAIL_FROM
        {
            get; set;
        }

        /// <remarks/>
        public string EMAIL_SUBJECT
        {
            get; set;
        }
        public string EMAIL_BODY
        {
            get; set;
        }       

        /// <remarks/>
        public string POL_NO_PAD
        {
            get; set;
        }

        /// <remarks/>
        public string OB_KEYWORD1
        {
            get; set;
        }

        /// <remarks/>
        public string OB_KEYWORD2
        {
            get; set;
        }

        /// <remarks/>
        public string OB_KEYWORD3
        {
            get; set;
        }

        /// <remarks/>
        public string OB_KEYWORD4
        {
            get; set;
        }

        /// <remarks/>
        public string OB_KEYWORD5
        {
            get; set;
        }

        /// <remarks/>
        public string INBND_DOCTYPE
        {
            get; set;
        }

        /// <remarks/>
        public string CURR_DT
        {
            get; set;
        }

        /// <remarks/>
        public string POL_EFF_DT_ID_CARD
        {
            get; set;
        }

        /// <remarks/>
        public string PC_TRIG_DT
        {
            get; set;
        }
        public string CSF_EFF
        {
            get; set;
        }
        public string CSF_BLK_PREFLL
        {
            get; set;
        }
        public string SEPARATE_DIVORCE_IND
        {
            get; set;
        }
        public string CLAIMS_POL_IND
        {
            get; set;
        }
        public string NUM_CLM_RPT
        {
            get; set;
        }

        /// <remarks/>
        public string POL_EXP_DT_ID_CARD
        {
            get; set;
        }

        /// <remarks/>
        public string LTR_CTGY
        {
            get; set;
        }

        /// <remarks/>
        public string LTR_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string OUTBND_DOCTYPE
        {
            get; set;
        }

        /// <remarks/>
        public string CREATOR_UID
        {
            get; set;
        }

        /// <remarks/>
        public string CREATOR_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string CREATOR_INT
        {
            get; set;
        }

        /// <remarks/>
        public string INS_CO_NM
        {
            get; set;
        }

        /// <remarks/>
        public string ADDRESSEE_NAME
        {
            get; set;
        }
        public string ADDRESSEE_NAME_2
        {
            get; set;
        }
        public string ADDRESSEE_NAME_3
        {
            get; set;
        }
        /// <remarks/>
        public string ADDRESSEE_ADDR_1
        {
            get; set;
        }
        public string ADDRESSEE_ADDR_2
        {
            get; set;
        }
        public string ADDRESSEE_ADDR_3
        {
            get; set;
        }
        /// <remarks/>
        public string ADDRESSEE_CTY
        {
            get; set;
        }

        /// <remarks/>
        public string ADDRESSEE_ST
        {
            get; set;
        }

        /// <remarks/>
        public string ADDRESSEE_ZIP
        {
            get; set;
        }

        /// <remarks/>
        public string GREETING_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string LIC_SUSP_IND
        {
            get; set;
        }

        /// <remarks/>
        public string INV_LIC_IND
        {
            get; set;
        }

        /// <remarks/>
        public string SUSP_DRVR_IND
        {
            get; set;
        }

        /// <remarks/>
        public string AV_IND
        {
            get; set;
        }

        /// <remarks/>
        public string MVR_CLUE_REF_INDICATOR
        {
            get; set;
        }

        /// <remarks/>
        public string PRINT_IND
        {
            get; set;
        }

        /// <remarks/>
        public string PRINTER_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string ARCHIVE_IND
        {
            get; set;
        }
        /// <remarks/>
        public string EMAIL_TO
        {
            get; set;
        }

        /// <remarks/>
        public string EMAIL_IND
        {
            get; set;
        }
        /// <remarks/>
        public string FAX_IND
        {
            get; set;
        }
        /// <remarks/>
        public string RIGHTFAX_NUM
        {
            get; set;
        }
        /// <remarks/>
        public string FAX_SUBJECT
        {
            get; set;
        }
        public string BARCODE_IND
        {
            get; set;
        }
        public string CERT_IND
        {
            get; set;
        }
        public string TERTIARY_INS_POL_HLD_NAME
        {
            get; set;
        }
        
        public string INS_ADDR_2
        {
            get; set;
        }
        public string INS_ADDR_3
        {
            get; set;
        }
        public string NAMED_INSD_1
        {
            get; set;
        }
        public string NAMED_INSD_2
        {
            get; set;
        }
        public string NAMED_INSD_3
        {
            get; set;
        }
        public string NAMED_INSD_4
        {
            get; set;
        }
        public string NAMED_INSD_5
        {
            get; set;
        }
        public string NAMED_INSD_6
        {
            get; set;
        }
        public string TORT_IND
        {
            get; set;
        }
        public string UM_LMT_Split
        {
            get; set;
        }
        public string UM_LMT
        {
            get; set;
        }
        public string UIM_LMT_Split
        {
            get; set;
        }
        public string UIM_LMT
        {
            get; set;
        }
        public string UMEQLIAB_SPLIT
        {
            get; set;
        }
        public string UM_EQ_LIAB_LIMIT
        {
            get; set;
        }
        public string UM_EQ_LIAB_PREMIUM
        {
            get; set;
        }
        public string UMLTLIAB_SPLIT
        {
            get; set;
        }
        public string UM_LT_LIAB_LIMIT
        {
            get; set;
        }
        public string UM_LT_LIAB_PREMIUM
        {
            get; set;
        }
        public string EUIM_SPLIT
        {
            get; set;
        }
        public string EUIM_LIMIT
        {
            get; set;
        }
        public string EUIM_PREMIUM
        {
            get; set;
        }
        public string TERR_CODE
        {
            get; set;
        }
        public string EVENT_DT
        {
            get; set;
        }
        public string CLAIM_DT
        {
            get; set;
        }
        public string NON_RNWL_IND
        {
            get; set;
        }
        public string DEL_COV_REAS_IND
        {
            get; set;
        }
        public string DEL_TYP
        {
            get; set;
        }
        public string INSPECTION_RESULTS
        {
            get; set;
        }
        public string NDEOffer
        {
            get; set;
        }
        public string LTR_DT
        {
            get; set;
        }
        public string LICENSE_REGISTRATION_SUSPENSION_INDICATOR
        {
            get; set;
        }
        public string FraudConcealmentMisrepresentationIndicator
        {
            get; set;
        }
        public string PUBLIC_SAFETY_IND
        {
            get; set;
        }
        public string CHG_IN_RISK_IND
        {
            get; set;
        }
        public string ResidencyRegistrationStateIndicator
        {
            get; set;
        }
        public string REGISTRATION_NO_INSURABLE_INTEREST_INDICATOR
        {
            get; set;
        }
        public string GARAGE_LOC_IND
        {
            get; set;
        }
        public string VEH_INSPECT_IND
        {
            get; set;
        }
        public string INSURANCE_HIST_PRIOR_CANCEL_NON_PAY_INDICATOR
        {
            get; set;
        }
        public string INS_HIST_PRIOR_BAL_IND
        {
            get; set;
        }
        public string FRAUD_IND
        {
            get; set;
        }
        public string INELIGIBLE_VEH_IND
        {
            get; set;
        }
        public string LapseinPrior6MonthsIndicator
        {
            get; set;
        }
        public string FREE_FORM_IND
        {
            get; set;
        }
        public string VEH_INFO_IND
        {
            get; set;
        }
        
        public string EUIM_CHECKBOX_IND
        {
            get; set;
        }
        public string UM_EQUAL_LIAB_CHECKBOX_IND
        {
            get; set;
        }
        public string UM_LT_LIAB_CHECKBOX_IND
        {
            get; set;
        }
        public string TOT_PREM
        {
            get; set;
        }
        public string CNC_RSN
        {
            get; set;
        }

        public string CTL_REQ_OPT_IND
        {
            get; set;
        }
        public string HIGHER_LMT_NOT_SELECT_IND
        {
            get; set;
        }
        public string CSF_BLK_PREFILL
        {
            get; set;
        }
        
        public string OTHER_INS_IND
        {
            get; set;
        }
        public string PIP_MED_EXP_IND
        {
            get; set;
        }
        public string NON_REL_RESIDENT_IND
        {
            get; set;
        }
        public string VERIFY_COV_IND
        {
            get; set;
        }
        public string PRIOR_POL_NO
        {
            get; set;
        }
        public string PRIOR_BAL
        {
            get; set;
        }
        
        public string RECONSIDER_IND
        {
            get; set;
        }
        public string MIDTRM_CNCL_IND
        {
            get; set;
        }
        public string VIOL_RSN_IND
        {
            get; set;
        }
        public string DUI_IND
        {
            get; set;
        }
        
        public string NUM_YRS_INS
        {
            get; set;
        }
        public string CNC_EFF_DT
        {
            get; set;
        }
        public string LIC_MVR_SUSPEND_DT
        {
            get; set;
        }
        public string VEH_OPERTNG_DT
        {
            get; set;
        }
        public string COV_EFF_DT
        {
            get; set;
        }

        // ST091224: New field added
        public string? TotalPremiumWithEUIM { get; set; } = null;

        // ST091224: New field added
        public string? TotalPremiumUMUIMEqualLiabWithoutEUIM { get; set; } = null;

        // 562096: New fields added
        public string? CSFPIPLimit1MilHighDollar { get; set; } = null;
        public string? CSFPIPLimit1MilLowDollar { get; set; } = null;
        public string? CSFPIPLimit1MilHighPer { get; set; } = null;
        public string? CSFPIPLimit1MilLowPer { get; set; } = null;
        public string? CSFPIPLimit150KHighDollar { get; set; } = null;
        public string? CSFPIPLimit150KLowDollar { get; set; } = null;
        public string? CSFPIPLimit150KHighPer { get; set; } = null;
        public string? CSFPIPLimit150KLowPer { get; set; } = null;
        public string? CSFPIPLimit75KHighDollar { get; set; } = null;
        public string? CSFPIPLimit75KLowDollar { get; set; } = null;
        public string? CSFPIPLimit75KHighPer { get; set; } = null;
        public string? CSFPIPLimit75KLowPer { get; set; } = null;
        public string? CSFPIPLimit50KHighDollar { get; set; } = null;
        public string? CSFPIPLimit50KLowDollar { get; set; } = null;
        public string? CSFPIPLimit50KHighPer { get; set; } = null;
        public string? CSFPIPLimit50KLowPer { get; set; } = null;
        public string? CSFPIPLimit15KHighDollar { get; set; } = null;
        public string? CSFPIPLimit15KLowDollar { get; set; } = null;
        public string? CSFPIPLimit15KHighPer { get; set; } = null;
        public string? CSFPIPLimit15KLowPer { get; set; } = null;
        public string? CSFPIPDED500HighDollar { get; set; } = null;
        public string? CSFPIPDED500LowDollar { get; set; } = null;
        public string? CSFPIPDED500HighPer { get; set; } = null;
        public string? CSFPIPDED500LowPer { get; set; } = null;
        public string? CSFPIPDED1000HighDollar { get; set; } = null;
        public string? CSFPIPDED1000LowDollar { get; set; } = null;
        public string? CSFPIPDED1000HighPer { get; set; } = null;
        public string? CSFPIPDED1000LowPer { get; set; } = null;
        public string? CSFPIPDED2000HighDollar { get; set; } = null;
        public string? CSFPIPDED2000LowDollar { get; set; } = null;
        public string? CSFPIPDED2000HighPer { get; set; } = null;
        public string? CSFPIPDED2000LowPer { get; set; } = null;
        public string? CSFPIPDED2500HighDollar { get; set; } = null;
        public string? CSFPIPDED2500LowDollar { get; set; } = null;
        public string? CSFPIPDED2500HighPer { get; set; } = null;
        public string? CSFPIPDED2500LowPer { get; set; } = null;
        public string? CSFLawsuitOptionsHighDollar { get; set; } = null;
        public string? CSFLawsuitOptionsLowDollar { get; set; } = null;
        public string? CSFLawsuitOptionsHighPer { get; set; } = null;
        public string? CSFLawsuitOptionsLowPer { get; set; } = null;
        public string? CSFPIPNonMedicalHighDollar { get; set; } = null;
        public string? CSFPIPNonMedicalLowDollar { get; set; } = null;
        public string? CSFPIPNonMedicalHighPer { get; set; } = null;
        public string? CSFPIPNonMedicalLowPer { get; set; } = null;


    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMLTR_NAME_REC
    {
        public string POL_FK
        {
            get; set;
        }

        /// <remarks/>
        public string LTR_NAME_BATCH
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMLIC_SUSP
    {
        /// <remarks/>
        public string SUSP_LIC_DRVR_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMINVALID_DRV
    {
        public string INV_LIC_DRVR_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMSUSP_DRV
    {
        public string SUSP_DRVR_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMACC_VIOL
    {
        public string ACTVTY_DESC
        {
            get; set;
        }

        /// <remarks/>
        public string ADVERSE_DATA_SRC
        {
            get; set;
        }

        /// <remarks/>
        public string AV_DRVR_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string AV_EVENT_DT
        {
            get; set;
        }

        /// <remarks/>
        public string AV_POST_PAY_DT
        {
            get; set;
        }

        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }
        public string EXPOSURE_TYPE
        {
            get; set;
        }
        public string PAYOUT_AMOUNT
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC
    {
        public string CLUE_REF_NO
        {
            get; set;
        }

        /// <remarks/>
        public string DRVR_NAME
        {
            get; set;
        }

        /// <remarks/>
        public string MVR_REF_NUM1
        {
            get; set;
        }

        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }
        public string LICENSE_REGISTRATION_SUSPENSION_INDICATOR
        {
            get; set;
        }
        public string LIC_MVR_SUSPEND_DT
        {
            get; set;
        }
        public string LicenseMVRSuspendedDate
        {
            get; set;
        }
        public string DRVR_YR_BRTH
        {
            get; set;
        }
        public string DUI_IND
        {
            get; set;
        }
        public string PROOF_COV_IND
        {
            get; set;
        }
        public string OTH_RES_DRVR_NAME_IND
        {
            get; set;
        }
        public string OTH_RES_DOB_IND
        {
            get; set;
        }
        public string OTH_RES_MARITAL_IND
        {
            get; set;
        }
        public string OTH_RES_REL_IND
        {
            get; set;
        }
        public string OTH_RES_INS_IND
        {
            get; set;
        }
        public string OTH_RES_LIC_IND
        {
            get; set;
        }
        public string OTH_RES_VLD_LIC_IND
        {
            get; set;
        }
        public string OTH_RES_PRIOR_LIC_IND
        {
            get; set;
        }
        public string OTH_RES_NOT_LEGAL_IND
        {
            get; set;
        }
        public string OTH_RES_IND
        {
            get; set;
        }
        public string DRVR_NAME_IND
        {
            get; set;
        }
        public string DRVR_GNDR_IND
        {
            get; set;
        }
        public string DRVR_DOB_IND
        {
            get; set;
        }
        public string DRVR_LIC_IND
        {
            get; set;
        }
        public string DRVR_LIC_ST_IND
        {
            get; set;
        }
        public string DRVR_DT_LIC_IND
        {
            get; set;
        }
        public string MATURE_DRIVER_COURSE_DISCOUNT
        {
            get; set;
        }

    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMVEH_DESC
    {
        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }

        /// <remarks/>
        public string VEH_YR
        {
            get; set;
        }

        /// <remarks/>
        public string VEH_MK
        {
            get; set;
        }
        public string VEH_NO
        {
            get;set;
        }
        /// <remarks/>
        public string VEH_MDL
        {
            get; set;
        }

        /// <remarks/>
        public string VEH_VIN
        {
            get; set;
        }
        public string REGSTR_IND
        {
            get; set;
        }
        public string REG_DOC_IND
        {
            get; set;
        }

        public string VEH_VIN_IND
        {
            get; set;
        }
        public string VEH_FIN_IND
        {
            get; set;
        }
        public string VEH_LEASE_IND
        {
            get; set;
        }
        public string COLL_DED
        {
            get; set;
        }
        public string OTH_THAN_COLL_DED
        {
            get; set;
        }
        public string COLL_PREM
        {
            get; set;
        }
        public string LIAB_PREM
        {
            get; set;
        }
        public string OTH_THAN_COLL_PREM
        {
            get; set;
        }
        public string PIP_MED_LMT_PREM
        {
            get; set;
        }
        public string VEH_BODY_TYPE
        {
            get; set;
        }
        public string FINANCE_CO_NAME
        {
            get; set;
        }
        public string FINANCE_CO_ADDR_1
        {
            get; set;
        }
        public string FINANCE_CO_ADDR_2
        {
            get; set;
        }
        public string FINANCE_CO_ADDR_3
        {
            get; set;
        }
        public string FINANCE_CO_CTY
        {
            get; set;
        }
        public string FINANCE_CO_ST
        {
            get; set;
        }
        public string FINANCE_CO_ZIP
        {
            get; set;
        }
        public string LEASE_CO_NAME
        {
            get; set;
        }
        public string LEASE_CO_ADDR_1
        {
            get; set;
        }
        public string LEASE_CO_ADDR_2
        {
            get; set;
        }
        public string LEASE_CO_ADDR_3
        {
            get; set;
        }
        public string LEASE_CO_CTY
        {
            get; set;
        }
        public string LEASE_CO_ST
        {
            get; set;
        }
        public string LEASE_CO_ZIP
        {
            get; set;
        }
        public string VERIFY_COV_IND
        {
            get; set;
        }
        
        public string TITLE_IND
        {
            get; set;
        }
        public string PURC_ORDR_IND
        {
            get; set;
        }
        public string LEASE_AGREE_IND
        {
            get; set;
        }
        public string FIN_AGREE_IND
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMSERVICE_EVNT
    {
        public string SERVICE_EVENT
        {
            get; set;
        }

        /// <remarks/>
        public string SERVICE_DESC
        {
            get; set;
        }

        /// <remarks/>
        public string SERVICE_VEHICLE
        {
            get; set;
        }

        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMCLAIMS_POL
    {
        /// <remarks/>
        public string CLAIM_NUM
        {
            get; set;
        }

        /// <remarks/>
        public string CLAIM_DT
        {
            get; set;
        }

        /// <remarks/>
        public string CLAIM_DESC
        {
            get; set;
        }
        /// <remarks/>
        public string POL_FK
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMUM_W_STANDARD_UIM_COV
    {

        /// <remarks/>
        public string UM_W_STANDARD_UIM_COV_LIMIT
        {
            get; set;
        }

        /// <remarks/>
        public string UM_W_STANDARD_UIM_COV_TEXT
        {
            get; set;
        }

        /// <remarks/>
        public string UM_W_STANDARD_UIM_COV_TOT_PREM
        {
            get; set;
        }

        /// <remarks/>
        public string UM_W_STANDARD_UIM_COV_LESS_LIAB
        {
            get; set;
        }
        public string UM_W_STANDARD_UIM_COV_SPLIT_LIMIT
        {
            get; set;
        }
        
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMUM_W_UIM_CONVERSION_COV
    {
        /// <remarks/>
        public string UM_W_UIM_CONVERSION_COV_LIMIT
        {
            get; set;
        }
        /// <remarks/>
        public string UM_W_UIM_CONVERSION_COV_TEXT
        {
            get; set;
        }
        /// <remarks/>
        public string UM_W_UIM_CONVERSION_COV_TOT_PREM
        {
            get; set;
        }
        /// <remarks/>
        public string UM_W_UIM_CONVERSION_COV_LESS_LIAB
        {
            get; set;
        }
        public string UM_W_UIM_CONVERSION_COV_SPLIT_LIMIT
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMID_CARD
    {
        public string ID_CARD_VALID_FROM
        {
            get; set;
        }
        public string ID_CARD_VALID_TO
        {
            get; set;
        }
        public string POL_FK
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_ACCIDENT_INFO
    {
        public string ACC_DT
        {
            get; set;
        }
        public string ACC_INFO_NAME_IND
        {
            get; set;
        }
        public string ACC_INFO_POLICE_RPT_IND
        {
            get; set;
        }
        public string ACC_INFO_INS_LTR_IND
        {
            get; set;
        }
        public string POL_FK
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_REINSTATE_CANCEL
    {
        public string REINSTD_DT
        {
            get; set;
        }
        public string CNCL_DT
        {
            get; set;
        }
        public string POL_FK
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMADDL_POL_NUM
    {

        private string aDDL_POLNUMField;

        private string pOL_FKField;

        /// <remarks/>
        public string ADDL_POLNUM
        {
            get
            {
                return this.aDDL_POLNUMField;
            }
            set
            {
                this.aDDL_POLNUMField = value;
            }
        }

        /// <remarks/>
        public string POL_FK
        {
            get
            {
                return this.pOL_FKField;
            }
            set
            {
                this.pOL_FKField = value;
            }
        }
    }
}


