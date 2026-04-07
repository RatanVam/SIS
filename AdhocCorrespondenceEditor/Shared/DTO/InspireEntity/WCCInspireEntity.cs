using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.WCC
{
    public class WCCInspireEntity : InspireBase
    {
        public WCC_DATA CustomerData { get; set; } = new WCC_DATA();
    }


    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class WCC_DATA
    {

        private WCC_DATARECORD_DELIM rECORD_DELIMField = new WCC_DATARECORD_DELIM();

        public WCC_DATARECORD_DELIM RECORD_DELIM
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
    public partial class WCC_DATARECORD_DELIM
    {

        private WCC_DATARECORD_DELIMWCC_CLAIM_REC wCC_CLAIM_RECField = new WCC_DATARECORD_DELIMWCC_CLAIM_REC();

        private List<WCC_DATARECORD_DELIMAFF_BODY_PART> aFF_BODY_PARTField = new List<WCC_DATARECORD_DELIMAFF_BODY_PART>();

        private List<WCC_DATARECORD_DELIMWCC_RE_OPT> wCC_RE_OPTField = new List<WCC_DATARECORD_DELIMWCC_RE_OPT>();

        private List<WCC_DATARECORD_DELIMWCC_CC_OPT> wCC_CC_OPTField = new List<WCC_DATARECORD_DELIMWCC_CC_OPT>();

        private List<WCC_DATARECORD_DELIMCLM_PETITION_NO_REC> cLM_PETITION_NO_RECField = new List<WCC_DATARECORD_DELIMCLM_PETITION_NO_REC>();

        private List<WCC_DATARECORD_DELIMMULTIPLE_PROVIDER> mULTIPLE_PROVIDERField = new List<WCC_DATARECORD_DELIMMULTIPLE_PROVIDER>();

        private List<WCC_DATARECORD_DELIMDENIAL> dENIALField = new List<WCC_DATARECORD_DELIMDENIAL>();

        private List<WCC_DATARECORD_DELIMNJM_CHART_DATA> nJM_CHART_DATAField = new List<WCC_DATARECORD_DELIMNJM_CHART_DATA>();

        private List<WCC_DATARECORD_DELIM_DME_DATA> nJM_DMEField = new List<WCC_DATARECORD_DELIM_DME_DATA>();

        private WCC_DATARECORD_PHYSICAL_THERAPY_DATA nJM_PHYSICAL_THERAPYField = new WCC_DATARECORD_PHYSICAL_THERAPY_DATA();

        private List<WCC_DATARECORD_TRTMNT_PARENT_REC_DATA> nJM_TreatmentField = new List<WCC_DATARECORD_TRTMNT_PARENT_REC_DATA>();

        private List<WCC_DATARECORD_OVER_PAYMENT_REC_DATA> nJM_OverPaymentField = new List<WCC_DATARECORD_OVER_PAYMENT_REC_DATA>();
        
        private List<WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA> nJM_multiOverPaymentField = new List<WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA>();
        private List<WCC_DATARECORD_PROCEDURE_REC_DATA> nJM_procedureField = new List<WCC_DATARECORD_PROCEDURE_REC_DATA>();
        


        public WCC_DATARECORD_DELIMWCC_CLAIM_REC WCC_CLAIM_REC
        {
            get
            {
                return this.wCC_CLAIM_RECField;
            }
            set
            {
                this.wCC_CLAIM_RECField = value;
            }
        }

        public WCC_DATARECORD_PHYSICAL_THERAPY_DATA PHYSICAL_THERAPY
        {
            get
            {
                return this.nJM_PHYSICAL_THERAPYField;
            }
            set
            {
                this.nJM_PHYSICAL_THERAPYField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("AFF_BODY_PART")] 
        public List<WCC_DATARECORD_DELIMAFF_BODY_PART> AFF_BODY_PART
        {
            get
            {
                return this.aFF_BODY_PARTField;
            }
            set
            {
                this.aFF_BODY_PARTField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("WCC_RE_OPT")]
        public List<WCC_DATARECORD_DELIMWCC_RE_OPT> WCC_RE_OPT
        {
            get
            {
                return this.wCC_RE_OPTField;
            }
            set
            {
                this.wCC_RE_OPTField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("WCC_CC_OPT")]
        public List<WCC_DATARECORD_DELIMWCC_CC_OPT> WCC_CC_OPT
        {
            get
            {
                return this.wCC_CC_OPTField;
            }
            set
            {
                this.wCC_CC_OPTField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("CLM_PETITION_NO_REC")]
        public List<WCC_DATARECORD_DELIMCLM_PETITION_NO_REC> CLM_PETITION_NO_REC
        {
            get
            {
                return this.cLM_PETITION_NO_RECField;
            }
            set
            {
                this.cLM_PETITION_NO_RECField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("MULTIPLE_PROVIDER")]
        public List<WCC_DATARECORD_DELIMMULTIPLE_PROVIDER> MULTIPLE_PROVIDER
        {
            get
            {
                return this.mULTIPLE_PROVIDERField;
            }
            set
            {
                this.mULTIPLE_PROVIDERField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DENIAL")]
        public List<WCC_DATARECORD_DELIMDENIAL> DENIAL
        {
            get
            {
                return this.dENIALField;
            }
            set
            {
                this.dENIALField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("NJM_CHART_DATA")]
        public List<WCC_DATARECORD_DELIMNJM_CHART_DATA> NJM_CHART_DATA
        {
            get
            {
                return this.nJM_CHART_DATAField;
            }
            set
            {
                this.nJM_CHART_DATAField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DME")]
        public List<WCC_DATARECORD_DELIM_DME_DATA> DME
        {
            get
            {
                return this.nJM_DMEField;
            }
            set
            {
                this.nJM_DMEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("INFO_ADD_TRTMNT_PARENT_REC")]
        public List<WCC_DATARECORD_TRTMNT_PARENT_REC_DATA> INFO_ADD_TRTMNT_PARENT_REC
        {
            get
            {
                return this.nJM_TreatmentField;
            }
            set
            {
                this.nJM_TreatmentField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("OVERPAYMENT_PARENT_REC")]
        public List<WCC_DATARECORD_OVER_PAYMENT_REC_DATA> OVERPAYMENT_PARENT_REC
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
        [System.Xml.Serialization.XmlElementAttribute("MULTI_OVERPAYMENT_REC")]
        public List<WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA> MULTI_OVERPAYMENT_REC
        {
            get
            {
                return this.nJM_multiOverPaymentField;
            }
            set
            {
                this.nJM_multiOverPaymentField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("PROCEDURE")]
        public List<WCC_DATARECORD_PROCEDURE_REC_DATA> PROCEDURE
        {
            get
            {
                return this.nJM_procedureField;
            }
            set
            {
                this.nJM_procedureField = value;
            }
        }      
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMWCC_CLAIM_REC
    {
        public string CLM_PK
        {
            get;set;
        }
        public string SRC_SYS
        {
            get; set;
        }
        public string INS_CONTACT_NAME
        {
            get; set;
        }
        public string CAUSE_INJ_CD
        {
            get; set;
        }
        public string BOARD_W_NUMBER
        {
            get; set;
        }
        public string STATE_CLAIM_NO
        {
            get; set;
        }
        

        public string HIST_AND_INJ
        {
            get; set;
        }
        public string CLM_NO
        {
            get; set;
        }
        public string ONBASE_CLM_NO
        {
            get; set;
        }
        public string POL_EFF_DT_FROM
        {
            get; set;
        }
        public string POL_EFF_DT_TO
        {
            get; set;
        }
        public string NJ_COMPANY
        {
            get; set;
        }
        public string INS_COUNTY
        {
            get; set;
        }
        public string POL_NO
        {
            get; set;
        }
        public string POL_NO_NUMERIC
        {
            get; set;
        }
        public string POL_TYPE
        {
            get; set;
        }
        public string EMPL_NOTIFY_DT
        {
            get; set;
        }
        public string PREPARED_DT
        {
            get; set;
        }
        public string MEDICAL_PD
        {
            get; set;
        }
        public string TEMP_PD
        {
            get; set;
        }
        public string PERM_PD
        {
            get; set;
        }
        public string SUBRO_PERM_PD
        {
            get; set;
        }
        public string FUNERAL_PD
        {
            get; set;
        }
        public string GROSS_LIEN
        {
            get; set;
        }
        public string NET_LIEN
        {
            get; set;
        }
        public string COUNSEL_FEES_STAT
        {
            get; set;
        }
        public string SUIT_EXPENSES_STAT
        {
            get; set;
        }
        public string NET_SETTLE
        {
            get; set;
        }
        public string PCT_FUT_PYMTS
        {
            get; set;
        }
        public string TYPE_INJ_ILL
        {
            get; set;
        }
        public string TYPE_INJ_ILL_CD
        {
            get; set;
        }
        public string POL_HOL_NAME
        {
            get; set;
        }
        public string POL_HOL_ADDR_1
        {
            get; set;
        }
        public string POL_HOL_ADDR_2
        {
            get; set;
        }
        public string POL_HOL_ADDR_3
        {
            get; set;
        }
        public string POL_HOL_CTY
        {
            get; set;
        }
        public string POL_HOL_ST
        {
            get; set;
        }
        public string POL_HOL_ZIP
        {
            get; set;
        }
        public string POL_HOL_COUNTRY
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
        public string INS_ADDR_1
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
        public string INS_CTY
        {
            get; set;
        }
        public string INS_ST
        {
            get; set;
        }
        public string INS_ZIP
        {
            get; set;
        }
        public string INS_COUNTRY
        {
            get; set;
        }
        public string INS_FEIN
        {
            get; set;
        }
        public string INS_ATTN
        {
            get; set;
        }
        public string CLMT_EMPLOYER_ADDR
        {
            get; set;
        }
        public string INS_PHN
        {
            get; set;
        }
        public string INS_CONTACT_PHN
        {
            get; set;
        }
        public string INS_CONTACT_EXT
        {
            get; set;
        }
        public string CLMT_EMPLOYER_CTY
        {
            get; set;
        }
        public string CLMT_EMPLOYER_ST
        {
            get; set;
        }
        public string CLMT_EMPLOYER_ZIP
        {
            get; set;
        }
        public string DT_OF_SERVICE
        {
            get; set;
        }
        public string EXAM_TIME
        {
            get; set;
        }
        public string CLMT_EXAM_DAY
        {
            get; set;
        }
        public string CLMT_NAME
        {
            get; set;
        }
        public string CLMT_FIRST_NAME
        {
            get; set;
        }
        public string CLMT_MIDDLE_NAME
        {
            get; set;
        }
        public string CLMT_LAST_NAME
        {
            get; set;
        }
        public string CLMT_ST_ADDR_1
        {
            get; set;
        }
        public string CLMT_ST_ADDR_2
        {
            get; set;
        }
        public string CLMT_ST_ADDR_3
        {
            get; set;
        }
        public string CLMT_CTY
        {
            get; set;
        }
        public string CLMT_ST
        {
            get; set;
        }
        public string CLMT_ZIP
        {
            get; set;
        }
        public string CLMT_COUNTY
        {
            get; set;
        }
        public string CLMT_COUNTRY
        {
            get; set;
        }
        public string CLMT_PHN
        {
            get; set;
        }
        public string CLMT_PHN_NO_EXT
        {
            get; set;
        }
        public string CLMT_MARITAL_STATUS
        {
            get; set;
        }
        public string CLMT_BIRTH_DT
        {
            get; set;
        }
        public string CLMT_DEATH_DT
        {
            get; set;
        }
        public string CLMT_EMAIL
        {
            get; set;
        }
        public string IND_MED_FACIL_NAME
        {
            get; set;
        }
        
        public string CLMT_GENDER
        {
            get; set;
        }
        public string CLMT_SOC_SEC_NO
        {
            get; set;
        }
        public string CLMT_OCCUPATION
        {
            get; set;
        }
        public string PREPARERS_NAME
        {
            get; set;
        }
        public string PREPARERS_PHN
        {
            get; set;
        }
        public string PREPARERS_EXT
        {
            get; set;
        }
        public string OUT_OF_WORK_DT
        {
            get; set;
        }
        public string RET_TO_WORK_DT
        {
            get; set;
        }
        public string LOCATION_NUM
        {
            get; set;
        }
        public string PAY_PERIOD
        {
            get; set;
        }
        public string LAST_WORK_DT
        {
            get; set;
        }
        public string FULL_PAY_INJ_DAY_IND
        {
            get; set;
        }
        public string WORK_START_TIME
        {
            get; set;
        }
        public string WORK_START_TIME_AMPM
        {
            get; set;
        }
        public string NUM_DEPENDENTS
        {
            get; set;
        }
        public string SAFETY_EQUIP_USED_IND
        {
            get; set;
        }
        public string ACC_LOC_ADDR_2_SYS
        {
            get; set;
        }
        public string ACC_LOC_ADDR_3_SYS
        {
            get; set;
        }

        public string COMP_RATE
        {
            get; set;
        }
        public string WAGES
        {
            get; set;
        }
        public string NCCI_CD
        {
            get; set;
        }
        public string NUM_DAYS_WORKED_WK
        {
            get; set;
        }
        public string CLMT_STATE_HIRED
        {
            get; set;
        }
        public string INJURED_EMPLOYER_PREM_IND
        {
            get; set;
        }
        public string SAFETY_EQUIP_PROV_IND
        {
            get; set;
        }
        public string JURISDICTION
        {
            get; set;
        }
        public string CLM_LOSS_CTY
        {
            get; set;
        }
        public string CLM_LOSS_ST
        {
            get; set;
        }
        public string REPORTED_DT
        {
            get; set;
        }
        public string EMPL_CLM
        {
            get; set;
        }
        public string TIME_INJURED
        {
            get; set;
        }
        public string TIME_INJURED_AMPM
        {
            get; set;
        }
        public string POL_NUM_NO_CHK_DGT
        {
            get; set;
        }
        public string TAX_ID
        {
            get; set;
        }
        public string MED_NET_TOT_INCURRED
        {
            get; set;
        }
        public string INDEM_NET_TOT_INCURRED
        {
            get; set;
        }
        public string INDEM_PD
        {
            get; set;
        }
        public string INDEM_OPEN_RSRV
        {
            get; set;
        }
        public string MED_OPEN_RSRV
        {
            get; set;
        }
        public string ACC_LOC_ADDR_1_SYS
        {
            get; set;
        }
        public string ACC_LOC_CTY_SYS
        {
            get; set;
        }
        public string ACC_LOC_ST_SYS
        {
            get; set;
        }
        public string ACC_LOC_ZIP_SYS
        {
            get; set;
        }
        public string CLAIM_TYPE
        {
            get; set;
        }
        public string DAYS_REPORTED_LATE
        {
            get; set;
        }
        public string TOT_MED_PD
        {
            get; set;
        }
        public string TEMP_COMP_PD
        {
            get; set;
        }
        public string PERM_COMP_PD
        {
            get; set;
        }
        public string CURR_DT
        {
            get; set;
        }
        public string AUTH_EXPIRATION_DT
        {
            get; set;
        }
        public string LTR_CREATE_DT
        {
            get; set;
        }
        public string CLM_LOSS_DT
        {
            get; set;
        }
        public string CLMT_DATE_HIRED
        {
            get; set;
        }
        public string MMI_DT
        {
            get; set;
        }
        
        public string CLM_PET_DT
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
        public string CREATOR_UID
        {
            get; set;
        }
        public string CREATOR_NAME
        {
            get; set;
        }
      
        public string OUTBND_DOCTYPE
        {
            get; set;
        }
        public string TO_WCC
        {
            get; set;
        }
        
        public string MPC_APPLICANT
        {
            get; set;
        }
        public string CMS_CASE_CNTRL_NO
        {
            get; set;
        }
        public string OUTSD_LAW_FIRM_NAME
        {
            get; set;
        }
        public string LAW_FIRM
        {
            get; set;
        }
        public string CLM_PET_NUM_MANUAL
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
        public string PRI_ADDRESSEE_PHN_NUM
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
        public string PRI_ADDRESSEE_COUNTRY
        {
            get; set;
        }
        public string PRI_ADDRESSEE_POSTNET_INFO
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
        public string AUTH_NAME_CLOSING_FOR_MANUAL
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
        public string AUTHOR_EXEC_IND
        {
            get; set;
        }
        public string AUTHOR_CREDS
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
        public string PRINT_IND
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
        public string FAX_SUBJECT
        {
            get; set;
        }   
        public string CLMT_ATTORNEY_ST_ADDR
        {
            get; set;
        }
        public string CLMT_ATTORNEY_NAME
        {
            get; set;
        }
        public string CLMT_ATTORNEY_CTY
        {
            get; set;
        }
        public string CLMT_ATTORNEY_ST
        {
            get; set;
        }
        public string CLMT_ATTORNEY_ZIP
        {
            get; set;
        }
        public string CLMT_ATTORNEY_PHN
        {
            get; set;
        }
        public string INTERR_RCVR
        {
            get; set;
        }
        public string INTERR_RCVR2
        {
            get; set;
        }
        public string INTERR_RCVR3
        {
            get; set;
        }
        public string INTERR_RCVR4
        {
            get; set;
        }
        public string INTERR_RCVR5
        {
            get; set;
        }
        public string OUTSD_ATTORNEY_NAME
        {
            get; set;
        }
        public string OUTSD_ATTORNEY_ST_ADDR1
        {
            get; set;
        }
        public string OUTSD_ATTORNEY_ST_ADDR2
        {
            get; set;
        }
        public string OUTSD_ATTORNEY_ST_ADDR3
        {
            get; set;
        }
        public string OUTSD_ATTORNEY_CTY
        {
            get; set;
        }
        public string OUTSD_ATTORNEY_ST
        {
            get; set;
        }
        public string OUTSD_ATTORNEY_ZIP
        {
            get; set;
        }
        public string PROVIDER
        {
            get; set;
        }
        public string PROV_ST_ADDR1
        {
            get; set;
        }
        public string PROV_ST_ADDR2
        {
            get; set;
        }
        public string PROV_ST_ADDR3
        {
            get; set;
        }
        public string PROV_CTY
        {
            get; set;
        }
        public string PROV_ST
        {
            get; set;
        }
        public string PROV_ZIP
        {
            get; set;
        }
        public string PROVIDER_NAME
        {
            get; set;
        }
        public string PROVIDER_PHN_NUM
        {
            get; set;
        }
        public string PROVIDER_FAX_NO
        {
            get; set;
        }
        public string MatterCounselNJMAttorneyName
        {
            get; set;
        }
        public string MatterCounselNJMAttorneyEmail
        {
            get; set;
        }    
        public string NJM_ATTORNEY_SYS
        {
            get; set;
        }
        public string NJM_ATTNY_PHN
        {
            get; set;
        }
        public string NJM_ATTNY_FAX
        {
            get; set;
        }
        public string NJM_ATTNY_EXT
        {
            get; set;
        }
        public string ARCHIVE_IND
        {
            get; set;
        }
        public string SNE_NAME
        {
            get; set;
        }
        public string SNE_ST_ADDR_1
        {
            get; set;
        }
        public string SNE_ST_ADDR_2
        {
            get; set;
        }
        public string SNE_ST_ADDR_3
        {
            get; set;
        }
        public string SNE_CTY
        {
            get; set;
        }
        public string SNE_ST
        {
            get; set;
        }
        public string SNE_ZIP
        {
            get; set;
        }
        public string SNE_COUNTRY
        {
            get; set;
        }
        public string SNE_ATTN_TYPLST
        {
            get; set;
        }
        public string SNE_ATTN_VAL
        {
            get; set;
        }
        public string COURT_ADDRESS_1
        {
            get; set;
        }   
        public string COURT_CITY
        {
            get; set;
        }
        public string COURT_ZIP
        {
            get; set;
        }
        public string COURT_DATE
        {
            get; set;
        }
        public string RESPONSE_TIME
        {
            get; set;
        }
        public string RESPONSE_DATE
        {
            get; set;
        }
        public string HEARING_TIME
        {
            get; set;
        }
        public string JUDGE_NAME
        {
            get; set;
        }
        public string HEARING_MONTH
        {
            get; set;
        }
        public string HEARING_DAY
        {
            get; set;
        }
        public string HEARING_YR
        {
            get; set;
        }
        public string COURT_DAY
        {
            get; set;
        }
        public string ADJ_AND_CASE_MGR_NAME
        {
            get; set;
        }
        public string ADJ_AND_CASE_MGR_FX_NUM
        {
            get; set;
        }
        public string ADJ_AND_CASE_MGR_PHN_NUM
        {
            get; set;
        }
        public string ADJ_AND_CASE_MGR_EXT
        {
            get; set;
        }
        public string ADJ_CASE_MGR_CREDS
        {
            get; set;
        }
        public string NURSE_CASE_MGR_NM
        {
            get; set;
        }
        public string NURSE_CASE_MGR_FX_NUM
        {
            get; set;
        }
        public string NURSE_CASE_MGR_CREDS
        {
            get; set;
        }
        public string PHYS_NAME
        {
            get; set;
        }
        public string PHYS_ADDR_1
        {
            get; set;
        }
        public string PHYS_ADDR_2
        {
            get; set;
        }
        public string PHYS_ADDR_3
        {
            get; set;
        }
        public string PHYS_CTY
        {
            get; set;
        }
        public string PHYS_ST
        {
            get; set;
        }
        public string PHYS_ZIP
        {
            get; set;
        }
        public string PHYS_COUNTRY
        {
            get; set;
        }
        public string CLMT_PHYS_NM
        {
            get; set;
        }
        public string PHYS_PHN
        {
            get; set;
        }
        public string CC_RECIPIENT2
        {
            get; set;
        }
        public string ADMISS_STATUS
        {
            get; set;
        }
        public string PROVIDE_TAX_ID_AUTO
        {
            get; set;
        }
        public string SURGERY_DT
        {
            get; set;
        }
        public string SURGERY_STATUS
        {
            get; set;
        }
        public string FACIL_NAME
        {
            get; set;
        }
        public string REFERRED_BY
        {
            get; set;
        }
        public string PROVIDER_1
        {
            get; set;
        }
        public string PROV_ST_ADDR1_1
        {
            get; set;
        }
        public string PROV_ST_ADDR2_1
        {
            get; set;
        }
        public string PROV_ST_ADDR3_1
        {
            get; set;
        }
        public string PROV_CTY_1
        {
            get; set;
        }
        public string PROV_ST_1
        {
            get; set;
        }
        public string PROV_ZIP_1
        {
            get; set;
        }
        public string PROVIDER_PHN_NUM_1
        {
            get; set;
        }
        public string PROVIDER_2
        {
            get; set;
        }
        public string PROV_ST_ADDR1_2
        {
            get; set;
        }
        public string PROV_ST_ADDR2_2
        {
            get; set;
        }
        public string PROV_ST_ADDR3_2
        {
            get; set;
        }

        public string PROV_CTY_2
        {
            get; set;
        }
        public string PROV_ST_2
        {
            get; set;
        }
        public string PROV_ZIP_2
        {
            get; set;
        }
        public string PROVIDER_PHN_NUM_2
        {
            get; set;
        }
        public string PROVIDER_3
        {
            get; set;
        }
        public string PROV_ST_ADDR1_3
        {
            get; set;
        }
        public string PROV_ST_ADDR2_3
        {
            get; set;
        }
        public string PROV_ST_ADDR3_3
        {
            get; set;
        }
        public string PROV_CTY_3
        {
            get; set;
        }
        public string PROV_ST_3
        {
            get; set;
        }
        public string PROV_ZIP_3
        {
            get; set;
        }
        public string PROVIDER_PHN_NUM_3
        {
            get; set;
        }
        public string PROVIDER_4
        {
            get; set;
        }
        public string PROV_ST_ADDR1_4
        {
            get; set;
        }
        public string PROV_ST_ADDR2_4
        {
            get; set;
        }
        public string PROV_ST_ADDR3_4
        {
            get; set;
        }
        public string PROV_CTY_4
        {
            get; set;
        }
        public string PROV_ST_4
        {
            get; set;
        }
        public string PROV_ZIP_4
        {
            get; set;
        }
        public string PROVIDER_PHN_NUM_4
        {
            get; set;
        }
        public string CLMT_DEPENDENT_SYS
        {
            get; set;
        }
        public string GUARDIAN_NM
        {
            get; set;
        }
        public string SURGERY_COMMENTS_ADDL_INFO
        {
            get; set;
        }
        public string GUARDSURGERY_COMMENTS_ADDL_INFOIAN_NM
        {
            get; set;
        }
        public string NOT_CLINIC_SUP_MED_NECESSARY
        {
            get; set;
        }
        public string NOT_ACCORD_ACCEPT_STD
        {
            get; set;
        }
        public string DENIED_NON_COMPENSABLE
        {
            get; set;
        }
        public string NOT_CAUSALLY_REL
        {
            get; set;
        }
        public string DECISION_PEND_IME
        {
            get; set;
        }
        public string DECISION_PEND_SEC_OPINION
        {
            get; set;
        }
        public string LACK_UPDATED_MED_DOC
        {
            get; set;
        }
        public string LACK_CONSERV_CARE_SUP_MED_NECESSITY
        {
            get; set;
        }
        public string CHK_AMT_1
        {
            get; set;
        }
        public string CHK_AMT_2
        {
            get; set;
        }
        public string CHK_AMT_3
        {
            get; set;
        }
        public string CHK_AMT_4
        {
            get; set;
        }
        public string CHK_AMT_5
        {
            get; set;
        }
        public string CHK_AMT_6
        {
            get; set;
        }
        public string HOSP_NAME
        {
            get; set;
        }
        public string HOSP_ADDR1
        {
            get; set;
        }
        public string HOSP_ADDR2
        {
            get; set;
        }
        public string HOSP_ADDR3
        {
            get; set;
        }
        public string HOSP_CTY
        {
            get; set;
        }
        public string HOSP_ST
        {
            get; set;
        }
        public string HOSP_ZIP
        {
            get; set;
        }
        public string HOSP_COUNTRY
        {
            get; set;
        }
        public string WITNESS_NAME
        {
            get; set;
        }
        public string WITNESS_PHN
        {
            get; set;
        }
        public string TOT_CHK_AMT
        {
            get; set;
        }
        public string ALL_LAW_FIRMS
        {
            get; set;
        }
        public string OTH_OVERPYMNT_REASON
        {
            get; set;
        }
        public string OVERPYMNT_TYPE
        {
            get; set;
        }
        public string CHK_PAYABLE_TO
        {
            get; set;
        }
        public string MAIL_TO_ADDR1
        {
            get; set;
        }
        public string MAIL_TO_ADDR2
        {
            get; set;
        }
        public string MAIL_TO_CITY
        {
            get; set;
        }
        public string MAIL_TO_ST
        {
            get; set;
        }
        public string MAIL_TO_ZIP
        {
            get; set;
        }
        public string NO_CHARTS
        {
            get; set;
        }       
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMAFF_BODY_PART
    {
        public string CLM_FK
        {
            get; set;
        }
        public string BODY_PART
        {
            get; set;
        }
        public string BODY_PART_CD
        {
            get; set;
        }
        public string PRIMARY_IND
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMWCC_RE_OPT
    {
        public string CLM_FK
        {
            get; set;
        }
        public string RE_OPT_NAME
        {
            get; set;
        }
        public string RE_OPT_VAL
        {
            get; set;
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMWCC_CC_OPT
    {
        public string CLM_FK
        {
            get; set;
        }
        public string CC_REF
        {
            get; set;
        }
        public string CC_BCC_IND
        {
            get; set;
        }
        public string CC_ADDRESSEE_NAME
        {
            get; set;
        }
        public string CC_ADDRESSEE_ADDR_1
        {
            get; set;
        }
        public string CC_ADDRESSEE_ADDR_2
        {
            get; set;
        }
        public string CC_ADDRESSEE_CTY
        {
            get; set;
        }
        public string CC_ADDRESSEE_ST
        {
            get; set;
        }
        public string CC_ADDRESSEE_ZIP
        {
            get; set;
        }
        public string CC_ADDRESSEE_POSTNET_INFO
        {
            get; set;
        }
     
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMCLM_PETITION_NO_REC
    {

        private string cLM_FKField;

        private string cLM_PETITION_NOField;

        /// <remarks/>
        public string CLM_FK
        {
            get
            {
                return this.cLM_FKField;
            }
            set
            {
                this.cLM_FKField = value;
            }
        }

        /// <remarks/>
        public string CLM_PETITION_NO
        {
            get
            {
                return this.cLM_PETITION_NOField;
            }
            set
            {
                this.cLM_PETITION_NOField = value;
            }
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMMULTIPLE_PROVIDER
    {

        private string cLM_FKField;

        private string pROVIDER_NM_MULTIField;

        private string pROVIDER_PHN_NUM_MULTIField;

        private string pROVIDER_ST_ADD_1_MULTIField;

        private string pROVIDER_ST_ADD_2_MULTIField;

        private string pROVIDER_ST_ADD_3_MULTIField;

        private string pROVIDER_CTY_MULTIField;

        private string pROVIDER_ST_MULTIField;

        private string pROVIDER_ZIP_MULTIField;

        /// <remarks/>
        public string CLM_FK
        {
            get
            {
                return this.cLM_FKField;
            }
            set
            {
                this.cLM_FKField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_NM_MULTI
        {
            get
            {
                return this.pROVIDER_NM_MULTIField;
            }
            set
            {
                this.pROVIDER_NM_MULTIField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_PHN_NUM_MULTI
        {
            get
            {
                return this.pROVIDER_PHN_NUM_MULTIField;
            }
            set
            {
                this.pROVIDER_PHN_NUM_MULTIField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_ST_ADD_1_MULTI
        {
            get
            {
                return this.pROVIDER_ST_ADD_1_MULTIField;
            }
            set
            {
                this.pROVIDER_ST_ADD_1_MULTIField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_ST_ADD_2_MULTI
        {
            get
            {
                return this.pROVIDER_ST_ADD_2_MULTIField;
            }
            set
            {
                this.pROVIDER_ST_ADD_2_MULTIField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_ST_ADD_3_MULTI
        {
            get
            {
                return this.pROVIDER_ST_ADD_3_MULTIField;
            }
            set
            {
                this.pROVIDER_ST_ADD_3_MULTIField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_CTY_MULTI
        {
            get
            {
                return this.pROVIDER_CTY_MULTIField;
            }
            set
            {
                this.pROVIDER_CTY_MULTIField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_ST_MULTI
        {
            get
            {
                return this.pROVIDER_ST_MULTIField;
            }
            set
            {
                this.pROVIDER_ST_MULTIField = value;
            }
        }

        /// <remarks/>
        public string PROVIDER_ZIP_MULTI
        {
            get
            {
                return this.pROVIDER_ZIP_MULTIField;
            }
            set
            {
                this.pROVIDER_ZIP_MULTIField = value;
            }
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMDENIAL
    {

        private string rEASON_DENIALField;

        private string cLM_FKField;

        /// <remarks/>
        public string REASON_DENIAL
        {
            get
            {
                return this.rEASON_DENIALField;
            }
            set
            {
                this.rEASON_DENIALField = value;
            }
        }

        /// <remarks/>
        public string CLM_FK
        {
            get
            {
                return this.cLM_FKField;
            }
            set
            {
                this.cLM_FKField = value;
            }
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIMNJM_CHART_DATA
    {

        private string cHART_NOField;

        private string cHART_TITLEField;

        private string cHART_LABELField;

        private string cHART_VALUEField;

        private string cLM_FKField;

        /// <remarks/>
        public string CHART_NO
        {
            get
            {
                return this.cHART_NOField;
            }
            set
            {
                this.cHART_NOField = value;
            }
        }

        /// <remarks/>
        public string CHART_TITLE
        {
            get
            {
                return this.cHART_TITLEField;
            }
            set
            {
                this.cHART_TITLEField = value;
            }
        }

        /// <remarks/>
        public string CHART_LABEL
        {
            get
            {
                return this.cHART_LABELField;
            }
            set
            {
                this.cHART_LABELField = value;
            }
        }

        /// <remarks/>
        public string CHART_VALUE
        {
            get
            {
                return this.cHART_VALUEField;
            }
            set
            {
                this.cHART_VALUEField = value;
            }
        }

        /// <remarks/>
        public string CLM_FK
        {
            get
            {
                return this.cLM_FKField;
            }
            set
            {
                this.cLM_FKField = value;
            }
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_DELIM_DME_DATA
    {
        /// <remarks/>
        public string EQUIP_STATUS
        {
            get; set;
        }

        /// <remarks/>
        public string EQUIP_DETAILS
        {
            get; set;
        }

        /// <remarks/>
        public string DME_NOTES
        {
            get; set;
        }

        /// <remarks/>
        public string CLM_FK
        {
            get; set;
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class WCC_DATARECORD_PHYSICAL_THERAPY_DATA
    {
        /// <remarks/>
        public string SERVICE
        {
            get; set;
        }
        public string PRIMARY_BODY_PART
        {
            get; set;
        }
        public string DETAILED_BODY_PART
        {
            get; set;
        }
        public string CERTIFICATION
        {
            get; set;
        }
        public string REQUESTED_VISITS
        {
            get; set;
        }
        public string TOTAL_VISITS
        {
            get; set;
        }
        public string AUTH_NUM_VISITS
        {
            get; set;
        }
        public string APPROVAL_STATUS
        {
            get; set;
        }
        public string DIAGNOSIS_CODE
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
    public partial class WCC_DATARECORD_TRTMNT_PARENT_REC_DATA
    {
        /// <remarks/>
        public string INFO_ADD_TRTMNT
        {
            get; set;
        }
        public string OTH_INFO_ADD_TRTMNT
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
    public partial class WCC_DATARECORD_OVER_PAYMENT_REC_DATA
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
    public partial class WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA
    {
        /// <remarks/>
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
        public string TOT_CHK_AMT
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
    public partial class WCC_DATARECORD_PROCEDURE_REC_DATA
    {
 
        /// <remarks/>
        public string TABLE_TYPE
        {
            get; set;
        }
        public string ASSIST_TYPE
        {
            get; set;
        }
        public string COSURG_STATUS
        {
            get; set;
        }
        public string PROCED_CODES
        {
            get; set;
        }
        public string ASSIST_STATUS
        {
            get; set;
        }
        public string PROVIDE_STATUS
        {
            get; set;
        }
        public string CLM_FK
        {
            get; set;
        }
    }
}

