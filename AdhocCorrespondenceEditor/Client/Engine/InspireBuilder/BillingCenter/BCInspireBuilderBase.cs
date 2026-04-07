using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.BC;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public abstract class BCInspireBuilderBase : InspireBuilderBase
    {
        #region Memebers
        protected string BC_Date_Format = "yyyy-MM-dd";
        protected string BC_Poicy_Holder_Account_Statement = "PL Policyholder Acct Statement";
        private string BC_Payment_Returned = "Payment Returned";
        private string Reversal = "reversal";
        private string Returned = "Returned";
        private string Disbursement = "Disbursement";
        private string Thank_You = "Thank You";
        protected BCInspireEntity BCInspireEntity { get; set; }
        protected BCUserEntity BCUserDataEntity { get; set; }
        protected BCSourceSystemEntity BCSourceSystemEntity { get; set; }
        protected CUSTOMER_DATARECORD_DELIMBILLING_REC InspireBillingRecord;
        protected PolicyPeriod SourceActInvoiceFirstRecord;
        protected AccountInvoice[] AccountInvoices;
        protected AccountViewTransactionDetails[] AccountViewTransactionDetails;
        protected PolicyPeriod PolicyPeriod;
        protected List<AccountInvoice> AllAccountInvoices;
        protected List<ProducerStatement> ProducerStatements;
        protected decimal? TempAmount;
        protected decimal? PolicyTotBalDue;
        protected decimal? TempPastDueAmount;
        protected string LineOfBusiness;
        protected string PolicyLOBCodeDisplayName;
        protected string PolicyValidLOBCode;
        #endregion

        #region All Abstract methods
        protected abstract string GetOB_KeyWord1(string pol);
        protected abstract string GetOB_KeyWord2();
        protected abstract string GetOB_KeyWord3();
        protected abstract string GetOB_KeyWord4(string lob);
        protected abstract string GetOB_KeyWord5();
        protected abstract string GetOB_KeyWord6();
        protected abstract string GetOB_KeyWord7();
        protected abstract string GetOB_KeyWord8();
        protected abstract string GetOB_KeyWord9();
        protected abstract string GetOB_KeyWord10();
        protected abstract string GetOB_KeyWord11();
        protected abstract string GetOB_KeyWord12();
        protected abstract string GetDocOutBoundType(string lob);
        protected abstract string GetProductType(string lob);
        #endregion

        protected override void CreateInspireRequest()
        {
            BCUserDataEntity = (BCUserEntity)UserInputData;
            BCSourceSystemEntity = (BCSourceSystemEntity)SourceSystemData;
            BCInspireEntity = new BCInspireEntity();
            InspireBillingRecord = BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_REC;

            // This condition exists for all documents except Manual Invouce
            if (BCSourceSystemEntity.retrievePolicyInvoiceDetailsOut != null)
            {
                var sourceSystem = BCSourceSystemEntity.retrievePolicyInvoiceDetailsOut;
                AllAccountInvoices = sourceSystem?.AccountInvoices.ToList();
                AccountInvoices = sourceSystem?.AccountInvoices;
                if (sourceSystem?.AccountInvoices.Length >= 0)
                {
                    SourceActInvoiceFirstRecord = sourceSystem?.AccountInvoices[0]?.PolicyPeriodForThisInvoice;
                    PolicyPeriod = sourceSystem?.AccountInvoices[0]?.PolicyPeriodForThisInvoice;
                }
            }
            // This section is ONLY for Manual Invoice
            else if (BCSourceSystemEntity.retrieveInvoiceTransactionsOut != null)
            {
                var sourceSystem = BCSourceSystemEntity.retrieveInvoiceTransactionsOut;
                AllAccountInvoices = sourceSystem?.AccountInvoices.ToList();
                AccountInvoice accountInvoiceLatest = new AccountInvoice();
                accountInvoiceLatest.PolicyPeriodForThisInvoice = sourceSystem?.LatestPolicyPeriod;
                AllAccountInvoices.Insert(0, accountInvoiceLatest);

                AccountInvoices = sourceSystem?.AccountInvoices;
                SourceActInvoiceFirstRecord = AllAccountInvoices[0]?.PolicyPeriodForThisInvoice;
                AccountViewTransactionDetails = sourceSystem?.InvoiceLineItemsFrom360ForThePolicy;

                TempAmount = sourceSystem?.PolicyInstAmtDue;
                TempPastDueAmount = sourceSystem?.PolicyPastDueAmt;
                PolicyTotBalDue = sourceSystem?.PolicyTotBalDue;
                PolicyPeriod = sourceSystem?.LatestPolicyPeriod;
            }
            else if (BCSourceSystemEntity.retrieveProducerStatementDetailsOut != null)
            {
                ProducerStatements = BCSourceSystemEntity.retrieveProducerStatementDetailsOut.ProducerStatments.ToList();
            }
        }
        protected override void ProcessUserInputData()
        {
            AddPrinter();
            CopyCopiesToSection();
        }
        protected override string SeriliazeInspireRequest()
        {
            var emptyNamespaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var serializer = new XmlSerializer(typeof(CUSTOMER_DATA));
            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;

            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, BCInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
        }
        protected override void ProcessPolicyAndAccountRecord()
        {
            AddPolicyGeneralDetails();
            AddPolicyDatesAndAmounts();
            AddRemainingInstallments();
            // The below 2 methods ONLY used for manual Invoice and Account statement
            AddInvoiceTransactionsFrom360ForThisPolicy();
            AddTransactionItemsFrom360();
        }
        protected virtual void AddPrinter()
        {
            var printer = BCUserDataEntity.PrinterDetails;
            if (printer.PrinterName == ApplicationConstants.Archive_Only)
            {
                InspireBillingRecord.ARCHIVE_IND = GetConfigValue(nameof(InspireBillingRecord.ARCHIVE_IND));
            }
            else
            {
                InspireBillingRecord.ARCHIVE_IND = GetConfigValue(nameof(InspireBillingRecord.ARCHIVE_IND));
                InspireBillingRecord.PRINT_IND = GetConfigValue(nameof(InspireBillingRecord.PRINT_IND));
                InspireBillingRecord.PRINTER_NAME = printer.PrinterCode;
            }
        }
        protected virtual void CopyCopiesToSection()
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

                copyRecord.CC_ADDRESSEE_NAME_1 = string.IsNullOrEmpty(copyTo?.CopyToName.Trim()) ? null : copyTo?.CopyToName.Trim();
                copyRecord.CC_ADDRESSEE_ADDR_1 = copyTo?.CopyToAddressLine1;
                copyRecord.CC_ADDRESSEE_ADDR_2 = copyTo?.CopyToAddressLine2;
                copyRecord.CC_ADDRESSEE_ADDR_3 = copyTo?.CopyToAddressLine3;
                copyRecord.CC_ADDRESSEE_CTY = copyTo?.CopyToCity;
                copyRecord.CC_ADDRESSEE_ST = copyTo?.CopyToState;
                copyRecord.CC_ADDRESSEE_ZIP = copyTo?.CopyToZIP;
                BCInspireEntity.CustomerData.RECORD_DELIM.BILLING_CC_OPT[index] = copyRecord;

                CUSTOMER_DATARECORD_DELIMCOPY_TO cc = new CUSTOMER_DATARECORD_DELIMCOPY_TO();
                cc.BILL_FK = copyRecord.BILL_FK;
                cc.CPY_TO_NAME = copyTo.CopyToCompanyName;
                BCInspireEntity.CustomerData.RECORD_DELIM.COPY_TO[index++] = cc;
            }
        }
        private void AddPolicyGeneralDetails()
        {
            PolicyLOBCodeDisplayName = SourceActInvoiceFirstRecord.Policy.LOBCode.DisplayName;
            LineOfBusiness = GetLineOfBusiness(PolicyLOBCodeDisplayName);
            PolicyValidLOBCode = GetPolicyLOBValue(nameof(SourceActInvoiceFirstRecord.Policy.LOBCode.DisplayName));
            InspireBillingRecord.LINEOFBUSINESS = LineOfBusiness;
            InspireBillingRecord.BILL_PK = GetConfigValue(nameof(InspireBillingRecord.BILL_PK));
            InspireBillingRecord.SRC_SYS = GetConfigValue(nameof(InspireBillingRecord.SRC_SYS));
            InspireBillingRecord.BARCODE_IND = GetConfigValue(nameof(InspireBillingRecord.BARCODE_IND));
            InspireBillingRecord.CERT_IND = GetConfigValue(nameof(InspireBillingRecord.CERT_IND));

            InspireBillingRecord.OUTBND_DOCTYPE = GetDocOutBoundType(PolicyValidLOBCode);
            InspireBillingRecord.POL_NO = GetPolicyNumber(PolicyValidLOBCode);
            var reasCode = GetPolicyPeriodREASValue();
            InspireBillingRecord.REAS_CODE_DESC = reasCode?.DisplayName;
            InspireBillingRecord.POL_ST = GetPolicyState()?.Code;

            var address = GetPrimaryInsuredPrimaryAddressVariableValue("PrimaryAddress");
            InspireBillingRecord.INS_POL_HLD_ADD_1 = address?.AddressLine1;
            InspireBillingRecord.INS_POL_HLD_ADD_2 = address?.AddressLine2;
            InspireBillingRecord.INS_POL_HLD_ADD_3 = address?.AddressLine3;
            InspireBillingRecord.INS_POL_HLD_CTY = address?.City;
            InspireBillingRecord.INS_POL_HLD_ST = address?.State.Code;
            InspireBillingRecord.INS_POL_HLD_ZIP = address?.PostalCode;

            InspireBillingRecord.INS_POL_HLD_NAME_1 = GetInsuredName("primaryinsured");

            InspireBillingRecord.PRODUCT_TYPE = GetProductType(PolicyLOBCodeDisplayName);
            InspireBillingRecord.ProductCode = GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.ProductOfferingCode_Ext));
            InspireBillingRecord.IndustryCode = GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.NJMIndustryOfferingCode_Ext));
            InspireBillingRecord.PolicyNumPrefixDisplay = GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.PolicyProductCode_Ext));
            InspireBillingRecord.RemainingInstallmentTotalBalance = GetRemainingInstBalance();

            //Aded tags from UI controls of ICE
            InspireBillingRecord.INBND_DOCTYPE = DocumentData.DocumentOnbaseID;
            InspireBillingRecord.LTR_CTGY = DocumentData.documentEntity.CategoryName;
            InspireBillingRecord.LTR_NAME = DocumentData.documentEntity.DocumentName;
            InspireBillingRecord.CREATOR_UID = InputQueryParameters.UserDetails.UserID;
            InspireBillingRecord.CREATOR_NAME = InputQueryParameters.UserDetails.UserName;
            InspireBillingRecord.CREATOR_INT = InputQueryParameters.UserDetails.UserInitials;
            var uwCompany = GetPolicyUWCompany();
            InspireBillingRecord.INS_CO_NM = GetInsuranceCompanyName(uwCompany?.Code);
            InspireBillingRecord.ADDRESSEE_NAME_1 = BCUserDataEntity.AddresseeAddress.DisplayName;
            InspireBillingRecord.ADDRESSEE_ADDR_1 = BCUserDataEntity.AddresseeAddress.Line1Tx;
            InspireBillingRecord.ADDRESSEE_ADDR_2 = BCUserDataEntity.AddresseeAddress.Line2Tx;
            InspireBillingRecord.ADDRESSEE_ADDR_3 = BCUserDataEntity.AddresseeAddress.Line3Tx;
            InspireBillingRecord.ADDRESSEE_CTY = BCUserDataEntity.AddresseeAddress.MunicipalityNm;
            InspireBillingRecord.ADDRESSEE_ST = BCUserDataEntity.AddresseeAddress.CountrySubdivisionNm;
            InspireBillingRecord.ADDRESSEE_ZIP = BCUserDataEntity.AddresseeAddress.PostalCd;
            InspireBillingRecord.ADDRESSEE_NAME_2 = string.IsNullOrEmpty(BCUserDataEntity.AddresseeAddress2) ? null : BCUserDataEntity.AddresseeAddress2;
            InspireBillingRecord.ATTN_NAME = BCUserDataEntity.AttentionName;
            InspireBillingRecord.REMITTANCE_IND = BCUserDataEntity.RemittanceIndicator;

            BCInspireEntity.CustomerData.RECORD_DELIM.LTR_NAME_REC = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();
            BCInspireEntity.CustomerData.RECORD_DELIM.LTR_NAME_REC.BILL_FK = GetConfigValue(nameof(InspireBillingRecord.BILL_PK));
            BCInspireEntity.CustomerData.RECORD_DELIM.LTR_NAME_REC.LTR_NAME_BATCH = DocumentData.documentEntity.DocumentName;
        }
        private void AddPolicyDatesAndAmounts()
        {
            InspireBillingRecord.INV_DT     = ConvertDateFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.IntentToCancelMailDate_Ext)), BC_Date_Format);
            InspireBillingRecord.CNC_EFF_DT = ConvertDateFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.ScheduledCancellationDate_Ext)), BC_Date_Format);
            InspireBillingRecord.POL_EFF_DT = ConvertDateFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.PolicyPerEffDate)), BC_Date_Format);
            InspireBillingRecord.POL_EXP_DT = ConvertDateFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.PolicyPerExpirDate)), BC_Date_Format);
            InspireBillingRecord.POL_EFF_YR = ConvertDateFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.PolicyPerEffDate)), "yyyy");
            InspireBillingRecord.CANCEL_MAIL_DT = ConvertDateFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.IntentToCancelMailDate_Ext)), BC_Date_Format);

            InspireBillingRecord.TOT_AMT_DUE_TEMP = ConvertAmountFormat(PolicyTotBalDue);
            InspireBillingRecord.TEMP_AMT = GetTempAmount(TempAmount); // used only for manual invoice check later        
            InspireBillingRecord.AMT = GetAmount(AllAccountInvoices[0].AmountDue);
            InspireBillingRecord.CUR_INSTALL_AMT = ConvertAmountFormat(TempAmount);

            InspireBillingRecord.PMNT_AMT = ConvertAmountFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.LastPaymentAmountPosted)));
            InspireBillingRecord.NOT_HONORED_PYMT_AMT = ConvertAmountFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.NotHonoredPaymentAmount_Ext)));
            InspireBillingRecord.EARNED_PREM_AMT = ConvertAmountFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.EPAgreementPaymentAmount)));
            InspireBillingRecord.TEMP_PAST_DUE_AMT = ConvertAmountFormat(TempPastDueAmount);

            InspireBillingRecord.PAST_DUE_AMT = GetPastDueAmount(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.DueAmount)));
            InspireBillingRecord.TOT_AMT_DUE = GetTotalAmountDue(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.TotalDueForPolicyPeriod)));
            InspireBillingRecord.FULL_ANNUAL_PREM = ConvertAmountFormat(GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.EPAgreementPaymentAmount)));
        }
        private void AddRemainingInstallments()
        {
            int index = 0;
            var invoices = SourceActInvoiceFirstRecord.PlannedInvoices;
            var recordDelim = BCInspireEntity.CustomerData.RECORD_DELIM;
            recordDelim.RemainingInstallments = new CUSTOMER_DATARECORD_DELIMRemainingInstallments[invoices.Length];

            foreach (var invoice in invoices ?? Array.Empty<Invoice>())
            {
                recordDelim.RemainingInstallments[index++] = new CUSTOMER_DATARECORD_DELIMRemainingInstallments()
                {
                    RemainingInstallmentAmountDue = ConvertAmountFormat(invoice.AmountDue),
                    RemainingInstallmentDueDate = ConvertDateFormat(invoice.PaymentDueDate, BC_Date_Format)
                };
            }
        }
        private void AddInvoiceTransactionsFrom360ForThisPolicy()
        {
            int index = 0;
            var inspireRecordDelim = BCInspireEntity.CustomerData.RECORD_DELIM;
            var sourceTransactionDetails = AccountViewTransactionDetails;
            inspireRecordDelim.InvoiceTransactions = new CUSTOMER_DATARECORD_DELIMInvoiceTransactions[sourceTransactionDetails == null ? 0 : sourceTransactionDetails.Length]; ;

            foreach (var transaction in sourceTransactionDetails ?? Array.Empty<AccountViewTransactionDetails>())
            {
                inspireRecordDelim.InvoiceTransactions[index++] = new CUSTOMER_DATARECORD_DELIMInvoiceTransactions()
                {
                    InvoiceTransactionDate = ConvertDateFormat(transaction.TransactionDate, BC_Date_Format),
                    InvoiceTransactionDescription = transaction.Description,
                    InvoicePayments = GetInvoicePaidamount(transaction),
                    InvoicePolicyYear = transaction.PolicyYear.HasValue ? transaction.PolicyYear.Value.ToString() : null,
                    InvoiceUnderwritingCompany = transaction.UnderwritingCompany,
                    InvoiceCharge = ConvertAmountFormat(transaction.DueAmount),
                    InvoiceCredit = ConvertAmountFormat(transaction.PaidAmount),
                    InvoiceAmountDue = ConvertAmountFormat(transaction.InvoiceItemAmtDue)
                };
            }
        }
        private void AddTransactionItemsFrom360()
        {
            int index = 0;
            int count = AccountInvoices.SelectMany(x => x.InvoiceLineItemsFrom360).Count();

            var inspireRecordDelim = BCInspireEntity.CustomerData.RECORD_DELIM;
            inspireRecordDelim.TRANS_DATE_REC = new CUSTOMER_DATARECORD_DELIMTRANS_DATE_REC[count];
            foreach (var accountInvoice in AccountInvoices.ToArray() ?? Array.Empty<AccountInvoice>())
            {
                var sourceTransactionDetails = accountInvoice?.InvoiceLineItemsFrom360;
                foreach (var transaction in sourceTransactionDetails)
                {
                    inspireRecordDelim.TRANS_DATE_REC[index++] = new CUSTOMER_DATARECORD_DELIMTRANS_DATE_REC()
                    {
                        TRANS_DATE = ConvertDateFormat(transaction.TransactionDate, BC_Date_Format),
                        TRANS = TransformDescription(transaction.Description),
                        POL_YR = transaction.PolicyYear.HasValue ? transaction.PolicyYear.Value.ToString() : null,
                        BR_NJM_POL_NO = transaction.PolicyYear.HasValue ? transaction.PolicyYear.Value.ToString() : null,
                        //BR_NJM_POLHOLD_NAME_1 = CANNOT FIND this tag
                        CHARGE_AMT = ConvertAmountFormat(transaction.DueAmount),
                        CREDIT_AMT = ConvertAmountFormat(transaction.PaidAmount),
                        BAL_AMT = ConvertAmountFormat(transaction.InvoiceItemAmtDue),
                        UnderwritingCompany = transaction.UnderwritingCompany
                    };
                }
            }
        }
        private string GetInvoicePaidamount(AccountViewTransactionDetails transaction)
        {
            if (transaction.Description == BC_Payment_Returned)
                return ConvertAmountFormat(transaction.DueAmount);
            else
                return ConvertAmountFormat(transaction.PaidAmount);
        }
        protected void AddOnbaseKeywords()
        {
            InspireBillingRecord.OB_KEYWORD1 = GetOB_KeyWord1(SourceActInvoiceFirstRecord?.PolicyNumber);
            InspireBillingRecord.OB_KEYWORD2 = GetOB_KeyWord2();
            InspireBillingRecord.OB_KEYWORD3 = GetOB_KeyWord3();
            InspireBillingRecord.OB_KEYWORD4 = GetOB_KeyWord4(PolicyLOBCodeDisplayName);
            InspireBillingRecord.OB_KEYWORD5 = GetOB_KeyWord5();
            InspireBillingRecord.OB_KEYWORD6 = GetOB_KeyWord6();
            InspireBillingRecord.OB_KEYWORD7 = GetOB_KeyWord7();
            InspireBillingRecord.OB_KEYWORD8 = GetOB_KeyWord8();
            InspireBillingRecord.OB_KEYWORD9 = GetOB_KeyWord9();
            InspireBillingRecord.OB_KEYWORD10 = GetOB_KeyWord10();
            InspireBillingRecord.OB_KEYWORD11 = GetOB_KeyWord11();
            InspireBillingRecord.OB_KEYWORD12 = GetOB_KeyWord12();
        }

        private string GetLineOfBusiness(string lob)
        {
            if (lob == ApplicationConstants.LOB_HO)
                lob = SourceActInvoiceFirstRecord.HOPolicyType_Ext.Code;

            ILookup<string, string> lookup = ApplicationConstants.BCLineOfBusiness.
                                    ToLookup(x => x.Key, x => x.Value);

            return lookup[lob].SingleOrDefault();
        }
        private string GetPolicyNumber(string lob)
        {
            var policyNumber = GetPolicyPeriodValue(nameof(SourceActInvoiceFirstRecord.PolicyNumber));
            switch (lob)
            {
                case ApplicationConstants.LOB_PA:
                case ApplicationConstants.LOB_HO:
                case ApplicationConstants.LOB_PUP:
                    return String.Format("{0}-{1}", policyNumber.Substring(0, policyNumber.Length - 1), policyNumber[policyNumber.Length - 1]);
                case ApplicationConstants.LOB_CA:
                case ApplicationConstants.LOB_CGL:
                case ApplicationConstants.LOB_BOP:
                case ApplicationConstants.LOB_CUMB:
                case ApplicationConstants.LOB_CPP:
                case ApplicationConstants.LOB_WC:
                    return policyNumber;
                default: return null;
            }
        }
        private string GetInsuredName(string role)
        {
            PolicyPeriodContact policyPeriodContact = GetPrimaryInsured();
            if (policyPeriodContact.Roles.Where(x => x.Role.Code == role).Count() > 0)
            {
                return policyPeriodContact.DisplayName;
            }
            else return null;
        }
        protected string GetSecondaryInsuredName(string role)
        {
            PolicyPeriodContact[] policyPeriodContacts = GetSecondayInsured();
            var secondary = policyPeriodContacts
                                    .Where(c => c.Roles
                                        .Any(x => x.Role.Code == role)).FirstOrDefault();
            return secondary != null ? secondary.DisplayName : null;
        }
        private string GetRemainingInstBalance()
        {
            if (PolicyPeriod != null && PolicyPeriod.TotalDueForPolicyPeriod.HasValue)
                return ConvertAmountFormat(PolicyPeriod.TotalDueForPolicyPeriod);
            else return null;
        }
        private string GetAmount(decimal? amount)
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (document == ApplicationConstants.Doc_Manual_Invoice)
            {
                if (InspireBillingRecord.TEMP_AMT?.ToString() == "0") return String.Empty;
                else return InspireBillingRecord.TEMP_AMT;
            }
            else
            {
                return amount.HasValue ? amount.Value.ToString() : String.Empty;
            }
        }
        private string GetTempAmount(decimal? amount)
        {
            var document = DocumentData.documentEntity.DocumentName;

            if (document == BC_Poicy_Holder_Account_Statement) return String.Empty;

            if (document == ApplicationConstants.Doc_Manual_Invoice)
            {
                if (amount.HasValue && amount.Value == decimal.Zero) return String.Empty;
                else return amount.HasValue ? amount.Value.ToString() : "0";
            }
            else return amount.HasValue ? amount.Value.ToString() : String.Empty;
        }
        private string GetTotalAmountDue(string? amount)
        {
            var document = DocumentData.documentEntity.DocumentName;

            if (document == BC_Poicy_Holder_Account_Statement) return String.Empty;

            if (document == ApplicationConstants.Doc_Manual_Invoice)
            {
                if (InspireBillingRecord.TOT_AMT_DUE_TEMP == null) return String.Empty;
                else return InspireBillingRecord.TOT_AMT_DUE_TEMP;
            }
            else return amount != null ? amount.ToString() : String.Empty;
        }
        private string GetPastDueAmount(string amount)
        {
            var document = DocumentData.documentEntity.DocumentName;

            if (document == ApplicationConstants.Doc_Manual_Invoice)
            {
                if (string.IsNullOrEmpty(InspireBillingRecord.TEMP_PAST_DUE_AMT)) return String.Empty;
                else return InspireBillingRecord.TEMP_PAST_DUE_AMT;
            }
            else return amount != null ? amount : String.Empty;
        }
        protected string GetPolicyPeriodValue(string xmlNodeName)
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                foreach (var property in currentObj.PolicyPeriodForThisInvoice.GetType().GetProperties())
                {
                    if (property.Name == xmlNodeName)
                    {
                        var value = property.GetValue(currentObj.PolicyPeriodForThisInvoice);
                        if (value != null) return value.ToString();
                    }
                }
            }
            return null;
        }
        private PolicyPeriodContact GetPrimaryInsured()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice.PrimaryInsured;
                {
                    if (obj != null)
                        return obj;
                }
            }
            return null;
        }
        private PolicyPeriodContact[] GetSecondayInsured()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice.Contacts;
                {
                    if (obj != null)
                        return obj;
                }
            }
            return null;
        }
        private string GetPolicyLOBValue(string xmlNodeName)
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                foreach (var property in currentObj.PolicyPeriodForThisInvoice.Policy.LOBCode.GetType().GetProperties())
                {
                    if (property.Name == xmlNodeName)
                    {
                        var value = property.GetValue(currentObj.PolicyPeriodForThisInvoice.Policy.LOBCode);
                        if (value != null) return value.ToString();
                    }
                }
            }
            return null;
        }
        private AdhocCorrespondenceEditor.Shared.BC.Address? GetPrimaryInsuredPrimaryAddressVariableValue(string variableName)
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.PrimaryInsured?.Contact?.PrimaryAddress;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private PolicyPeriodRiskState? GetPolicyState()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.RiskState;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private PolicyPeriodNotHonoredPaymentReason_Ext GetPolicyPeriodREASValue()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.NotHonoredPaymentReason_Ext;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private PolicyPeriodUWCompany GetPolicyUWCompany()
        {
            foreach (var currentObj in AllAccountInvoices)
            {
                var obj = currentObj.PolicyPeriodForThisInvoice?.UWCompany;
                if (obj != null)
                    return obj;
            }
            return null;
        }
        private string TransformDescription(string description)
        {
            if (!string.IsNullOrEmpty(description))
            {
                description = Regex.Replace(description, @"#", string.Empty);

                if (description.ToLower().IndexOf(Reversal) != -1)
                {
                    description = Regex.Replace(description, Reversal, Returned, RegexOptions.IgnoreCase);
                }
                else if (description.ToLower().IndexOf(Disbursement) != -1)
                {
                    if (description.IndexOf("[NJM]") != -1)
                    {
                        description = Regex.Replace(description, Disbursement, "Transferred", RegexOptions.IgnoreCase);
                        description = Regex.Replace(description, @"\[.*\]", "");
                    }
                }
                else
                {
                    description = Regex.Replace(description, @"\[.*\]", Thank_You);
                }
            }
            return description;
        }
    }
}
