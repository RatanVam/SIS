using AdhocCorrespondenceEditor.Client.Common;

namespace AdhocCorrespondenceEditor.Client
{
    public class BCPAInspireBuilder : BCInspireBuilderBase
    {
        protected override void CreateCustomTags()
        {
            InspireBillingRecord.CURR_DT = ConvertDateFormat(DateTime.Today, ApplicationConstants.CurrentDate_Format);
            InspireBillingRecord.INS_POL_HLD_NAME_2 = GetSecondaryInsuredName("SecondaryContact_Ext");
            AddOnbaseKeywords();
            AddEmail();
        }
        protected override string GetProductType(string lob)
        {
            if (lob == ApplicationConstants.LOB_HO)
                lob = SourceActInvoiceFirstRecord.HOPolicyType_Ext.Code;

            ILookup<string, string> lookup = ApplicationConstants.BCProductType.
                                    ToLookup(x => x.Key, x => x.Value);

            return lookup[lob].SingleOrDefault();
        }

        private void AddEmail()
        {
            InspireBillingRecord.EMAIL_IND = BCUserDataEntity.EmailAddress is null ? null : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(BCUserDataEntity.EmailAddress))
            {
                InspireBillingRecord.EMAIL_TO = BCUserDataEntity.EmailAddress;
                InspireBillingRecord.EMAIL_IND = ApplicationConstants.YES;

                string policyType = GetBCEmailSubjectByPolicy(InspireBillingRecord.LINEOFBUSINESS);
                if (!string.IsNullOrEmpty(policyType))
                {
                    InspireBillingRecord.EMAIL_SUBJECT = String.Format(GetConfigValue(nameof(InspireBillingRecord.EMAIL_SUBJECT)), policyType);
                }

                InspireBillingRecord.EMAIL_FROM = GetConfigValue(nameof(InspireBillingRecord.EMAIL_FROM));
                InspireBillingRecord.EMAIL_BODY = GetConfigValue(nameof(InspireBillingRecord.EMAIL_BODY));
            }
            // BIL-6255
            if (DocumentData.documentEntity.DocumentName == "PL BC Blank Letter Template")
            {
                InspireBillingRecord.EMAIL_SUBJECT = "Important NJM Billing and Payment Information";
                InspireBillingRecord.EMAIL_BODY = "The attachment contains details of your billing and payment information";
            }
        }

