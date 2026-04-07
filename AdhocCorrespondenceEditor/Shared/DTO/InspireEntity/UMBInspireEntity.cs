using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL
{
    public class UMBInspireEntity : InspireBase
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

        private CUSTOMER_DATARECORD_DELIMUMBRELLA_REC uMBRELLA_RECField = new CUSTOMER_DATARECORD_DELIMUMBRELLA_REC();

        private CUSTOMER_DATARECORD_DELIMLTR_NAME_REC lTR_NAME_RECField = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();

        private List<CUSTOMER_DATARECORD_DELIMFAMILY_REC> family_RECField = new List<CUSTOMER_DATARECORD_DELIMFAMILY_REC>() ;

        private List<CUSTOMER_DATARECORD_DELIMPROP_DET_INFO> pROP_DET_INFOField = new List<CUSTOMER_DATARECORD_DELIMPROP_DET_INFO>();

        private List<CUSTOMER_DATARECORD_DELIMLOT_REC> lOT_RECField = new List<CUSTOMER_DATARECORD_DELIMLOT_REC>();

        private List<CUSTOMER_DATARECORD_DELIMWTRCRFT_DET> wTRCRFT_DETField = new List<CUSTOMER_DATARECORD_DELIMWTRCRFT_DET>();

        private List<CUSTOMER_DATARECORD_DELIMVEH_DET> vEH_DETField = new List<CUSTOMER_DATARECORD_DELIMVEH_DET>();

        private List<CUSTOMER_DATARECORD_DELIMDRIVER_DET> dRIVER_DETField = new List<CUSTOMER_DATARECORD_DELIMDRIVER_DET>();

        private List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM> aDDL_POL_NUMField = new List<CUSTOMER_DATARECORD_DELIMADDL_POL_NUM>();

        /// <remarks/>
        public CUSTOMER_DATARECORD_DELIMUMBRELLA_REC UMBRELLA_REC
        {
            get
            {
                return this.uMBRELLA_RECField;
            }
            set
            {
                this.uMBRELLA_RECField = value;
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
        [System.Xml.Serialization.XmlElementAttribute("FAMILY_REC")]
        public List<CUSTOMER_DATARECORD_DELIMFAMILY_REC> FAMILY_REC
        {
            get
            {
                return this.family_RECField;
            }
            set
            {
                this.family_RECField = value;
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("PROP_DET_INFO")]
        public List<CUSTOMER_DATARECORD_DELIMPROP_DET_INFO> PROP_DET_INFO
        {
            get
            {
                return this.pROP_DET_INFOField;
            }
            set
            {
                this.pROP_DET_INFOField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("LOT_REC")]
        public List<CUSTOMER_DATARECORD_DELIMLOT_REC> LOT_REC
        {
            get
            {
                return this.lOT_RECField;
            }
            set
            {
                this.lOT_RECField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("WTRCRFT_DET")]
        public List<CUSTOMER_DATARECORD_DELIMWTRCRFT_DET> WTRCRFT_DET
        {
            get
            {
                return this.wTRCRFT_DETField;
            }
            set
            {
                this.wTRCRFT_DETField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("VEH_DET")]
        public List<CUSTOMER_DATARECORD_DELIMVEH_DET> VEH_DET
        {
            get
            {
                return this.vEH_DETField;
            }
            set
            {
                this.vEH_DETField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("DRIVER_DET")]
        public List<CUSTOMER_DATARECORD_DELIMDRIVER_DET> DRIVER_DET
        {
            get
            {
                return this.dRIVER_DETField;
            }
            set
            {
                this.dRIVER_DETField = value;
            }
        }

        /// <remarks/>
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
    public partial class CUSTOMER_DATARECORD_DELIMUMBRELLA_REC
    {

        private string pOL_PKField;

        private string sRC_SYSField;

        private string pOL_NOField;

        private string qUOTE_NUMField;

        private string pOL_STField;

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

        private string hOME_POL_MAIL_ADDR_1Field;
        private string hOME_POL_MAIL_ADDR_2Field;
        private string hOME_POL_MAIL_ADDR_3Field;

        private string hOME_POL_MAIL_CTYField;
        private string hOME_POL_MAIL_STField;
        private string hOME_POL_MAIL_ZIPField;

        private string pOL_EFF_DTField;

        private string pOL_EXP_DTField;
        private string pOL_ENDRS_DTField;

        private string sUB_POL_PREMField;

        private string pRIOR_POL_PD_YRField;

        private string pOL_MAILING_ADD_INDField;

        private string aUTOMOBILE_INDField;

        private string wATERCRAFT_INDField;

        private string fAM_MEM_INDField;

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

        private string iNBND_DOCTYPEField;

        private string cURR_DTField;

        private string lTR_CTGYField;

        private string lTR_NAMEField;

        private string oUTBND_DOCTYPEField;

        private string cREATOR_UIDField;

        private string cREATOR_NAMEField;

        private string cREATOR_INTField;

        private string iNS_CO_NMField;

        private string aI_COMP_ADDRField;

        private string aI_VACNT_LANDField;

        private string aI_NAME_DEEDField;

        private string aI_PROP_INFOField;

        private string aI_WTRCRFTField;

        private string aI_VEHField;

        private string aI_BUS_USEField;

        private string aI_DRVR_INFOField;

        private string aI_ACC_INFOField;

        private string pRINT_INDField;

        private string pRINTER_NAMEField;

        private string aRCHIVE_INDField;

        private string lTR_DTField;

        private string cNC_WTHDR_RSNField;

        private string aDDRESSEE_NAMEField;
        private string aDDRESSEE_NAME3Field;
        private string aDDRESSEE_NAME2Field;

        private string aDDRESSEE_ADDR_1Field;
        private string aDDRESSEE_ADDR_2Field;
        private string aDDRESSEE_ADDR_3Field;

        private string aDDRESSEE_CTYField;

        private string aDDRESSEE_STField;

        private string aDDRESSEE_ZIPField;

        private string gREETING_NAMEField;

        private string eMAIL_TOField;

        private string eMAIL_INDField;

        private string fAX_INDField;

        private string rIGHTFAX_NUMField;

        private string fAX_SUBJECTField;
        private string hOME_PRIM_INSD_EMAILField;
        private string hOME_FORM_TYPEField;
        private string hOME_ESCROW_INDField;

        private string hOME_TOT_PREMField;
        private string hOME_LMT_LIABField;
        private string hOME_TOT_POL_PREMField;
        private string hOME_PLIGAField;
        private string hOME_TOT_ADD_RETURN_PREMField;
        private string hOME_DIVIDENDField;
        private string hOME_ADJ_TOT_DIVField;
        private string hOME_MOTORCYCLE_INDField;
        private string hOME_RES_PREM_INDField;
        private string hOME_VACANT_LAND_INDField;
        private string hOME_RV_INDField;
        private string hOME_UM_UIM_INDINDField;
        private string hOME_BOAT_SLIP_INDField;
        private string hOME_RENTAL_PROP_INDField;
        private string hOME_EMAIL_INDField;
        private string hOME_EMAIL_TOField;
        private string hOME_FAX_INDField;

        private string hOME_RIGHTFAX_NUMField;
        private string hOME_FAX_SUBJECTField;
        private string reason_PropertyFeild1, reason_PropertyFeild2,reason_PropertyFeild3;
        private string reason_PropertyFeild4, reason_PropertyFeild5, reason_PropertyFeild6;
        private string reason_PropertyFeild7, reason_PropertyFeild8, reason_PropertyFeild9;
        private string reason_PropertyFeild10, reason_PropertyFeild11, reason_PropertyFeild12;
        private string reason_PropertyFeild13, reason_PropertyFeild14, reason_PropertyFeild15;
        private string reason_PropertyFeild16, reason_PropertyFeild17, reason_PropertyFeild18;
        private string reason_PropertyFeild19, reason_PropertyFeild20, reason_PropertyFeild21;
        private string reason_PropertyFeild22, reason_PropertyFeild23, reason_PropertyFeild24;
        private string midtermCancel_PropertyFeild, mdtermCancel_PropertyFeild;
        private string ndeOffer_PropertyFeild;
        private string clueRef_PropertyFeild;
        private string unlyPolType_PropertyFeild,nonrnwl_PropertyFeild, nonRnwlWithdraw_PropertyFeild, underlyingPolType_PropertyFeild;

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
        }
        /// <remarks/>
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
        public string ENDRS_EFF_DT
        {
            get
            {
                return this.pOL_ENDRS_DTField;
            }
            set
            {
                this.pOL_ENDRS_DTField = value;
            }
        }
        

        /// <remarks/>
        public string SUB_POL_PREM
        {
            get
            {
                return this.sUB_POL_PREMField;
            }
            set
            {
                this.sUB_POL_PREMField = value;
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
        public string AUTOMOBILE_IND
        {
            get
            {
                return this.aUTOMOBILE_INDField;
            }
            set
            {
                this.aUTOMOBILE_INDField = value;
            }
        }

        /// <remarks/>
        public string WATERCRAFT_IND
        {
            get
            {
                return this.wATERCRAFT_INDField;
            }
            set
            {
                this.wATERCRAFT_INDField = value;
            }
        }

        /// <remarks/>
        public string FAM_MEM_IND
        {
            get
            {
                return this.fAM_MEM_INDField;
            }
            set
            {
                this.fAM_MEM_INDField = value;
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
        public string AI_COMP_ADDR
        {
            get
            {
                return this.aI_COMP_ADDRField;
            }
            set
            {
                this.aI_COMP_ADDRField = value;
            }
        }

        /// <remarks/>
        public string AI_VACNT_LAND
        {
            get
            {
                return this.aI_VACNT_LANDField;
            }
            set
            {
                this.aI_VACNT_LANDField = value;
            }
        }

        /// <remarks/>
        public string AI_NAME_DEED
        {
            get
            {
                return this.aI_NAME_DEEDField;
            }
            set
            {
                this.aI_NAME_DEEDField = value;
            }
        }

        /// <remarks/>
        public string AI_PROP_INFO
        {
            get
            {
                return this.aI_PROP_INFOField;
            }
            set
            {
                this.aI_PROP_INFOField = value;
            }
        }

        /// <remarks/>
        public string AI_WTRCRFT
        {
            get
            {
                return this.aI_WTRCRFTField;
            }
            set
            {
                this.aI_WTRCRFTField = value;
            }
        }

        /// <remarks/>
        public string AI_VEH
        {
            get
            {
                return this.aI_VEHField;
            }
            set
            {
                this.aI_VEHField = value;
            }
        }

        /// <remarks/>
        public string AI_BUS_USE
        {
            get
            {
                return this.aI_BUS_USEField;
            }
            set
            {
                this.aI_BUS_USEField = value;
            }
        }

        /// <remarks/>
        public string AI_DRVR_INFO
        {
            get
            {
                return this.aI_DRVR_INFOField;
            }
            set
            {
                this.aI_DRVR_INFOField = value;
            }
        }

        /// <remarks/>
        public string AI_ACC_INFO
        {
            get
            {
                return this.aI_ACC_INFOField;
            }
            set
            {
                this.aI_ACC_INFOField = value;
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

        /// <remarks/>
        public string CNC_WTHDR_RSN
        {
            get
            {
                return this.cNC_WTHDR_RSNField;
            }
            set
            {
                this.cNC_WTHDR_RSNField = value;
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
        public string ADDRESSEE_NAME_2
        {
            get
            {
                return this.aDDRESSEE_NAME2Field;
            }
            set
            {
                this.aDDRESSEE_NAME2Field = value;
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
        public string PRIM_INSD_EMAIL
        {
            get
            {
                return this.hOME_PRIM_INSD_EMAILField;
            }
            set
            {
                this.hOME_PRIM_INSD_EMAILField = value;
            }
        }
        public string FORM_TYPE
        {
            get
            {
                return this.hOME_FORM_TYPEField;
            }
            set
            {
                this.hOME_FORM_TYPEField = value;
            }
        }
        public string ESCROW_IND
        {
            get
            {
                return this.hOME_ESCROW_INDField;
            }
            set
            {
                this.hOME_ESCROW_INDField = value;
            }
        }
        public string TOT_PREM
        {
            get
            {
                return this.hOME_TOT_PREMField;
            }
            set
            {
                this.hOME_TOT_PREMField = value;
            }
        }
        public string LMT_LIAB
        {
            get
            {
                return this.hOME_LMT_LIABField;
            }
            set
            {
                this.hOME_LMT_LIABField = value;
            }
        }
        public string TOT_POL_PREM
        {
            get
            {
                return this.hOME_TOT_POL_PREMField;
            }
            set
            {
                this.hOME_TOT_POL_PREMField = value;
            }
        }
        public string PLIGA
        {
            get
            {
                return this.hOME_PLIGAField;
            }
            set
            {
                this.hOME_PLIGAField = value;
            }
        }
        public string TOT_ADD_RETURN_PREM
        {
            get
            {
                return this.hOME_TOT_ADD_RETURN_PREMField;
            }
            set
            {
                this.hOME_TOT_ADD_RETURN_PREMField = value;
            }
        }
        public string DIVIDEND
        {
            get
            {
                return this.hOME_DIVIDENDField;
            }
            set
            {
                this.hOME_DIVIDENDField = value;
            }
        }
        public string ADJ_TOT_DIV
        {
            get
            {
                return this.hOME_ADJ_TOT_DIVField;
            }
            set
            {
                this.hOME_ADJ_TOT_DIVField = value;
            }
        }
        public string MOTORCYCLE_IND
        {
            get
            {
                return this.hOME_MOTORCYCLE_INDField;
            }
            set
            {
                this.hOME_MOTORCYCLE_INDField = value;
            }
        }
        public string RES_PREM_IND
        {
            get
            {
                return this.hOME_RES_PREM_INDField;
            }
            set
            {
                this.hOME_RES_PREM_INDField = value;
            }
        }
        public string VACANT_LAND_IND
        {
            get
            {
                return this.hOME_VACANT_LAND_INDField;
            }
            set
            {
                this.hOME_VACANT_LAND_INDField = value;
            }
        }
        public string RV_IND
        {
            get
            {
                return this.hOME_RV_INDField;
            }
            set
            {
                this.hOME_RV_INDField = value;
            }
        }
        public string UM_UIM_IND
        {
            get
            {
                return this.hOME_UM_UIM_INDINDField;
            }
            set
            {
                this.hOME_UM_UIM_INDINDField = value;
            }
        }
        public string BOAT_SLIP_IND
        {
            get
            {
                return this.hOME_BOAT_SLIP_INDField;
            }
            set
            {
                this.hOME_BOAT_SLIP_INDField = value;
            }
        }
        public string RENTAL_PROP_IND
        {
            get
            {
                return this.hOME_RENTAL_PROP_INDField;
            }
            set
            {
                this.hOME_RENTAL_PROP_INDField = value;
            }
        }
        public string NO_UND_AUTO_POL
        {
            get { return this.reason_PropertyFeild1;  }
            set { this.reason_PropertyFeild1 = value; }
        }
        public string NO_UNDERLYING_PROPERTY_POLICY
        {
            get { return this.reason_PropertyFeild2; }
            set { this.reason_PropertyFeild2 = value; }
        }
        public string PROPERTY_NON_RESIDENTIAL
        {
            get { return this.reason_PropertyFeild3; }
            set { this.reason_PropertyFeild3 = value; }
        }
        public string PROPERTY_MORE_4_FAM_2_ROOM
        {
            get { return this.reason_PropertyFeild4; }
            set { this.reason_PropertyFeild4 = value; }
        }
        public string PROPERTY_BUSINESS_USE
        {
            get { return this.reason_PropertyFeild5; }
            set { this.reason_PropertyFeild5 = value; }
        }
        public string PROPERTY_FARM_USE
        {
            get { return this.reason_PropertyFeild6; }
            set { this.reason_PropertyFeild6 = value; }
        }
        public string PROPERTY_RENTAL_PROPERTIES
        {
            get { return this.reason_PropertyFeild7; }
            set { this.reason_PropertyFeild7 = value; }
        }
        public string PROPERTY_ANIMAL_CAUSED_DAMAGES
        {
            get { return this.reason_PropertyFeild8; }
            set { this.reason_PropertyFeild8 = value; }
        }
        public string PROPERTY_ANIMAL_BREEDING_BOARDING
        {
            get { return this.reason_PropertyFeild9; }
            set { this.reason_PropertyFeild9 = value; }
        }
        public string PROPERTY_DAMAGE_NOT_REPAIRED
        {
            get { return this.reason_PropertyFeild10; }
            set { this.reason_PropertyFeild10 = value; }
        }
        public string PROPERTY_UNSECURED_POOL
        {
            get { return this.reason_PropertyFeild11; }
            set { this.reason_PropertyFeild11 = value; }
        }
        public string PROPERTY_EVIDENCE_OF_NEGLECT
        {
            get { return this.reason_PropertyFeild12; }
            set { this.reason_PropertyFeild12 = value; }
        }
        public string FAILURE_PROVIDE_UW_INFO
        {
            get { return this.reason_PropertyFeild13; }
            set { this.reason_PropertyFeild13 = value; }
        }
        public string MORAL_HAZARD_DESTRUCTION_OF_PROPERTY
        {
            get { return this.reason_PropertyFeild14; }
            set { this.reason_PropertyFeild14 = value; }
        }
        public string MORAL_HAZARD_INCREASED_PROBABILITY_OF_LOSS
        {
            get { return this.reason_PropertyFeild15; }
            set { this.reason_PropertyFeild15 = value; }
        }
        public string FRAUD_MISREPRESENTATION
        {
            get { return this.reason_PropertyFeild16; }
            set { this.reason_PropertyFeild16 = value; }
        }
        public string INSURABILITY_OF_RISK
        {
            get { return this.reason_PropertyFeild17; }
            set { this.reason_PropertyFeild17 = value; }
        }
        public string LACK_OF_COOPERATION
        {
            get { return this.reason_PropertyFeild18; }
            set { this.reason_PropertyFeild18 = value; }
        }
        public string FRAUD
        {
            get { return this.reason_PropertyFeild19; }
            set { this.reason_PropertyFeild19 = value; }
        }

        public string FAILURE_COMPLY_W_REG
        {
            get { return this.reason_PropertyFeild20; }
            set { this.reason_PropertyFeild20 = value; }
        }
        public string SUBSTANTIAL_CHANGE_INC_HAZARD
        {
            get { return this.reason_PropertyFeild21; }
            set { this.reason_PropertyFeild21 = value; }
        }
        public string NEGLIGENCE
        {
            get { return this.reason_PropertyFeild22; }
            set { this.reason_PropertyFeild22 = value; }
        }
        public string SuspendedExpiredRevoked
        {
            get { return this.reason_PropertyFeild23; }
            set { this.reason_PropertyFeild23 = value; }
        }
        public string FREE_FORM_IND
        {
            get { return this.reason_PropertyFeild24; }
            set { this.reason_PropertyFeild24 = value; }
        }

        public string NONRNWL_IND
        {
            get { return this.nonrnwl_PropertyFeild; }
            set { this.nonrnwl_PropertyFeild = value; }
        }
        public string CLUEReferenceNumber
        {
            get { return this.clueRef_PropertyFeild; }
            set { this.clueRef_PropertyFeild = value; }
        }
        public string NDEOffer
        {
            get { return this.ndeOffer_PropertyFeild; }
            set { this.ndeOffer_PropertyFeild = value; }
        }
        public string MIDTRM_CNCL_IND
        {
            get { return this.midtermCancel_PropertyFeild; }
            set { this.midtermCancel_PropertyFeild = value; }
        }
        public string MDTRM_CNC_IND
        {
            get { return this.mdtermCancel_PropertyFeild; }
            set { this.mdtermCancel_PropertyFeild = value; }
        }
        public string NONRNWL_WTHDR_RSN
        {
            get { return this.nonRnwlWithdraw_PropertyFeild; }
            set { this.nonRnwlWithdraw_PropertyFeild = value; }
        }
        public string UNLY_POL_TYPE
        {
            get { return this.underlyingPolType_PropertyFeild; }
            set { this.underlyingPolType_PropertyFeild = value; }
        }
        public string UNLY_POL
        {
            get { return this.unlyPolType_PropertyFeild; }
            set { this.unlyPolType_PropertyFeild = value; }
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
    public partial class CUSTOMER_DATARECORD_DELIMFAMILY_REC
    {
        private string pOL_FKField;

        private string family_Rec_LicenceField;

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
        public string LICENSE_FAM_MEM
        {
            get
            {
                return this.family_Rec_LicenceField;
            }
            set
            {
                this.family_Rec_LicenceField = value;
            }
        }
    }
    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMPROP_DET_INFO
    {

        private string rSK_LOC_ADDR_1Field;
        private string rSK_LOC_ADDR_3Field;
        private string rSK_LOC_ADDR_2Field;

        private string rSK_LOC_CTYField;

        private string rSK_LOC_STField;

        private string rSK_LOC_ZIPField;

        private string pOL_FKField;
        private string clms_HomeField;
        private string inspect_HomeField;
        private string pOOLField;
        private string resTypeField, occTypeField, usageField;

        private string tLCField;

        private string pROP_INFO_TYPEField;
        private string aDVERTISEField;
        private string nUM_EMPField;
        private string nUM_CLIENTSField;
        private string tYPE_BUSField;


        /// <remarks/>
        public string RSK_LOC_ADDR_1
        {
            get
            {
                return this.rSK_LOC_ADDR_1Field;
            }
            set
            {
                this.rSK_LOC_ADDR_1Field = value;
            }
        }
        public string RSK_LOC_ADDR_2
        {
            get
            {
                return this.rSK_LOC_ADDR_2Field;
            }
            set
            {
                this.rSK_LOC_ADDR_2Field = value;
            }
        }
        public string RSK_LOC_ADDR_3
        {
            get
            {
                return this.rSK_LOC_ADDR_3Field;
            }
            set
            {
                this.rSK_LOC_ADDR_3Field = value;
            }
        }
        

        /// <remarks/>
        public string RSK_LOC_CTY
        {
            get
            {
                return this.rSK_LOC_CTYField;
            }
            set
            {
                this.rSK_LOC_CTYField = value;
            }
        }

        /// <remarks/>
        public string RSK_LOC_ST
        {
            get
            {
                return this.rSK_LOC_STField;
            }
            set
            {
                this.rSK_LOC_STField = value;
            }
        }

        /// <remarks/>
        public string RSK_LOC_ZIP
        {
            get
            {
                return this.rSK_LOC_ZIPField;
            }
            set
            {
                this.rSK_LOC_ZIPField = value;
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
        public string CLMS_HOME
        {
            get
            {
                return this.clms_HomeField;
            }
            set
            {
                this.clms_HomeField = value;
            }
        }
        public string INSPECT_PROP
        {
            get
            {
                return this.inspect_HomeField;
            }
            set
            {
                this.inspect_HomeField = value;
            }
        }
        


        /// <remarks/>
        public string POOL
        {
            get
            {
                return this.pOOLField;
            }
            set
            {
                this.pOOLField = value;
            }
        }
        public string OCC_TYPE
        {
            get
            {
                return this.occTypeField;
            }
            set
            {
                this.occTypeField = value;
            }
        }
        public string USAGE
        {
            get
            {
                return this.usageField;
            }
            set
            {
                this.usageField = value;
            }
        }
        public string RES_TYPE
        {
            get
            {
                return this.resTypeField;
            }
            set
            {
                this.resTypeField = value;
            }
        }
        /// <remarks/>
        public string TLC
        {
            get
            {
                return this.tLCField;
            }
            set
            {
                this.tLCField = value;
            }
        }
        public string TYPE_BUS
        {
            get  {   return this.tYPE_BUSField;     }
            set  {   this.tYPE_BUSField = value;    }
        }
        public string NUM_CLIENTS
        {
            get { return this.nUM_CLIENTSField; }
            set { this.nUM_CLIENTSField = value; }
        }
        public string NUM_EMP
        {
            get { return this.nUM_EMPField; }
            set { this.nUM_EMPField = value; }
        }
        public string ADVERTISE
        {
            get { return this.aDVERTISEField; }
            set { this.aDVERTISEField = value; }
        }


        /// <remarks/>
        public string PROP_INFO_TYPE
        {
            get
            {
                return this.pROP_INFO_TYPEField;
            }
            set
            {
                this.pROP_INFO_TYPEField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMLOT_REC
    {

        private string pOL_FKField;

        private string pROP_INFO_TYPEField;
        private string pROP_LOT_AND_BLOCKField;

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
        public string PROP_INFO_TYPE
        {
            get
            {
                return this.pROP_INFO_TYPEField;
            }
            set
            {
                this.pROP_INFO_TYPEField = value;
            }
        }
        public string LOT_AND_BLOCK
        {
            get
            {
                return this.pROP_LOT_AND_BLOCKField;
            }
            set
            {
                this.pROP_LOT_AND_BLOCKField = value;
            }
        }
        
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CUSTOMER_DATARECORD_DELIMWTRCRFT_DET
    {

        private string wTRCFTField;

        private string wTRCFT_UNDRLY_POLField;

        private string wTRCFT_OWNField;

        private string pOL_FKField;
        private string wTRCFT_TypeField;
        private string wTRCFT_YEARField;
        private string wTRCFT_MAKEField;
        private string wTRCFT_MAXHPField;
        private string wTRCFT_LGTHField;

        /// <remarks/>
        public string WTRCFT
        {
            get
            {
                return this.wTRCFTField;
            }
            set
            {
                this.wTRCFTField = value;
            }
        }

        /// <remarks/>
        public string WTRCFT_UNDRLY_POL
        {
            get
            {
                return this.wTRCFT_UNDRLY_POLField;
            }
            set
            {
                this.wTRCFT_UNDRLY_POLField = value;
            }
        }

        /// <remarks/>
        public string WTRCFT_OWN
        {
            get
            {
                return this.wTRCFT_OWNField;
            }
            set
            {
                this.wTRCFT_OWNField = value;
            }
        }

        public string WTRCFT_TYPE
        {
            get { return this.wTRCFT_TypeField; }
            set { this.wTRCFT_TypeField = value; }
        }
        public string WTRCFT_YEAR
        {
            get { return this.wTRCFT_YEARField; }
            set { this.wTRCFT_YEARField = value; }
        }
        public string WTRCFT_MAKE
        {
            get { return this.wTRCFT_MAKEField; }
            set { this.wTRCFT_MAKEField = value; }
        }
        public string MAX_HP
        {
            get { return this.wTRCFT_MAXHPField; }
            set { this.wTRCFT_MAXHPField = value; }
        }
        public string WTRCFT_LGTH
        {
            get { return this.wTRCFT_LGTHField; }
            set { this.wTRCFT_LGTHField = value; }
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
    public partial class CUSTOMER_DATARECORD_DELIMVEH_DET
    {

        private string vEHField;

        private string vEH_TYPEField;

        private string vEH_UNDRLY_POLField;

        private string pOL_FKField;
        private string vEH_MAKEField;
        private string vEH_REGField;
        private string vEH_OWNField, vEH_YEARField;

        /// <remarks/>
        public string VEH
        {
            get
            {
                return this.vEHField;
            }
            set
            {
                this.vEHField = value;
            }
        }

        /// <remarks/>
        public string VEH_TYPE
        {
            get
            {
                return this.vEH_TYPEField;
            }
            set
            {
                this.vEH_TYPEField = value;
            }
        }
        public string VEH_MAKE
        {
            get
            {
                return this.vEH_MAKEField;
            }
            set
            {
                this.vEH_MAKEField = value;
            }
        }
        public string VEH_REG
        {
            get
            {
                return this.vEH_REGField;
            }
            set
            {
                this.vEH_REGField = value;
            }
        }
        public string VEH_OWN
        {
            get
            {
                return this.vEH_OWNField;
            }
            set
            {
                this.vEH_OWNField = value;
            }
        }
        public string VEH_YEAR
        {
            get
            {
                return this.vEH_YEARField;
            }
            set
            {
                this.vEH_YEARField = value;
            }
        }
        

        /// <remarks/>
        public string VEH_UNDRLY_POL
        {
            get
            {
                return this.vEH_UNDRLY_POLField;
            }
            set
            {
                this.vEH_UNDRLY_POLField = value;
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
    public partial class CUSTOMER_DATARECORD_DELIMDRIVER_DET
    {

        private string dRVR_NAMEField;

        private string vAL_DLField;

        private string pOL_FKField;

        private string dRVR_INFO_TYPEField;

        private string aCC_DTField;

        private string oWN_INSField;

        private string aCC_DESCField;

        private string cLM_STATUSField;
        private string PYOUT_AMTField;

        private string aCTIVITY_DESCRIPTIONField;

        private string aDVERSE_DATA_SOURCEField;

        private string aCCIDENT_VIOLATION_DRIVER_NAMEField;

        private string aCCIDENT_VIOLATION_EVENT_DATEField;

        private string aCCIDENT_VIOLATION_POSTING_PAYOUT_DATEField;

        private string mVRReferenceNumberField;
        private string licenseMVRField;

        private string dRVR_RECSField;
        private string REL_APPLCNTField;
        private string lIC_STATUSField;
        private string oWN_DOBField;
        private string odL_NUM_STField;
        private string YR_FRST_LICField;
        private string PR_DLSField;
        private string clms_AutoField;

        /// <remarks/>
        public string CLMS_AUTO
        {
            get
            {
                return this.clms_AutoField;
            }
            set
            {
                this.clms_AutoField = value;
            }
        }
        public string DRVR_NAME
        {
            get
            {
                return this.dRVR_NAMEField;
            }
            set
            {
                this.dRVR_NAMEField = value;
            }
        }

        /// <remarks/>
        public string VAL_DL
        {
            get
            {
                return this.vAL_DLField;
            }
            set
            {
                this.vAL_DLField = value;
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
        public string LicenseMVRSuspendedDate
        {
            get
            {
                return this.licenseMVRField;
            }
            set
            {
                this.licenseMVRField = value;
            }
        }

        /// <remarks/>
        public string DRVR_INFO_TYPE
        {
            get
            {
                return this.dRVR_INFO_TYPEField;
            }
            set
            {
                this.dRVR_INFO_TYPEField = value;
            }
        }

        /// <remarks/>
        public string ACC_DT
        {
            get
            {
                return this.aCC_DTField;
            }
            set
            {
                this.aCC_DTField = value;
            }
        }

        /// <remarks/>
        public string OWN_INS
        {
            get
            {
                return this.oWN_INSField;
            }
            set
            {
                this.oWN_INSField = value;
            }
        }

        public string REL_APPLCNT
        {
            get { return this.REL_APPLCNTField;  }
            set { this.REL_APPLCNTField = value; }
        }
        public string LIC_STATUS
        {
            get { return this.lIC_STATUSField; }
            set { this.lIC_STATUSField = value; }
        }
        public string DOB
        {
            get { return this.oWN_DOBField; }
            set { this.oWN_DOBField = value; }
        }
        public string DL_NUM_ST
        {
            get { return this.odL_NUM_STField; }
            set { this.odL_NUM_STField = value; }
        }
        public string YR_FRST_LIC
        {
            get { return this.YR_FRST_LICField; }
            set { this.YR_FRST_LICField = value; }
        }
        public string PR_DL
        {
            get { return this.PR_DLSField; }
            set { this.PR_DLSField = value; }
        }
    

        /// <remarks/>
        public string ACC_DESC
        {
            get
            {
                return this.aCC_DESCField;
            }
            set
            {
                this.aCC_DESCField = value;
            }
        }

        /// <remarks/>
        public string CLM_STATUS
        {
            get
            {
                return this.cLM_STATUSField;
            }
            set
            {
                this.cLM_STATUSField = value;
            }
        }
        public string PYOUT_AMT
        {
            get
            {
                return this.PYOUT_AMTField;
            }
            set
            {
                this.PYOUT_AMTField = value;
            }
        }
        

        /// <remarks/>
        public string ACTIVITY_DESCRIPTION
        {
            get
            {
                return this.aCTIVITY_DESCRIPTIONField;
            }
            set
            {
                this.aCTIVITY_DESCRIPTIONField = value;
            }
        }

        /// <remarks/>
        public string ADVERSE_DATA_SOURCE
        {
            get
            {
                return this.aDVERSE_DATA_SOURCEField;
            }
            set
            {
                this.aDVERSE_DATA_SOURCEField = value;
            }
        }

        /// <remarks/>
        public string ACCIDENT_VIOLATION_DRIVER_NAME
        {
            get
            {
                return this.aCCIDENT_VIOLATION_DRIVER_NAMEField;
            }
            set
            {
                this.aCCIDENT_VIOLATION_DRIVER_NAMEField = value;
            }
        }

        /// <remarks/>
        public string ACCIDENT_VIOLATION_EVENT_DATE
        {
            get
            {
                return this.aCCIDENT_VIOLATION_EVENT_DATEField;
            }
            set
            {
                this.aCCIDENT_VIOLATION_EVENT_DATEField = value;
            }
        }

        /// <remarks/>
        public string ACCIDENT_VIOLATION_POSTING_PAYOUT_DATE
        {
            get
            {
                return this.aCCIDENT_VIOLATION_POSTING_PAYOUT_DATEField;
            }
            set
            {
                this.aCCIDENT_VIOLATION_POSTING_PAYOUT_DATEField = value;
            }
        }

        /// <remarks/>
        public string MVRReferenceNumber
        {
            get
            {
                return this.mVRReferenceNumberField;
            }
            set
            {
                this.mVRReferenceNumberField = value;
            }
        }

        /// <remarks/>
        public string DRVR_RECS
        {
            get
            {
                return this.dRVR_RECSField;
            }
            set
            {
                this.dRVR_RECSField = value;
            }
        }
    }

    /// <remarks/>
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
