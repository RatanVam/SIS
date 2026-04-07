using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL.PA;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.PCPA;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCPAInspireBuilder : PLInspireBase
    {
        protected PLPAUserEntity PLUserDataEntity { get; set; }
        protected PLAutoSourceSystemEntity PLSourceSystemEntity { get; set; }
        protected PAInspireEntity PAInspireEntity { get; set; }
        protected CUSTOMER_DATARECORD_DELIM InspireCustomerRec { get; set; }
        protected CUSTOMER_DATARECORD_DELIMPOLICY_REC InspirePARec { get; set; }
        protected PolicyPeriod SourcePolicyPeriod { get; set; }
        protected Policy SourcePolicy { get; set; }
        private string Pattern_Slash = "/";
        private string PCPA_Date_Format = "MMM dd, yyyy";

        protected override void CreateInspireRequest()
        {
            PLUserDataEntity = (PLPAUserEntity)UserInputData;
            PLSourceSystemEntity = (PLAutoSourceSystemEntity)SourceSystemData;
            PAInspireEntity = new PAInspireEntity();
            InspireCustomerRec = PAInspireEntity.CustomerData.RECORD_DELIM;
            InspirePARec = PAInspireEntity.CustomerData.RECORD_DELIM.POLICY_REC;

            SourcePolicyPeriod = PLSourceSystemEntity?.PolicyData?.Policy?.PolicyPeriod;
            SourcePolicy = PLSourceSystemEntity?.PolicyData?.Policy;
        }
        protected override void ProcessPolicyAndAccountRecord()
        {
            AddPolicyConfigValues(InspirePARec);
            AddPolicyGeneralDetails(InspirePARec);
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
            InitializeRules(InspirePARec.QUOTE_NUM, SourcePolicyPeriod.StartDt, SourcePolicy?.PolicyNumber == ApplicationConstants.Unassigned ? null : SourcePolicy?.PolicyNumber);//Create RuleModel by passing your required values
            ExecuteRules();
            TransferRuleResults(InspirePARec); //Transfer the rule based values back to the main inspire object
        }
        protected override void ProcessUserInputData()
        {
            AddUserInputTags();
            AddPrinter(PLUserDataEntity, InspirePARec);
            UserAddPolicyDetails(PLUserDataEntity, InspirePARec);
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
                serializer.Serialize(writer, PAInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
            return null;
        }
        protected void AddPolicyDatesAndAmounts()
        {
            var policyDate = SourcePolicyPeriod?.PolicyLines.Where(p => p.PersonalAutoLine.PolicyInceptionDt != null).FirstOrDefault();

            InspirePARec.POL_EFF_DT = ConvertDateFormat(SourcePolicyPeriod?.StartDt, LOB_Date_Format);
            InspirePARec.POL_EXP_DT = ConvertDateFormat(SourcePolicyPeriod?.EndDt, LOB_Date_Format);
            InspirePARec.Pol_Inception_Date = ConvertDateFormat(policyDate?.PersonalAutoLine?.PolicyInceptionDt, "yyyy-MM-ddTHH:mm:ssK");            
            InspirePARec.POL_EFF_DT_ID_CARD = ConvertDateFormat(SourcePolicyPeriod?.StartDt, PCPA_Date_Format).ToUpper();
            InspirePARec.POL_EXP_DT_ID_CARD = ConvertDateFormat(SourcePolicyPeriod?.EndDt, PCPA_Date_Format).ToUpper();
            InspirePARec.PC_TRIG_DT = GetTriggerDate(SourcePolicyPeriod?.StartDt);
            InspirePARec.CSF_EFF = PLUserDataEntity.CsfEffective;
            InspirePARec.POL_EVENT_CHANGE_EFF_DT = PLUserDataEntity.CsfEffective==ApplicationConstants.PA_CSF_Effective_MidTerm_Change ? ConvertDateFormat(SourcePolicyPeriod?.NotableEvents.FirstOrDefault()?.EventChangeEffectiveDt, "yyyy-MM-ddTHH:mm:ssK") : null;
            InspirePARec.CSF_BLK_PREFLL = string.IsNullOrEmpty(PLUserDataEntity.CsfBlankPrefilled) ? null : PLUserDataEntity.CsfBlankPrefilled;
            InspirePARec.SEPARATE_DIVORCE_IND = string.IsNullOrEmpty(PLUserDataEntity.SpouseDivorceInfo) ? null : PLUserDataEntity.SpouseDivorceInfo;
            InspirePARec.CLAIMS_POL_IND = string.IsNullOrEmpty(PLUserDataEntity.ClaimPolicyInd) ? null : PLUserDataEntity.ClaimPolicyInd;
            InspirePARec.NUM_CLM_RPT = string.IsNullOrEmpty(PLUserDataEntity.noofClaimReported) ? null : PLUserDataEntity.noofClaimReported;
            InspirePARec.CNC_EFF_DT = ConvertDateFormat(PLUserDataEntity?.VehicleCoverageCancelDate, LOB_Date_Format);
            InspirePARec.VEH_OPERTNG_DT = ConvertDateFormat(PLUserDataEntity?.VehicleOperatingDate, LOB_Date_Format);
            InspirePARec.EVENT_DT = ConvertDateFormat(PLUserDataEntity?.NoticeNonrenewalEvent_DT, LOB_Date_Format);
            InspirePARec.CLAIM_DT = ConvertDateFormat(PLUserDataEntity?.NoticeNonrenewalCLAIM_DT, LOB_Date_Format);
            InspirePARec.COV_EFF_DT = ConvertDateFormat(PLUserDataEntity?.CoverageEffectiveDate, LOB_Date_Format);

            InspirePARec.COLL_DED = GetCoverage(ApplicationConstants.Collision); ;
            InspirePARec.OTH_THAN_COLL_DED = GetCoverage(ApplicationConstants.Comprehensive);
            InspirePARec.LIAB_LMT = GetAmounts(ApplicationConstants.Liability, Pattern_Slash, false);
            InspirePARec.LIAB_LMT_Split = GetAmounts(ApplicationConstants.Liability, Pattern_Slash, true);
            InspirePARec.UNINSD_MTRST_LMT = GetAmounts(ApplicationConstants.UnInsuredMotorist, Pattern_Slash, false);
            InspirePARec.UNINSD_MTRST_LMT_Split = GetAmounts(ApplicationConstants.UnInsuredMotorist, Pattern_Slash, true);
            InspirePARec.PIP_DED = GetUnformattedValue(ApplicationConstants.PIP, ApplicationConstants.PIP_Ded);
            InspirePARec.TOT_BSC_PREM = GetSummaryAmount(ApplicationConstants.TotalBasicPremium);
            InspirePARec.TOT_BSC_PREM_FULL_TORT = GetSummaryAmount(ApplicationConstants.TotalBasicPremiumFullTort);
            InspirePARec.PIP_PRIMARY_PROV = GetPrimaryProv();
            InspirePARec.PIP_OPTION = GetUnformattedValue(ApplicationConstants.PIP, ApplicationConstants.PIP_Non_Med_Exp);
            InspirePARec.PIP_HIGHER_LMT = GetUnformattedValue(ApplicationConstants.PIP, ApplicationConstants.PIP_Non_Med_Exp);
            InspirePARec.PIP_MED_LMT = GetUnformattedValue(ApplicationConstants.PIP, ApplicationConstants.PIP_Med_Exp);
            InspirePARec.SUPP_FMLY_MEMB_LIAB_COV_PREM = GetSummaryAmount(ApplicationConstants.PIP_Tot_Family);
            InspirePARec.TOT_ANNUAL_FULL_PIP_PREM = GetSummaryAmount(ApplicationConstants.PIP_Tot_Pre);
            InspirePARec.WAIVED_PIP_PERCENT = GetSummaryAmount(ApplicationConstants.PIP_Waiver_Per);
            InspirePARec.TOT_ANNUAL_WAIVED_PIP_PREM = GetSummaryAmount(ApplicationConstants.PIP_Waived_Pre);
            InspirePARec.THRESH_OPTION = GetThreshOption();
            var healthPol = GetHealthPol();
            InspirePARec.HLTH_INS_PROV = healthPol?.PolicyProvider;
            InspirePARec.POL_GRP_CERT_NO = healthPol?.PolicyId;
            InspirePARec.TORT_IND = GetTortInd();

            //Motorist
            var umSplit = GetUnformattedValue(ApplicationConstants.PA_UnInsuredMotorist, ApplicationConstants.PA_UnInsuredMotoristLimit);
            if (!string.IsNullOrEmpty(umSplit))
            {
                if (umSplit.Contains(Pattern_Slash))
                    InspirePARec.UM_LMT_Split = umSplit;
                else if (Regex.IsMatch(umSplit, @"\d"))
                    InspirePARec.UM_LMT = umSplit;
            }
            if (string.IsNullOrEmpty(InspirePARec.UM_LMT))
            {
                InspirePARec.UM_LMT = GetFormattedValue(ApplicationConstants.PA_UnInsuredMotorist, ApplicationConstants.PA_UnInsuredMotoristLimit);
            }

            string uimSplit = GetUnformattedValue(ApplicationConstants.PA_UnderInsuredMotorist, ApplicationConstants.PA_UnderInsuredMotoristLimit);
            if (!string.IsNullOrEmpty(uimSplit))
            {
                if (uimSplit.Contains(Pattern_Slash))
                    InspirePARec.UIM_LMT_Split = uimSplit;
                else if (Regex.IsMatch(uimSplit, @"\d"))
                    InspirePARec.UIM_LMT = uimSplit;
            }
            if (string.IsNullOrEmpty(InspirePARec.UIM_LMT))
            {
                InspirePARec.UIM_LMT = GetFormattedValue(ApplicationConstants.PA_UnderInsuredMotorist, ApplicationConstants.PA_UnderInsuredMotoristLimit);
            }

            InspirePARec.UM_LESS_THAN_LIAB_IND = ApplicationConstants.NO;
            var coverageTrue = SourcePolicyPeriod?.PolicyLines.Where(p => p.PersonalAutoLine.UMLessThanLiabilityIn == true);
            if (coverageTrue.Any())
            {
                InspirePARec.UM_LESS_THAN_LIAB_IND = ApplicationConstants.YES;
            }

            InspirePARec.UIM_LESS_THAN_LIAB_IND = ApplicationConstants.NO; ;
            coverageTrue = SourcePolicyPeriod?.PolicyLines.Where(p => p.PersonalAutoLine.UIMLessThanLiabilityIn == true);
            if (coverageTrue.Any())
            {
                InspirePARec.UIM_LESS_THAN_LIAB_IND = ApplicationConstants.YES;
            }
            var umeqLiablity = GetFormattedValue(ApplicationConstants.PA_UMEQLIABLimit);
            if (!string.IsNullOrEmpty(umeqLiablity) && umeqLiablity.Contains(Pattern_Slash))
                InspirePARec.UMEQLIAB_SPLIT = umeqLiablity;
            else
                InspirePARec.UM_EQ_LIAB_LIMIT = umeqLiablity;

            InspirePARec.UM_EQ_LIAB_PREMIUM = GetFormattedPremium(ApplicationConstants.PA_UMEQLIABLimit);

            var umLtLiablity = GetFormattedValue(ApplicationConstants.PA_UMLTLIABLimit);
            if (!string.IsNullOrEmpty(umLtLiablity) && umLtLiablity.Contains(Pattern_Slash))
                InspirePARec.UMLTLIAB_SPLIT = umLtLiablity;
            else
                InspirePARec.UM_LT_LIAB_LIMIT = umLtLiablity;

            InspirePARec.UM_LT_LIAB_PREMIUM = GetFormattedPremium(ApplicationConstants.PA_UMLTLIABLimit);

            var euiLimit = GetFormattedValue(ApplicationConstants.PA_EUIMLimit);
            if (!string.IsNullOrEmpty(euiLimit) && euiLimit.Contains(Pattern_Slash))
                InspirePARec.EUIM_SPLIT = euiLimit;
            else
                InspirePARec.EUIM_LIMIT = euiLimit;
            InspirePARec.EUIM_PREMIUM = GetFormattedPremium(ApplicationConstants.PA_EUIMLimit);
        }
        protected void AddPolicyAdditionalDetails()
        {
            InspirePARec.POL_NO = GetPolicyNumber();
            InspirePARec.POL_NO_PAD = GetPolicyPad();
            InspirePARec.INS_CO_NM = GetInsuranceCompanyName(SourcePolicyPeriod?.UnderwritingCompany?.OrganizationNameCd);
            InspirePARec.QUOTE_NUM = SourcePolicyPeriod?.QuoteNumber;
            InspirePARec.POL_ST = SourcePolicyPeriod?.BaseStateCd;
            InspirePARec.POL_STATUS = SourcePolicyPeriod?.StatusCd;
            InspirePARec.PRIMARY_INS_POL_HLD_NAME_NO_PREFIX = GetNameInsuredWithOutTitle(ApplicationConstants.PrimaryNamedInsured);
            InspirePARec.PRIMARY_INS_POL_HLD_NAME = GetNameInsured(ApplicationConstants.PrimaryNamedInsured);
            InspirePARec.SECONDARY_INS_POL_HLD_NAME = GetNameInsured(ApplicationConstants.SecondaryNamedInsured);
            InspirePARec.TERTIARY_INS_POL_HLD_NAME = GetTertiaryInsured(ApplicationConstants.TertiaryNamedInsured);
            InspirePARec.TERR_CODE = SourcePolicyPeriod?.PolicyLocation?.TerritoryCd;
            SetAddress();
        }
        protected override string GetNameInsured(string role, int position = 0)
        {
            string name = String.Empty;
            var namedInsured = SourcePolicyPeriod.ListedParties.Where(l => l.Party.PartyRoles.Contains(role));
            if (namedInsured?.Count() > position)
            {
                var insured = namedInsured.ElementAt(position).Party.Person;
                name = string.Format("{0} {1} {2} {3} {4}",
                    insured.PersonName.NameSalutationCd,
                    insured.PersonName.FirstGivenNm,
                    insured.SecondGivenNameInitial,
                    insured.PersonName.FamilyNm,
                    insured.PersonName.FamilyNameGenerationCd);
            }
            return name;
        }
        protected string GetNameInsuredWithOutTitle(string role, int position = 0)
        {
            string name = String.Empty;
            var namedInsured = SourcePolicyPeriod.ListedParties.Where(l => l.Party.PartyRoles.Contains(role));
            if (namedInsured?.Count() > position)
            {
                var insured = namedInsured.ElementAt(position).Party.Person;
                name = string.Format("{0} {1} {2} {3}",
                    insured.PersonName.FirstGivenNm,
                    insured.SecondGivenNameInitial,
                    insured.PersonName.FamilyNm,
                    insured.PersonName.FamilyNameGenerationCd);
            }
            return name;
        }

        private void SetAddress()
        {
            if (!string.IsNullOrEmpty(PLUserDataEntity.IDCardAddress?.Line1Tx))
            {
                var address = PLUserDataEntity.IDCardAddress;
                InspirePARec.INS_ADDR_1 = address?.Line1Tx;
                InspirePARec.INS_ADDR_2 = address?.Line2Tx;
                InspirePARec.INS_ADDR_3 = address?.Line3Tx;
                InspirePARec.INS_CTY = address?.MunicipalityNm;
                InspirePARec.INS_ST = address?.CountrySubdivisionNm;
                InspirePARec.INS_ZIP = address?.PostalCd;
            }
            else
            {
                var address = GetInsAddress();
                InspirePARec.INS_ADDR_1 = address?.Line1Tx;
                InspirePARec.INS_ADDR_2 = address?.Line2Tx;
                InspirePARec.INS_ADDR_3 = address?.Line3Tx;
                InspirePARec.INS_CTY = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.CITY, address);
                InspirePARec.INS_ST = address?.CountrySubdivision?.CountrySubdivisionNm;
                InspirePARec.INS_ZIP = address?.PostalCd;
            }
        }
        private void AddUserInputTags()
        {
            AddVehicleInfo();
            AddPolicyMRVRRef();
            AddClueReference();
            AddPolicyDriver();
            AddInvalidDriver();
            AddSuspendedDriver();
            AddLicSuspendedDriver();
            AddIndicators();
            AddServiceEvent();
            AddCancelReasonTag();
            AddMidtermCancel();
            AddUmUimStandard();
            AddUmUimConversion();
            AddAccidentViolation();
            AddIDCards();
            AddUMUIMForm2();
            AddSpouseName();
            AddClaimInfo();
            AddReinstateCancel();
            AddPolicyClaims();
            AddAdditionalPolicy();
            AddCSFDynamicRating();
        }
        private void AddAdditionalPolicy()
        {
            PLUserDataEntity?.PolicyNumberSelected?.ForEach(policy =>
            {
                var polNum = new CUSTOMER_DATARECORD_DELIMADDL_POL_NUM();
                polNum.ADDL_POLNUM = policy;
                polNum.POL_FK = GetConfigValue(nameof(polNum.POL_FK));
                InspireCustomerRec.ADDL_POL_NUM.Add(polNum);
            });
        }
        private void AddReinstateCancel()
        {
            PLUserDataEntity?.ReinstCancelDates?.ForEach(cancel =>
            {
                var c = new CUSTOMER_DATARECORD_REINSTATE_CANCEL();
                c.REINSTD_DT = ConvertDateFormat(cancel.ReinstateDate, LOB_Date_Format);
                c.CNCL_DT = ConvertDateFormat(cancel.CancelDate, LOB_Date_Format);
                c.POL_FK = GetConfigValue(nameof(c.POL_FK));
                InspireCustomerRec.REINSTATE_CNCL_DT.Add(c);
            });
        }
        private void AddClaimInfo()
        {
            PLUserDataEntity?.ClaimInformation?.ForEach(claim =>
              {
                  var c = new CUSTOMER_DATARECORD_ACCIDENT_INFO();
                  c.ACC_DT = ConvertDateFormat(claim.ClaimDate, LOB_Date_Format);
                  c.ACC_INFO_INS_LTR_IND = claim.InsLtrCheck.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                  c.ACC_INFO_POLICE_RPT_IND = claim.PoliceReportCheck.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                  c.ACC_INFO_NAME_IND = claim.DriverNmCheck.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                  c.POL_FK = GetConfigValue(nameof(c.POL_FK));
                  InspireCustomerRec.ACC_INFO.Add(c);
              });
        }
        private void AddPolicyClaims()
        {
            PLUserDataEntity?.ClaimOnPolicyDetails?.ForEach(claim =>
            {
                var c = new CUSTOMER_DATARECORD_DELIMCLAIMS_POL();
                c.CLAIM_DT = ConvertDateFormat(claim.NJMClaimDate, LOB_Date_Format);
                c.CLAIM_NUM = claim.NJMClaimNo;
                c.CLAIM_DESC = claim.NJMClaimDiscription;
                c.POL_FK = GetConfigValue(nameof(c.POL_FK));
                InspireCustomerRec.CLAIMS_POL.Add(c);
            });
            if (!string.IsNullOrEmpty(PLUserDataEntity?.ClaimNumber))
            {
                var c = new CUSTOMER_DATARECORD_DELIMCLAIMS_POL();
                c.CLAIM_NUM = PLUserDataEntity.ClaimNumber;
                c.POL_FK = GetConfigValue(nameof(c.POL_FK));
                InspireCustomerRec.CLAIMS_POL.Add(c);
            }
        }
        private void AddSpouseName()
        {
            //Spouse related
            if (!string.IsNullOrEmpty(PLUserDataEntity.SpouseParterName))
                InspirePARec.SPOUSE_PARTNER_NAME = PLUserDataEntity.SpouseParterName;
            else
                InspirePARec.SPOUSE_PARTNER_NAME = GetSpouseName();

        }
        private void AddVehicleInfo()
        {
            PLUserDataEntity.VehicleDiscriptions?.ForEach((v) =>
            {
                var vehicle = new CUSTOMER_DATARECORD_DELIMVEH_DESC();
                vehicle.VEH_YR = v.ModelYearNr.ToString();
                vehicle.VEH_MK = v.VehicleTradeNm;
                vehicle.VEH_MDL = v.ModelNm;
                vehicle.VEH_VIN = v.ManufacturerVehicleIdentificationNr;

                vehicle.POL_FK = GetConfigValue(nameof(vehicle.POL_FK));
                if (v.VinInd.HasValue)
                    vehicle.VEH_VIN_IND = v.VinInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (v.FinanceCompanyInd.HasValue)
                    vehicle.VEH_FIN_IND = v.FinanceCompanyInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (v.LeaseCompanyInd.HasValue)
                    vehicle.VEH_LEASE_IND = v.LeaseCompanyInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (v.VehicleCoverageInd.HasValue)
                    vehicle.VERIFY_COV_IND = v.VehicleCoverageInd.Value == true ? ApplicationConstants.YES : ApplicationConstants.NO;
                vehicle.COLL_DED = v.CollisionDeductible;
                vehicle.OTH_THAN_COLL_DED = v.OtherCollisionDeductible;
                vehicle.COLL_PREM = v.CollisionPrem;
                vehicle.LIAB_PREM = v.LiabilityPrem;
                vehicle.OTH_THAN_COLL_PREM = v.OtherCollisionPrem;
                vehicle.PIP_MED_LMT_PREM = v.PipMedLimitPrem;
                vehicle.VEH_BODY_TYPE = v.VehicleBodyType;
                vehicle.FINANCE_CO_NAME = v.FinanceCpyName;
                vehicle.FINANCE_CO_ADDR_1 = v.FinanceCpyAddr1;
                vehicle.FINANCE_CO_ADDR_2 = v.FinanceCpyAddr2;
                vehicle.FINANCE_CO_ADDR_3 = v.FinanceCpyAddr3;
                vehicle.FINANCE_CO_CTY = v.FinanceCpyCity;
                vehicle.FINANCE_CO_ST = v.FinanceCpyState;
                vehicle.FINANCE_CO_ZIP = v.FinanceCpyZip;
                vehicle.LEASE_CO_NAME = v.LeaseCoName;
                vehicle.LEASE_CO_ADDR_1 = v.LeaseCpyAddr1;
                vehicle.LEASE_CO_ADDR_2 = v.LeaseCpyAddr2;
                vehicle.LEASE_CO_ADDR_3 = v.LeaseCpyAddr3;
                vehicle.LEASE_CO_CTY = v.LeaseCpyCity;
                vehicle.LEASE_CO_ST = v.LeaseCpyState;
                vehicle.LEASE_CO_ZIP = v.LeaseCpyZip;
                SetPropValueByReflection(v.ControlType, v.ControlType, vehicle);
                InspireCustomerRec.VEH_DESC.Add(vehicle);
            });

            if (!string.IsNullOrEmpty(PLUserDataEntity.CsfEffective) || !string.IsNullOrEmpty(PLUserDataEntity.CsfBlankPrefilled))
            {
                var count = 1;
                foreach (var veh in SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.VehicleCoverageDetails))
                {
                    var vehicle = new CUSTOMER_DATARECORD_DELIMVEH_DESC();
                    vehicle.VEH_YR = veh.Vehicle.ModelYearNr.ToString();
                    vehicle.VEH_MK = veh.Vehicle.VehicleTradeNm;
                    vehicle.VEH_NO = count++.ToString();
                    vehicle.POL_FK = GetConfigValue(nameof(vehicle.POL_FK));
                    vehicle.COLL_DED = veh.Coverages.Where(c => c.CoverageTypeCd == ApplicationConstants.Collision).FirstOrDefault()?.CoverageParameterUnformattedValueTx;
                    vehicle.OTH_THAN_COLL_DED = veh.Coverages.Where(c => c.CoverageTypeCd == ApplicationConstants.Comprehensive).FirstOrDefault()?.CoverageParameterUnformattedValueTx;
                    InspireCustomerRec.VEH_DESC.Add(vehicle);
                }
            }
        }
        private void AddPolicyDriver()
        {
            PLUserDataEntity?.PolicyDriverDetails?.ForEach(c =>
            {
                var driver = new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                driver.DRVR_NAME = c.DriverName;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                if (c.DriverDOBYear.HasValue)
                    driver.DRVR_YR_BRTH = c.DriverDOBYear.Value.ToString();
                if (c.ProofCovInd.HasValue)
                    driver.PROOF_COV_IND = c.ProofCovInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.DriverNameInd.HasValue)
                    driver.OTH_RES_DRVR_NAME_IND = c.DriverNameInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.DateOfBirth.HasValue)
                    driver.OTH_RES_DOB_IND = c.DateOfBirth.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.MaritalStatus.HasValue)
                    driver.OTH_RES_MARITAL_IND = c.MaritalStatus.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.RelationToApplicant.HasValue)
                    driver.OTH_RES_REL_IND = c.RelationToApplicant.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.InsuranceInfo.HasValue)
                    driver.OTH_RES_INS_IND = c.InsuranceInfo.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.LicenseInfo.HasValue)
                    driver.OTH_RES_LIC_IND = c.LicenseInfo.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.ValidLicenceInfo.HasValue)
                    driver.OTH_RES_VLD_LIC_IND = c.ValidLicenceInfo.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.PriorLicenseInfo.HasValue)
                    driver.OTH_RES_PRIOR_LIC_IND = c.PriorLicenseInfo.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.ProofOfResidency.HasValue)
                    driver.OTH_RES_NOT_LEGAL_IND = c.ProofOfResidency.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.OtherHouseholdInd.HasValue)
                    driver.OTH_RES_IND = c.OtherHouseholdInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.NameInd.HasValue)
                    driver.DRVR_NAME_IND = c.NameInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.GenderInd.HasValue)
                    driver.DRVR_GNDR_IND = c.GenderInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.DateOfBirthInd.HasValue)
                    driver.DRVR_DOB_IND = c.DateOfBirthInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.LicenseNumberInd.HasValue)
                    driver.DRVR_LIC_IND = c.LicenseNumberInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.LicenseStateInd.HasValue)
                    driver.DRVR_LIC_ST_IND = c.LicenseStateInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (c.DateFirstLicensedInd.HasValue)
                    driver.DRVR_DT_LIC_IND = c.DateFirstLicensedInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;

                MatureDriverCourse(driver);

                InspireCustomerRec.POL_DRVR_DESC.Add(driver);
            });
            if (!string.IsNullOrEmpty(PLUserDataEntity?.SelectedDriverName))
            {
                var driver = new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                driver.DRVR_NAME = PLUserDataEntity?.SelectedDriverName;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                MatureDriverCourse(driver);
                InspireCustomerRec.POL_DRVR_DESC.Add(driver);               
            }
            if (InspireCustomerRec.POL_DRVR_DESC.Count() == 0 && SourcePolicyPeriod.ListedParties.Where(x => x.PartyDiscounts.Where(y => y.DiscountReasonCd == "MaturedDriverCourseDiscount").ToList().Count() > 0).Count() > 0)
            {
                var driver = MatureDriverCourse();
                if (driver != null)
                    InspireCustomerRec.POL_DRVR_DESC.Add(driver);
            }
        }
        private CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC MatureDriverCourse(CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC driver = null)
        {
            if (SourcePolicyPeriod.ListedParties.Where(x => x.PartyDiscounts.Where(y => y.DiscountReasonCd == "MaturedDriverCourseDiscount").ToList().Count() > 0).Count() > 0)
            {
                if (SourcePolicyPeriod.BaseStateCd == "OH")
                {
                    driver = driver ?? new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                    driver.MATURE_DRIVER_COURSE_DISCOUNT = ApplicationConstants.DocNameMatureDriverCourse;
                }
                else if (SourcePolicyPeriod.BaseStateCd == "MD")
                {
                    driver = driver ?? new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                    driver.MATURE_DRIVER_COURSE_DISCOUNT = ApplicationConstants.DocNameMatureDriverAccidentPreventionCourseDiscount;
                }
            }
            return driver;
        }
       
        private void AddPolicyMRVRRef()
        {
            PLUserDataEntity.MRVRReferences?.ForEach(d =>
            {
                var driver = new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                driver.DRVR_NAME = d.SelectedDriverName;
                driver.MVR_REF_NUM1 = d.MVRReferenceNumber;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                InspireCustomerRec.POL_DRVR_DESC.Add(driver);
            });
            if (PLUserDataEntity?.MRVRReferences?.Count() > 0)
                InspirePARec.MVR_CLUE_REF_INDICATOR = ApplicationConstants.YES;
            var clue = PLUserDataEntity?.ClueReferenceNumber?.Where(x => !string.IsNullOrEmpty(x));
            if (clue?.Count() > 0)
                InspirePARec.MVR_CLUE_REF_INDICATOR = ApplicationConstants.YES;
        }
        private void AddClueReference()
        {
            PLUserDataEntity.ClueReferenceNumber?.ForEach(c =>
            {
                var driver = new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                driver.CLUE_REF_NO = c;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                InspireCustomerRec.POL_DRVR_DESC.Add(driver);
            });
        }
        private void AddInvalidDriver()
        {
            PLUserDataEntity.InvalidLicDriverName?.ForEach(c =>
            {
                var driver = new CUSTOMER_DATARECORD_DELIMINVALID_DRV();
                driver.INV_LIC_DRVR_NAME = c;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                InspireCustomerRec.INVALID_DRV.Add(driver);
            });
            if (PLUserDataEntity?.InvalidLicDriverName != null)
                InspirePARec.INV_LIC_IND = PLUserDataEntity?.InvalidLicDriverName.Count() > 0 ? ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void AddLicSuspendedDriver()
        {
            PLUserDataEntity?.SuspendedLicDriverName?.ForEach(c =>
            {
                var driver = new CUSTOMER_DATARECORD_DELIMLIC_SUSP();
                driver.SUSP_LIC_DRVR_NAME = c;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                InspireCustomerRec.LIC_SUSP.Add(driver);
            });
            if (PLUserDataEntity?.SuspendedLicDriverName != null)
            {
                InspirePARec.LIC_SUSP_IND = PLUserDataEntity?.SuspendedLicDriverName.Count() > 0 ? ApplicationConstants.YES : ApplicationConstants.NO;
            }
        }
        private void AddSuspendedDriver()
        {
            PLUserDataEntity?.SuspendedDriversWhileDriving?.ForEach(c =>
            {
                var driver = new CUSTOMER_DATARECORD_DELIMSUSP_DRV();
                driver.SUSP_DRVR_NAME = c;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                InspireCustomerRec.SUSP_DRV.Add(driver);
            });
            if (PLUserDataEntity?.SuspendedDriversWhileDriving != null)
            {
                InspirePARec.SUSP_DRVR_IND = PLUserDataEntity?.SuspendedDriversWhileDriving.Count() > 0 ? ApplicationConstants.YES : ApplicationConstants.NO;
            }
        }
        private void AddIndicators()
        {
            if (!string.IsNullOrEmpty(PLUserDataEntity.ReasonNonrenewal))
            {
                InspirePARec.NON_RNWL_IND = PLUserDataEntity.ReasonNonrenewal;
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity.ReasonDeletionOfCoverage))
            {
                InspirePARec.DEL_COV_REAS_IND = PLUserDataEntity.ReasonDeletionOfCoverage;
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity.DeletionType))
            {
                InspirePARec.DEL_TYP = PLUserDataEntity.DeletionType;
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity.InspectionReason))
            {
                InspirePARec.INSPECTION_RESULTS = PLUserDataEntity.InspectionReason;
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity.ReasonDeletionOfCoverageOtherInfo) || !string.IsNullOrEmpty(PLUserDataEntity.DeletionTypeOtherInfo))
            {
                if ((PLUserDataEntity.ReasonDeletionOfCoverageOtherInfo != ApplicationConstants.Driver.ToLower() &&
                        PLUserDataEntity.ReasonDeletionOfCoverageOtherInfo != ApplicationConstants.Both) ||
                     (PLUserDataEntity.DeletionTypeOtherInfo != ApplicationConstants.Driver.ToLower() &&
                        PLUserDataEntity.DeletionTypeOtherInfo != ApplicationConstants.Both))
                    InspirePARec.FREE_FORM_IND = ApplicationConstants.YES;
            }
            if (PLUserDataEntity.VehicleInfoInd.HasValue)
            {
                InspirePARec.VEH_INFO_IND = PLUserDataEntity.VehicleInfoInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
            }
            if (PLUserDataEntity.IsNDEOffer.HasValue)
                InspirePARec.NDEOffer = PLUserDataEntity.IsNDEOffer.Value ? ApplicationConstants.YES : ApplicationConstants.NO;

            if (PLUserDataEntity.AddedPip != null)
            {
                if (PLUserDataEntity.AddedPip.HIGHER_LMT_NOT_SELECT_IND.HasValue)
                {
                    InspirePARec.HIGHER_LMT_NOT_SELECT_IND = PLUserDataEntity.AddedPip.HIGHER_LMT_NOT_SELECT_IND.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                    InspirePARec.CSF_BLK_PREFILL = ApplicationConstants.PA_Blank;
                }
                if (PLUserDataEntity.AddedPip.OTHER_INS_IND.HasValue)
                    InspirePARec.OTHER_INS_IND = PLUserDataEntity.AddedPip.OTHER_INS_IND.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (PLUserDataEntity.AddedPip.PIP_MED_EXP_IND.HasValue)
                    InspirePARec.PIP_MED_EXP_IND = PLUserDataEntity.AddedPip.PIP_MED_EXP_IND.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (PLUserDataEntity.AddedPip.NON_REL_RESIDENT_IND.HasValue)
                    InspirePARec.NON_REL_RESIDENT_IND = PLUserDataEntity.AddedPip.NON_REL_RESIDENT_IND.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
            }
            InspirePARec.VERIFY_COV_IND = string.IsNullOrEmpty(PLUserDataEntity.VehicleCoverageInd) ? null : PLUserDataEntity.VehicleCoverageInd;
            InspirePARec.NUM_YRS_INS = string.IsNullOrEmpty(PLUserDataEntity.InsuredYears) ? null : PLUserDataEntity.InsuredYears;
            InspirePARec.RECONSIDER_IND = string.IsNullOrEmpty(PLUserDataEntity.Reconsideration) ? null : PLUserDataEntity.Reconsideration;
            InspirePARec.PRIOR_POL_NO = string.IsNullOrEmpty(PLUserDataEntity.PolicyNumber) ? null : PLUserDataEntity.PolicyNumber;
            InspirePARec.PRIOR_BAL = string.IsNullOrEmpty(PLUserDataEntity.PiiorBalance) ? null : PLUserDataEntity.PiiorBalance;
            InspirePARec.MIDTRM_CNCL_IND = string.IsNullOrEmpty(PLUserDataEntity.MidTermCancelationInd) ? null : PLUserDataEntity.MidTermCancelationInd;
            InspirePARec.VIOL_RSN_IND = string.IsNullOrEmpty(PLUserDataEntity.ViolationReasonInd) ? null : PLUserDataEntity.ViolationReasonInd;
            if (PLUserDataEntity.DuiInd.HasValue)
                InspirePARec.DUI_IND = PLUserDataEntity.DuiInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void AddServiceEvent()
        {
            PLUserDataEntity.ServiceEvents?.ForEach(s =>
            {
                var driver = new CUSTOMER_DATARECORD_DELIMSERVICE_EVNT();
                driver.SERVICE_EVENT = ConvertDateFormat(s.Date, LOB_Date_Format);
                driver.SERVICE_DESC = s.Description;
                driver.SERVICE_VEHICLE = s.VehicleText;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                InspireCustomerRec.SERVICE_EVNT.Add(driver);
            });
        }
        private void AddMidtermCancel()
        {
            if (!string.IsNullOrEmpty(PLUserDataEntity.SelectedDriverNameMVRSuspendDate))
            {
                var driver = new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                driver.DRVR_NAME = PLUserDataEntity.SelectedDriverNameMVRSuspendDate;
                driver.LICENSE_REGISTRATION_SUSPENSION_INDICATOR = ApplicationConstants.YES;
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                driver.LIC_MVR_SUSPEND_DT = ConvertDateFormat(PLUserDataEntity.LIC_MVR_SuspendDate, LOB_Date_Format);
                InspireCustomerRec.POL_DRVR_DESC.Add(driver);
            }
            if (PLUserDataEntity.LicenseMVRSuspendedDate > DateTime.MinValue)
            {
                var driver = new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));

                // Commented the if/else condition for PLPC 25801
                driver.LIC_MVR_SUSPEND_DT = ConvertDateFormat(PLUserDataEntity.LicenseMVRSuspendedDate, LOB_Date_Format);
                //if (DocumentData.documentEntity.DocumentName == ApplicationConstants.Doc_MD_MidTerm_Cancel)
                //    driver.LIC_MVR_SUSPEND_DT = ConvertDateFormat(PLUserDataEntity.LicenseMVRSuspendedDate, LOB_Date_Format);
                //else
                //    driver.LicenseMVRSuspendedDate = ConvertDateFormat(PLUserDataEntity.LicenseMVRSuspendedDate, LOB_Date_Format);

                InspireCustomerRec.POL_DRVR_DESC.Add(driver);
            }
            if (PLUserDataEntity?.LicenseSuspendedDate > DateTime.MinValue)
            {
                var driver = new CUSTOMER_DATARECORD_DELIMPOL_DRVR_DESC();
                driver.POL_FK = GetConfigValue(nameof(driver.POL_FK));
                driver.LIC_MVR_SUSPEND_DT = ConvertDateFormat(PLUserDataEntity?.LicenseSuspendedDate, LOB_Date_Format);
                InspireCustomerRec.POL_DRVR_DESC.Add(driver);
            }
        }
        private void AddUmUimStandard()
        {
            int count = 0;
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var BILimit = coverages.Where(c => c.CoverageTypeCd == ApplicationConstants.Liability && c.CoverageParameterTypeCd == ApplicationConstants.Liability_Limit).FirstOrDefault()?.CoverageParameterUnformattedValueTx;

            coverages = coverages.Where(c => c.CoverageParameterTypeCd == ApplicationConstants.PA_UMUIMStandardLimit);
            if (coverages.Any(o => o.UMUIMLimitOrder != null))
                coverages = coverages.OrderByDescending(o => o.UMUIMLimitOrder);
            else
                coverages = coverages.OrderBy(o => o.id);

            coverages.ToList().ForEach(p =>
            {
                var standard = new CUSTOMER_DATARECORD_DELIMUM_W_STANDARD_UIM_COV();
                var coverageParam = p?.CoverageParameterValueTx;

                if (!string.IsNullOrEmpty(coverageParam) && coverageParam.Contains(Pattern_Slash))
                    standard.UM_W_STANDARD_UIM_COV_SPLIT_LIMIT = coverageParam;
                else
                    standard.UM_W_STANDARD_UIM_COV_LIMIT = coverageParam;

                standard.UM_W_STANDARD_UIM_COV_TEXT = GetStandardUIMText(count++, coverages.Count(), coverageParam, BILimit);
                standard.UM_W_STANDARD_UIM_COV_TOT_PREM = ConvertAmountFormat(p.CoverageParameterPremiumAm);
                standard.UM_W_STANDARD_UIM_COV_LESS_LIAB = p.UMUIMLessThanLiabilityIn ? "*" : null;
                InspireCustomerRec.UM_W_STANDARD_UIM_COV.Add(standard);
            });
        }
        private void AddUmUimConversion()
        {
            int count = 0;
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var BILimit = coverages.Where(c => c.CoverageTypeCd == ApplicationConstants.Liability && c.CoverageParameterTypeCd == ApplicationConstants.Liability_Limit).FirstOrDefault()?.CoverageParameterUnformattedValueTx;
            coverages = coverages.Where(c => c.CoverageParameterTypeCd == ApplicationConstants.PA_UMUIMConversionLimit);
            if (coverages.Any(o => o.UMUIMLimitOrder != null))
                coverages = coverages.OrderByDescending(o => o.UMUIMLimitOrder);
            else
                coverages = coverages.OrderBy(o => o.id);

            coverages.ToList().ForEach(p =>
            {
                var conversion = new CUSTOMER_DATARECORD_DELIMUM_W_UIM_CONVERSION_COV();
                var coverageParam = p?.CoverageParameterValueTx;

                if (!string.IsNullOrEmpty(coverageParam) && coverageParam.Contains(Pattern_Slash))
                    conversion.UM_W_UIM_CONVERSION_COV_SPLIT_LIMIT = coverageParam;
                else
                    conversion.UM_W_UIM_CONVERSION_COV_LIMIT = coverageParam;

                conversion.UM_W_UIM_CONVERSION_COV_TEXT = GetStandardUIMText(count++, coverages.Count(), coverageParam, BILimit);
                conversion.UM_W_UIM_CONVERSION_COV_TOT_PREM = ConvertAmountFormat(p.CoverageParameterPremiumAm);
                conversion.UM_W_UIM_CONVERSION_COV_LESS_LIAB = p.UMUIMLessThanLiabilityIn ? "*" : null;
                InspireCustomerRec.UM_W_UIM_CONVERSION_COV.Add(conversion);
            });
        }
        private string GetStandardUIMText(int currentCount, int totalCount, string coverageParameterValueTx, string biLimit)
        {
            int index2 = -1;
            var index1 = biLimit.IndexOf('/');
            if (index1 > 0)
                index2 = biLimit.IndexOf('/', index1);
            string value1 = index1 > 0 ? biLimit.Substring(0, index1) : biLimit;
            string value2 = index2 > 0 ? biLimit.Substring(index1, index2) : biLimit;
            string value = string.Format("{0}{1}{2}{3}", value1, Pattern_Slash, value2, Pattern_Slash);
            string result = string.Empty;

            if (currentCount == 0)
                result += ApplicationConstants.PA_Double_BI_Limit;
            if (coverageParameterValueTx.Contains(Pattern_Slash) && coverageParameterValueTx == value)
                result += ApplicationConstants.PA_BI_Limit;
            if (!coverageParameterValueTx.Contains(Pattern_Slash) && coverageParameterValueTx == biLimit)
                result += ApplicationConstants.PA_BI_Limit;
            if (currentCount == totalCount - 1)
                result += ApplicationConstants.PA_Minimum_Limit;
            return result.Length > 0 ? result : null;
        }
        private void AddCancelReasonTag()
        {
            SetPropValueByReflection(PLUserDataEntity.ReasonNonrenewalInspireTag, PLUserDataEntity.ReasonNonrenewalInspireTag);

            if (!string.IsNullOrEmpty(PLUserDataEntity.Reason))
            {
                if (DocumentData.documentEntity.DocumentName == ApplicationConstants.Doc_MD_MidTerm_Cancel)
                    InspirePARec.CTL_REQ_OPT_IND = PLUserDataEntity.Reason;
                if (PLUserDataEntity?.Reason == ApplicationConstants.PA_Registration)
                {
                    var vehicle = new CUSTOMER_DATARECORD_DELIMVEH_DESC();
                    vehicle.REGSTR_IND = ApplicationConstants.YES;
                    vehicle.POL_FK = GetConfigValue(nameof(vehicle.POL_FK));
                    InspireCustomerRec.VEH_DESC.Add(vehicle);
                }
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity?.ReasonNonrenewalCancel))
            {
                InspirePARec.CNC_RSN = PLUserDataEntity?.ReasonNonrenewalCancel;
            }
        }
        private void AddAccidentViolation()
        {
            PLUserDataEntity?.DrivingRecordDetails?.ForEach(d =>
            {
                var accident = new CUSTOMER_DATARECORD_DELIMACC_VIOL();
                accident.ACTVTY_DESC = d.ActivityDescription;
                accident.ADVERSE_DATA_SRC = d.AdverseDataSource;
                accident.AV_DRVR_NAME = d.DriverName;
                accident.AV_EVENT_DT = ConvertDateFormat(d.EventDate, LOB_Date_Format);
                accident.AV_POST_PAY_DT = ConvertDateFormat(d.PostingPayoutDate, LOB_Date_Format);
                accident.POL_FK = GetConfigValue(nameof(accident.POL_FK));
                accident.EXPOSURE_TYPE = string.IsNullOrEmpty(d.ExposureDataSource) ? null : d.ExposureDataSource;
                accident.PAYOUT_AMOUNT = d.PayoutAmount==0 ? null : ConvertAmountFormat(d.PayoutAmount);
                InspireCustomerRec.ACC_VIOL.Add(accident);
            });
            if (PLUserDataEntity?.DrivingRecordDetails != null)
                InspirePARec.AV_IND = PLUserDataEntity?.DrivingRecordDetails.Count() > 0 ? ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void AddIDCards()
        {
            if (PLUserDataEntity.IDCardValidFrom > DateTime.MinValue)
            {
                var idCard = new CUSTOMER_DATARECORD_DELIMID_CARD();
                idCard.ID_CARD_VALID_FROM = ConvertDateFormat(PLUserDataEntity.IDCardValidFrom, LOB_Date_Format);
                idCard.ID_CARD_VALID_TO = ConvertDateFormat(PLUserDataEntity.IDCardValidTo, LOB_Date_Format);
                idCard.POL_FK = GetConfigValue(nameof(idCard.POL_FK));
                InspireCustomerRec.ID_CARD.Add(idCard);
            }
        }
        private void AddUMUIMForm2()
        {
            if (DocumentData.documentEntity.DocumentName == ApplicationConstants.Doc_UM_UIM_Form2)
            {
                var euimInd = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.EnhancedUIMIn;
                var umLibInd = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.UMUIMEqualtoLiabilityIn;
                var umLtLibInd = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.UMUIMLTLiabilityIn;
                
                //ST092024: New AmountTypeCd where TOT_PREM will be passed by ESB.
                var totPrem = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.SummaryAmounts.Where(c => c.AmountTypeCd == ApplicationConstants.PA_Total_Policy_Premium && c.AmountTypeCategoryCd == ApplicationConstants.PA_Premium).FirstOrDefault()?.SummaryAm;

                if (euimInd.HasValue)
                    InspirePARec.EUIM_CHECKBOX_IND = euimInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                if (umLibInd.HasValue)
                    InspirePARec.UM_EQUAL_LIAB_CHECKBOX_IND = umLibInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO; ;
                if (umLtLibInd.HasValue)
                    InspirePARec.UM_LT_LIAB_CHECKBOX_IND = umLtLibInd.Value ? ApplicationConstants.YES : ApplicationConstants.NO; ;
                InspirePARec.TOT_PREM = ConvertAmountFormat(totPrem);

                // ST091224: Added 2 new premium fields
                // TotalPremiumWithEUIM
                var TotalPremiumWithEUIM = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.SummaryAmounts
                                                .Where(c => c.AmountTypeCd == ApplicationConstants.PA_Total_Policy_Premium_Fullpay_Option3
                                                            && c.AmountTypeCategoryCd == ApplicationConstants.PA_Premium)
                                                .FirstOrDefault()?.SummaryAm;
                InspirePARec.TotalPremiumWithEUIM = ConvertAmountFormat(TotalPremiumWithEUIM);

                // TotalPremiumUMUIMEqualLiabWithoutEUIM
                var TotalPremiumUMUIMEqualLiabWithoutEUIM = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.SummaryAmounts
                                                .Where(c => c.AmountTypeCd == ApplicationConstants.PA_Total_Policy_Premium_Fullpay_Option1
                                                            && c.AmountTypeCategoryCd == ApplicationConstants.PA_Premium)
                                                .FirstOrDefault()?.SummaryAm;
                InspirePARec.TotalPremiumUMUIMEqualLiabWithoutEUIM = ConvertAmountFormat(TotalPremiumUMUIMEqualLiabWithoutEUIM);

            }
        }

        private void AddCSFDynamicRating()
        {
            if (DocumentData.documentEntity.DocumentName == ApplicationConstants.Doc_NJM_NJ_StandardCSF)
            {

                var PA_CSF_PIPLimit1Mil_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit1Mil_HighDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit1MilHighDollar = ConvertAmountFormat(PA_CSF_PIPLimit1Mil_HighDollar);

                var PA_CSF_PIPLimit1Mil_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit1Mil_LowDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit1MilLowDollar = ConvertAmountFormat(PA_CSF_PIPLimit1Mil_LowDollar);

                var PA_CSF_PIPLimit1Mil_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit1Mil_HighPer)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit1MilHighPer = ConvertAmountFormat(PA_CSF_PIPLimit1Mil_HighPer);

                var PA_CSF_PIPLimit1Mil_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit1Mil_LowPer)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit1MilLowPer = ConvertAmountFormat(PA_CSF_PIPLimit1Mil_LowPer);

                var PA_CSF_PIPLimit150K_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit150K_HighDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit150KHighDollar = ConvertAmountFormat(PA_CSF_PIPLimit150K_HighDollar);

                var PA_CSF_PIPLimit150K_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit150K_LowDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit150KLowDollar = ConvertAmountFormat(PA_CSF_PIPLimit150K_LowDollar); 

                var PA_CSF_PIPLimit150K_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit150K_HighPer)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit150KHighPer = ConvertAmountFormat(PA_CSF_PIPLimit150K_HighPer); 

                var PA_CSF_PIPLimit150K_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit150K_LowPer)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit150KLowPer = ConvertAmountFormat(PA_CSF_PIPLimit150K_LowPer); 

                var PA_CSF_PIPLimit75K_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit75K_HighDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit75KHighDollar = ConvertAmountFormat(PA_CSF_PIPLimit75K_HighDollar);
                
                var PA_CSF_PIPLimit75K_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit75K_LowDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit75KLowDollar = ConvertAmountFormat(PA_CSF_PIPLimit75K_LowDollar);
                
                var PA_CSF_PIPLimit75K_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit75K_HighPer)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit75KHighPer = ConvertAmountFormat(PA_CSF_PIPLimit75K_HighPer); 

                var PA_CSF_PIPLimit75K_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit75K_LowPer)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit75KLowPer = ConvertAmountFormat(PA_CSF_PIPLimit75K_LowPer); 

                var PA_CSF_PIPLimit50K_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit50K_HighDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit50KHighDollar = ConvertAmountFormat(PA_CSF_PIPLimit50K_HighDollar);
                
                var PA_CSF_PIPLimit50K_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit50K_LowDollar)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit50KLowDollar = ConvertAmountFormat(PA_CSF_PIPLimit50K_LowDollar); 

                var PA_CSF_PIPLimit50K_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                                .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit50K_HighPer)
                                                .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit50KHighPer = ConvertAmountFormat(PA_CSF_PIPLimit50K_HighPer);

                var PA_CSF_PIPLimit50K_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit50K_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit50KLowPer = ConvertAmountFormat(PA_CSF_PIPLimit50K_LowPer);

                var PA_CSF_PIPLimit15K_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit15K_HighDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit15KHighDollar = ConvertAmountFormat(PA_CSF_PIPLimit15K_HighDollar);

                var PA_CSF_PIPLimit15K_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit15K_LowDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit15KLowDollar = ConvertAmountFormat(PA_CSF_PIPLimit15K_LowDollar);

                var PA_CSF_PIPLimit15K_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit15K_HighPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit15KHighPer = ConvertAmountFormat(PA_CSF_PIPLimit15K_HighPer);

                var PA_CSF_PIPLimit15K_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPLimit15K_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPLimit15KLowPer = ConvertAmountFormat(PA_CSF_PIPLimit15K_LowPer);

                var PA_CSF_PIPDED500_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED500_HighDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED500HighDollar = ConvertAmountFormat(PA_CSF_PIPDED500_HighDollar);

                var PA_CSF_PIPDED500_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED500_LowDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED500LowDollar = ConvertAmountFormat(PA_CSF_PIPDED500_LowDollar);

                var PA_CSF_PIPDED500_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED500_HighPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED500HighPer = ConvertAmountFormat(PA_CSF_PIPDED500_HighPer);

                var PA_CSF_PIPDED500_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED500_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED500LowPer = ConvertAmountFormat(PA_CSF_PIPDED500_LowPer);

                var PA_CSF_PIPDED1000_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED1000_HighDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED1000HighDollar = ConvertAmountFormat(PA_CSF_PIPDED1000_HighDollar);

                var PA_CSF_PIPDED1000_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED1000_LowDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED1000LowDollar = ConvertAmountFormat(PA_CSF_PIPDED1000_LowDollar);

                var PA_CSF_PIPDED1000_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED1000_HighPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED1000HighPer = ConvertAmountFormat(PA_CSF_PIPDED1000_HighPer);

                var PA_CSF_PIPDED1000_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED1000_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED1000LowPer = ConvertAmountFormat(PA_CSF_PIPDED1000_LowPer);

                var PA_CSF_PIPDED2000_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2000_HighDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2000HighDollar = ConvertAmountFormat(PA_CSF_PIPDED2000_HighDollar);

                var PA_CSF_PIPDED2000_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2000_LowDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2000LowDollar = ConvertAmountFormat(PA_CSF_PIPDED2000_LowDollar);

                var PA_CSF_PIPDED2000_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2000_HighPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2000HighPer = ConvertAmountFormat(PA_CSF_PIPDED2000_HighPer);

                var PA_CSF_PIPDED2000_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2000_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2000LowPer = ConvertAmountFormat(PA_CSF_PIPDED2000_LowPer);

                var PA_CSF_PIPDED2500_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2500_HighDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2500HighDollar = ConvertAmountFormat(PA_CSF_PIPDED2500_HighDollar);

                var PA_CSF_PIPDED2500_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2500_LowDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2500LowDollar = ConvertAmountFormat(PA_CSF_PIPDED2500_LowDollar);

                var PA_CSF_PIPDED2500_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2500_HighPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2500HighPer = ConvertAmountFormat(PA_CSF_PIPDED2500_HighPer);

                var PA_CSF_PIPDED2500_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPDED2500_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPDED2500LowPer = ConvertAmountFormat(PA_CSF_PIPDED2500_LowPer);

                var PA_CSF_LawsuitOptions_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_LawsuitOptions_HighDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFLawsuitOptionsHighDollar = ConvertAmountFormat(PA_CSF_LawsuitOptions_HighDollar);

                var PA_CSF_LawsuitOptions_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_LawsuitOptions_LowDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFLawsuitOptionsLowDollar = ConvertAmountFormat(PA_CSF_LawsuitOptions_LowDollar);

                var PA_CSF_LawsuitOptions_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_LawsuitOptions_HighPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFLawsuitOptionsHighPer = ConvertAmountFormat(PA_CSF_LawsuitOptions_HighPer);

                var PA_CSF_LawsuitOptions_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_LawsuitOptions_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFLawsuitOptionsLowPer = ConvertAmountFormat(PA_CSF_LawsuitOptions_LowPer);

                var PA_CSF_PIPNonMedical_HighDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPNonMedical_HighDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPNonMedicalHighDollar = ConvertAmountFormat(PA_CSF_PIPNonMedical_HighDollar);

                var PA_CSF_PIPNonMedical_LowDollar = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPNonMedical_LowDollar)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPNonMedicalLowDollar = ConvertAmountFormat(PA_CSF_PIPNonMedical_LowDollar);

                var PA_CSF_PIPNonMedical_HighPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPNonMedical_HighPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPNonMedicalHighPer = ConvertAmountFormat(PA_CSF_PIPNonMedical_HighPer);

                var PA_CSF_PIPNonMedical_LowPer = SourcePolicyPeriod?.PolicyLines?.FirstOrDefault()?.PersonalAutoLine?.RatingWorksheets
                                               .Where(c => c.RatingTypeCd == ApplicationConstants.PA_CSF_PIPNonMedical_LowPer)
                                               .FirstOrDefault()?.Amount;
                InspirePARec.CSFPIPNonMedicalLowPer = ConvertAmountFormat(PA_CSF_PIPNonMedical_LowPer);

            }
        }
        private AdhocCorrespondenceEditor.Shared.PCPA.Address GetInsAddress()
        {
            return SourcePolicyPeriod?.PolicyLocation?.Address;
        }
        private string GetPolicyNumber()
        {
            var policyNumber = SourcePolicy?.PolicyNumber;
            if (!string.IsNullOrEmpty(policyNumber) && policyNumber != ApplicationConstants.Unassigned)
            {
                return String.Format("{0}-{1}", policyNumber.Substring(0, policyNumber.Length - 1), policyNumber.Last());
            }
            return null;
        }
        private string GetTertiaryInsured(string role, int position = 0)
        {
            string name = String.Empty;
            var namedInsured = SourcePolicyPeriod.ListedParties.Where(l => l.Party.PartyRoles.Contains(role));
            if (namedInsured.Count() > position)
            {
                var insured = namedInsured.ElementAt(position).Party.Person;
                name = string.Format("{0} {1}",
                    insured.PersonName.FirstGivenNm,
                    insured.PersonName.FamilyNm);
            }
            return name;
        }
        private string GetCoverage(string role)
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.VehicleCoverageDetails);
            var coverage = coverages.SelectMany(c => c.Coverages.Where(cov => cov.CoverageTypeCd == role)).FirstOrDefault();
            return coverage?.CoverageParameterUnformattedValueTx;
        }
        private string GetAmounts(string role, string pattern, bool condition)
        {
            CoverageElectionParameter coverageElectionParameter = null;
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var coverage = coverages.Where(c => c.CoverageTypeCd == role);
            if (condition)
                coverageElectionParameter = coverage.Where(c => c.CoverageParameterUnformattedValueTx != null && c.CoverageParameterUnformattedValueTx.Contains(pattern)).FirstOrDefault();
            else
                coverageElectionParameter = coverage.Where(c => c.CoverageParameterUnformattedValueTx != null && !c.CoverageParameterUnformattedValueTx.Contains(pattern)).FirstOrDefault();

            return coverageElectionParameter?.CoverageParameterUnformattedValueTx;
        }
        private string GetAmounts(string role, string pattern)
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var coverage = coverages.Where(c => c.CoverageTypeCd == role).Where(c => c.CoverageParameterUnformattedValueTx != null && c.CoverageParameterUnformattedValueTx == pattern).FirstOrDefault();

            return coverage?.CoverageParameterUnformattedValueTx;
        }
        private string GetPrimaryProv()
        {
            var pipNjm = GetAmounts(ApplicationConstants.PIP, ApplicationConstants.PIP_NJM);
            var pipHealth = GetAmounts(ApplicationConstants.PIP, ApplicationConstants.PIP_Health);
            var pipLimit = GetAmounts(ApplicationConstants.PIP, ApplicationConstants.PIP_Lawsuit_Limit);
            var pipNoLimit = GetAmounts(ApplicationConstants.PIP, ApplicationConstants.PIP_Lawsuit_No_Limit);

            pipNjm = string.IsNullOrEmpty(pipNjm) ? string.Empty : ApplicationConstants.PIP_NJM;
            pipHealth = string.IsNullOrEmpty(pipHealth) ? string.Empty : ApplicationConstants.Health_Ins_Primary;
            pipLimit = string.IsNullOrEmpty(pipLimit) ? string.Empty : ApplicationConstants.Limitation;
            pipNoLimit = string.IsNullOrEmpty(pipNoLimit) ? string.Empty : ApplicationConstants.No_Limitation;

            return string.Format("{0} {1} {2} {3}", pipNjm, pipHealth, pipLimit, pipNoLimit);
        }
        private string GetSummaryAmount(string role)
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.SummaryAmounts);
            var coverage = coverages.Where(c => c.AmountTypeCd == role).FirstOrDefault();

            return ConvertAmountFormat(coverage?.SummaryAm);
        }
        private AssociatedPolicy GetHealthPol()
        {
            var coverage = SourcePolicyPeriod?.AssociatedPolicies.Where(p => p.AssociationReasonCd == ApplicationConstants.PIP_Health_Ins).FirstOrDefault();
            return coverage;
        }
        private string GetThreshOption()
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var coverage = coverages.Where(c => c.CoverageTypeCd == ApplicationConstants.PA_LawsuitThreshold).
                                Where(c => c.CoverageParameterTypeCd == ApplicationConstants.PA_LawsuitThresholdLimit).FirstOrDefault();
            if (coverage != null)
            {
                switch (coverage?.CoverageParameterValueTx)
                {
                    case ApplicationConstants.PIP_NJM: return ApplicationConstants.PIP_NJM;
                    case ApplicationConstants.Health_Ins_Primary: return ApplicationConstants.Health_Ins_Primary;
                    case ApplicationConstants.Limit_Lawsuit: return ApplicationConstants.Limitation;
                    case ApplicationConstants.No_Limit_Lawsuit: return ApplicationConstants.No_Limitation;
                }
            }
            return null;
        }
        private string GetSpouseName()
        {
            var partList = SourcePolicyPeriod.ListedParties.Where(x => x.Party.PartyRoles.Contains(ApplicationConstants.Spouse) && x.DriverStatusCd != ApplicationConstants.PA_License_Own_Ins);
            var party = partList?.Where(x => x.Party?.Person?.VehicleDriverLicense.LicenseStatusCd != ApplicationConstants.PA_License_Suspended).FirstOrDefault();
            var spouse = party?.Party?.Person?.PersonName;
            return String.Format("{0} {1} {2} {3}", spouse?.FirstGivenNm, party?.Party?.Person?.SecondGivenNameInitial, spouse?.FamilyNm, spouse?.FamilyNameGenerationCd);
        }
        private string GetTortInd()
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var coverage = coverages.Where(c => c.CoverageTypeCd == ApplicationConstants.PA_Tort).
                Where(c => c.CoverageParameterTypeCd == ApplicationConstants.PA_TortOption).FirstOrDefault();
            var tortValue = GetUnformattedValue(ApplicationConstants.PA_Tort, ApplicationConstants.PA_TortOption);

            if (!string.IsNullOrEmpty(tortValue))
            {
                return coverage?.CoverageParameterValueTx;
            }
            return tortValue;
        }
        private string? GetUnformattedValue(string coverageTypeCd, string coverageParameterTypeCd)
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            coverages = coverages.Where(c => c.CoverageTypeCd == coverageTypeCd).Where(c => c.CoverageParameterTypeCd == coverageParameterTypeCd);
            var coverage = coverages.Where(c => c.CoverageParameterUnformattedValueTx?.Length > 0 || c.CoverageParameterValueTx?.Length > 0).FirstOrDefault();
            return coverage?.CoverageParameterUnformattedValueTx;
        }
        private string GetFormattedValue(string coverageParameterTypeCd)
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var coverage = coverages.Where(c => c.CoverageParameterTypeCd == coverageParameterTypeCd).FirstOrDefault();
            return coverage?.CoverageParameterValueTx;
        }
        private string GetFormattedValue(string coverageTypeCd, string coverageParameterTypeCd)
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            coverages = coverages.Where(c => c.CoverageTypeCd == coverageTypeCd).Where(c => c.CoverageParameterTypeCd == coverageParameterTypeCd);
            var coverage = coverages.Where(c => c.CoverageParameterUnformattedValueTx?.Length > 0 || c.CoverageParameterValueTx?.Length > 0).FirstOrDefault();
            return coverage?.CoverageParameterValueTx;
        }
        private string GetFormattedPremium(string coverageParameterTypeCd)
        {
            var coverages = SourcePolicyPeriod?.PolicyLines.SelectMany(p => p.PersonalAutoLine.CoverageElectionParameters);
            var coverage = coverages.Where(c => c.CoverageParameterTypeCd == coverageParameterTypeCd).FirstOrDefault();
            return coverage?.CoverageParameterPremiumAm;
        }
        private string GetPolicyPad()
        {
            var policyNumber = SourcePolicy?.PolicyNumber;
            if (!string.IsNullOrEmpty(policyNumber) && policyNumber != ApplicationConstants.Unassigned)
            {
                var polNumPad = string.Format("000000000{0}", policyNumber);
                return polNumPad.Substring(policyNumber.Length - 1, 9);
            }
            return null;
        }
        private string GetTriggerDate(DateTime? startDate)
        {
            if (startDate.HasValue)
            {
                var halfDate = startDate.Value;
                halfDate = halfDate.AddMonths(6);
                halfDate = halfDate.AddDays(-15);
                return ConvertDateFormat(halfDate);
            }
            return null;
        }
        private void SetPropValueByReflection(string value, string tagName)
        {
            //use reflection to set the property that comes from database row.
            if (!string.IsNullOrEmpty(value))
            {
                PropertyInfo prop = InspirePARec.GetType().GetProperty(tagName, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                {
                    prop.SetValue(InspirePARec, ApplicationConstants.YES, null);
                }
            }
        }
        private void SetPropValueByReflection(string value, string tagName, CUSTOMER_DATARECORD_DELIMVEH_DESC? Veh)
        {
            //use reflection to set the property that comes from database row.
            if (!string.IsNullOrEmpty(value))
            {
                PropertyInfo prop = Veh.GetType().GetProperty(tagName, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                {
                    prop.SetValue(Veh, ApplicationConstants.YES, null);
                }
            }
        }
    }
}