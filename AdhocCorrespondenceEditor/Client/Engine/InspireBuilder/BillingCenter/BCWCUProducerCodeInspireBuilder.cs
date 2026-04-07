using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.BC;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity;

namespace AdhocCorrespondenceEditor.Client
{
    //Producer Code statement uses different ESB object structure compare to BC
    //LOB's. So we have to override major methods to read from ProducerStatements object
    public class BCWCUProducerCodeInspireBuilder : BCInspireBuilderBase
    {
        protected override void ProcessPolicyAndAccountRecord()
        {
            AddPolicyGeneralDetails();
            AddPolicyDatesAndAmounts();
        }
        protected override void CreateCustomTags()
        {
            AddBrokerKeywords();
            AddOnbaseKeywords();
        }
        private void AddPolicyGeneralDetails()
        {
            InspireBillingRecord.GUNTHER_IND = string.Empty;
            InspireBillingRecord.BILL_PK = GetConfigValue(nameof(InspireBillingRecord.BILL_PK));
            InspireBillingRecord.SRC_SYS = GetConfigValue(nameof(InspireBillingRecord.SRC_SYS));
            InspireBillingRecord.BARCODE_IND = GetConfigValue(nameof(InspireBillingRecord.BARCODE_IND));
            InspireBillingRecord.CERT_IND = GetConfigValue(nameof(InspireBillingRecord.CERT_IND));
            InspireBillingRecord.CURR_DT = ConvertDateFormat(DateTime.Today, ApplicationConstants.CurrentDate_Format);
            InspireBillingRecord.PRODUCER_CODE = GetProducerCode();
            InspireBillingRecord.OUTBND_DOCTYPE = GetDocOutBoundType(PolicyValidLOBCode);
            InspireBillingRecord.INBND_DOCTYPE = DocumentData.DocumentOnbaseID;

            InspireBillingRecord.LTR_CTGY = DocumentData.documentEntity.CategoryName;
            InspireBillingRecord.LTR_NAME = DocumentData.documentEntity.DocumentName;
            InspireBillingRecord.CREATOR_UID = InputQueryParameters.UserDetails.UserID;
            InspireBillingRecord.CREATOR_NAME = InputQueryParameters.UserDetails.UserName;
            InspireBillingRecord.CREATOR_INT = InputQueryParameters.UserDetails.UserInitials;

            InspireBillingRecord.INS_CO_NM = GetInsuranceCompanyName(GetPolicyUWCompany()); 
            InspireBillingRecord.ATTN_NAME = BCUserDataEntity.AttentionName;
            var address = BCUserDataEntity.AddresseeAddress;
            InspireBillingRecord.ADDRESSEE_NAME_1 = address?.DisplayName;
            InspireBillingRecord.ADDRESSEE_ADDR_1 = address?.Line1Tx;
            InspireBillingRecord.ADDRESSEE_ADDR_2 = address?.Line2Tx;
            InspireBillingRecord.ADDRESSEE_ADDR_3 = address?.Line3Tx;
            InspireBillingRecord.ADDRESSEE_CTY = address?.MunicipalityNm;
            InspireBillingRecord.ADDRESSEE_ST = address?.CountrySubdivisionNm;
            InspireBillingRecord.ADDRESSEE_ZIP = address?.PostalCd;
            BCInspireEntity.CustomerData.RECORD_DELIM.LTR_NAME_REC = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();
            BCInspireEntity.CustomerData.RECORD_DELIM.LTR_NAME_REC.BILL_FK = GetConfigValue(nameof(InspireBillingRecord.BILL_PK));
            BCInspireEntity.CustomerData.RECORD_DELIM.LTR_NAME_REC.LTR_NAME_BATCH = DocumentData.documentEntity.DocumentName;
        }
        private void AddPolicyDatesAndAmounts()
        {
            var policyPeriod = GetPolicyPeriodValue();
            InspireBillingRecord.POL_EFF_DT = ConvertDateFormat(PolicyPeriod?.PolicyPerEffDate, BC_Date_Format);
            InspireBillingRecord.POL_EXP_DT = ConvertDateFormat(PolicyPeriod?.PolicyPerExpirDate, BC_Date_Format);
            InspireBillingRecord.POL_EFF_YR = ConvertDateFormat(PolicyPeriod?.PolicyPerEffDate, "yyyy");

            InspireBillingRecord.BR_NJM_POL_NO = policyPeriod?.PolicyNumber;
            InspireBillingRecord.BR_NJM_POLHOLD_NAME_1 = policyPeriod?.PrimaryInsured?.DisplayName;
            InspireBillingRecord.INS_POL_HLD_NAME_1 = GetBrokerName();

            InspireBillingRecord.TOT_AMT_DUE = GetTotalAmountDue();
        }
        protected override void AddPrinter()
        {
            var printer = BCUserDataEntity.PrinterDetails;
            InspireBillingRecord.PRINT_IND = printer.PrinterCode;
            InspireBillingRecord.PRINTER_NAME = printer.PrinterCode;
        }
        protected override string GetOB_KeyWord1(string polNumber)
        {
            return null;
        }
        protected override string GetOB_KeyWord2()
        {
            return null;
        }
        protected override string GetOB_KeyWord3()
        {
            return null;
        }
        protected override string GetOB_KeyWord4(string pol)
        {
            return String.Empty;
        }
        protected override string GetOB_KeyWord5()
        {
             return String.Empty;
        }
        protected override string GetOB_KeyWord6()
        {
            return String.Empty;
        }
        protected override string GetOB_KeyWord7()
        {
            return null;
        }
        protected override string GetOB_KeyWord8()
        {
            return String.Empty;
        }
        protected override string GetOB_KeyWord9()
        {
            return GetProducerCode();
        }
        protected override string GetOB_KeyWord10()
        {
                return "WORKERS COMP";
        }
        protected override string GetOB_KeyWord11()
        {
            return "ADHOC";
        }
        protected override string GetOB_KeyWord12()
        {
            return null;
        }
        private Address GetPolicyBrokerAddress()
        {
            foreach (var currentObj in ProducerStatements)
            {
                var obj = currentObj.Producer?.Address_Ext;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private string GetBrokerName()
        {
            foreach (var currentObj in ProducerStatements)
            {
                var obj = currentObj.Producer ;
                if (obj != null)
                    return obj.Name;
            }
            return null;
        }
        private string GetProducerCode()
        {
            foreach (var currentObj in ProducerStatements)
            {
                var obj = currentObj.Producer?.ProducerCodes;
                if (obj != null)
                    return obj[0].Code;
            }
            return null;
        }
        private void AddBrokerKeywords()
        {
            InspireBillingRecord.BROKER_NAME = GetBrokerName();
            var address = GetPolicyBrokerAddress();
            if (address != null)
            {
                InspireBillingRecord.BROKER_ADD_1 = address?.AddressLine1;
                InspireBillingRecord.BROKER_ADD_2 = address?.AddressLine2;
                InspireBillingRecord.BROKER_ST = address?.State?.Code;
                InspireBillingRecord.BROKER_CTY = address?.City;
                InspireBillingRecord.BROKER_ZIP = address?.PostalCode;
                InspireBillingRecord.POL_ST = address?.State?.Code;
            }
        }
        protected override string GetDocOutBoundType(string lob)
        {
            var document = DocumentData.documentEntity.DocumentName;

           if (document == "2nd Request For Unearned Commission") return "CM  Billing";
           else return ApplicationConstants.WCU_Correspondence;
        }
        protected override string GetProductType(string lob)
        {
            return ApplicationConstants.Workers_Compensation;
        }
        private PolicyPeriod GetPolicyPeriodValue()
        {
            foreach (var currentObj in ProducerStatements)
            {
                foreach (var property in currentObj.ProducerActivity)
                {

                    if (property.RelatedPolicyPeriod  != null)
                    {
                        return property.RelatedPolicyPeriod;
                    }
                }
            }
            return null;
        }
        private string GetTotalAmountDue()
        {
            foreach (var currentObj in ProducerStatements)
            {
                if (currentObj.TotalAmountDue.HasValue)
                    return ConvertAmountFormat(currentObj.TotalAmountDue.Value);
            }
            return null;
        }
        private string GetPolicyUWCompany()
        {
            foreach (var currentObj in ProducerStatements)
            {
                foreach (var obj in currentObj.ProducerActivity)
                {
                    if (obj.RelatedPolicyPeriod?.UWCompany != null)
                        return obj.RelatedPolicyPeriod.UWCompany.Code;
                }
            }
            return ApplicationConstants.NJC; 
        }
        protected override void CopyCopiesToSection()
        {
            int index = 0;
            var sourceCopiesTo = BCUserDataEntity.CopiesTo;
            BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT = new CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT[sourceCopiesTo.Count];
            BCInspireEntity.CustomerData.RECORD_DELIM.COPY_TO = new CUSTOMER_DATARECORD_DELIMCOPY_TO[sourceCopiesTo.Count];

            foreach (var copyTo in sourceCopiesTo)
            {
                CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT copyRecord = new CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT();
                copyRecord.BILL_FK = GetConfigValue(nameof(copyRecord.BILL_FK)); ;
                copyRecord.CC_BCC_IND = GetConfigValue(nameof(copyRecord.CC_BCC_IND)); ;

                copyRecord.CC_ATTN_NAME = copyTo.CopyToCompanyName;

                copyRecord.CC_ADDRESSEE_NAME_1 = string.IsNullOrEmpty(copyTo?.CopyToName.Trim()) ? null : copyTo?.CopyToName.Trim();
                copyRecord.CC_ADDRESSEE_ADDR_1 = copyTo?.CopyToAddressLine1;
                copyRecord.CC_ADDRESSEE_ADDR_2 = copyTo?.CopyToAddressLine2;
                copyRecord.CC_ADDRESSEE_ADDR_3 = copyTo?.CopyToAddressLine3;

                copyRecord.CC_ADDRESSEE_CTY = copyTo?.CopyToCity;
                copyRecord.CC_ADDRESSEE_ST = copyTo?.CopyToState;
                copyRecord.CC_ADDRESSEE_ZIP = copyTo?.CopyToZIP;
                BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT[index++]= copyRecord;
            }
        }
        protected override void ProcessRules()
        {
        }
    }
}