        protected override string GetOB_KeyWord1(string polNumber)
        {
            //var lob = GetPolicyLOBValue(nameof( SourceActInvoiceRecord.Policy.LOBCode.DisplayName));
            switch (PolicyLOBCodeDisplayName)
            {
                case ApplicationConstants.LOB_PA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_PUP:
                case ApplicationConstants.LOB_CA:
                case ApplicationConstants.LOB_CGL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:
                case ApplicationConstants.LOB_WC:
                    return polNumber.Substring(0, polNumber.Length - 1);
                default: return string.Empty;
            }
        }
        protected override string GetOB_KeyWord2()
        {
            var document = DocumentData.documentEntity.DocumentName;
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            switch (lob)
            {
                case ApplicationConstants.LOB_CA:
                case ApplicationConstants.LOB_CGL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:
                case ApplicationConstants.LOB_PLA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_DW:
                case ApplicationConstants.LOB_UMB:

                    if (document == "PL Request Reissue of Check" ||
                        document == "PL BC Blank Letter Template" ||
                       document == "PL Return Pymts" ||
                       document == "PL Not Honored Pymt Request Replace" ||
                       document == "PL Policyholder Acct Statement" ||
                       document == "CMLC  Collection Agency" ||
                       document == "PL Partial Pymt Pending CN Stands" ||
                       document == "PL Return Pymt Letter" ||
                       document == "PL Pymt Accepted CN Stands" ||
                        document == "Manual Invoice" ||
                       document == "PL Loss Payee NH Pymt CN DT Stands" ||
                       document == "PL Not Honored Pymt Orig CN DT Stnd" ||
                       document == "PL Not Honored Pymt on Pending CN" ||
                       document == "PL BC Blank Letter Template")

                        return InspireBillingRecord.POL_EFF_DT == null ? null : InspireBillingRecord.POL_EFF_DT.Substring(0, 4);
                    else return string.Empty;
                default: return string.Empty;
            }
        }
        protected override string GetOB_KeyWord3()
        {
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            var documentName = DocumentData.documentEntity.DocumentName;
            switch (lob)
            {
                case ApplicationConstants.LOB_PLA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_DW:
                case ApplicationConstants.LOB_UMB:

                    if (documentName == "PL Loss Payee NH Pymt CN DT Stands" ||
                         documentName == "PL Not Honored Pymt Orig CN DT Stnd" ||
                         documentName == "PL Pymt Accepted CN Stands")
                        return string.Empty;
                    else if (documentName == "PL Request Reissue of Check" ||
                        documentName == "PL BC Blank Letter Template" ||
                        documentName == "PL Not Honored Pymt Request Replace" ||
                        documentName == "PL Policyholder Acct Statement" ||
                        documentName == "CMLC  Collection Agency" ||
                        documentName == "PL Return Pymts" ||
                        documentName == "Manual Invoice" ||
                        documentName == "PL BC Blank Letter Template")
                        return "OUTGOING";
                    else return string.Empty;
                case ApplicationConstants.LOB_CGL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:
                case ApplicationConstants.LOB_CA:

                    if (documentName == "PL Loss Payee NH Pymt CN DT Stands" ||
                          documentName == "PL Pymt Accepted CN Stands")
                        return "OUTGOING";
                    else if (documentName == "PL Request Reissue of Check" ||
                          documentName == "PL BC Blank Letter Template" ||
                          documentName == "PL Not Honored Pymt Request Replace" ||
                          documentName == "PL Policyholder Acct Statement" ||
                          documentName == "CMLC  Collection Agency" ||
                          documentName == "Manual Invoice")
                        return "OUTGOING";
                    else return string.Empty;

                default: return string.Empty;
            }
        }
        protected override string GetOB_KeyWord4(string lob)
        {
            if (lob == ApplicationConstants.LOB_HO)
                lob = SourceActInvoiceFirstRecord.HOPolicyType_Ext.Code;

            ILookup<string, string> lookup = ApplicationConstants.BCObKeyword4.
                                    ToLookup(x => x.Key, x => x.Value);

            return lookup[lob].SingleOrDefault();
        }
        protected override string GetOB_KeyWord5()
        {
            var document = DocumentData.documentEntity.DocumentName;
            ILookup<string, string> lookup = ApplicationConstants.BCObKeyword5.
                          ToLookup(x => x.Key, x => x.Value);

            return lookup[document].SingleOrDefault() ?? String.Empty;
        }
        protected override string GetOB_KeyWord6()
        {
            var lob = InspireBillingRecord.LINEOFBUSINESS;

            switch (lob)
            {
                case ApplicationConstants.LOB_PLA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_DW:
                case ApplicationConstants.LOB_UMB:
                    var document = DocumentData.documentEntity.DocumentName;
                    ILookup<string, string> lookup = ApplicationConstants.BCObKeyword6.
                                  ToLookup(x => x.Key, x => x.Value);

                    return lookup[document].SingleOrDefault() ?? String.Empty;
                default: return String.Empty;
            }
        }
        protected override string GetOB_KeyWord7()
        {
            var dateTime = GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.IntentToCancelMailDate_Ext));
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            var documentName = DocumentData.documentEntity.DocumentName;
            switch (lob)
            {
                case ApplicationConstants.LOB_PLA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_DW:
                case ApplicationConstants.LOB_UMB:

                    if (documentName == "PL Not Honored Pymt on Pending CN" ||
                       documentName == "PL Partial Pymt Pending CN Stands" ||
                       documentName == "PL Not Honored Pymt Orig CN DT Stnd" ||
                       documentName == "PL Return Pymt Letter")
                    {
                        if (dateTime == null) return string.Empty;
                        return ConvertDateFormat(dateTime);
                    }
                    else return null;
                default:
                    return String.Empty;
            }
        }
        protected override string GetOB_KeyWord8()
        {
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            switch (lob)
            {
                case ApplicationConstants.LOB_PLA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_DW:
                case ApplicationConstants.LOB_UMB:
                    var document = DocumentData.documentEntity.DocumentName;
                    if (document == "PL Loss Payee NH Pymt CN DT Stands")
                        return "LOSS PAYEE";
                    if (document == "PL Not Honored Pymt Orig CN DT Stnd" ||
                       document == "PL Partial Pymt Pending CN Stands")
                        return "INSURED";
                    else return String.Empty;

                default: return String.Empty;
            }
        }
        protected override string GetOB_KeyWord9()
        {
            var document = DocumentData.documentEntity.DocumentName;
            switch (PolicyLOBCodeDisplayName)
            {
                case ApplicationConstants.LOB_CA:
                case ApplicationConstants.LOB_GL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:
                    if (document == "PL Not Honored Pymt on Pending CN" ||
                        document == "PL Partial Pymt Pending CN Stands" ||
                        document == "PL Not Honored Pymt Orig CN DT Stnd" ||
                        document == "PL Return Pymts" ||
                        document == "PL Return Pymt Letter")
                        return InspireBillingRecord.CNC_EFF_DT == null ? String.Empty : InspireBillingRecord.CNC_EFF_DT;
                    else return String.Empty;

                default: return String.Empty;
            }
        }
        protected override string GetOB_KeyWord10()
        {
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            var document = DocumentData.documentEntity.DocumentName;

            switch (lob)
            {
                case ApplicationConstants.LOB_CA:
                case ApplicationConstants.LOB_GL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:
                    ILookup<string, string> lookup = ApplicationConstants.BCObKeyword10.
                                  ToLookup(x => x.Key, x => x.Value);

                    return lookup[document].SingleOrDefault() ?? String.Empty;
                default: return String.Empty;
            }
        }
        protected override string GetOB_KeyWord11()
        {
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            var document = DocumentData.documentEntity.DocumentName;

            switch (lob)
            {
                case ApplicationConstants.LOB_CA:
                case ApplicationConstants.LOB_GL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:

                    return "INVOICE";
                default: return String.Empty;
            }
        }
        protected override string GetOB_KeyWord12()
        {
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            switch (lob)
            {
                case ApplicationConstants.LOB_CA:
                case ApplicationConstants.LOB_GL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:
                    return SourceActInvoiceFirstRecord.Account.AccountNumber;

                case ApplicationConstants.LOB_PLA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_DW:
                case ApplicationConstants.LOB_UMB:
                    return string.Empty; ;
                default: return string.Empty;
            }
        }
        protected override string GetDocOutBoundType(string lob)
        {
            ILookup<string, string> lookup = ApplicationConstants.BCOutBoundType.
                                    ToLookup(x => x.Key, x => x.Value);

            var firstValue = lookup[lob].SingleOrDefault();
            var secondValue = GetDocOutBoundTypeExtn();
            return secondValue == null ? firstValue : secondValue;
        }
        private string GetDocOutBoundTypeExtn()
        {
            var lob = InspireBillingRecord.LINEOFBUSINESS;
            var document = DocumentData.documentEntity.DocumentName;

            switch (document)
            {
                case "PL Not Honored Pymt on Pending CN":
                case "PL Not Honored Pymt Orig CN DT Stnd":
                case "PL Return Pymt Letter":
                case "PL Pymt Accepted CN Stands":

                    if (lob == ApplicationConstants.LOB_CA ||
                        lob == ApplicationConstants.LOB_GL ||
                        lob == ApplicationConstants.LOB_BOP ||
                        lob == ApplicationConstants.LOB_CUMB ||
                        lob == ApplicationConstants.LOB_CPP)
                        return "CL  Non Payment Cancellation and Reinstatement";
                    else if (lob == ApplicationConstants.LOB_PLA ||
                        lob == ApplicationConstants.LOB_HO ||
                        lob == ApplicationConstants.LOB_DW ||
                        lob == ApplicationConstants.LOB_UMB)
                        return "CM  Collections - Cancel Notices";

                    else return string.Empty;
                case "PL Return Pymts":

                    if (lob == ApplicationConstants.LOB_CA ||
                                lob == ApplicationConstants.LOB_GL ||
                                lob == ApplicationConstants.LOB_BOP ||
                                lob == ApplicationConstants.LOB_CUMB ||
                                lob == ApplicationConstants.LOB_CPP)
                        return "CL  Correspondence";
                    else if (lob == ApplicationConstants.LOB_PLA ||
                        lob == ApplicationConstants.LOB_HO ||
                        lob == ApplicationConstants.LOB_DW ||
                        lob == ApplicationConstants.LOB_UMB)
                        return "POLDOC  Correspondence";
                    else return string.Empty;

                case "PL Partial Pymt Pending CN Stands":
                    if (lob == ApplicationConstants.LOB_CA ||
                                lob == ApplicationConstants.LOB_GL ||
                                lob == ApplicationConstants.LOB_BOP ||
                                lob == ApplicationConstants.LOB_CUMB ||
                                lob == ApplicationConstants.LOB_CPP)
                        return "CL  Non Payment Cancellation and Reinstatement";
                    else if (lob == ApplicationConstants.LOB_PLA ||
                        lob == ApplicationConstants.LOB_HO ||
                        lob == ApplicationConstants.LOB_DW ||
                        lob == ApplicationConstants.LOB_UMB)
                        return "CM  Collections - Cancel Notices ";
                    else return string.Empty;

                case "Manual Invoice":

                    if (lob == ApplicationConstants.LOB_CA ||
                         lob == ApplicationConstants.LOB_GL ||
                         lob == ApplicationConstants.LOB_BOP ||
                         lob == ApplicationConstants.LOB_CUMB ||
                         lob == ApplicationConstants.LOB_CPP)
                        return "CL  Invoices ";
                    else if (lob == ApplicationConstants.LOB_PLA ||
                            lob == ApplicationConstants.LOB_HO ||
                            lob == ApplicationConstants.LOB_DW ||
                            lob == ApplicationConstants.LOB_UMB)
                        return "POLDOC  Invoices";
                    else return null;

                default:
                    if (lob == ApplicationConstants.LOB_CA ||
                              lob == ApplicationConstants.LOB_GL ||
                              lob == ApplicationConstants.LOB_BOP ||
                              lob == ApplicationConstants.LOB_CUMB ||
                              lob == ApplicationConstants.LOB_CPP)
                        return "CL  Correspondence ";

                    else if (lob == ApplicationConstants.LOB_PLA ||
                        lob == ApplicationConstants.LOB_HO ||
                        lob == ApplicationConstants.LOB_DW ||
                        lob == ApplicationConstants.LOB_UMB)
                        return "POLDOC  Correspondence";
                    else return string.Empty;
            }
        }
        private string GetBCEmailSubjectByPolicy(string lob)
        {
            ILookup<string, string> lookup = ApplicationConstants.BCEmailSubjectByPolicy.
                          ToLookup(x => x.Key, x => x.Value);

            return lookup[lob].SingleOrDefault();
        }
        protected override void ProcessRules()
        {
        }
    }
}
