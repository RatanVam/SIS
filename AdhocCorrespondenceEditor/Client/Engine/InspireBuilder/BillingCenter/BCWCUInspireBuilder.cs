using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.BC;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity;

namespace AdhocCorrespondenceEditor.Client
{
    public class BCWCUInspireBuilder : BCInspireBuilderBase
    {
        protected override void CreateCustomTags()
        {
            AddBrokerKeywords();
            AddLeasingKeywords();
            SetCustomOverrideTags();
            AddOnbaseKeywords();
        }
        protected override void CopyCopiesToSection()
        {
            int index = 0;
            var sourceCopiesTo = BCUserDataEntity.CopiesTo;
            var document = DocumentData.documentEntity.DocumentName;
            BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT = new CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT[sourceCopiesTo.Count+2];

            foreach (var copyTo in sourceCopiesTo)
            {
                CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT copyRecord = new CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT();
                copyRecord.BILL_FK = GetConfigValue(nameof(copyRecord.BILL_FK)); ;
                copyRecord.CC_BCC_IND = GetConfigValue(nameof(copyRecord.CC_BCC_IND)); ;

                copyRecord.CC_ADDRESSEE_NAME_1 = string.IsNullOrEmpty(copyTo.CopyToName.Trim()) ? null : copyTo.CopyToName.Trim();
                copyRecord.CC_ADDRESSEE_ADDR_1 = copyTo.CopyToAddressLine1;
                copyRecord.CC_ADDRESSEE_ADDR_2 = copyTo.CopyToAddressLine2;
                copyRecord.CC_ADDRESSEE_ADDR_3 = copyTo.CopyToAddressLine3;
                copyRecord.CC_ADDRESSEE_CTY = copyTo.CopyToCity;
                copyRecord.CC_ADDRESSEE_ST = copyTo.CopyToState;
                copyRecord.CC_ADDRESSEE_ZIP = copyTo.CopyToZIP;
                copyRecord.CC_ATTN_NAME = copyTo.CopyToCompanyName;
                BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT[index++] = copyRecord;
            }
        }
        private void SetCustomOverrideTags()
        {
            var document = DocumentData.documentEntity.DocumentName;
            InspireBillingRecord.LINEOFBUSINESS = null;
            InspireBillingRecord.CURR_DT = ConvertDateFormat(DateTime.Today, ApplicationConstants.CurrentDate_Format);
            InspireBillingRecord.INS_POL_HLD_NAME_2 = GetSecondaryInsuredName(ApplicationConstants.AdditionalInsured);
            InspireBillingRecord.BUREAU_NO = GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.BureauFileNumber_Ext));
            InspireBillingRecord.PMNT_AMT = ConvertAmountFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.NotHonoredPaymentAmount_Ext)));
            if (BCUserDataEntity.IsDBASelected && !string.IsNullOrEmpty(BCUserDataEntity.AddresseeAddress.DisplayName))
            {
                InspireBillingRecord.INS_POL_HLD_NAME_1 = BCUserDataEntity.AddresseeAddress.DisplayName;
            }

            //adding CC setion by default when Broker name or fianance lease company is send from source data-
            int index = BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT.Length;
            index = index - 2;
            if (document == "Partial Pymt Pending CN Stands")
            {
                if (!string.IsNullOrEmpty(InspireBillingRecord.LEASING_CO_NAME))
                {
                    CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT copyRecord = new CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT();
                    copyRecord.BILL_FK = GetConfigValue(nameof(copyRecord.BILL_FK)); ;
                    copyRecord.CC_BCC_IND = GetConfigValue(nameof(copyRecord.CC_BCC_IND)); ;

                    copyRecord.CC_ADDRESSEE_NAME_1 = InspireBillingRecord.LEASING_CO_NAME;
                    copyRecord.CC_ADDRESSEE_ADDR_1 = InspireBillingRecord.LEASING_ADD_1;
                    copyRecord.CC_ADDRESSEE_ADDR_2 = InspireBillingRecord.LEASING_ADD_2;
                    copyRecord.CC_ADDRESSEE_ADDR_3 = InspireBillingRecord.LEASING_ADD_3;
                    copyRecord.CC_ADDRESSEE_CTY = InspireBillingRecord.LEASING_CTY;
                    copyRecord.CC_ADDRESSEE_ST = InspireBillingRecord.LEASING_ST;
                    copyRecord.CC_ADDRESSEE_ZIP = InspireBillingRecord.LEASING_ZIP;
                    BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT[index++] = copyRecord;
                }
                if (!string.IsNullOrEmpty(InspireBillingRecord.BROKER_NAME))
                {
                    CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT copyRecord = new CUSTOMER_DATARECORD_DELIMBILLING_CC_OPT();
                    copyRecord.BILL_FK = GetConfigValue(nameof(copyRecord.BILL_FK)); ;
                    copyRecord.CC_BCC_IND = GetConfigValue(nameof(copyRecord.CC_BCC_IND)); ;

                    copyRecord.CC_ADDRESSEE_NAME_1 = InspireBillingRecord.BROKER_NAME;
                    copyRecord.CC_ADDRESSEE_ADDR_1 = InspireBillingRecord.BROKER_ADD_1;
                    copyRecord.CC_ADDRESSEE_ADDR_2 = InspireBillingRecord.BROKER_ADD_2;
                    copyRecord.CC_ADDRESSEE_ADDR_3 = InspireBillingRecord.BROKER_ADD_3;

                    copyRecord.CC_ADDRESSEE_CTY = InspireBillingRecord.BROKER_CTY;
                    copyRecord.CC_ADDRESSEE_ST = InspireBillingRecord.BROKER_ST;
                    copyRecord.CC_ADDRESSEE_ZIP = InspireBillingRecord.BROKER_ZIP;
                    BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT[index] = copyRecord;
                }
            }
        }
        protected override void AddPrinter()
        {
            var printer = BCUserDataEntity.PrinterDetails;
            InspireBillingRecord.PRINT_IND = printer.PrinterCode;
            InspireBillingRecord.PRINTER_NAME = printer.PrinterCode;
        }
        protected override string GetOB_KeyWord1(string polNumber)
        {
            switch (PolicyLOBCodeDisplayName)
            {
                case ApplicationConstants.LOB_WCU:
                    return polNumber.Substring(0, polNumber.Length - 1);
                default: return string.Empty;
            }
        }
        protected override string GetOB_KeyWord2()
        {
            return SourceActInvoiceFirstRecord.Account.AccountNumber;
        }
        protected override string GetOB_KeyWord3()
        {
            return InspireBillingRecord.POL_EFF_YR;
        }
        protected override string GetOB_KeyWord4(string pol)
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (document == ApplicationConstants.Doc_Manual_Invoice) return "INVOICE";
            return String.Empty;
        }
        protected override string GetOB_KeyWord5()
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (document == "Blank Letter Template" ||
                document == "Claim Settlement" ||
                document == "CRIB Payment Arrangement" ||
                document == "Not Honored Pymt Request Replacemnt" ||
                document == "Broker Accounting Statement" ||
                document == "Request Reissue of Check" ||
                document == "Return Pymts" ||
                document == "WC-DD-Remove Multiple Cancel Pymts" ||
                document == "WCU-DD-Remove from Direct Debit" ||
                document == "WCU-DD-Waiting for New Funding" ||
                document == "WCU-Direct Debit Letter" ||
                document == "Manual Invoice" )

                return "OUTGOING";
            else
                return String.Empty;
        }
        protected override string GetOB_KeyWord6()
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (document == "CRIB Payment Arrangement")
                return "RATING BUREAU";

            else if (document == "2nd Request For Unearned Commission" ||
                      document == "Broker Accounting Statement" ||
                      document == "Partial Pymt Pending CN Stands" ||
                      document == "Pymt Accepted Cancellation Stands" ||
                      document == "Return Pymt Letter" ||
                      document == "Manual Invoice") 

                return String.Empty;
            else
                return "CASH MANAGEMENT";
        }
        protected override string GetOB_KeyWord7()
        {
            var ob7 = GetPolicyCancellationDate();
            if (ob7 != null)    return ConvertDateFormat(ob7.ModificationDate, BC_Date_Format);
            return null;
        }
        protected override string GetOB_KeyWord8()
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (document == "Partial Pymt Pending CN Stands")
                return "PARTIAL PYMT PEND CANCEL STANDS";
            else if (document == "Return Pymt Letter" ||
                    document == "Pymt Accepted Cancellation Stands")
                return "CANCELLATION";
            else if (document == "Not Honored Pymt Orig CN Date Stnds")
                return "NOT HONORED PYMT CANCEL DT STANDS";
            else if (document == "Not Honored Pymt on Pending Cancel")
                return "NOT HONORED PYMT PEND CANCEL";
            return String.Empty;
        }
        protected override string GetOB_KeyWord9()
        {
            return String.Empty;
        }
        protected override string GetOB_KeyWord10()
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (
                document == "2nd Request For Unearned Commission" ||
                document == "Broker Accounting Statement" ||
                document == "Manual Invoice")
                return "WORKERS COMP";

             else   return String.Empty;
        }
        protected override string GetOB_KeyWord11()
        {
            return "ADHOC";
        }
        protected override string GetOB_KeyWord12()
        {
            return null;
        }
        private Cancellation GetPolicyCancellationDate()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.Cancellation;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private Address GetPolicyBrokerAddress()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.Policy?.ProducerCodeOfService_Ext?.Producer?.Address_Ext;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private Address GetPolicyLeaseAddress()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.LCFAddress_Ext;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private string GetBrokerName()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.Policy?.ProducerCodeOfService_Ext?.Producer;
                if (obj != null)
                    return obj.Name;
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
                InspireBillingRecord.BROKER_ADD_3 = address?.AddressLine3;

                InspireBillingRecord.BROKER_ST = address?.State.Code;
                InspireBillingRecord.BROKER_CTY = address?.City;
                InspireBillingRecord.BROKER_ZIP = address?.PostalCode;
            }
        }
        private void AddLeasingKeywords()
        {
            InspireBillingRecord.LEASING_CO_NAME = SourceActInvoiceFirstRecord?.LCFName_Ext;
            var address = GetPolicyLeaseAddress();
            if (address != null)
            {
                InspireBillingRecord.LEASING_ADD_1 = address?.AddressLine1;
                InspireBillingRecord.LEASING_ADD_2 = address?.AddressLine2;
                InspireBillingRecord.LEASING_ADD_3 = address?.AddressLine3;

                InspireBillingRecord.LEASING_ST = address?.State.Code;
                InspireBillingRecord.LEASING_CTY = address?.City;
                InspireBillingRecord.LEASING_ZIP = address?.PostalCode;
            }
        }
        protected override string GetDocOutBoundType(string lob)
        {
            var document = DocumentData.documentEntity.DocumentName;

            if (document == "CCI Letter") return "CMLC  Collection Agency";
            else if (
                document == "Not Honored Pymt on Pending Cancel" ||
                document == "Not Honored Pymt Orig CN Date Stnds" ||
                document == "Partial Pymt Pending CN Stands" ||
                document == "Pymt Accepted Cancellation Stands" ||
                document == "Return Pymt Letter" ) 
                    return "WCU  Non Payment Cancellation and Reinstatement";

            else if (document == "2nd Request For Unearned Commission") return "CM  Billing";
            else if (document == "Manual Invoice") return "WCU  Invoices";
            else return "WCU  Correspondence";
        }
        protected override string GetProductType(string lob)
        {
            return ApplicationConstants.Workers_Compensation;
        }
        protected override void ProcessRules()
        {
        }
    }
}
