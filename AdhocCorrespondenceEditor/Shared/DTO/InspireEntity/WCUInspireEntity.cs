namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.WCU
{
    public class WCUInspireEntity : InspireBase
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

        /// <remarks/>
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

        private CUSTOMER_DATARECORD_DELIMNJM_POL_HLD[] nJM_POL_HLDField; 

        private CUSTOMER_DATARECORD_DELIMST_OF_OWNERSHIP_REC[] sT_OF_OWNERSHIP_RECField;

        private CUSTOMER_DATARECORD_DELIMLTR_NAME_REC lTR_NAME_RECField = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();

        private CUSTOMER_DATARECORD_DELIMEXP_RATE[] eXP_RATEField;

        private CUSTOMER_DATARECORD_DELIMPOLICY_CC_OPT[] pOLICY_CC_OPTField;


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
        [System.Xml.Serialization.XmlElementAttribute("NJM_POL_HLD")]
        public CUSTOMER_DATARECORD_DELIMNJM_POL_HLD[] NJM_POL_HLD
        {
            get
            {
                return this.nJM_POL_HLDField;
            }
            set
            {
                this.nJM_POL_HLDField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("ST_OF_OWNERSHIP_REC")]
        public CUSTOMER_DATARECORD_DELIMST_OF_OWNERSHIP_REC[] ST_OF_OWNERSHIP_REC
        {
            get
            {
                return this.sT_OF_OWNERSHIP_RECField;
            }
            set
            {
                this.sT_OF_OWNERSHIP_RECField = value;
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
        [System.Xml.Serialization.XmlElementAttribute("EXP_RATE")]
        public CUSTOMER_DATARECORD_DELIMEXP_RATE[] EXP_RATE
        {
            get
            {
                return this.eXP_RATEField;
            }
            set
            {
                this.eXP_RATEField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("POLICY_CC_OPT")]
        public CUSTOMER_DATARECORD_DELIMPOLICY_CC_OPT[] POLICY_CC_OPT
        {
            get
            {
                return this.pOLICY_CC_OPTField;
            }
            set
            {
                this.pOLICY_CC_OPTField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMPOLICY_REC
    {

        private string pOL_PKField;

        private string sRC_SYSField;

        private string pOL_STField;

        private string pOL_NOField;

        private string pRIMARY_INS_POL_HLD_NAMEField;

        private string pOL_EFF_YRField;

        private string pOL_EXP_YRField;

        private string aUDIT_PERIOD_BEGIN_DTField;

        private string aUDIT_PERIOD_END_DTField;

        private string pOL_EFF_DTField;

        private string pOL_EXP_DTField;

        private string oB_KEYWORD1Field;

        private string oB_KEYWORD2Field;

        private string oB_KEYWORD3Field;

        private string oB_KEYWORD4Field;
        private string oB_KEYWORD5Field;

        private string oB_KEYWORD6Field;
        private string oB_KEYWORD12Field;

        private string cERT_INDField;

        private string bARCODE_INDField;

        private string wCU_CSF_TYPEField;

        private string pOL_NO_PADField;

        private string aPPLICANT_CO_NMField;

        private string aPPLICANT_ADDR_1Field;
        private string aPPLICANT_ADDR_2Field;
        private string aPPLICANT_ADDR_3Field;

        private string aPPLICANT_CTYField;

        private string aPPLICANT_STField;

        private string aPPLICANT_ZIPField;

        private string eMP_NAMEField;

        private string eMP_CLM_LOC_ADDRField;

        private string eMP_CLM_LOC_CITYField;

        private string eMP_CLM_LOC_STField;

        private string eMP_CLM_LOC_ZIPField;

        private string nJM_POL_ADDR_1Field;
        private string nJM_POL_ADDR_2Field;
        private string nJM_POL_ADDR_3Field;
        private string nJM_POL_CTYField;

        private string nJM_POL_STField;

        private string nJM_POL_ZIPField;

        private string pOL_HLD_NAME_MULTI_CHAR_COUNTField;

        private string aUTHOR_EXEC_INDField;

        private string pKG_NAMEField;

        private string nJM_ACCT_NUMField;

        private string pRIMARY_NAMED_INS_ONLY_MANField;
        private string pNJM_POLHOLD_PHONE_NOField;

        private string bUREAU_FILE_NUMField;

        private string iNBND_DOCTYPEField;

        private string cURR_DTField;

        private string lTR_CTGYField;

        private string lTR_NAMEField;

        private string oUTBND_DOCTYPEField;

        private string cNC_DTField;

        private string cREATOR_UIDField;

        private string cREATOR_NAMEField;

        private string cREATOR_INTField;

        private string iNS_CO_NMField;

        private string aDDRESSEE_NAMEField;

        private string aDDRESSEE_CO_NMField;

        private string aDDRESSEE_ADDR_1Field;
        private string aDDRESSEE_ADDR_2Field;
        private string aDDRESSEE_ADDR_3Field;

        private string aDDRESSEE_CTYField;

        private string aDDRESSEE_STField;

        private string aDDRESSEE_ZIPField;

        private string aRCHIVE_INDField;

        private string pRINT_INDField;

        private string pRINTER_NAMEField;

        /// <remarks/>
        public string POL_PK
        {
            get
            {
                return this.pOL_PKField;
            }
            set
            {
                this.pOL_PKField = value;
            }
        }

        /// <remarks/>
        public string SRC_SYS
        {
            get
            {
                return this.sRC_SYSField;
            }
            set
            {
                this.sRC_SYSField = value;
            }
        }

        /// <remarks/>
        public string POL_ST
        {
            get
            {
                return this.pOL_STField;
            }
            set
            {
                this.pOL_STField = value;
            }
        }

        /// <remarks/>
        public string POL_NO
        {
            get
            {
                return this.pOL_NOField;
            }
            set
            {
                this.pOL_NOField = value;
            }
        }

        /// <remarks/>
        public string PRIMARY_INS_POL_HLD_NAME
        {
            get
            {
                return this.pRIMARY_INS_POL_HLD_NAMEField;
            }
            set
            {
                this.pRIMARY_INS_POL_HLD_NAMEField = value;
            }
        }

        /// <remarks/>
        public string POL_EFF_YR
        {
            get
            {
                return this.pOL_EFF_YRField;
            }
            set
            {
                this.pOL_EFF_YRField = value;
            }
        }

        /// <remarks/>
        public string POL_EXP_YR
        {
            get
            {
                return this.pOL_EXP_YRField;
            }
            set
            {
                this.pOL_EXP_YRField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "string")]
        public string AUDIT_PERIOD_BEGIN_DT
        {
            get
            {
                return this.aUDIT_PERIOD_BEGIN_DTField;
            }
            set
            {
                this.aUDIT_PERIOD_BEGIN_DTField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "string")]
        public string AUDIT_PERIOD_END_DT
        {
            get
            {
                return this.aUDIT_PERIOD_END_DTField;
            }
            set
            {
                this.aUDIT_PERIOD_END_DTField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "string")]
        public string POL_EFF_DT
        {
            get
            {
                return this.pOL_EFF_DTField;
            }
            set
            {
                this.pOL_EFF_DTField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "string")]
        public string POL_EXP_DT
        {
            get
            {
                return this.pOL_EXP_DTField;
            }
            set
            {
                this.pOL_EXP_DTField = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD1
        {
            get
            {
                return this.oB_KEYWORD1Field;
            }
            set
            {
                this.oB_KEYWORD1Field = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD2
        {
            get
            {
                return this.oB_KEYWORD2Field;
            }
            set
            {
                this.oB_KEYWORD2Field = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD3
        {
            get
            {
                return this.oB_KEYWORD3Field;
            }
            set
            {
                this.oB_KEYWORD3Field = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD4
        {
            get
            {
                return this.oB_KEYWORD4Field;
            }
            set
            {
                this.oB_KEYWORD4Field = value;
            }
        }
        public string OB_KEYWORD5
        {
            get
            {
                return this.oB_KEYWORD5Field;
            }
            set
            {
                this.oB_KEYWORD5Field = value;
            }
        }
        /// <remarks/>
        public string OB_KEYWORD6
        {
            get
            {
                return this.oB_KEYWORD6Field;
            }
            set
            {
                this.oB_KEYWORD6Field = value;
            }
        }
        public string OB_KEYWORD12
        {
            get
            {
                return this.oB_KEYWORD12Field;
            }
            set
            {
                this.oB_KEYWORD12Field = value;
            }
        }
        /// <remarks/>
        public string CERT_IND
        {
            get
            {
                return this.cERT_INDField;
            }
            set
            {
                this.cERT_INDField = value;
            }
        }

        /// <remarks/>
        public string BARCODE_IND
        {
            get
            {
                return this.bARCODE_INDField;
            }
            set
            {
                this.bARCODE_INDField = value;
            }
        }

        /// <remarks/>
        public string WCU_CSF_TYPE
        {
            get
            {
                return this.wCU_CSF_TYPEField;
            }
            set
            {
                this.wCU_CSF_TYPEField = value;
            }
        }

        /// <remarks/>
        public string POL_NO_PAD
        {
            get
            {
                return this.pOL_NO_PADField;
            }
            set
            {
                this.pOL_NO_PADField = value;
            }
        }

        /// <remarks/>
        public string APPLICANT_CO_NM
        {
            get
            {
                return this.aPPLICANT_CO_NMField;
            }
            set
            {
                this.aPPLICANT_CO_NMField = value;
            }
        }

        /// <remarks/>
        public string APPLICANT_ADDR_1
        {
            get
            {
                return this.aPPLICANT_ADDR_1Field;
            }
            set
            {
                this.aPPLICANT_ADDR_1Field = value;
            }
        }
        public string APPLICANT_ADDR_2
        {
            get
            {
                return this.aPPLICANT_ADDR_2Field;
            }
            set
            {
                this.aPPLICANT_ADDR_2Field = value;
            }
        }
        public string APPLICANT_ADDR_3
        {
            get
            {
                return this.aPPLICANT_ADDR_3Field;
            }
            set
            {
                this.aPPLICANT_ADDR_3Field = value;
            }
        }
        /// <remarks/>
        public string APPLICANT_CTY
        {
            get
            {
                return this.aPPLICANT_CTYField;
            }
            set
            {
                this.aPPLICANT_CTYField = value;
            }
        }

        /// <remarks/>
        public string APPLICANT_ST
        {
            get
            {
                return this.aPPLICANT_STField;
            }
            set
            {
                this.aPPLICANT_STField = value;
            }
        }

        /// <remarks/>
        public string APPLICANT_ZIP
        {
            get
            {
                return this.aPPLICANT_ZIPField;
            }
            set
            {
                this.aPPLICANT_ZIPField = value;
            }
        }

        /// <remarks/>
        public string EMP_NAME
        {
            get
            {
                return this.eMP_NAMEField;
            }
            set
            {
                this.eMP_NAMEField = value;
            }
        }

        /// <remarks/>
        public string EMP_CLM_LOC_ADDR
        {
            get
            {
                return this.eMP_CLM_LOC_ADDRField;
            }
            set
            {
                this.eMP_CLM_LOC_ADDRField = value;
            }
        }

        /// <remarks/>
        public string EMP_CLM_LOC_CITY
        {
            get
            {
                return this.eMP_CLM_LOC_CITYField;
            }
            set
            {
                this.eMP_CLM_LOC_CITYField = value;
            }
        }

        /// <remarks/>
        public string EMP_CLM_LOC_ST
        {
            get
            {
                return this.eMP_CLM_LOC_STField;
            }
            set
            {
                this.eMP_CLM_LOC_STField = value;
            }
        }

        /// <remarks/>
        public string EMP_CLM_LOC_ZIP
        {
            get
            {
                return this.eMP_CLM_LOC_ZIPField;
            }
            set
            {
                this.eMP_CLM_LOC_ZIPField = value;
            }
        }

        /// <remarks/>
        public string NJM_POL_ADDR_1
        {
            get
            {
                return this.nJM_POL_ADDR_1Field;
            }
            set
            {
                this.nJM_POL_ADDR_1Field = value;
            }
        }
        public string NJM_POL_ADDR_2
        {
            get
            {
                return this.nJM_POL_ADDR_2Field;
            }
            set
            {
                this.nJM_POL_ADDR_2Field = value;
            }
        }
        public string NJM_POL_ADDR_3
        {
            get
            {
                return this.nJM_POL_ADDR_3Field;
            }
            set
            {
                this.nJM_POL_ADDR_3Field = value;
            }
        }
        /// <remarks/>
        public string NJM_POL_CTY
        {
            get
            {
                return this.nJM_POL_CTYField;
            }
            set
            {
                this.nJM_POL_CTYField = value;
            }
        }

        /// <remarks/>
        public string NJM_POL_ST
        {
            get
            {
                return this.nJM_POL_STField;
            }
            set
            {
                this.nJM_POL_STField = value;
            }
        }

        /// <remarks/>
        public string NJM_POL_ZIP
        {
            get
            {
                return this.nJM_POL_ZIPField;
            }
            set
            {
                this.nJM_POL_ZIPField = value;
            }
        }

        /// <remarks/>
        public string POL_HLD_NAME_MULTI_CHAR_COUNT
        {
            get
            {
                return this.pOL_HLD_NAME_MULTI_CHAR_COUNTField;
            }
            set
            {
                this.pOL_HLD_NAME_MULTI_CHAR_COUNTField = value;
            }
        }

        /// <remarks/>
        public string AUTHOR_EXEC_IND
        {
            get
            {
                return this.aUTHOR_EXEC_INDField;
            }
            set
            {
                this.aUTHOR_EXEC_INDField = value;
            }
        }
        public string PKG_NAME
        {
            get
            {
                return this.pKG_NAMEField;
            }
            set
            {
                this.pKG_NAMEField = value;
            }
        }
        

        /// <remarks/>
        public string NJM_ACCT_NUM
        {
            get
            {
                return this.nJM_ACCT_NUMField;
            }
            set
            {
                this.nJM_ACCT_NUMField = value;
            }
        }

        /// <remarks/>
        public string PRIMARY_NAMED_INS_ONLY_MAN
        {
            get
            {
                return this.pRIMARY_NAMED_INS_ONLY_MANField;
            }
            set
            {
                this.pRIMARY_NAMED_INS_ONLY_MANField = value;
            }
        }
        public string NJM_POLHOLD_PHONE_NO
        {
            get
            {
                return this.pNJM_POLHOLD_PHONE_NOField;
            }
            set
            {
                this.pNJM_POLHOLD_PHONE_NOField = value;
            }
        }
        

        /// <remarks/>
        public string BUREAU_FILE_NUM
        {
            get
            {
                return this.bUREAU_FILE_NUMField;
            }
            set
            {
                this.bUREAU_FILE_NUMField = value;
            }
        }

        /// <remarks/>
        public string INBND_DOCTYPE
        {
            get
            {
                return this.iNBND_DOCTYPEField;
            }
            set
            {
                this.iNBND_DOCTYPEField = value;
            }
        }

        /// <remarks/>
        public string CURR_DT
        {
            get
            {
                return this.cURR_DTField;
            }
            set
            {
                this.cURR_DTField = value;
            }
        }

        /// <remarks/>
        public string LTR_CTGY
        {
            get
            {
                return this.lTR_CTGYField;
            }
            set
            {
                this.lTR_CTGYField = value;
            }
        }

        /// <remarks/>
        public string LTR_NAME
        {
            get
            {
                return this.lTR_NAMEField;
            }
            set
            {
                this.lTR_NAMEField = value;
            }
        }

        /// <remarks/>
        public string OUTBND_DOCTYPE
        {
            get
            {
                return this.oUTBND_DOCTYPEField;
            }
            set
            {
                this.oUTBND_DOCTYPEField = value;
            }
        }

        /// <remarks/>
        public string CNC_DT
        {
            get
            {
                return this.cNC_DTField;
            }
            set
            {
                this.cNC_DTField = value;
            }
        }

        /// <remarks/>
        public string CREATOR_UID
        {
            get
            {
                return this.cREATOR_UIDField;
            }
            set
            {
                this.cREATOR_UIDField = value;
            }
        }

        /// <remarks/>
        public string CREATOR_NAME
        {
            get
            {
                return this.cREATOR_NAMEField;
            }
            set
            {
                this.cREATOR_NAMEField = value;
            }
        }

        /// <remarks/>
        public string CREATOR_INT
        {
            get
            {
                return this.cREATOR_INTField;
            }
            set
            {
                this.cREATOR_INTField = value;
            }
        }

        /// <remarks/>
        public string INS_CO_NM
        {
            get
            {
                return this.iNS_CO_NMField;
            }
            set
            {
                this.iNS_CO_NMField = value;
            }
        }

        /// <remarks/>
        public string ADDRESSEE_NAME
        {
            get
            {
                return this.aDDRESSEE_NAMEField;
            }
            set
            {
                this.aDDRESSEE_NAMEField = value;
            }
        }

        /// <remarks/>
        public string ADDRESSEE_CO_NM
        {
            get
            {
                return this.aDDRESSEE_CO_NMField;
            }
            set
            {
                this.aDDRESSEE_CO_NMField = value;
            }
        }

        /// <remarks/>
        public string ADDRESSEE_ADDR_1
        {
            get
            {
                return this.aDDRESSEE_ADDR_1Field;
            }
            set
            {
                this.aDDRESSEE_ADDR_1Field = value;
            }
        }
        public string ADDRESSEE_ADDR_2
        {
            get
            {
                return this.aDDRESSEE_ADDR_2Field;
            }
            set
            {
                this.aDDRESSEE_ADDR_2Field = value;
            }
        }
        public string ADDRESSEE_ADDR_3
        {
            get
            {
                return this.aDDRESSEE_ADDR_3Field;
            }
            set
            {
                this.aDDRESSEE_ADDR_3Field = value;
            }
        }
        /// <remarks/>
        public string ADDRESSEE_CTY
        {
            get
            {
                return this.aDDRESSEE_CTYField;
            }
            set
            {
                this.aDDRESSEE_CTYField = value;
            }
        }

        /// <remarks/>
        public string ADDRESSEE_ST
        {
            get
            {
                return this.aDDRESSEE_STField;
            }
            set
            {
                this.aDDRESSEE_STField = value;
            }
        }

        /// <remarks/>
        public string ADDRESSEE_ZIP
        {
            get
            {
                return this.aDDRESSEE_ZIPField;
            }
            set
            {
                this.aDDRESSEE_ZIPField = value;
            }
        }

        /// <remarks/>
        public string ARCHIVE_IND
        {
            get
            {
                return this.aRCHIVE_INDField;
            }
            set
            {
                this.aRCHIVE_INDField = value;
            }
        }

        /// <remarks/>
        public string PRINT_IND
        {
            get
            {
                return this.pRINT_INDField;
            }
            set
            {
                this.pRINT_INDField = value;
            }
        }

        /// <remarks/>
        public string PRINTER_NAME
        {
            get
            {
                return this.pRINTER_NAMEField;
            }
            set
            {
                this.pRINTER_NAMEField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMNJM_POL_HLD
    {

        private string pOL_HLD_NAME_MULTIField;

        private string pOL_FKField;

        /// <remarks/>
        public string POL_HLD_NAME_MULTI
        {
            get
            {
                return this.pOL_HLD_NAME_MULTIField;
            }
            set
            {
                this.pOL_HLD_NAME_MULTIField = value;
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

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMST_OF_OWNERSHIP_REC
    {

        private string sT_OF_OWNERSHIP_INFOField;

        private string rATING_BUREAU_FILE_NUMField;

        /// <remarks/>
        public string ST_OF_OWNERSHIP_INFO
        {
            get
            {
                return this.sT_OF_OWNERSHIP_INFOField;
            }
            set
            {
                this.sT_OF_OWNERSHIP_INFOField = value;
            }
        }

        /// <remarks/>
        public string RATING_BUREAU_FILE_NUM
        {
            get
            {
                return this.rATING_BUREAU_FILE_NUMField;
            }
            set
            {
                this.rATING_BUREAU_FILE_NUMField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMLTR_NAME_REC
    {

        private string pOL_FKField;

        private string lTR_NAME_BATCHField;

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

        /// <remarks/>
        public string LTR_NAME_BATCH
        {
            get
            {
                return this.lTR_NAME_BATCHField;
            }
            set
            {
                this.lTR_NAME_BATCHField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMEXP_RATE
    {

        private string pOL_FKField;

        private string pOL_YRField;

        private string mODField;

        private string eMR_EFF_DTField;

        private string eMR_EXP_DTField;
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

        /// <remarks/>
        public string POL_YR
        {
            get
            {
                return this.pOL_YRField;
            }
            set
            {
                this.pOL_YRField = value;
            }
        }

        /// <remarks/>
        public string MOD
        {
            get
            {
                return this.mODField;
            }
            set
            {
                this.mODField = value;
            }
        }
        public string EMR_EFF_DT
        {
            get
            {
                return this.eMR_EFF_DTField;
            }
            set
            {
                this.eMR_EFF_DTField = value;
            }
        }

        public string EMR_EXP_DT
        {
            get
            {
                return this.eMR_EXP_DTField;
            }
            set
            {
                this.eMR_EXP_DTField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMPOLICY_CC_OPT
    {

        private string bILL_FKField;

        private string cC_BCC_INDField;

        private string cC_ADDRESSEE_CO_NMField;

        private string cC_ADDRESSEE_NAMEField;

        private string cC_ADDRESSEE_ADDR_1Field;

        private string cC_ADDRESSEE_ADDR_2Field;

        private string cC_ADDRESSEE_ADDR_3Field;

        private string cC_ADDRESSEE_CTYField;

        private string cC_ADDRESSEE_STField;

        private string cC_ADDRESSEE_ZIPField;

        /// <remarks/>
        public string BILL_FK
        {
            get
            {
                return this.bILL_FKField;
            }
            set
            {
                this.bILL_FKField = value;
            }
        }

        /// <remarks/>
        public string CC_BCC_IND
        {
            get
            {
                return this.cC_BCC_INDField;
            }
            set
            {
                this.cC_BCC_INDField = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_CO_NM
        {
            get
            {
                return this.cC_ADDRESSEE_CO_NMField;
            }
            set
            {
                this.cC_ADDRESSEE_CO_NMField = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_NAME
        {
            get
            {
                return this.cC_ADDRESSEE_NAMEField;
            }
            set
            {
                this.cC_ADDRESSEE_NAMEField = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_ADDR_1
        {
            get
            {
                return this.cC_ADDRESSEE_ADDR_1Field;
            }
            set
            {
                this.cC_ADDRESSEE_ADDR_1Field = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_ADDR_2
        {
            get
            {
                return this.cC_ADDRESSEE_ADDR_2Field;
            }
            set
            {
                this.cC_ADDRESSEE_ADDR_2Field = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_ADDR_3
        {
            get
            {
                return this.cC_ADDRESSEE_ADDR_3Field;
            }
            set
            {
                this.cC_ADDRESSEE_ADDR_3Field = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_CTY
        {
            get
            {
                return this.cC_ADDRESSEE_CTYField;
            }
            set
            {
                this.cC_ADDRESSEE_CTYField = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_ST
        {
            get
            {
                return this.cC_ADDRESSEE_STField;
            }
            set
            {
                this.cC_ADDRESSEE_STField = value;
            }
        }

        /// <remarks/>
        public string CC_ADDRESSEE_ZIP
        {
            get
            {
                return this.cC_ADDRESSEE_ZIPField;
            }
            set
            {
                this.cC_ADDRESSEE_ZIPField = value;
            }
        }
    }
}
