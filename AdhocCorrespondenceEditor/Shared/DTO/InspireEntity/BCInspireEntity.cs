namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity
{
    public class BCInspireEntity : InspireBase
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

        private CUSTOMER_DATARECORD_DELIMBILLING_REC bILLING_RECField = new CUSTOMER_DATARECORD_DELIMBILLING_REC();

        private CUSTOMER_DATARECORD_DELIMLTR_NAME_REC lTR_NAME_RECField = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();

        private CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT[] bILLING_CC_OPTField;

        private CUSTOMER_DATARECORD_DELIMCOPY_TO[] cOPY_TOField;

        private CUSTOMER_DATARECORD_DELIMRemainingInstallments[] remainingInstallmentsField;

        private CUSTOMER_DATARECORD_DELIMInvoiceTransactions[] invoiceTransactionsField;

        private CUSTOMER_DATARECORD_DELIMTRANS_DATE_REC[] tRANS_DATE_RECField;

        /// <remarks/>
        public CUSTOMER_DATARECORD_DELIMBILLING_REC BILLING_REC
        {
            get
            {
                return this.bILLING_RECField;
            }
            set
            {
                this.bILLING_RECField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("InvoiceTransactions")]
        public CUSTOMER_DATARECORD_DELIMInvoiceTransactions[] InvoiceTransactions
        {
            get
            {
                return this.invoiceTransactionsField;
            }
            set
            {
                this.invoiceTransactionsField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("TRANS_DATE_REC")]
        public CUSTOMER_DATARECORD_DELIMTRANS_DATE_REC[] TRANS_DATE_REC
        {
            get
            {
                return this.tRANS_DATE_RECField;
            }
            set
            {
                this.tRANS_DATE_RECField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("RemainingInstallments")]
        public CUSTOMER_DATARECORD_DELIMRemainingInstallments[] RemainingInstallments
        {
            get
            {
                return this.remainingInstallmentsField;
            }
            set
            {
                this.remainingInstallmentsField = value;
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
        ///[System.Xml.Serialization.XmlElementAttribute("RemainingInstallments")]
        [System.Xml.Serialization.XmlElementAttribute("BILLING_CC_OPT")]

        public CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT[] BILLING_CC_OPT
        {
            get
            {
                return this.bILLING_CC_OPTField;
            }
            set
            {
                this.bILLING_CC_OPTField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("COPY_TO")]

        public CUSTOMER_DATARECORD_DELIMCOPY_TO[] COPY_TO
        {
            get
            {
                return this.cOPY_TOField;
            }
            set
            {
                this.cOPY_TOField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMBILLING_REC
    {

        private string bILL_PKField;

        private string sRC_SYSField;

        private string oUTBND_DOCTYPEField;
        private string eMAIL_TOField;

        private string eMAIL_INDField;
        private string eMAIL_FROMField;

        private string eMAIL_BODYField;

        private string eMAIL_SUBJECTField;

        private string pOL_NOField;

        private string tEMP_AMTField;

        private string aMTField;

        private string iNV_DTField;

        private string cNC_EFF_DTField;

        private string pOL_EFF_DTField;

        private string pOL_EXP_DTField;

        private string pOL_EFF_YRField;

        private string eARNED_PREM_AMTField;

        private string pAST_DUE_AMTField;

        private string iNS_POL_HLD_NAME_1Field;

        private string iNS_POL_HLD_NAME_2Field;

        private string tOT_AMT_DUEField;

        private string tOT_AMT_DUE_TEMPField;

        private string cUR_INSTALL_AMTField;

        private string tEMP_PAST_DUE_AMTField;

        private string full_AMT_PremField;

        private string oB_KEYWORD1Field;

        private string oB_KEYWORD2Field;

        private string oB_KEYWORD3Field;

        private string oB_KEYWORD4Field;

        private string oB_KEYWORD5Field;

        private string oB_KEYWORD6Field;

        private string oB_KEYWORD7Field;

        private string oB_KEYWORD8Field;

        private string oB_KEYWORD9Field;

        private string oB_KEYWORD10Field;

        private string oB_KEYWORD11Field;

        private string oB_KEYWORD12Field;

        private string bARCODE_INDField;

        private string cERT_INDField;

        private string gUNTHER_INDField;

        private string rEAS_CODE_DESCField;

        private string cANCEL_MAIL_DTField;

        private string nOT_HONORED_PYMT_AMTField;

        private string pYMT_AMTField;

        private string bR_NJM_POL_NO_Field;

        private string BR_NJM_POLHOLD_NAME_1_Field;

        private string pOL_STField;

        private string iNS_POL_HLD_ADD_1Field;

        private string iNS_POL_HLD_ADD_2Field;

        private string iNS_POL_HLD_ADD_3Field;

        private string iNS_POL_HLD_CTYField;

        private string iNS_POL_HLD_STField;

        private string iNS_POL_HLD_ZIPField;

        private string iNS_BROKER_NAMEField;
        private string iNS_BROKER_ADD_1Field;
        private string iNS_BROKER_ADD_2Field;
        private string iNS_BROKER_ADD_3Field;
        private string iNS_BROKER_CTYField;
        private string iNS_BROKER_STField;
        private string iNS_BROKER_ZIPField;

        private string iNS_LEASING_NAMEField;
        private string iNS_LEASING_ADD_1Field;
        private string iNS_LEASING_ADD_2Field;
        private string iNS_LEASING_ADD_3Field;
        private string iNS_LEASING_CTYField;
        private string iNS_LEASING_STField;
        private string iNS_LEASING_ZIPField;

        private string lINEOFBUSINESSField;
        private string pRODUCER_CODEField;

        private string bUREAU_NOField;

        private string pRODUCT_TYPEField;

        private string productCodeField;

        private string industryCodeField;

        private string policyNumPrefixDisplayField;

        private string remainingInstallmentTotalBalanceField;

        private string iNBND_DOCTYPEField;

        private string cURR_DTField;

        private string lTR_CTGYField;

        private string lTR_NAMEField;

        private string cREATOR_UIDField;

        private string cREATOR_NAMEField;

        private string cREATOR_INTField;

        private string iNS_CO_NMField;

        private string aTTN_NAMEField;

        private string rEMITTANCE_INDField;

        private string aDDRESSEE_NAME_1Field;

        private string aDDRESSEE_NAME_2Field;

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
        public string BILL_PK
        {
            get
            {
                return this.bILL_PKField;
            }
            set
            {
                this.bILL_PKField = value;
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
        [System.Xml.Serialization.XmlIgnore]
        public string TEMP_AMT
        {
            get
            {
                return this.tEMP_AMTField;
            }
            set
            {
                this.tEMP_AMTField = value;
            }
        }

        public string AMT
        {
            get
            {
                return this.aMTField;
            }
            set
            {
                this.aMTField = value;
            }
        }

        /// <remarks/>
        public string INV_DT
        {
            get
            {
                return this.iNV_DTField;
            }
            set
            {
                this.iNV_DTField = value;
            }
        }

        /// <remarks/>
        public string CNC_EFF_DT
        {
            get
            {
                return this.cNC_EFF_DTField;
            }
            set
            {
                this.cNC_EFF_DTField = value;
            }
        }

        /// <remarks/>
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
        public string EMAIL_TO
        {
            get
            {
                return this.eMAIL_TOField;
            }
            set
            {
                this.eMAIL_TOField = value;
            }
        }
        public string EMAIL_IND
        {
            get
            {
                return this.eMAIL_INDField;
            }
            set
            {
                this.eMAIL_INDField = value;
            }
        }
        public string EMAIL_FROM
        {
            get
            {
                return this.eMAIL_FROMField;
            }
            set
            {
                this.eMAIL_FROMField = value;
            }
        }

        /// <remarks/>
        public string EMAIL_BODY
        {
            get
            {
                return this.eMAIL_BODYField;
            }
            set
            {
                this.eMAIL_BODYField = value;
            }
        }

        /// <remarks/>
        public string EMAIL_SUBJECT
        {
            get
            {
                return this.eMAIL_SUBJECTField;
            }
            set
            {
                this.eMAIL_SUBJECTField = value;
            }
        }
        /// <remarks/>
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
        public string EARNED_PREM_AMT
        {
            get
            {
                return this.eARNED_PREM_AMTField;
            }
            set
            {
                this.eARNED_PREM_AMTField = value;
            }
        }

        /// <remarks/>
        public string PAST_DUE_AMT
        {
            get
            {
                return this.pAST_DUE_AMTField;
            }
            set
            {
                this.pAST_DUE_AMTField = value;
            }
        }

        /// <remarks/>
        public string INS_POL_HLD_NAME_1
        {
            get
            {
                return this.iNS_POL_HLD_NAME_1Field;
            }
            set
            {
                this.iNS_POL_HLD_NAME_1Field = value;
            }
        }
        public string INS_POL_HLD_NAME_2
        {
            get
            {
                return this.iNS_POL_HLD_NAME_2Field;
            }
            set
            {
                this.iNS_POL_HLD_NAME_2Field = value;
            }
        }
        /// <remarks/>
        public string TOT_AMT_DUE
        {
            get
            {
                return this.tOT_AMT_DUEField;
            }
            set
            {
                this.tOT_AMT_DUEField = value;
            }
        }
        [System.Xml.Serialization.XmlIgnore]

        public string TOT_AMT_DUE_TEMP
        {
            get
            {
                return this.tOT_AMT_DUE_TEMPField;
            }
            set
            {
                this.tOT_AMT_DUE_TEMPField = value;
            }
        }
        public string CUR_INSTALL_AMT
        {
            get
            {
                return this.cUR_INSTALL_AMTField;
            }
            set
            {
                this.cUR_INSTALL_AMTField = value;
            }
        }

        [System.Xml.Serialization.XmlIgnore]

        public string TEMP_PAST_DUE_AMT
        {
            get
            {
                return this.tEMP_PAST_DUE_AMTField;
            }
            set
            {
                this.tEMP_PAST_DUE_AMTField = value;
            }
        }

        [System.Xml.Serialization.XmlIgnore]

        public string FULL_ANNUAL_PREM
        {
            get
            {
                return this.full_AMT_PremField;
            }
            set
            {
                this.full_AMT_PremField = value;
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

        /// <remarks/>
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

        /// <remarks/>
        public string OB_KEYWORD7
        {
            get
            {
                return this.oB_KEYWORD7Field;
            }
            set
            {
                this.oB_KEYWORD7Field = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD8
        {
            get
            {
                return this.oB_KEYWORD8Field;
            }
            set
            {
                this.oB_KEYWORD8Field = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD9
        {
            get
            {
                return this.oB_KEYWORD9Field;
            }
            set
            {
                this.oB_KEYWORD9Field = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD10
        {
            get
            {
                return this.oB_KEYWORD10Field;
            }
            set
            {
                this.oB_KEYWORD10Field = value;
            }
        }

        /// <remarks/>
        public string OB_KEYWORD11
        {
            get
            {
                return this.oB_KEYWORD11Field;
            }
            set
            {
                this.oB_KEYWORD11Field = value;
            }
        }

        /// <remarks/>
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

        //[System.Xml.Serialization.XmlIgnore]
        public string GUNTHER_IND
        {
            get
            {
                return this.gUNTHER_INDField;
            }
            set
            {
                this.gUNTHER_INDField = value;
            }
        }
        public string REAS_CODE_DESC
        {
            get
            {
                return this.rEAS_CODE_DESCField;
            }
            set
            {
                this.rEAS_CODE_DESCField = value;
            }
        }


        /// <remarks/>
        public string CANCEL_MAIL_DT
        {
            get
            {
                return this.cANCEL_MAIL_DTField;
            }
            set
            {
                this.cANCEL_MAIL_DTField = value;
            }
        }

        /// <remarks/>
        public string NOT_HONORED_PYMT_AMT
        {
            get
            {
                return this.nOT_HONORED_PYMT_AMTField;
            }
            set
            {
                this.nOT_HONORED_PYMT_AMTField = value;
            }
        }
        public string PMNT_AMT
        {
            get
            {
                return this.pYMT_AMTField;
            }
            set
            {
                this.pYMT_AMTField = value;
            }
        }

        public string BR_NJM_POL_NO
        {
            get
            {
                return this.bR_NJM_POL_NO_Field;
            }
            set
            {
                this.bR_NJM_POL_NO_Field = value;
            }
        }
        public string BR_NJM_POLHOLD_NAME_1
        {
            get
            {
                return this.BR_NJM_POLHOLD_NAME_1_Field;
            }
            set
            {
                this.BR_NJM_POLHOLD_NAME_1_Field = value;
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
        public string INS_POL_HLD_ADD_1
        {
            get
            {
                return this.iNS_POL_HLD_ADD_1Field;
            }
            set
            {
                this.iNS_POL_HLD_ADD_1Field = value;
            }
        }
        public string INS_POL_HLD_ADD_2
        {
            get
            {
                return this.iNS_POL_HLD_ADD_2Field;
            }
            set
            {
                this.iNS_POL_HLD_ADD_2Field = value;
            }
        }
        public string INS_POL_HLD_ADD_3
        {
            get
            {
                return this.iNS_POL_HLD_ADD_3Field;
            }
            set
            {
                this.iNS_POL_HLD_ADD_3Field = value;
            }
        }
        /// <remarks/>
        public string INS_POL_HLD_CTY
        {
            get
            {
                return this.iNS_POL_HLD_CTYField;
            }
            set
            {
                this.iNS_POL_HLD_CTYField = value;
            }
        }

        /// <remarks/>
        public string INS_POL_HLD_ST
        {
            get
            {
                return this.iNS_POL_HLD_STField;
            }
            set
            {
                this.iNS_POL_HLD_STField = value;
            }
        }

        /// <remarks/>
        public string INS_POL_HLD_ZIP
        {
            get
            {
                return this.iNS_POL_HLD_ZIPField;
            }
            set
            {
                this.iNS_POL_HLD_ZIPField = value;
            }
        }


        public string BROKER_NAME
        {
            get
            {
                return this.iNS_BROKER_NAMEField; ; ; ;
            }
            set
            {
                this.iNS_BROKER_NAMEField = value;
            }
        }
        public string BROKER_ADD_1
        {
            get
            {
                return this.iNS_BROKER_ADD_1Field; ; ;
            }
            set
            {
                this.iNS_BROKER_ADD_1Field = value;
            }
        }
        public string BROKER_ADD_2
        {
            get
            {
                return this.iNS_BROKER_ADD_2Field; ; ;
            }
            set
            {
                this.iNS_BROKER_ADD_2Field = value;
            }
        }
        public string BROKER_ADD_3
        {
            get
            {
                return this.iNS_BROKER_ADD_3Field; ; ;
            }
            set
            {
                this.iNS_BROKER_ADD_3Field = value;
            }
        }
        /// <remarks/>
        public string BROKER_CTY
        {
            get
            {
                return this.iNS_BROKER_CTYField; ;
            }
            set
            {
                this.iNS_BROKER_CTYField = value;
            }
        }

        /// <remarks/>
        public string BROKER_ST
        {
            get
            {
                return this.iNS_BROKER_STField; ;
            }
            set
            {
                this.iNS_BROKER_STField = value;
            }
        }

        /// <remarks/>
        public string BROKER_ZIP
        {
            get
            {
                return this.iNS_BROKER_ZIPField;
            }
            set
            {
                this.iNS_BROKER_ZIPField = value;
            }
        }



        public string LEASING_CO_NAME
        {
            get
            {
                return this.iNS_LEASING_NAMEField;
            }
            set
            {
                this.iNS_LEASING_NAMEField = value;
            }
        }
        public string LEASING_ADD_1
        {
            get
            {
                return this.iNS_LEASING_ADD_1Field; ; ;
            }
            set
            {
                this.iNS_LEASING_ADD_1Field = value;
            }
        }
        public string LEASING_ADD_2
        {
            get
            {
                return this.iNS_LEASING_ADD_2Field; ; ;
            }
            set
            {
                this.iNS_LEASING_ADD_2Field = value;
            }
        }
        public string LEASING_ADD_3
        {
            get
            {
                return this.iNS_LEASING_ADD_3Field; ; ;
            }
            set
            {
                this.iNS_LEASING_ADD_3Field = value;
            }
        }
        /// <remarks/>
        public string LEASING_CTY
        {
            get
            {
                return this.iNS_LEASING_CTYField; ;
            }
            set
            {
                this.iNS_LEASING_CTYField = value;
            }
        }

        /// <remarks/>
        public string LEASING_ST
        {
            get
            {
                return this.iNS_LEASING_STField; ;
            }
            set
            {
                this.iNS_LEASING_STField = value;
            }
        }

        /// <remarks/>
        public string LEASING_ZIP
        {
            get
            {
                return this.iNS_LEASING_ZIPField;
            }
            set
            {
                this.iNS_LEASING_ZIPField = value;
            }
        }

        /// <remarks/>
        public string LINEOFBUSINESS
        {
            get
            {
                return this.lINEOFBUSINESSField;
            }
            set
            {
                this.lINEOFBUSINESSField = value;
            }
        }
        public string PRODUCER_CODE
        {
            get
            {
                return this.pRODUCER_CODEField;
            }
            set
            {
                this.pRODUCER_CODEField = value;
            }
        }

        public string BUREAU_NO
        {
            get
            {
                return this.bUREAU_NOField;
            }
            set
            {
                this.bUREAU_NOField = value;
            }
        }


        /// <remarks/>
        public string PRODUCT_TYPE
        {
            get
            {
                return this.pRODUCT_TYPEField;
            }
            set
            {
                this.pRODUCT_TYPEField = value;
            }
        }

        /// <remarks/>
        public string ProductCode
        {
            get
            {
                return this.productCodeField;
            }
            set
            {
                this.productCodeField = value;
            }
        }

        /// <remarks/>
        public string IndustryCode
        {
            get
            {
                return this.industryCodeField;
            }
            set
            {
                this.industryCodeField = value;
            }
        }

        /// <remarks/>
        public string PolicyNumPrefixDisplay
        {
            get
            {
                return this.policyNumPrefixDisplayField;
            }
            set
            {
                this.policyNumPrefixDisplayField = value;
            }
        }

        /// <remarks/>
        public string RemainingInstallmentTotalBalance
        {
            get
            {
                return this.remainingInstallmentTotalBalanceField;
            }
            set
            {
                this.remainingInstallmentTotalBalanceField = value;
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
        public string ATTN_NAME
        {
            get
            {
                return this.aTTN_NAMEField;
            }
            set
            {
                this.aTTN_NAMEField = value;
            }
        }
        public string REMITTANCE_IND
        {
            get
            {
                return this.rEMITTANCE_INDField;
            }
            set
            {
                this.rEMITTANCE_INDField = value;
            }
        }

        /// <remarks/>
        public string ADDRESSEE_NAME_1
        {
            get
            {
                return this.aDDRESSEE_NAME_1Field;
            }
            set
            {
                this.aDDRESSEE_NAME_1Field = value;
            }
        }
        public string ADDRESSEE_NAME_2
        {
            get
            {
                return this.aDDRESSEE_NAME_2Field;
            }
            set
            {
                this.aDDRESSEE_NAME_2Field = value;
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
    public partial class CUSTOMER_DATARECORD_DELIMRemainingInstallments
    {

        private string remainingInstallmentAmountDueField;

        private string remainingInstallmentDueDateField;

        /// <remarks/>
        public string RemainingInstallmentAmountDue
        {
            get
            {
                return this.remainingInstallmentAmountDueField;
            }
            set
            {
                this.remainingInstallmentAmountDueField = value;
            }
        }

        /// <remarks/>
        public string RemainingInstallmentDueDate
        {
            get
            {
                return this.remainingInstallmentDueDateField;
            }
            set
            {
                this.remainingInstallmentDueDateField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMLTR_NAME_REC
    {

        private string bILL_FKField;

        private string lTR_NAME_BATCHField;

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

    public partial class CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT
    {

        private string bILL_FKField;

        private string cC_BCC_INDField;

        private string cC_ADDRESSEE_NAME_1Field;

        private string cC_ADDRESSEE_ADDR_1Field;
        private string cC_ADDRESSEE_ADDR_2Field;
        private string cC_ADDRESSEE_ADDR_3Field;

        private string cC_ADDRESSEE_CTYField;

        private string cC_ADDRESSEE_STField;

        private string cC_ADDRESSEE_ZIPField;
        private string cC_ATTN_NAMEField;

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
        public string CC_ADDRESSEE_NAME_1
        {
            get
            {
                return this.cC_ADDRESSEE_NAME_1Field;
            }
            set
            {
                this.cC_ADDRESSEE_NAME_1Field = value;
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
        public string CC_ATTN_NAME
        {
            get
            {
                return this.cC_ATTN_NAMEField;
            }
            set
            {
                this.cC_ATTN_NAMEField = value;
            }
        }

    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMCOPY_TO
    {

        private string bILL_FKField;

        private string cPY_TO_NAMEField;

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
        public string CPY_TO_NAME
        {
            get
            {
                return this.cPY_TO_NAMEField;
            }
            set
            {
                this.cPY_TO_NAMEField = value;
            }
        }

    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMTRANS_DATE_REC
    {

        private string tRANS_DATEField;


        private string tRANSField;

        private string cHARGE_AMTField;

        private string BR_NJM_POLHOLD_NAME_1Field;

        private string cREDIT_AMTField;

        private string bAL_AMTField;

        private string pOL_YRField;

        private string bR_NJM_POL_NOField;

        private string underwritingCompanyField;

        /// <remarks/>
        /// [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public string TRANS_DATE
        {
            get
            {
                return this.tRANS_DATEField;
            }
            set
            {
                this.tRANS_DATEField = value;
            }
        }

        /// <remarks/>
        public string TRANS
        {
            get
            {
                return this.tRANSField;
            }
            set
            {
                this.tRANSField = value;
            }
        }

        /// <remarks/>
        public string CHARGE_AMT
        {
            get
            {
                return this.cHARGE_AMTField;
            }
            set
            {
                this.cHARGE_AMTField = value;
            }
        }
        public string CREDIT_AMT
        {
            get
            {
                return this.cREDIT_AMTField;
            }
            set
            {
                this.cREDIT_AMTField = value;
            }
        }


        public string BR_NJM_POLHOLD_NAME_1
        {
            get
            {
                return this.BR_NJM_POLHOLD_NAME_1Field;
            }
            set
            {
                this.BR_NJM_POLHOLD_NAME_1Field = value;
            }
        }

        /// <remarks/>
        public string BAL_AMT
        {
            get
            {
                return this.bAL_AMTField;
            }
            set
            {
                this.bAL_AMTField = value;
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
        public string BR_NJM_POL_NO
        {
            get
            {
                return this.bR_NJM_POL_NOField;
            }
            set
            {
                this.bR_NJM_POL_NOField = value;
            }
        }

        /// <remarks/>
        public string UnderwritingCompany
        {
            get
            {
                return this.underwritingCompanyField;
            }
            set
            {
                this.underwritingCompanyField = value;
            }
        }
    }

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMInvoiceTransactions
    {

        private string invoiceTransactionDateField;

        private string invoiceTransactionDescriptionField;

        private string invoicePolicyYearField;

        private string invoiceUnderwritingCompanyField;

        private string invoiceChargeField;

        private string invoiceAmountDueField;

        private string invoiceInvoicePaymentsField;

        private string invoiceCreditField;
        /// <remarks/>

        public string InvoiceTransactionDate
        {
            get
            {
                return this.invoiceTransactionDateField;
            }
            set
            {
                this.invoiceTransactionDateField = value;
            }
        }

        public string InvoicePayments
        {
            get
            {
                return this.invoiceInvoicePaymentsField;
            }
            set
            {
                this.invoiceInvoicePaymentsField = value;
            }
        }


        /// <remarks/>
        public string InvoiceTransactionDescription
        {
            get
            {
                return this.invoiceTransactionDescriptionField;
            }
            set
            {
                this.invoiceTransactionDescriptionField = value;
            }
        }

        /// <remarks/>
        public string InvoicePolicyYear
        {
            get
            {
                return this.invoicePolicyYearField;
            }
            set
            {
                this.invoicePolicyYearField = value;
            }
        }
        public string InvoiceCredit
        {
            get
            {
                return this.invoiceCreditField;
            }
            set
            {
                this.invoiceCreditField = value;
            }
        }

        /// <remarks/>
        public string InvoiceUnderwritingCompany
        {
            get
            {
                return this.invoiceUnderwritingCompanyField;
            }
            set
            {
                this.invoiceUnderwritingCompanyField = value;
            }
        }

        /// <remarks/>
        public string InvoiceCharge
        {
            get
            {
                return this.invoiceChargeField;
            }
            set
            {
                this.invoiceChargeField = value;
            }
        }

        /// <remarks/>
        public string InvoiceAmountDue
        {
            get
            {
                return this.invoiceAmountDueField;
            }
            set
            {
                this.invoiceAmountDueField = value;
            }
        }
    }
}
