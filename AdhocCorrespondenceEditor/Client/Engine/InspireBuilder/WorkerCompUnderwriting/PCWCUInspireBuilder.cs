using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.WCU;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.WCU;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCWCUInspireBuilder : InspireBuilderBase
    {
        protected WCUInspireEntity WCUInspireEntity { get; set; }
        private PCWCUUserEntity WCUUserDataEntity { get; set; }
        private PCWCUSourceSystemEntity WCUSourceSystemEntity { get; set; }

        protected CUSTOMER_DATARECORD_DELIM InspireCustomerRecord;
        protected CUSTOMER_DATARECORD_DELIMPOLICY_REC InspirePolicyRecord;
        protected PolicyPeriod SourcePolicy;
        protected string WCU_Date_Format = "yyyy-MM-dd";

        protected override void CreateInspireRequest()
        {
            WCUUserDataEntity = (PCWCUUserEntity)UserInputData;
            WCUSourceSystemEntity = (PCWCUSourceSystemEntity)SourceSystemData;
            WCUInspireEntity = new WCUInspireEntity();

            InspireCustomerRecord = WCUInspireEntity.CustomerData.RECORD_DELIM;
            InspirePolicyRecord = WCUInspireEntity.CustomerData.RECORD_DELIM.POLICY_REC;
            SourcePolicy = WCUSourceSystemEntity?.PolicyData?.Policy?.PolicyPeriod;
        }

        protected override void CreateCustomTags()
        {
            AddOnbaseKeywords();
        }

        #region OnBase Keywords
        protected void AddOnbaseKeywords()
        {
            InspirePolicyRecord.OB_KEYWORD1 = GetOB_KeyWord1();
            InspirePolicyRecord.OB_KEYWORD2 = GetOB_KeyWord2();
            InspirePolicyRecord.OB_KEYWORD3 = GetOB_KeyWord3();
            InspirePolicyRecord.OB_KEYWORD4 = GetOB_KeyWord4();
            InspirePolicyRecord.OB_KEYWORD5 = GetOB_KeyWord5();
            InspirePolicyRecord.OB_KEYWORD6 = GetOB_KeyWord6();
            InspirePolicyRecord.OB_KEYWORD12= GetOB_KeyWord12();
        }
        private string GetOB_KeyWord1()
        {
            var pol= GetPolicyNumber();
            return pol == null ? null : pol.Substring(0,pol.Length-2);
        }
        private string GetOB_KeyWord2()
        {
            return ConvertDateFormat(SourcePolicy.StartDt, "yyyy");
        }
        private string GetOB_KeyWord3()
        {
            var account =  GetAccountNumber();
            return account == null ? null : account.Substring(0, account.Length-1);
        }
        private string GetOB_KeyWord4()
        {
            return "OUTGOING";
        }
        private string GetOB_KeyWord5()
        {
            var document = DocumentData.documentEntity.DocumentName;
            switch(document)
            {
                case "Bkr Chg Add Delete Billing Opts":
                case "Bkr Mid Term Change-Add":
                case "Broker Authorization Ltr":
                    return "BROKER";

                case "Non Pay to Broker":
                    return "CANCEL-REINSTATE";

                case "Check Lacks CRIB Endorsement":
                case "CRIB Ownership Response":
                case "CRIB Req Relief Redes Letter":
                case "CRIB Zero Balance":
                case "CRIB-Vol Cov Credit Ltr":
                case "Ownership to Crib":
                case "Re Designation App Letter":
                case "Request Bureau File Number":
                case "1st Fraud Notice Complied After Req":
                case "CRIB Req for Records Audit Complete":
                case "Re-Audit Decline":
                case "Test Audit Reqd Audit not Complete":
                    return "RATING BUREAU";

                case "1st Fraud Notice Req CRIB Assist":
                case "Fraud Letter":
                case "Mail Audit":
                case "No Change Audit Correct":
                case "No Change Lack of Cooperation":
                    return "PREMIUM AUDIT";

                case "Fin Co Notify Fin Co of Prior CN":
                case "Fin Co Rec Part of Agremt or Rec Ck":
                case "Fin Co Received Complete Agreement":
                case "Finance Co Final Request":
                    return "FINANCE AGREEMENT";

                case "OCIP CCIP Letter":
                    return "OCIP-CCIP";
                case "SIU Referral":
                    return "SIU";
            }
            return null;
        }
        private string GetOB_KeyWord6()
        {
            return SourcePolicy.QuoteNr;
        }
        private string GetOB_KeyWord12()
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (document == "Legal Status Change") return "Final Audit";
            return null;
        }
        #endregion

        protected override void ProcessPolicyAndAccountRecord()
        {
            AddPolicyGeneralDetails();
            AddPolicyDatesAndAmounts();
            AddRecordDelimTags();
            AddModularTags();
        }
        private void AddModularTags()
        {
            var delim = WCUInspireEntity.CustomerData.RECORD_DELIM;
            delim.EXP_RATE = new CUSTOMER_DATARECORD_DELIMEXP_RATE[WCUUserDataEntity.ModeValues.Count];
            int index = 0;
            WCUUserDataEntity.ModeValues.ForEach(x =>
            {
                delim.EXP_RATE[index] = new CUSTOMER_DATARECORD_DELIMEXP_RATE();
                delim.EXP_RATE[index].POL_YR = x.Year;
                delim.EXP_RATE[index].POL_FK = GetConfigValue("POL_FK");
                delim.EXP_RATE[index].MOD = x.MOD;
                var document = DocumentData.documentEntity.DocumentName;
                if (document == "Exp Mod Letter Bidding-Dates")
                {
                    delim.EXP_RATE[index].EMR_EFF_DT = ConvertDateFormat( x.ModEffDate, WCU_Date_Format);
                    delim.EXP_RATE[index].EMR_EXP_DT = ConvertDateFormat(x.ModExpDate, WCU_Date_Format);
                }
                index++;
            });
        }
        private void AddPolicyGeneralDetails()
        {
            InspirePolicyRecord.CURR_DT = ConvertDateFormat(DateTime.Today, "MMMM d, yyyy");
            InspirePolicyRecord.SRC_SYS = GetConfigValue(nameof(InspirePolicyRecord.SRC_SYS));
            InspirePolicyRecord.POL_PK = GetConfigValue(nameof(InspirePolicyRecord.POL_PK));
            InspirePolicyRecord.BARCODE_IND = GetConfigValue(nameof(InspirePolicyRecord.BARCODE_IND));
            InspirePolicyRecord.WCU_CSF_TYPE = GetConfigValue(nameof(InspirePolicyRecord.WCU_CSF_TYPE));
            InspirePolicyRecord.CERT_IND = GetConfigValue(nameof(InspirePolicyRecord.CERT_IND));

            InspirePolicyRecord.POL_ST = SourcePolicy.BaseState;
            InspirePolicyRecord.POL_NO = GetPolicyNumber();
            InspirePolicyRecord.PRIMARY_INS_POL_HLD_NAME = GetPolicyHolder();
            InspirePolicyRecord.POL_NO_PAD = GetPolicyWithPad();
            InspirePolicyRecord.APPLICANT_CO_NM = GetPolicyHolder();

            InspirePolicyRecord.INBND_DOCTYPE = DocumentData.DocumentOnbaseID;
            InspirePolicyRecord.LTR_CTGY = DocumentData.documentEntity.CategoryName;
            InspirePolicyRecord.LTR_NAME = DocumentData.documentEntity.DocumentName;
            InspirePolicyRecord.OUTBND_DOCTYPE = DocumentData.documentEntity.DocumentType;
            InspirePolicyRecord.CREATOR_UID = InputQueryParameters.UserDetails.UserID;
            InspirePolicyRecord.CREATOR_NAME = InputQueryParameters.UserDetails.UserName;
            InspirePolicyRecord.CREATOR_INT = InputQueryParameters.UserDetails.UserInitials;

            var organization = SourcePolicy.InvolvedParties.Where(p => p.PartyRoles.Contains(ApplicationConstants.NamedInsured))
                                                           .FirstOrDefault()?.Organization;
            var address = GetAddress(organization);
            if (address != null)
            {
                InspirePolicyRecord.APPLICANT_ADDR_1 = address.Line1Tx;
                InspirePolicyRecord.APPLICANT_ADDR_2 = address.Line2Tx;
                InspirePolicyRecord.APPLICANT_ADDR_3 = address.Line3Tx;
                InspirePolicyRecord.APPLICANT_CTY = address?.Municipality.FirstOrDefault()?.MunicipalityNm;
                InspirePolicyRecord.APPLICANT_ST = address?.CountrySubdivision.CountrySubdivisionNm;
                InspirePolicyRecord.APPLICANT_ZIP = address.PostalCd;

                InspirePolicyRecord.EMP_NAME = organization.OrganizationNm;
                InspirePolicyRecord.EMP_CLM_LOC_ADDR = address.Line1Tx; 
                InspirePolicyRecord.EMP_CLM_LOC_CITY = address?.Municipality.FirstOrDefault()?.MunicipalityNm;
                InspirePolicyRecord.EMP_CLM_LOC_ST = address?.CountrySubdivision.CountrySubdivisionNm;
                InspirePolicyRecord.EMP_CLM_LOC_ZIP = address.PostalCd;

                InspirePolicyRecord.NJM_POL_ADDR_1 = address.Line1Tx;
                InspirePolicyRecord.NJM_POL_ADDR_2 = address.Line2Tx;
                InspirePolicyRecord.NJM_POL_ADDR_3 = address.Line3Tx;
                InspirePolicyRecord.NJM_POL_CTY = address?.Municipality.FirstOrDefault()?.MunicipalityNm;
                InspirePolicyRecord.NJM_POL_ST = address?.CountrySubdivision.CountrySubdivisionNm;
                InspirePolicyRecord.NJM_POL_ZIP = address.PostalCd;
            }
            InspirePolicyRecord.POL_HLD_NAME_MULTI_CHAR_COUNT = GetHolderCharCount();
            InspirePolicyRecord.AUTHOR_EXEC_IND = GetConfigValue(nameof(InspirePolicyRecord.AUTHOR_EXEC_IND));
            InspirePolicyRecord.PKG_NAME = GetPackageName();
            InspirePolicyRecord.NJM_ACCT_NUM = GetAccountNumber(); 
            InspirePolicyRecord.PRIMARY_NAMED_INS_ONLY_MAN = organization.OrganizationNm;
            InspirePolicyRecord.NJM_POLHOLD_PHONE_NO = GetNJMPhone(organization);
            InspirePolicyRecord.BUREAU_FILE_NUM = GetBureauFile(organization);

            InspirePolicyRecord.INS_CO_NM = GetInsuranceCompanyName(SourcePolicy?.UnderwritingCompany?.OrganizationNameCd);
            InspirePolicyRecord.ADDRESSEE_NAME = WCUUserDataEntity.AddresseeName;
            InspirePolicyRecord.ADDRESSEE_CO_NM = WCUUserDataEntity.AddresseeAddress.DisplayName;
            InspirePolicyRecord.ADDRESSEE_ADDR_1 = WCUUserDataEntity.AddresseeAddress.Line1Tx;
            InspirePolicyRecord.ADDRESSEE_ADDR_2 = WCUUserDataEntity.AddresseeAddress.Line2Tx;
            InspirePolicyRecord.ADDRESSEE_ADDR_3 = WCUUserDataEntity.AddresseeAddress.Line3Tx;
            InspirePolicyRecord.ADDRESSEE_CTY = WCUUserDataEntity.AddresseeAddress.MunicipalityNm;
            InspirePolicyRecord.ADDRESSEE_ST = WCUUserDataEntity.AddresseeAddress.CountrySubdivisionNm;
            InspirePolicyRecord.ADDRESSEE_ZIP = WCUUserDataEntity.AddresseeAddress.PostalCd; 
        }
        private string GetPolicyWithPad()
        {
            var polNum = GetPolicyNumber();
            var polNumPad = string.Format("000000000{0}", polNum);
            return polNumPad.Substring(polNum.Length-2, 9);
        }
        private string GetHolderCharCount()
        {
            string name = string.Empty;
            var nameInsured = SourcePolicy.InvolvedParties.Where(p => p.PartyRoles.Contains(ApplicationConstants.NamedInsured)
                                          && p.PartyTypeCd == ApplicationConstants.Organization).ToList();
            nameInsured.ForEach(p =>  {
                name +=  p.Organization.OrganizationNm.Trim();
            });
 
            nameInsured = SourcePolicy.InvolvedParties.Where(p => p.PartyRoles.Contains(ApplicationConstants.AdditionalInsured)
                                          && p.PartyTypeCd == ApplicationConstants.Organization).ToList();
            nameInsured.ForEach(p => {
                name += p.Organization.OrganizationNm.Trim();
            });
    
            var nameIns = SourcePolicy.InvolvedParties.Where
                                    (p => p.PartyTypeCd == ApplicationConstants.Organization
                                     && (p.PartyRoles.Contains(ApplicationConstants.NamedInsured)
                                         || p.PartyRoles.Contains(ApplicationConstants.AdditionalInsured)));
          
            int padding = nameIns.Count() > 1 ? ((nameIns.Count() - 1) * 6) : (int) decimal.Zero;
            return Convert.ToString(name.Length + padding);
        }
        private string GetPolHolderMultiName(Party? party)
        {
            string orgName = party?.Organization?.OrganizationNm;
            string dbaTraderNameTrue = String.Empty, dbaTraderNameFalse = String.Empty;

            var trades = SourcePolicy.PolicyLines.SelectMany(p => p.Trades.Where
              (t => t.RelatedPartyNm == orgName && t.PrimaryTradeNameIn == true)).OrderBy(o => o.TradeNm).ToList();

            trades.ForEach(trade =>  {
                dbaTraderNameTrue += string.Format("{0} {1} {2}", trade.TradeNm, orgName,"true");
            });

            trades = SourcePolicy.PolicyLines.SelectMany(p => p.Trades.Where
              (t => t.RelatedPartyNm == orgName && t.PrimaryTradeNameIn != true)).OrderBy(o => o.TradeNm).ToList();

            trades.ForEach(trade => {
                dbaTraderNameFalse += string.Format("{0} {1} {2}", trade.TradeNm, orgName, "false");
            });

            return string.Format("{0} {1} {2}", orgName, dbaTraderNameTrue, dbaTraderNameFalse).Trim();
        }
        private void AddRecordDelimTags()
        {
            var recordDelim = WCUInspireEntity.CustomerData.RECORD_DELIM;
            int index = 0;
            // Add Outputs DBANames Secondary Table 
            var parties = SourcePolicy.InvolvedParties.Where(p => p.PartyTypeCd == ApplicationConstants.Organization
                           && (p.PartyRoles.Contains(ApplicationConstants.AdditionalInsured) || p.PartyRoles.Contains(ApplicationConstants.NamedInsured)));

            recordDelim.NJM_POL_HLD = new CUSTOMER_DATARECORD_DELIMNJM_POL_HLD[parties.Count()];
            foreach (var lParty in parties)
            {
                recordDelim.NJM_POL_HLD[index] = new CUSTOMER_DATARECORD_DELIMNJM_POL_HLD();
                recordDelim.NJM_POL_HLD[index].POL_HLD_NAME_MULTI = GetPolHolderMultiName(lParty);
                recordDelim.NJM_POL_HLD[index++].POL_FK = GetConfigValue("POL_FK");
            }

            // Add ARRAY DATA FOR STATE AND BUREAU FILE NO
            index = 0;
            var party = SourcePolicy.InvolvedParties.Where(p => p.PartyTypeCd == ApplicationConstants.Organization
                                                            && p.PartyRoles.Contains(ApplicationConstants.NamedInsured));
            var bureaus = party.SelectMany(x=>x.Organization.OfficialIdentifications.Where(i => i.IdentificationTypeCd == ApplicationConstants.BureauID));
            recordDelim.ST_OF_OWNERSHIP_REC = new CUSTOMER_DATARECORD_DELIMST_OF_OWNERSHIP_REC[bureaus.Count()];
            foreach (var bureau in bureaus)
            {
                recordDelim.ST_OF_OWNERSHIP_REC[index] = new CUSTOMER_DATARECORD_DELIMST_OF_OWNERSHIP_REC();
                recordDelim.ST_OF_OWNERSHIP_REC[index].ST_OF_OWNERSHIP_INFO = bureau.IssuingCountrySubdivisionCd;
                recordDelim.ST_OF_OWNERSHIP_REC[index++].RATING_BUREAU_FILE_NUM = bureau.IdentificationCd;
            }

            // Add Letter Info
            recordDelim.LTR_NAME_REC = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();
            recordDelim.LTR_NAME_REC.LTR_NAME_BATCH = DocumentData.documentEntity.DocumentName;
            recordDelim.LTR_NAME_REC.POL_FK = GetConfigValue("POL_FK");

        }
        private AdhocCorrespondenceEditor.Shared.WCU.Address GetAddress(Organization organization)
        {
            foreach (var currentObj in organization.Addresses)
            {
                if (currentObj.Address != null)
                    return currentObj.Address;
            }
            return null;
        }
      
        private void AddPolicyDatesAndAmounts()
        {
            InspirePolicyRecord.POL_EFF_YR = ConvertDateFormat(SourcePolicy.StartDt, "yy");
            InspirePolicyRecord.POL_EXP_YR = ConvertDateFormat(SourcePolicy.EndDt, "yy");
            InspirePolicyRecord.AUDIT_PERIOD_BEGIN_DT = ConvertDateFormat(SourcePolicy.StartDt, WCU_Date_Format);
            InspirePolicyRecord.AUDIT_PERIOD_END_DT = ConvertDateFormat(SourcePolicy.EndDt, WCU_Date_Format);
            InspirePolicyRecord.POL_EFF_DT = ConvertDateFormat(SourcePolicy.StartDt, WCU_Date_Format);
            InspirePolicyRecord.POL_EXP_DT = ConvertDateFormat(SourcePolicy.EndDt, WCU_Date_Format);
            if (SourcePolicy.CancellationDt > DateTime.MinValue)
                InspirePolicyRecord.CNC_DT  = ConvertDateFormat(SourcePolicy.CancellationDt, "MMMM d, yyyy");
        }
        private string GetPolicyNumber()
        {
            var pol = WCUSourceSystemEntity.PolicyData.Policy.PolicyNumber;
            if (pol != ApplicationConstants.Unassigned)
            {
                return string.Format("{0}-{1}",pol.Substring(0,pol.Length-1), pol.Last());
            }
            return string.Empty;
        }
        private string GetPolicyHolder()
        {
            var nameInsured = SourcePolicy.InvolvedParties.Where(p => p.PartyRoles.Contains(ApplicationConstants.NamedInsured));
            if (nameInsured.Any())
            {
                var role = nameInsured.Where(p => p.PartyTypeCd == ApplicationConstants.Person);
                if (role.Any()) //person
                {
                    return String.Format("{0} {1}", nameInsured.FirstOrDefault()?.Person?.PersonName?.FirstGivenNm,
                         nameInsured.FirstOrDefault()?.Person?.PersonName?.FamilyNm);
                }
                role = nameInsured.Where(p => p.PartyTypeCd == ApplicationConstants.Organization);
                if (role.Any()) //Organization
                {
                    return nameInsured.FirstOrDefault()?.Organization?.OrganizationNm;
                }
            }
            return string.Empty;
        }
        private string GetAccountNumber()
        {
            return  WCUSourceSystemEntity.PolicyData.Policy.Account.AccountNo;
        }
        private string GetNJMPhone(Organization organization)
        {
            PartyPhoneNumber partyPhoneNumber = null;
            foreach (var obj in organization.Telephones)
            {
                if (obj != null)
                {
                    partyPhoneNumber = obj;
                    break;
                }
            }
            if (partyPhoneNumber?.PhoneNumber != null)
            {
                var areaCode = partyPhoneNumber.PhoneNumber.AreaCd;
                var exchangeCode = partyPhoneNumber.PhoneNumber.ExchangeId;
                var lineCode = partyPhoneNumber.PhoneNumber.SubscriberLineId;

                if (areaCode != null && exchangeCode != null && lineCode != null)
                    return String.Format("{0}-{1}-{2}", areaCode, exchangeCode, lineCode);
            }
            return null;
        }
        private string GetBureauFile(Organization organization)
        {
            var bureau = organization.OfficialIdentifications.Where( o=> o.IdentificationTypeCd == ApplicationConstants.BureauID).FirstOrDefault();
            if (bureau != null) return bureau.IdentificationCd;
            return String.Empty;
        }
        private string GetPackageName()
        {
            var document = DocumentData.documentEntity.DocumentName;
            if (document == "Need Completed PP1B" || document == "Bkr Mid Term Change-Add") 
                return "WCU PP1B Package";
            return null;
        }
        protected override void ProcessUserInputData()
        {
           AddPrinter();
           CopyCopiesToSection();
        }
        protected void AddPrinter()
        {
            var printer = WCUUserDataEntity.PrinterDetails;
            InspirePolicyRecord.ARCHIVE_IND = GetConfigValue(nameof(InspirePolicyRecord.ARCHIVE_IND));
            InspirePolicyRecord.PRINT_IND = GetConfigValue(nameof(InspirePolicyRecord.PRINT_IND)); 
            InspirePolicyRecord.PRINTER_NAME = printer.PrinterCode;
        }
        protected void CopyCopiesToSection()
        {
            int index = 0;
            var sourceCopiesTo = WCUUserDataEntity.CopiesTo;
            WCUInspireEntity.CustomerData.RECORD_DELIM.POLICY_CC_OPT = new CUSTOMER_DATARECORD_DELIMPOLICY_CC_OPT[sourceCopiesTo.Count];
 
            foreach (var copyTo in sourceCopiesTo)
            {
                CUSTOMER_DATARECORD_DELIMPOLICY_CC_OPT copyRecord = new CUSTOMER_DATARECORD_DELIMPOLICY_CC_OPT();
                copyRecord.BILL_FK = GetConfigValue(nameof(copyRecord.BILL_FK)); 
                copyRecord.CC_BCC_IND = GetConfigValue(nameof(copyRecord.CC_BCC_IND)); ;

                copyRecord.CC_ADDRESSEE_CO_NM = string.IsNullOrEmpty(copyTo.CopyToCompanyName.Trim()) ? null : copyTo.CopyToCompanyName.Trim();
                copyRecord.CC_ADDRESSEE_NAME = string.IsNullOrEmpty(copyTo.CopyToName.Trim()) ? null : copyTo.CopyToName.Trim();
                copyRecord.CC_ADDRESSEE_ADDR_1 = copyTo.CopyToAddressLine1;
                copyRecord.CC_ADDRESSEE_ADDR_2 = string.IsNullOrEmpty(copyTo.CopyToAddressLine2) ? string.Empty : copyTo.CopyToAddressLine2;
                copyRecord.CC_ADDRESSEE_ADDR_3 = string.IsNullOrEmpty(copyTo.CopyToAddressLine3) ? string.Empty : copyTo.CopyToAddressLine3;

                copyRecord.CC_ADDRESSEE_CTY = copyTo.CopyToCity;
                copyRecord.CC_ADDRESSEE_ST = copyTo.CopyToState;
                copyRecord.CC_ADDRESSEE_ZIP = copyTo.CopyToZIP;
                WCUInspireEntity.CustomerData.RECORD_DELIM.POLICY_CC_OPT[index++] = copyRecord;
            }
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
                serializer.Serialize(writer, WCUInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
            return null;
        }

        protected override void ProcessRules()
        {
            
        }
    }
}
