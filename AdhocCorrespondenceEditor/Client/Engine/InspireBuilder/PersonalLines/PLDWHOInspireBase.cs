using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL.DWHO;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.PL;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public abstract class PLDWHOInspireBase : PLInspireBase
    {
        protected DWHOInspireEntity DWHOInspireEntity { get; set; }
        protected CUSTOMER_DATARECORD_DELIM InspireCustomerRec { get; set; }
        protected CUSTOMER_DATARECORD_DELIMDWELLING_REC InspireDWHORec { get; set; }
        protected abstract XmlAttributeOverrides GetXMLOverrides();
        protected override void CreateInspireRequest()
        {
            PLUserDataEntity = (PLHoUmbDwUserEntity)UserInputData;
            PLSourceSystemEntity = (PLSourceSystemEntity)SourceSystemData;
            DWHOInspireEntity = new DWHOInspireEntity();
            InspireCustomerRec = DWHOInspireEntity.CustomerData.RECORD_DELIM;
            InspireDWHORec = DWHOInspireEntity.CustomerData.RECORD_DELIM.DWHO_REC;
            base.CreateInspireRequest();
        }
        protected override void ProcessPolicyAndAccountRecord()
        {
            AddPolicyConfigValues(InspireDWHORec);
            AddPolicyGeneralDetails(InspireDWHORec);
            AddPolicyGeneralOtherDetails(InspireDWHORec);
            AddPolicyAdditionalDetails();
            AddPolicyDatesAndAmounts();
        }
        protected override void CreateCustomTags()
        {
            InspireCustomerRec.LTR_NAME_REC = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();
            CreateCustomTags(InspireCustomerRec);
        }
        protected override void ProcessRules()
        {
            InitializeRules(InspireDWHORec.QUOTE_NUM, SourcePolicyPeriod.StartDt, SourcePolicy?.PolicyNumber);//Create RuleModel by passing your required values
            ExecuteRules();
            TransferRuleResults(InspireDWHORec); //Transfer the rule based values back to the main inspire object
        }
        protected override string SeriliazeInspireRequest()
        {
            var overrides = GetXMLOverrides();
            var emptyNamespaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var serializer = new XmlSerializer(typeof(CUSTOMER_DATA), overrides);

            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;

            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, DWHOInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
        }
        protected void AddPolicyDatesAndAmounts()
        {
            var dwellingLine = SourcePolicyPeriod.PolicyLines.Where(p => p.HomeownersLine != null).FirstOrDefault()?.HomeownersLine;
            var totalPremium = dwellingLine.SummaryAmounts.Where(s => s.AmountTypeCd == "Total Policy Premium").FirstOrDefault();
            var totalBasePremium = dwellingLine.SummaryAmounts.Where(s => s.AmountTypeCd == "Total Base Premium").FirstOrDefault();
            var totalSubPremium = dwellingLine.SummaryAmounts.Where(s => s.AmountTypeCd == "Subtotal Policy Premium").FirstOrDefault();
            var njPliga = dwellingLine.NonCoverageCharges.Where(s => s.ChargeReasonCd == "NJ PLIGA Charge").FirstOrDefault();

            InspireDWHORec.POL_EFF_DT = ConvertDateFormat(SourcePolicyPeriod.StartDt, LOB_Date_Format);
            InspireDWHORec.POL_EXP_DT = ConvertDateFormat(SourcePolicyPeriod.EndDt, LOB_Date_Format);
            InspireDWHORec.TOT_PREM = totalPremium?.SummaryAm;
            InspireDWHORec.COVS_TOT_PREM = totalBasePremium?.SummaryAm;
            InspireDWHORec.SUB_POL_PREM = totalSubPremium?.SummaryAm;
            InspireDWHORec.PLIGA = njPliga?.ChargeAm;
            InspireDWHORec.PRIOR_POL_PD_YR = SourcePolicyPeriod.DividendYr.ToString();
            InspireDWHORec.REG_DIV = SourcePolicyPeriod.TotalDividendAm;
            //Don't see this path in ESB object
            //InspireDwellingRec.TOT_ADDL_RET_PREM = dwellingLine?.TOT_ADDL_RET_PREM;
            //InspireDwellingRec.ADJ_TOT_DIV = dwellingLine?.ADJ_TOT_DIV;

            InspireDWHORec.COV_A_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_A_Dwelling);
            InspireDWHORec.COV_B_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_B_Dwelling);
            InspireDWHORec.COV_C_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_C_Dwelling);
            InspireDWHORec.COV_F_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_F_Dwelling);
            InspireDWHORec.SECT_I_DED     = GetCoverageAmount(ApplicationConstants.Coverage_I_Dwelling);

            InspireDWHORec.FORM_TYPE = dwellingLine?.FormTypeCd;
            var partList = SourcePolicyPeriod.ListedParties.Where(x => x.Party.PartyRoles.Contains(ApplicationConstants.PrimaryNamedInsured)).FirstOrDefault();
            InspireDWHORec.PRIM_INSD_EMAIL = partList.Party?.Person?.EmailAddresses?.Where(e => e.EmailAddress.UnparsedEmailAddress != null)?.FirstOrDefault()?.EmailAddress?.UnparsedEmailAddress;
        }
        protected void AddPolicyAdditionalDetails()
        {
            var homeOwnerLine = SourcePolicyPeriod?.PolicyLines.Where(p => p.HomeownersLine != null).FirstOrDefault();
            InspireDWHORec.ESCROW_IND = homeOwnerLine?.HomeownersLine.ListedDwellings.SelectMany(l => l.AssociatedParties.Where(a => a.FinancialInstitution != null)).FirstOrDefault()?.FinancialInstitution?.EscrowIn;
            InspireDWHORec.OTH_INSD_LOC_IND = homeOwnerLine?.HomeownersLine?.OtherInsuredLocationIn;
            InspireDWHORec.POL_DISCOUNTS_IND = homeOwnerLine?.HomeownersLine?.PolicyDiscountsIn;
            InspireDWHORec.WORK_COMP_IND = homeOwnerLine?.HomeownersLine?.WorkersCompensationIn;
            InspireDWHORec.MORTGAGEE_IND = homeOwnerLine?.HomeownersLine?.ListedDwellings?.Where(d => d.MortgageeIn != null).FirstOrDefault()?.MortgageeIn;
            InspireDWHORec.EXT_COV = homeOwnerLine?.HomeownersLine?.ExtendedCoverageIn;
            InspireDWHORec.VDLSM_MLSC_MSCHF = homeOwnerLine?.HomeownersLine?.VandalismMLSCMischiefCoverageIn;
            InspireDWHORec.RCT_COV_IND = homeOwnerLine?.HomeownersLine?.ListedDwellings?.Where(d => d.RCTCoverageIn != null).FirstOrDefault()?.RCTCoverageIn;
            InspireDWHORec.SECONDARY_POL_IND = SourcePolicyPeriod?.SecondaryPolicyIn;
            InspireDWHORec.POL_MAILING_ADD_IND = SourcePolicyPeriod?.PolicyMailingAddressIn;
            InspireDWHORec.POL_ST = SourcePolicy?.BaseStateCd;

            var address = GetHomeAddress(ApplicationConstants.Address_Risk);
            if (address != null)
            {
                InspireDWHORec.POL_LOC_ADDR_1 = address.Line1Tx;
                InspireDWHORec.POL_LOC_ADDR_2 = address.Line2Tx;
                InspireDWHORec.POL_LOC_ADDR_3 = address.Line3Tx;
                InspireDWHORec.POL_LOC_CTY = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.CITY, address);
                InspireDWHORec.POL_LOC_ST = address.CountrySubdivision.CountrySubdivisionNm;
                InspireDWHORec.POL_LOC_ZIP = address.PostalCd;
                InspireDWHORec.POL_LOC_TOWNSHIP = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.TOWNSHIP, address);
                InspireDWHORec.POL_LOC_COUNTY = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.COUNTY, address);
            }
        }
        protected override void ProcessUserInputData()
        {
            AddPrinter(PLUserDataEntity,InspireDWHORec);
            UserAddPolicyDetails(PLUserDataEntity,InspireDWHORec);
            if (PLUserDataEntity.CertificateHolderDetails != null)
            {
                var certificate = PLUserDataEntity.CertificateHolderDetails;
                var insCertificate = new CUSTOMER_DATARECORD_DELIMLTR_CERT_INS();
                insCertificate.CERT_HLD_NAME = certificate.DisplayName;
                insCertificate.CERT_HOLD_ADDR1 = certificate.Line1Tx;
                insCertificate.CERT_HOLD_ADDR2 = certificate.Line2Tx;
                insCertificate.CERT_HOLD_ADDR3 = certificate.Line3Tx;
                insCertificate.CERT_HOLD_CTY = certificate.MunicipalityNm;
                insCertificate.CERT_HOLD_ST = certificate.CountrySubdivisionNm;
                insCertificate.CERT_HOLD_ZIP = certificate.PostalCd;
                insCertificate.CERT_LOC = PLUserDataEntity.CertificateLocationTx;
                insCertificate.POL_FK = GetConfigValue(nameof(InspireCustomerRec.LTR_NAME_REC.POL_FK));
                InspireCustomerRec.CERT_INS = insCertificate;
            }
        }
        private AdhocCorrespondenceEditor.Shared.PL.Address GetHomeAddress(string addressCd)
        {
            var namedInsured = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.HomeownersLine.ListedDwellings.Where(l => l.DwellingTypeCd == "Risk"));
            namedInsured = namedInsured.Where(l => l.DwellingAddress.Address != null);
            return namedInsured.FirstOrDefault()?.DwellingAddress?.Address;
        }
        protected string GetCoverageAmount(string coverageType)
        {
            var dwellingLine = SourcePolicyPeriod.PolicyLines.Where(p => p.HomeownersLine != null).FirstOrDefault()?.HomeownersLine;
            var lmtOfLiability = dwellingLine.CoveragesElectionParameters.Where(c => c.CoverageTypeCd == coverageType).FirstOrDefault();
            return lmtOfLiability?.CoverageParameterUnformattedValueTx;
        }
    }
}
