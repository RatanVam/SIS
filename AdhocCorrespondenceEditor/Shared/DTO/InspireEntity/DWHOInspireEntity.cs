using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL.DWHO
{
    public class DWHOInspireEntity : InspireBase
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

        private CUSTOMER_DATARECORD_DELIMDWELLING_REC dWELLING_RECField = new CUSTOMER_DATARECORD_DELIMDWELLING_REC();

        private CUSTOMER_DATARECORD_DELIMLTR_NAME_REC lTR_NAME_RECField = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();

        private CUSTOMER_DATARECORD_DELIMLTR_CERT_INS cert_INS_RECField = new CUSTOMER_DATARECORD_DELIMLTR_CERT_INS();

        private List<CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO> hO61_ADTL_INFOField = new List<CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO>();

        private List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM> aDDL_POL_NUMField = new List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM>();

        /// <remarks/>
        public CUSTOMER_DATARECORD_DELIMDWELLING_REC DWHO_REC
        {
            get
            {
                return this.dWELLING_RECField;
            }
            set
            {
                this.dWELLING_RECField = value;
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
        public CUSTOMER_DATARECORD_DELIMLTR_CERT_INS CERT_INS
        {
            get
            {
                return this.cert_INS_RECField;
            }
            set
            {
                this.cert_INS_RECField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("HO61_ADTL_INFO")]
        public List<CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO> HO61_ADTL_INFO
        {
            get
            {
                return this.hO61_ADTL_INFOField;
            }
            set
            {
                this.hO61_ADTL_INFOField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ADDL_POL_NUM")]
        public List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM> ADDL_POL_NUM
        {
            get
            {
                return this.aDDL_POL_NUMField;
            }
            set
            {
                this.aDDL_POL_NUMField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMDWELLING_REC
    {

        private string cREATOR_UIDField;

        private string cREATOR_NAMEField;

        private string cREATOR_INTField;

        private string iNBND_DOCTYPEField;

        private string oUTBND_DOCTYPEField;

        private string cURR_DTField;

        private string lTR_CTGYField;

        private string lTR_NAMEField;

        private string pRINT_INDField;

        private string pRINTER_NAMEField;

        private string iNS_CO_NMField;

        private string pOL_PKField;

        private string sRC_SYSField;

        private string pOL_NOField;

        private string qUOTE_NUMField;

        private string nAMED_INSD_1Field;

        private string nAMED_INSD_2Field;

        private string nAMED_INSD_3Field;

        private string nAMED_INSD_4Field;

        private string nAMED_INSD_5Field;

        private string nAMED_INSD_6Field;

        private string hOME_ADDR_1Field;
        private string hOME_ADDR_2Field;
        private string hOME_ADDR_3Field;

        private string hOME_CTYField;

        private string hOME_STField;

        private string hOME_ZIPField;

        private string pOL_EFF_DTField;

        private string pOL_EXP_DTField;

        private string oB_KEYWORD1Field;

        private string oB_KEYWORD2Field;

        private string oB_KEYWORD3Field;

        private string oB_KEYWORD4Field;

        private string oB_KEYWORD5Field;

        private string bARCODE_INDField;

        private string cERT_INDField;

        private string eMAIL_FROMField;

        private string eMAIL_BODYField;

        private string eMAIL_SUBJECTField;

        private string pOL_NO_PADField;

        private string aRCHIVE_INDField;

        private string eMAIL_TOField;

        private string eMAIL_INDField;

        private string fAX_INDField;

        private string rIGHTFAX_NUMField;

        private string fAX_SUBJECTField;

        private string aDDRESSEE_NAMEField;

        private string aDDRESSEE_ADDR_1Field;
        
        private string aDDRESSEE_ADDR_2Field;

        private string aDDRESSEE_ADDR_3Field;

        private string aDDRESSEE_CTYField;

        private string aDDRESSEE_STField;

        private string aDDRESSEE_ZIPField;

        private string aDDRESSEE_NAME_2Field;

        private string aDDRESSEE_NAME3Field;

        private string gREETING_NAMEField;

        private string pERS_LIAB_LMTField;

        private string mED_PYMT_LMTField;

        private string tOT_PREMField;

        private string cOV_A_LMT_LIABField;

        private string cOV_B_LMT_LIABField;

        private string cOV_C_LMT_LIABField;
        private string cOV_D_LMT_LIABField;
        private string cOV_E_LMT_LIABField;

        private string cOV_F_LMT_LIABField;

        private string sECT_I_DEDField;

        private string pOL_LOC_ADDR_1Field;
        private string pOL_LOC_ADDR_2Field;
        private string pOL_LOC_ADDR_3Field;

        private string pOL_LOC_CTYField;

        private string pOL_LOC_STField;

        private string pOL_LOC_ZIPField;

        private string pOL_LOC_TOWNSHIPField;

        private string pOL_LOC_COUNTYField;

        private string pRIM_INSD_EMAILField;

        private string fORM_TYPEField;

        private string cOVS_TOT_PREMField;
        private string tot_ADDL_RetField;
        private string windHailded_DW_PREMField;
        private string windHailded_HO_PREMField;
        private string primary_Pol_NumField;
        private string reg_DIV_PREMField;
        private string sub_POL_PREMField;
        private string adj_TOT_DivField;

        private string pLIGAField;

        private string pRIOR_POL_PD_YRField;

        private string eSCROW_INDField;

        private string oTH_INSD_LOC_INDField;

        private string pOL_DISCOUNTS_INDField;

        private string wORK_COMP_INDField;

        private string mORTGAGEE_INDField;

        private string eXT_COVField;

        private string vDLSM_MLSC_MSCHFField;

        private string rCT_COV_INDField;

        private string sECONDARY_POL_INDField;

        private string pOL_MAILING_ADD_INDField;

        private string pOL_STField;

        private string oCCUPIED_BY_WHOMField;

        private string nEW_CALC_RCT_VALField;

        private string hOME_POL_MAIL_ADDR_1Field;
        private string hOME_POL_MAIL_ADDR_2Field;
        private string hOME_POL_MAIL_ADDR_3Field;

        private string hOME_POL_MAIL_CTYField;
        private string hOME_POL_MAIL_STField;
        private string hOME_POL_MAIL_ZIPField;
        private string lTR_DTField;
        private string ho_61_ADD_ADDL_INFOField;
        private string ho_61_NADD_ADDL_INFOField;
        private string ho_61_DCLN_ADDL_INFOField;
        private string ho_61_UPD_APPRField;
        private string pOL_FK_INFOField;
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
        public string QUOTE_NUM
        {
            get
            {
                return this.qUOTE_NUMField;
            }
            set
            {
                this.qUOTE_NUMField = value;
            }
        }

        /// <remarks/>
        public string NAMED_INSD_1
        {
            get
            {
                return this.nAMED_INSD_1Field;
            }
            set
            {
                this.nAMED_INSD_1Field = value;
            }
        }

        /// <remarks/>
        public string NAMED_INSD_2
        {
            get
            {
                return this.nAMED_INSD_2Field;
            }
            set
            {
                this.nAMED_INSD_2Field = value;
            }
        }

        /// <remarks/>
        public string NAMED_INSD_3
        {
            get
            {
                return this.nAMED_INSD_3Field;
            }
            set
            {
                this.nAMED_INSD_3Field = value;
            }
        }

        /// <remarks/>
        public string NAMED_INSD_4
        {
            get
            {
                return this.nAMED_INSD_4Field;
            }
            set
            {
                this.nAMED_INSD_4Field = value;
            }
        }

        /// <remarks/>
        public string NAMED_INSD_5
        {
            get
            {
                return this.nAMED_INSD_5Field;
            }
            set
            {
                this.nAMED_INSD_5Field = value;
            }
        }

        /// <remarks/>
        public string NAMED_INSD_6
        {
            get
            {
                return this.nAMED_INSD_6Field;
            }
            set
            {
                this.nAMED_INSD_6Field = value;
            }
        }

        /// <remarks/>
        public string HOME_ADDR_1
        {
            get
            {
                return this.hOME_ADDR_1Field;
            }
            set
            {
                this.hOME_ADDR_1Field = value;
            }
        }
        public string HOME_ADDR_2
        {
            get
            {
                return this.hOME_ADDR_2Field;
            }
            set
            {
                this.hOME_ADDR_2Field = value;
            }
        }
        public string HOME_ADDR_3
        {
            get
            {
                return this.hOME_ADDR_3Field;
            }
            set
            {
                this.hOME_ADDR_3Field = value;
            }
        }      /// <remarks/>
        public string HOME_CTY
        {
            get
            {
                return this.hOME_CTYField;
            }
            set
            {
                this.hOME_CTYField = value;
            }
        }

        /// <remarks/>
        public string HOME_ST
        {
            get
            {
                return this.hOME_STField;
            }
            set
            {
                this.hOME_STField = value;
            }
        }

        /// <remarks/>
        public string HOME_ZIP
        {
            get
            {
                return this.hOME_ZIPField;
            }
            set
            {
                this.hOME_ZIPField = value;
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

        /// <remarks/>
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

        /// <remarks/>
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

        /// <remarks/>
        public string FAX_IND
        {
            get
            {
                return this.fAX_INDField;
            }
            set
            {
                this.fAX_INDField = value;
            }
        }

        /// <remarks/>
        public string RIGHTFAX_NUM
        {
            get
            {
                return this.rIGHTFAX_NUMField;
            }
            set
            {
                this.rIGHTFAX_NUMField = value;
            }
        }

        /// <remarks/>
        public string FAX_SUBJECT
        {
            get
            {
                return this.fAX_SUBJECTField;
            }
            set
            {
                this.fAX_SUBJECTField = value;
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
        public string ADDRESSEE_NAME_3
        {
            get
            {
                return this.aDDRESSEE_NAME3Field;
            }
            set
            {
                this.aDDRESSEE_NAME3Field = value;
            }
        }
        /// <remarks/>
        public string GREETING_NAME
        {
            get
            {
                return this.gREETING_NAMEField;
            }
            set
            {
                this.gREETING_NAMEField = value;
            }
        }

        /// <remarks/>
        public string PERS_LIAB_LMT
        {
            get
            {
                return this.pERS_LIAB_LMTField;
            }
            set
            {
                this.pERS_LIAB_LMTField = value;
            }
        }

        /// <remarks/>
        public string MED_PYMT_LMT
        {
            get
            {
                return this.mED_PYMT_LMTField;
            }
            set
            {
                this.mED_PYMT_LMTField = value;
            }
        }

        /// <remarks/>
        public string TOT_PREM
        {
            get
            {
                return this.tOT_PREMField;
            }
            set
            {
                this.tOT_PREMField = value;
            }
        }

        /// <remarks/>
        public string COV_A_LMT_LIAB
        {
            get
            {
                return this.cOV_A_LMT_LIABField;
            }
            set
            {
                this.cOV_A_LMT_LIABField = value;
            }
        }

        /// <remarks/>
        public string COV_B_LMT_LIAB
        {
            get
            {
                return this.cOV_B_LMT_LIABField;
            }
            set
            {
                this.cOV_B_LMT_LIABField = value;
            }
        }

        /// <remarks/>
        public string COV_C_LMT_LIAB
        {
            get
            {
                return this.cOV_C_LMT_LIABField;
            }
            set
            {
                this.cOV_C_LMT_LIABField = value;
            }
        }
        public string COV_D_LMT_LIAB
        {
            get
            {
                return this.cOV_D_LMT_LIABField;
            }
            set
            {
                this.cOV_D_LMT_LIABField = value;
            }
        }
        public string COV_E_LMT_LIAB
        {
            get
            {
                return this.cOV_E_LMT_LIABField;
            }
            set
            {
                this.cOV_E_LMT_LIABField = value;
            }
        }
        

        /// <remarks/>
        public string COV_F_LMT_LIAB
        {
            get
            {
                return this.cOV_F_LMT_LIABField;
            }
            set
            {
                this.cOV_F_LMT_LIABField = value;
            }
        }

        /// <remarks/>
        public string SECT_I_DED
        {
            get
            {
                return this.sECT_I_DEDField;
            }
            set
            {
                this.sECT_I_DEDField = value;
            }
        }

        /// <remarks/>
        public string POL_LOC_ADDR_1
        {
            get
            {
                return this.pOL_LOC_ADDR_1Field;
            }
            set
            {
                this.pOL_LOC_ADDR_1Field = value;
            }
        }
        public string POL_LOC_ADDR_2
        {
            get
            {
                return this.pOL_LOC_ADDR_2Field;
            }
            set
            {
                this.pOL_LOC_ADDR_2Field = value;
            }
        }
        public string POL_LOC_ADDR_3
        {
            get
            {
                return this.pOL_LOC_ADDR_3Field;
            }
            set
            {
                this.pOL_LOC_ADDR_3Field = value;
            }
        }
        /// <remarks/>
        public string POL_LOC_CTY
        {
            get
            {
                return this.pOL_LOC_CTYField;
            }
            set
            {
                this.pOL_LOC_CTYField = value;
            }
        }

        /// <remarks/>
        public string POL_LOC_ST
        {
            get
            {
                return this.pOL_LOC_STField;
            }
            set
            {
                this.pOL_LOC_STField = value;
            }
        }

        /// <remarks/>
        public string POL_LOC_ZIP
        {
            get
            {
                return this.pOL_LOC_ZIPField;
            }
            set
            {
                this.pOL_LOC_ZIPField = value;
            }
        }

        /// <remarks/>
        public string POL_LOC_TOWNSHIP
        {
            get
            {
                return this.pOL_LOC_TOWNSHIPField;
            }
            set
            {
                this.pOL_LOC_TOWNSHIPField = value;
            }
        }

        /// <remarks/>
        public string POL_LOC_COUNTY
        {
            get
            {
                return this.pOL_LOC_COUNTYField;
            }
            set
            {
                this.pOL_LOC_COUNTYField = value;
            }
        }

        /// <remarks/>
        public string PRIM_INSD_EMAIL
        {
            get
            {
                return this.pRIM_INSD_EMAILField;
            }
            set
            {
                this.pRIM_INSD_EMAILField = value;
            }
        }

        /// <remarks/>
        public string FORM_TYPE
        {
            get
            {
                return this.fORM_TYPEField;
            }
            set
            {
                this.fORM_TYPEField = value;
            }
        }

        /// <remarks/>
        public string COVS_TOT_PREM
        {
            get
            {
                return this.cOVS_TOT_PREMField;
            }
            set
            {
                this.cOVS_TOT_PREMField = value;
            }
        }
        public string SUB_POL_PREM
        {
            get
            {
                return this.sub_POL_PREMField;
            }
            set
            {
                this.sub_POL_PREMField = value;
            }
        }
        public string REG_DIV
        {
            get
            {
                return this.reg_DIV_PREMField;
            }
            set
            {
                this.reg_DIV_PREMField = value;
            }
        }
        public string WindHailDed_DW
        {
            get
            {
                return this.windHailded_DW_PREMField;
            }
            set
            {
                this.windHailded_DW_PREMField = value;
            }
        }
        public string WindHailDed_HO
        {
            get
            {
                return this.windHailded_HO_PREMField;
            }
            set
            {
                this.windHailded_HO_PREMField = value;
            }
        }
        public string PRIMARY_POL_NUM
        {
            get
            {
                return this.primary_Pol_NumField;
            }
            set
            {
                this.primary_Pol_NumField = value;
            }
        }
        
        public string TOT_ADDL_RET_PREM
        {
            get
            {
                return this.tot_ADDL_RetField;
            }
            set
            {
                this.tot_ADDL_RetField = value;
            }
        }
        public string ADJ_TOT_DIV
        {
            get
            {
                return this.adj_TOT_DivField;
            }
            set
            {
                this.adj_TOT_DivField = value;
            }
        }
        
        /// <remarks/>
        public string PLIGA
        {
            get
            {
                return this.pLIGAField;
            }
            set
            {
                this.pLIGAField = value;
            }
        }

        /// <remarks/>
        public string PRIOR_POL_PD_YR
        {
            get
            {
                return this.pRIOR_POL_PD_YRField;
            }
            set
            {
                this.pRIOR_POL_PD_YRField = value;
            }
        }

        /// <remarks/>
        public string ESCROW_IND
        {
            get
            {
                return this.eSCROW_INDField;
            }
            set
            {
                this.eSCROW_INDField = value;
            }
        }

        /// <remarks/>
        public string OTH_INSD_LOC_IND
        {
            get
            {
                return this.oTH_INSD_LOC_INDField;
            }
            set
            {
                this.oTH_INSD_LOC_INDField = value;
            }
        }

        /// <remarks/>
        public string POL_DISCOUNTS_IND
        {
            get
            {
                return this.pOL_DISCOUNTS_INDField;
            }
            set
            {
                this.pOL_DISCOUNTS_INDField = value;
            }
        }

        /// <remarks/>
        public string WORK_COMP_IND
        {
            get
            {
                return this.wORK_COMP_INDField;
            }
            set
            {
                this.wORK_COMP_INDField = value;
            }
        }

        /// <remarks/>
        public string MORTGAGEE_IND
        {
            get
            {
                return this.mORTGAGEE_INDField;
            }
            set
            {
                this.mORTGAGEE_INDField = value;
            }
        }

        /// <remarks/>
        public string EXT_COV
        {
            get
            {
                return this.eXT_COVField;
            }
            set
            {
                this.eXT_COVField = value;
            }
        }

        /// <remarks/>
        public string VDLSM_MLSC_MSCHF
        {
            get
            {
                return this.vDLSM_MLSC_MSCHFField;
            }
            set
            {
                this.vDLSM_MLSC_MSCHFField = value;
            }
        }

        /// <remarks/>
        public string RCT_COV_IND
        {
            get
            {
                return this.rCT_COV_INDField;
            }
            set
            {
                this.rCT_COV_INDField = value;
            }
        }

        /// <remarks/>
        public string SECONDARY_POL_IND
        {
            get
            {
                return this.sECONDARY_POL_INDField;
            }
            set
            {
                this.sECONDARY_POL_INDField = value;
            }
        }

        /// <remarks/>
        public string POL_MAILING_ADD_IND
        {
            get
            {
                return this.pOL_MAILING_ADD_INDField;
            }
            set
            {
                this.pOL_MAILING_ADD_INDField = value;
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
        public string OCCUPIED_BY_WHOM
        {
            get
            {
                return this.oCCUPIED_BY_WHOMField;
            }
            set
            {
                this.oCCUPIED_BY_WHOMField = value;
            }
        }

        /// <remarks/>
        public string NEW_CALC_RCT_VAL
        {
            get
            {
                return this.nEW_CALC_RCT_VALField;
            }
            set
            {
                this.nEW_CALC_RCT_VALField = value;
            }
        }
        public string POL_MAIL_ADDR_1
        {
            get
            {
                return this.hOME_POL_MAIL_ADDR_1Field;
            }
            set
            {
                this.hOME_POL_MAIL_ADDR_1Field = value;
            }
        }
        public string POL_MAIL_ADDR_2
        {
            get
            {
                return this.hOME_POL_MAIL_ADDR_2Field;
            }
            set
            {
                this.hOME_POL_MAIL_ADDR_2Field = value;
            }
        }
        public string POL_MAIL_ADDR_3
        {
            get
            {
                return this.hOME_POL_MAIL_ADDR_3Field;
            }
            set
            {
                this.hOME_POL_MAIL_ADDR_3Field = value;
            }
        }
        public string POL_MAIL_CTY
        {
            get
            {
                return this.hOME_POL_MAIL_CTYField;
            }
            set
            {
                this.hOME_POL_MAIL_CTYField = value;
            }
        }
        public string POL_MAIL_ST
        {
            get
            {
                return this.hOME_POL_MAIL_STField;
            }
            set
            {
                this.hOME_POL_MAIL_STField = value;
            }
        }
        public string POL_MAIL_ZIP
        {
            get
            {
                return this.hOME_POL_MAIL_ZIPField;
            }
            set
            {
                this.hOME_POL_MAIL_ZIPField = value;
            }
        }
        public string LTR_DT
        {
            get
            {
                return this.lTR_DTField;
            }
            set
            {
                this.lTR_DTField = value;
            }
        }
        public string HO_61_ADD_ADDL_INFO
        {
            get { return this.ho_61_ADD_ADDL_INFOField;   }
            set { this.ho_61_ADD_ADDL_INFOField = value;  }
        }
        public string HO_61_NADD_ADDL_INFO
        {
            get { return this.ho_61_NADD_ADDL_INFOField; }
            set { this.ho_61_NADD_ADDL_INFOField = value; }
        }
        public string HO_61_UPD_APPR
        {
            get { return this.ho_61_UPD_APPRField; }
            set { this.ho_61_UPD_APPRField = value; }
        }
        public string HO_61_DCLN_ADDL_INFO
        {
            get { return this.ho_61_DCLN_ADDL_INFOField; }
            set { this.ho_61_DCLN_ADDL_INFOField = value; }
        }
        public string POL_FK
        {
            get { return this.pOL_FK_INFOField; }
            set { this.pOL_FK_INFOField = value; }
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

    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMLTR_CERT_INS
    {

        private string pOL_FKField;

        private string cert_Ins_NameField;
        private string cert_Ins_Addr1Field;
        private string cert_Ins_Addr2Field;
        private string cert_Ins_Addr3Field;
        private string cert_Ins_CityField;
        private string cert_Ins_StateField;
        private string cert_Ins_ZipField;
        private string cert_Ins_LocationField;


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

        public string CERT_HLD_NAME
        {
            get { return this.cert_Ins_NameField; }
            set { this.cert_Ins_NameField = value; }
        }
        public string CERT_HOLD_ADDR1
        {
            get { return this.cert_Ins_Addr1Field; }
            set { this.cert_Ins_Addr1Field = value; }
        }
        public string CERT_HOLD_ADDR2
        {
            get { return this.cert_Ins_Addr2Field; }
            set { this.cert_Ins_Addr2Field = value; }
        }
        public string CERT_HOLD_ADDR3
        {
            get { return this.cert_Ins_Addr3Field; }
            set { this.cert_Ins_Addr3Field = value; }
        }
        public string CERT_HOLD_CTY
        {
            get { return this.cert_Ins_CityField; }
            set { this.cert_Ins_CityField = value; }
        }
        public string CERT_HOLD_ST
        {
            get { return this.cert_Ins_StateField; }
            set { this.cert_Ins_StateField = value; }
        }
        public string CERT_HOLD_ZIP
        {
            get { return this.cert_Ins_ZipField; }
            set { this.cert_Ins_ZipField = value; }
        }
        public string CERT_LOC
        {
            get { return this.cert_Ins_LocationField; }
            set { this.cert_Ins_LocationField = value; }
        }
    }


    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO
    {

        private string hO_61_DESCField;

        private string sCHED_PRSNL_PROP_APPField;

        private string dESC_APPRField;

        private string nUM_OFField;

        private string cLRTYField;

        private string cLRTY_MAN_ENTRYField;

        private string cARAT_WGHTField;

        private string wATCHField;

        private string wGHT_OFField;

        private bool wGHT_OFFieldSpecified;

        private string sEP_VALUEField;

        private string fURSField;

        private string lNGTH_SWEEPField;

        private string rECEIPTField;

        private string cERTField;

        private string cERT_NUMField;

        private string hO_61_FREE_FORM1Field;

        private string hO_61_FREE_FORM2Field;

        private string pOL_FKField;

        private string hO_61_ADDL_TYPEField;

        /// <remarks/>
        public string HO_61_DESC
        {
            get
            {
                return this.hO_61_DESCField;
            }
            set
            {
                this.hO_61_DESCField = value;
            }
        }

        /// <remarks/>
        public string SCHED_PRSNL_PROP_APP
        {
            get
            {
                return this.sCHED_PRSNL_PROP_APPField;
            }
            set
            {
                this.sCHED_PRSNL_PROP_APPField = value;
            }
        }

        /// <remarks/>
        public string DESC_APPR
        {
            get
            {
                return this.dESC_APPRField;
            }
            set
            {
                this.dESC_APPRField = value;
            }
        }

        /// <remarks/>
        public string NUM_OF
        {
            get
            {
                return this.nUM_OFField;
            }
            set
            {
                this.nUM_OFField = value;
            }
        }

        /// <remarks/>
        public string CLRTY
        {
            get
            {
                return this.cLRTYField;
            }
            set
            {
                this.cLRTYField = value;
            }
        }

        /// <remarks/>
        public string CLRTY_MAN_ENTRY
        {
            get
            {
                return this.cLRTY_MAN_ENTRYField;
            }
            set
            {
                this.cLRTY_MAN_ENTRYField = value;
            }
        }

        /// <remarks/>
        public string CARAT_WGHT
        {
            get
            {
                return this.cARAT_WGHTField;
            }
            set
            {
                this.cARAT_WGHTField = value;
            }
        }

        /// <remarks/>
        public string WATCH
        {
            get
            {
                return this.wATCHField;
            }
            set
            {
                this.wATCHField = value;
            }
        }

        /// <remarks/>
        public string WGHT_OF
        {
            get
            {
                return this.wGHT_OFField;
            }
            set
            {
                this.wGHT_OFField = value;
            }
        }
        /// <remarks/>
        public string SEP_VALUE
        {
            get
            {
                return this.sEP_VALUEField;
            }
            set
            {
                this.sEP_VALUEField = value;
            }
        }

        /// <remarks/>
        public string FURS
        {
            get
            {
                return this.fURSField;
            }
            set
            {
                this.fURSField = value;
            }
        }

        /// <remarks/>
        public string LNGTH_SWEEP
        {
            get
            {
                return this.lNGTH_SWEEPField;
            }
            set
            {
                this.lNGTH_SWEEPField = value;
            }
        }

        /// <remarks/>
        public string RECEIPT
        {
            get
            {
                return this.rECEIPTField;
            }
            set
            {
                this.rECEIPTField = value;
            }
        }

        /// <remarks/>
        public string CERT
        {
            get
            {
                return this.cERTField;
            }
            set
            {
                this.cERTField = value;
            }
        }

        /// <remarks/>
        public string CERT_NUM
        {
            get
            {
                return this.cERT_NUMField;
            }
            set
            {
                this.cERT_NUMField = value;
            }
        }

        /// <remarks/>
        public string HO_61_FREE_FORM1
        {
            get
            {
                return this.hO_61_FREE_FORM1Field;
            }
            set
            {
                this.hO_61_FREE_FORM1Field = value;
            }
        }

        /// <remarks/>
        public string HO_61_FREE_FORM2
        {
            get
            {
                return this.hO_61_FREE_FORM2Field;
            }
            set
            {
                this.hO_61_FREE_FORM2Field = value;
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

        /// <remarks/>
        public string HO_61_ADDL_TYPE
        {
            get
            {
                return this.hO_61_ADDL_TYPEField;
            }
            set
            {
                this.hO_61_ADDL_TYPEField = value;
            }
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
