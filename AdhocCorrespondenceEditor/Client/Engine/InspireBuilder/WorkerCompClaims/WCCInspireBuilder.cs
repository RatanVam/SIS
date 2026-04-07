using System.Globalization;
using System.Reflection;
using System.Xml;
using System.Xml.Serialization;
using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.WCC;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.Extentions;
using AdhocCorrespondenceEditor.Shared.WCC;

namespace AdhocCorrespondenceEditor.Client
{
    public class WCCInspireBuilder : InspireBuilderBase
    {
        protected WCCInspireEntity WCCInspireEntity { get; set; }
        private WCCUserEntity WCCUserDataEntity { get; set; }
        private WCCSourceSystemEntity WCCSourceSystemEntity { get; set; }

        protected WCC_DATARECORD_DELIMWCC_CLAIM_REC InspireClaimRecord;
        protected WCC_DATARECORD_DELIM InspireRecordDelim;
        protected Claim Claim;
        protected Policy ClaimPolicy;
        private string WCC_Date_Formt = "MMMM d, yyyy";

        protected override void CreateInspireRequest()
        {
            WCCUserDataEntity = (WCCUserEntity)UserInputData;
            WCCSourceSystemEntity = (WCCSourceSystemEntity)SourceSystemData;
            WCCInspireEntity = new WCCInspireEntity();

            InspireClaimRecord = WCCInspireEntity.CustomerData.RECORD_DELIM.WCC_CLAIM_REC;
            InspireRecordDelim = WCCInspireEntity.CustomerData.RECORD_DELIM;
            Claim = WCCSourceSystemEntity?.Claim;
            ClaimPolicy = WCCSourceSystemEntity.Claim?.ClaimPolicy;
        }
        protected override string SeriliazeInspireRequest()
        {
            var emptyNamespaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var serializer = new XmlSerializer(typeof(WCC_DATA));
            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;

            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, WCCInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
            return null;
        }
        protected override void ProcessRules()
        {}
        protected override void CreateCustomTags()
        {}

        protected override void ProcessUserInputData()
        {
            AddUserInputTags();
            AddEmail();
            AddFax();
            AddPrinter(WCCUserDataEntity, InspireClaimRecord);

            if (string.IsNullOrEmpty(InspireClaimRecord.PRINT_IND))
                InspireClaimRecord.PRINT_IND = ApplicationConstants.NO;
        }
        private void AddUserInputTags()
        {
            AddClaimantAttorneyDetails();
            AddAddressDetails();
            AddAuthorDetails();
            AddMiscInputDetails();
            AddSecondaryAddress();
            AddLegalCourtDetails();
            AddAdjrCaseDetails();
            AddNurseCaseDetails();
            AddDoctorDetails();
            AddReferredDetails();
            AddAdmissionDetails();
            AddChartDataDetails();
            AddFiveProviderDetails();
            AddSurgeryIndicators();
            AddCheckAmount();
            AddPrimaryAddress();
        }
        protected override void ProcessPolicyAndAccountRecord()
        {
            AddClaimGeneralDetails();
            AddClaimDatesAndAmounts();
            AddInsuranceDetails();
            AddInsuredDetails();
            AddClaimantDetails();
            AddPreparerDetails();
            AddRecordDelimTags();
        }
        private void AddClaimGeneralDetails()
        {
            InspireClaimRecord.POL_NO = ClaimPolicy?.PolicyNumber;
            InspireClaimRecord.POL_NO_NUMERIC = string.IsNullOrEmpty(ClaimPolicy?.PolicyNumber) ? null: ClaimPolicy?.PolicyNumber?.Substring(1); 
            InspireClaimRecord.POL_TYPE = ClaimPolicy?.Type.ToDescritpionString();
            InspireClaimRecord.POL_HOL_NAME = GetPolicyHolder(ApplicationConstants.PolicyHolder);
            InspireClaimRecord.CURR_DT = ConvertDateFormat(DateTime.Today, WCC_Date_Formt);
            InspireClaimRecord.SRC_SYS = GetConfigValue(nameof(InspireClaimRecord.SRC_SYS));
            InspireClaimRecord.LTR_CTGY = DocumentData.documentEntity.CategoryName;
            InspireClaimRecord.LTR_NAME = DocumentData.documentEntity.DocumentName;
            InspireClaimRecord.OUTBND_DOCTYPE = DocumentData.documentEntity.DocumentType;
            
            InspireClaimRecord.INBND_DOCTYPE = string.Empty; //Intentionally left blank for WCC
            InspireClaimRecord.CREATOR_UID = InputQueryParameters.UserDetails.UserID;
            InspireClaimRecord.CREATOR_NAME = InputQueryParameters.UserDetails.UserName;
            InspireClaimRecord.CREATOR_INT = InputQueryParameters.UserDetails.UserInitials;
            InspireClaimRecord.CLM_PK = GetConfigValue(nameof(InspireClaimRecord.CLM_PK));
            InspireClaimRecord.INS_CO_NM = GetInsuranceCompanyName(ClaimPolicy?.NjmInsuranceCompanyName);

            if (!string.IsNullOrEmpty(WCCUserDataEntity.DocType))
                InspireClaimRecord.OUTBND_DOCTYPE = WCCUserDataEntity.DocType;
            if (!string.IsNullOrEmpty(WCCUserDataEntity.ToWCC))
                InspireClaimRecord.TO_WCC = WCCUserDataEntity.ToWCC;
            if (!string.IsNullOrEmpty(WCCUserDataEntity.ClaimantDependent))
                InspireClaimRecord.CLMT_DEPENDENT_SYS = WCCUserDataEntity.ClaimantDependent;
            if (!string.IsNullOrEmpty(WCCUserDataEntity.GuardianName))
                InspireClaimRecord.GUARDIAN_NM = WCCUserDataEntity.GuardianName;

            if (!string.IsNullOrEmpty(WCCUserDataEntity.ALLLawFirmName))
                InspireClaimRecord.ALL_LAW_FIRMS = WCCUserDataEntity.ALLLawFirmName;
            if (!string.IsNullOrEmpty(WCCUserDataEntity.OverPaymentType))
                InspireClaimRecord.OVERPYMNT_TYPE = WCCUserDataEntity.OverPaymentType;
        }
        private void AddClaimDatesAndAmounts()
        {
            var claim = WCCSourceSystemEntity.Claim;
            var exSubrogation = claim?.Ex_Subrogation.FirstOrDefault();

            InspireClaimRecord.POL_EFF_DT_FROM = ConvertDateFormat(claim?.ClaimPolicy?.EffectiveDate);
            InspireClaimRecord.POL_EFF_DT_TO = ConvertDateFormat(claim?.ClaimPolicy?.ExpirationDate);
            InspireClaimRecord.EMPL_NOTIFY_DT = ConvertDateFormat(claim?.ClaimantReportedDate);
            InspireClaimRecord.PREPARED_DT = ConvertDateFormat(claim?.CreateDate);

            if (exSubrogation != null)
            {
                InspireClaimRecord.COUNSEL_FEES_STAT = ConvertAmountFormat(exSubrogation.ActualConselFeesAmount);
                InspireClaimRecord.SUIT_EXPENSES_STAT = ConvertAmountFormat(exSubrogation.ActualSuitExpenseAmount);
                InspireClaimRecord.NET_SETTLE = ConvertAmountFormat(exSubrogation.NetSettlementAmount);
                InspireClaimRecord.PCT_FUT_PYMTS = exSubrogation.FuturePaymentPercent > 0 ? ConvertAmountFormat(exSubrogation.FuturePaymentPercent) : null;
            }

            var empRelImproveDate = Claim?.InvolvedParties.SelectMany(p => p.EmploymentRelationships.Where(e => e.MaximumMedicalImprovementDt != null)).FirstOrDefault();
            var empRelHireDate = Claim?.InvolvedParties.SelectMany(p => p.EmploymentRelationships.Where(e => e.HireDate != null)).FirstOrDefault();
            InspireClaimRecord.LTR_CREATE_DT = ConvertDateFormat(DateTime.Today, "Mdyyyy"); ;
            InspireClaimRecord.CLM_LOSS_DT = ConvertDateFormat(Claim?.DateOfLoss, WCC_Date_Formt);
            InspireClaimRecord.CLM_PET_DT = ConvertDateFormat(Claim?.EarliestCPReceivedDate, WCC_Date_Formt);
            InspireClaimRecord.CLMT_DATE_HIRED = ConvertDateFormat(empRelHireDate?.HireDate, WCC_Date_Formt); ;
            InspireClaimRecord.MMI_DT = ConvertDateFormat(empRelImproveDate?.MaximumMedicalImprovementDt, WCC_Date_Formt);
            InspireClaimRecord.AUTH_EXPIRATION_DT = DateTime.UtcNow.AddMonths(6).ToString("MM/dd/yyyy", new CultureInfo("en-US"));
        }
        private void AddRecordDelimTags()
        {
            AddClaimPetitionNoDetails();
            AddMultipleProvider(WCCUserDataEntity.ProviderDetails);
            AddReSectionOption( ApplicationConstants.PolicyNum, WCCUserDataEntity.PolicyNum);
            AddReSectionOption(WCCUserDataEntity.ClaimPetitionNumber ? ApplicationConstants.ClaimPetitionNum : ApplicationConstants.CPNum, WCCUserDataEntity.ClaimPetNum);
            AddReSectionOption(ApplicationConstants.StateIdNum, WCCUserDataEntity.StateNum);
            AddReSectionOption(ApplicationConstants.DocketNum, WCCUserDataEntity.DocketNum);
            AddReSectionOption(ApplicationConstants.ListDate, WCCUserDataEntity.ListDate);
            AddReSectionOption(ApplicationConstants.NYWCBNum, WCCUserDataEntity.NYWCBnum);
            AddReSectionOption(ApplicationConstants.ReferenceNum, WCCUserDataEntity.RefNum);
            AddInjuryBodyPart();
            AddDenialDetails();
            AddPhysicalTherapy();
            AddTreatmentDetails();
            AddOverPaymentDetails();
            AddMultiOverPaymentDetails();
            AddCC();
            AddDME();
        }
        private void AddDoctorDetails()
        {
            if (WCCUserDataEntity.DoctorDetails != null)
            {
                var address = WCCUserDataEntity.DoctorDetails;
                if (WCCUserDataEntity.SpecailDoctorDetails)
                {
                    InspireClaimRecord.PHYS_NAME = address.DisplayName;
                    InspireClaimRecord.PHYS_ADDR_1 = address.Line1Tx;
                    InspireClaimRecord.PHYS_ADDR_2 = address.Line2Tx;
                    InspireClaimRecord.PHYS_ADDR_3 = address.Line3Tx;
                    InspireClaimRecord.PHYS_CTY = address.MunicipalityNm;
                    InspireClaimRecord.PHYS_ST = address.CountrySubdivisionNm;
                    InspireClaimRecord.PHYS_ZIP = address.PostalCd;
                    InspireClaimRecord.PHYS_COUNTRY = address.Country;
                }
                else
                {
                    InspireClaimRecord.CLMT_PHYS_NM = address.DisplayName;
                    InspireClaimRecord.PHYS_PHN = address.Phone;
                }
            }
        }
        private void AddLegalCourtDetails()
        {
            if (WCCUserDataEntity.LegalInfo != null)
            {
                var legal = WCCUserDataEntity.LegalInfo;
                InspireClaimRecord.COURT_ADDRESS_1 = legal.CourtAddress;
                InspireClaimRecord.COURT_CITY = legal.CourtCity;
                InspireClaimRecord.COURT_ZIP = legal.CourtZipCode;
                InspireClaimRecord.COURT_DATE = ConvertDateFormat( legal.CourtDate);
                InspireClaimRecord.RESPONSE_TIME = legal.CourtResponseTime;
                InspireClaimRecord.RESPONSE_DATE = ConvertDateFormat(legal.CourtResponseDate);
                InspireClaimRecord.HEARING_TIME = legal.CourtHearingTime;
                InspireClaimRecord.JUDGE_NAME = legal.CourtJudgeName;
                InspireClaimRecord.HEARING_DAY = legal.CourHearingDay;
                InspireClaimRecord.HEARING_YR = legal.CourtHearingYear;
                InspireClaimRecord.HEARING_MONTH = legal.CourtHearingMonth;
                InspireClaimRecord.COURT_DAY = legal.CourtCourtDayWeek;
            }
        }
        private void AddPrimaryAddress()
        {
            if (WCCUserDataEntity.primaryAddressee != null)
            {
                var address = WCCUserDataEntity.primaryAddressee.Address;
                InspireClaimRecord.PRI_ADDRESSEE_NAME = WCCUserDataEntity.primaryAddressee?.Name;
                InspireClaimRecord.PRI_ADDRESSEE_ADDR_1 = address?.Line1Tx;
                InspireClaimRecord.PRI_ADDRESSEE_ADDR_2 = address?.Line2Tx;
                InspireClaimRecord.PRI_ADDRESSEE_ADDR_3 = address?.Line3Tx;
                InspireClaimRecord.PRI_ADDRESSEE_CTY = address?.MunicipalityNm;
                InspireClaimRecord.PRI_ADDRESSEE_ST = address?.CountrySubdivisionNm;
                InspireClaimRecord.PRI_ADDRESSEE_ZIP = address?.PostalCd;
                InspireClaimRecord.PRI_ADDRESSEE_COUNTRY = address?.Country;
                InspireClaimRecord.PRI_ADDRESSEE_POSTNET_INFO = address?.PostNet;
                InspireClaimRecord.SEC_ADDRESSEE_NAME = WCCUserDataEntity.secondaryAddresseeName; 
                InspireClaimRecord.GRTG_TYPLST = WCCUserDataEntity?.Greeting?.Type;
                InspireClaimRecord.GRTG_VAL = WCCUserDataEntity?.Greeting?.Value;
                InspireClaimRecord.ATTN_TYPLST = WCCUserDataEntity?.primaryAddressee?.Attention?.Type;
                InspireClaimRecord.ATTN_VAL = WCCUserDataEntity?.primaryAddressee?.Attention?.Value;
            }
            if (WCCUserDataEntity.RoleAutherAddressee != null)
            {
                var address = WCCUserDataEntity.RoleAutherAddressee;
                InspireClaimRecord.PRI_ADDRESSEE_NAME = address?.DisplayName;
                InspireClaimRecord.PRI_ADDRESSEE_PHN_NUM = address?.Phone;
            }
        }
        private void AddAdjrCaseDetails()
        {
            if (WCCUserDataEntity.AdjrCaseMngrDetails != null)
            {
                var address = WCCUserDataEntity.AdjrCaseMngrDetails;
                InspireClaimRecord.ADJ_AND_CASE_MGR_NAME = address.DisplayName;
                InspireClaimRecord.ADJ_AND_CASE_MGR_FX_NUM = address.FaxDetails;
                InspireClaimRecord.ADJ_AND_CASE_MGR_PHN_NUM = address.Phone;
                InspireClaimRecord.ADJ_AND_CASE_MGR_EXT = address.PhoneExtension;
                InspireClaimRecord.ADJ_CASE_MGR_CREDS = address.Credentials;
            }
        }
        private void AddNurseCaseDetails()
        {
            if (WCCUserDataEntity.NurseCaseMngrDetails != null)
            {
                var address = WCCUserDataEntity.NurseCaseMngrDetails;
                InspireClaimRecord.NURSE_CASE_MGR_NM = address.DisplayName;
                InspireClaimRecord.NURSE_CASE_MGR_FX_NUM = address.FaxDetails;
                InspireClaimRecord.NURSE_CASE_MGR_CREDS = address.Credentials;
            }
        }
        private void AddSecondaryAddress()
        {
            if (WCCUserDataEntity.ExamInfo != null)
            {
                var address = WCCUserDataEntity.ExamInfo.Address;
                InspireClaimRecord.SNE_NAME = WCCUserDataEntity.ExamInfo.Name;
                InspireClaimRecord.SNE_ST_ADDR_1 = address?.Line1Tx;
                InspireClaimRecord.SNE_ST_ADDR_2 = address?.Line2Tx;
                InspireClaimRecord.SNE_ST_ADDR_3 = address?.Line3Tx;
                InspireClaimRecord.SNE_CTY = address?.MunicipalityNm;
                InspireClaimRecord.SNE_ST = address?.CountrySubdivisionNm;
                InspireClaimRecord.SNE_ZIP = address?.PostalCd;
                InspireClaimRecord.SNE_COUNTRY = address?.Country;
                InspireClaimRecord.SNE_ATTN_TYPLST = WCCUserDataEntity.ExamInfo.Attention?.Type;
                InspireClaimRecord.SNE_ATTN_VAL = WCCUserDataEntity.ExamInfo.Attention?.Value;
            }
        }
        private void AddInsuranceDetails()
        {
            var exSubrogation = Claim?.Ex_Subrogation.FirstOrDefault();

            InspireClaimRecord.INS_CONTACT_NAME = GetInsuredContact();
            InspireClaimRecord.CAUSE_INJ_CD = Claim?.AccidentTypeCode;
            InspireClaimRecord.BOARD_W_NUMBER = Claim?.BoardWNumber;
            if (!string.IsNullOrEmpty(WCCUserDataEntity.BoardWNumber))
                InspireClaimRecord.BOARD_W_NUMBER = WCCUserDataEntity.BoardWNumber;

            InspireClaimRecord.HIST_AND_INJ = Claim?.ClaimDescription;
            InspireClaimRecord.STATE_CLAIM_NO = Claim?.StateClaimNumber;
            InspireClaimRecord.CLM_NO = Claim?.ClaimNumber;
            InspireClaimRecord.ONBASE_CLM_NO = Claim?.ClaimNumber.Replace("-", string.Empty);
            InspireClaimRecord.NJ_COMPANY = ClaimPolicy?.NjmCompanyCd;
            InspireClaimRecord.INS_COUNTY = ClaimPolicy?.PolicyCounty;
            InspireClaimRecord.TYPE_INJ_ILL = Claim?.Incidents?.Where(i => i.DetailedInjuryType != null).FirstOrDefault()?.DetailedInjuryType;
            InspireClaimRecord.TYPE_INJ_ILL_CD = Claim?.Incidents?.Where(i => i.DetailedInjuryTypeCode != null).FirstOrDefault()?.DetailedInjuryTypeCode;
            if (exSubrogation != null)
            {
                InspireClaimRecord.MEDICAL_PD = ConvertAmountFormat(exSubrogation.ActualMedicalPaidAmount);
                InspireClaimRecord.TEMP_PD = ConvertAmountFormat(exSubrogation.ActualTempPaidAmount);
                InspireClaimRecord.PERM_PD = ConvertAmountFormat(exSubrogation.ActualPermPaidAmount);
                InspireClaimRecord.SUBRO_PERM_PD = ConvertAmountFormat(exSubrogation.ActualPermPaidAmount);
                InspireClaimRecord.FUNERAL_PD = ConvertAmountFormat(exSubrogation.ActualFuneralPaidAmount);
                InspireClaimRecord.GROSS_LIEN = ConvertAmountFormat(exSubrogation.GrossLienAmount);
                InspireClaimRecord.NET_LIEN = ConvertAmountFormat(exSubrogation.NetLienAmount);
            }
        }
        private void AddPreparerDetails()
        {
            var prepararer = Claim?.InvolvedParties?.Where(p => p.Role.Contains("Reporter")).FirstOrDefault();
            var preparerPhone = prepararer?.PhoneNumbers?.Where(p => p.IsPrimary == true).FirstOrDefault();
            var empRelationship = Claim?.InvolvedParties?.SelectMany(p => p.EmploymentRelationships?.Where(e => e.HireDate != null)).FirstOrDefault();

            if (prepararer != null)
            {
                InspireClaimRecord.PREPARERS_NAME = String.Format("{0} {1} {2} {3}", prepararer.FirstName, prepararer.MiddleName, prepararer.LastName, prepararer.Suffix);
                InspireClaimRecord.PREPARERS_PHN = String.Format("{0} {1} {2}", preparerPhone?.AreaCode, preparerPhone?.Exchange, preparerPhone?.Number);
                InspireClaimRecord.PREPARERS_EXT = preparerPhone?.Extension;
            }
            if (empRelationship != null)
            {
                InspireClaimRecord.RET_TO_WORK_DT = ConvertDateFormat(empRelationship.ReturnToWorkDate, "yyyy-MM-dd");
                InspireClaimRecord.OUT_OF_WORK_DT = ConvertDateFormat(empRelationship.OutOfWorkDt, "yyyy-MM-ddTHH:mm:ssZ");
                InspireClaimRecord.COMP_RATE = empRelationship.WeeklyCompensationRate>0 ? ConvertAmountFormat(empRelationship.WeeklyCompensationRate) : null;
                InspireClaimRecord.LOCATION_NUM = empRelationship.DepartmentCode;
                InspireClaimRecord.WAGES = ConvertAmountFormat(empRelationship.WageAmount);
                InspireClaimRecord.NCCI_CD = empRelationship.ClassCode;
                InspireClaimRecord.NUM_DAYS_WORKED_WK = empRelationship.DaysWorkedPerWeekNumber.ToString();
                InspireClaimRecord.PAY_PERIOD = empRelationship.PayPeriod;
                InspireClaimRecord.CLMT_STATE_HIRED = empRelationship.HireState;
                InspireClaimRecord.LAST_WORK_DT = ConvertDateFormat(empRelationship.LastWorkedDate);
                InspireClaimRecord.FULL_PAY_INJ_DAY_IND = empRelationship.LastDayWorkedFullPayIndicator ? ApplicationConstants.YES : null;
                InspireClaimRecord.WORK_START_TIME = ConvertDateFormat(empRelationship.InjuryDateWorkStartTime);
                InspireClaimRecord.WORK_START_TIME_AMPM = ConvertDateFormat(empRelationship.InjuryDateWorkStartTime);
            }
            InspireClaimRecord.NUM_DEPENDENTS = Claim?.InvolvedParties.Where(p => p.DependentsNumber > 0).FirstOrDefault()?.DependentsNumber.ToString();
            InspireClaimRecord.JURISDICTION = Claim?.ClaimJurisdictionState;
            InspireClaimRecord.CLM_LOSS_CTY = Claim?.LossLocationCity;
            InspireClaimRecord.CLM_LOSS_ST = Claim?.LossLocationState;
            InspireClaimRecord.REPORTED_DT = ConvertDateFormat(Claim?.CreateDate);
            InspireClaimRecord.EMPL_CLM = Claim.NJMEmployeeClaimIndicator ? ApplicationConstants.YES : ApplicationConstants.NO;
            InspireClaimRecord.SAFETY_EQUIP_PROV_IND = Claim.SafetyEquipmentProividedIndicator ? ApplicationConstants.YES : null;
            InspireClaimRecord.INJURED_EMPLOYER_PREM_IND = Claim.InjuredOnEmployerPremisesIndicator ? ApplicationConstants.YES : ApplicationConstants.NO;
            InspireClaimRecord.SAFETY_EQUIP_USED_IND = Claim.SafetyEquipmentUsedIndicator ? ApplicationConstants.YES : null;

            InspireClaimRecord.TIME_INJURED = Claim?.TimeOfLoss.ToString("HH:mm");
            InspireClaimRecord.TIME_INJURED_AMPM = string.Format("{0} {1}", Claim?.TimeOfLoss.ToString("HH:mm"), Claim?.TimeOfLoss.ToString("tt"));
            InspireClaimRecord.POL_NUM_NO_CHK_DGT = ClaimPolicy?.PolicyNumberWithOutCheckDigit;
            InspireClaimRecord.TAX_ID = ClaimPolicy?.NjmInsuranceCompanyTaxID;
            InspireClaimRecord.MED_NET_TOT_INCURRED = GetTotalAmount(ApplicationConstants.NetTotalIncurred, ApplicationConstants.Medical);
            InspireClaimRecord.INDEM_NET_TOT_INCURRED = GetTotalAmount(ApplicationConstants.NetTotalIncurred, ApplicationConstants.Indemnity);
            InspireClaimRecord.INDEM_PD = GetTotalAmount(ApplicationConstants.AdjustedPaid, ApplicationConstants.Indemnity);
            InspireClaimRecord.INDEM_OPEN_RSRV = GetTotalAmount(ApplicationConstants.OpenReserves, ApplicationConstants.Indemnity);
            InspireClaimRecord.MED_OPEN_RSRV = GetTotalAmount(ApplicationConstants.OpenReserves, ApplicationConstants.Medical);
            InspireClaimRecord.TOT_MED_PD = GetTotalAmount(ApplicationConstants.AdjustedPaid, ApplicationConstants.Medical);
            InspireClaimRecord.TEMP_COMP_PD = GetTotalAmount(ApplicationConstants.AdjustedPaid, ApplicationConstants.Temp, ApplicationConstants.Indemnity);
            InspireClaimRecord.PERM_COMP_PD = GetTotalAmount(ApplicationConstants.AdjustedPaid, ApplicationConstants.Perm, ApplicationConstants.Indemnity);

            InspireClaimRecord.ACC_LOC_ADDR_1_SYS = Claim?.LossLocationAddress1;
            InspireClaimRecord.ACC_LOC_ADDR_2_SYS = Claim?.LossLocationAddress2;
            InspireClaimRecord.ACC_LOC_ADDR_3_SYS = Claim?.LossLocationAddress3;
            InspireClaimRecord.ACC_LOC_CTY_SYS = Claim?.LossLocationCity;
            InspireClaimRecord.ACC_LOC_ST_SYS = Claim?.LossLocationState;
            InspireClaimRecord.ACC_LOC_ZIP_SYS = Claim?.LossLocationZipCode;
            InspireClaimRecord.CLAIM_TYPE = Claim?.ClaimType;
            InspireClaimRecord.DAYS_REPORTED_LATE = Claim?.DaysReportedLateNumber.ToString();
        }
        private void AddClaimantAttorneyDetails()
        {
            if (WCCUserDataEntity.ClaimantAttorneyDetails != null)
            {
                var claimant = WCCUserDataEntity.ClaimantAttorneyDetails;
                InspireClaimRecord.CLMT_ATTORNEY_NAME = claimant.DisplayName;
                InspireClaimRecord.CLMT_ATTORNEY_ST_ADDR = claimant.Line1Tx;
                InspireClaimRecord.CLMT_ATTORNEY_CTY = claimant.MunicipalityNm;
                InspireClaimRecord.CLMT_ATTORNEY_ST = claimant.CountrySubdivisionNm;
                InspireClaimRecord.CLMT_ATTORNEY_ZIP = claimant.PostalCd;
                InspireClaimRecord.CLMT_ATTORNEY_PHN = claimant.Phone;
            }
        }
        private void AddAddressDetails()
        {
            AddAttorneyAddress(WCCUserDataEntity.AttorneyNameAndAddress);
            AddNJMAttorneyAddress(WCCUserDataEntity.AttorneyDetails);
            AddClaimantAttorneyAddress(WCCUserDataEntity.ClaimantAttorneyDetails);
            AddCheckPayableAddress(WCCUserDataEntity.PayableToDetails);
            AddProviderAddress(WCCUserDataEntity.Provider);
            AddProviderNameAddress(WCCUserDataEntity.ProviderName);
            AddHospitalAddress(WCCUserDataEntity.HospitalDetails);
            AddWitnessAddress(WCCUserDataEntity.Witness);
        }
        private void AddNJMAttorneyAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (!string.IsNullOrEmpty(WCCUserDataEntity.OutsideLawFirmName))
                InspireClaimRecord.OUTSD_LAW_FIRM_NAME = WCCUserDataEntity.OutsideLawFirmName;

            if (WCCUserDataEntity.AttorneyDetailsMatterCounsel)
            {
                InspireClaimRecord.MatterCounselNJMAttorneyName = address?.DisplayName;
                InspireClaimRecord.MatterCounselNJMAttorneyEmail = address?.Email;
            }
            else
                InspireClaimRecord.NJM_ATTORNEY_SYS = address?.DisplayName;

            InspireClaimRecord.NJM_ATTNY_PHN = address?.Phone;
            InspireClaimRecord.NJM_ATTNY_FAX = address?.FaxDetails;
            InspireClaimRecord.NJM_ATTNY_EXT = address?.PhoneExtension;
        }
        private void AddAttorneyAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            InspireClaimRecord.OUTSD_ATTORNEY_NAME = address?.DisplayName;
            InspireClaimRecord.OUTSD_ATTORNEY_ST_ADDR1 = address?.Line1Tx;
            InspireClaimRecord.OUTSD_ATTORNEY_ST_ADDR2 = address?.Line2Tx;
            InspireClaimRecord.OUTSD_ATTORNEY_ST_ADDR3 = address?.Line3Tx;
            InspireClaimRecord.OUTSD_ATTORNEY_CTY = address?.MunicipalityNm;
            InspireClaimRecord.OUTSD_ATTORNEY_ST = address?.CountrySubdivisionNm;
            InspireClaimRecord.OUTSD_ATTORNEY_ZIP = address?.PostalCd;
        }
        private void AddClaimantAttorneyAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            InspireClaimRecord.CLMT_ATTORNEY_NAME = address?.DisplayName;
            InspireClaimRecord.CLMT_ATTORNEY_ST_ADDR = address?.Line1Tx;
            InspireClaimRecord.CLMT_ATTORNEY_CTY = address?.MunicipalityNm;
            InspireClaimRecord.CLMT_ATTORNEY_ST = address?.CountrySubdivisionNm;
            InspireClaimRecord.CLMT_ATTORNEY_ZIP = address?.PostalCd;
            InspireClaimRecord.CLMT_ATTORNEY_PHN = address?.Phone;
        }
        private void AddProviderAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.PROVIDER = address.DisplayName;
                InspireClaimRecord.PROV_ST_ADDR1 = address.Line1Tx;
                InspireClaimRecord.PROV_ST_ADDR2 = address.Line2Tx;
                InspireClaimRecord.PROV_ST_ADDR3 = address.Line3Tx;
                InspireClaimRecord.PROV_CTY = address.MunicipalityNm;
                InspireClaimRecord.PROV_ST = address.CountrySubdivisionNm;
                InspireClaimRecord.PROV_ZIP = address.PostalCd;
                InspireClaimRecord.PROVIDER_PHN_NUM = address.Phone;
            }
        }
        private void AddCheckPayableAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.CHK_PAYABLE_TO = address.DisplayName;
                InspireClaimRecord.MAIL_TO_ADDR1 = address.Line1Tx;
                InspireClaimRecord.MAIL_TO_ADDR2 = address.Line2Tx;
                InspireClaimRecord.MAIL_TO_CITY = address.MunicipalityNm;
                InspireClaimRecord.MAIL_TO_ST = address.CountrySubdivisionNm;
                InspireClaimRecord.MAIL_TO_ZIP = address.PostalCd;
            }
        }
        private void AddProviderNameAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.PROVIDER = address.DisplayName;
                InspireClaimRecord.PROVIDER_NAME = address.DisplayName;
                InspireClaimRecord.PROVIDER_PHN_NUM = address.Phone;
                InspireClaimRecord.PROVIDER_FAX_NO = address.FaxDetails;
            }
        }
        private void AddHospitalAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.HOSP_NAME = address.DisplayName;
                InspireClaimRecord.HOSP_ADDR1 = address.Line1Tx;
                InspireClaimRecord.HOSP_ADDR2 = address.Line2Tx;
                InspireClaimRecord.HOSP_ADDR3 = address.Line3Tx;
                InspireClaimRecord.HOSP_CTY = address.MunicipalityNm;
                InspireClaimRecord.HOSP_ST = address.CountrySubdivisionNm;
                InspireClaimRecord.HOSP_ZIP = address.PostalCd;
                InspireClaimRecord.HOSP_COUNTRY = address.Country;
            }
        }
        private void AddWitnessAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.WITNESS_NAME = address.DisplayName;
                InspireClaimRecord.WITNESS_PHN = address.Phone;
            }
        }       
        private void AddAuthorDetails()
        {
            if (WCCUserDataEntity.AuthorDetails != null)
            {
                var auth = WCCUserDataEntity.AuthorDetails;
                InspireClaimRecord.AUTH_NAME_CLOSING_FOR_MANUAL = auth.CompletedName;
                InspireClaimRecord.AUTHOR_NAME = auth.Name;
                InspireClaimRecord.AUTHOR_EMAIL = auth.Email;
                InspireClaimRecord.AUTHOR_FAX = auth.Fax;
                InspireClaimRecord.AUTHOR_TITL = auth.Title;
                InspireClaimRecord.AUTHOR_WORK_PHN = auth.WorkPhn;
                InspireClaimRecord.AUTHOR_WORK_EXT = auth.WorkExt;
                InspireClaimRecord.AUTHOR_CREDS = auth.Creds;
                InspireClaimRecord.AUTHOR_EXEC_IND = auth.ExecInd;
                InspireClaimRecord.AUTHOR_UID = auth.Uid;
                InspireClaimRecord.AUTHOR_UID_ARCH = auth.Uid_Arch;
            }
        }
        private void AddMiscInputDetails()
        {
            int index = 1;
            InspireClaimRecord.CMS_CASE_CNTRL_NO = string.IsNullOrEmpty(WCCUserDataEntity.CMSCaseCtrl) ? null : WCCUserDataEntity.CMSCaseCtrl;
            InspireClaimRecord.MPC_APPLICANT = string.IsNullOrEmpty(WCCUserDataEntity.MPCapplicant) ? null : WCCUserDataEntity.MPCapplicant;
            InspireClaimRecord.OUTSD_LAW_FIRM_NAME = string.IsNullOrEmpty(WCCUserDataEntity.OutsideLawFirmName) ? null : WCCUserDataEntity.OutsideLawFirmName;
            InspireClaimRecord.LAW_FIRM = string.IsNullOrEmpty(WCCUserDataEntity.LawFirmName) ? InspireClaimRecord.LAW_FIRM : WCCUserDataEntity.LawFirmName;
            InspireClaimRecord.CLM_PET_NUM_MANUAL= string.IsNullOrEmpty(WCCUserDataEntity.ClaimPetNumText) ? null : WCCUserDataEntity.ClaimPetNumText;

            WCCUserDataEntity?.Interrogatories?.ForEach(inter =>
            {
                PropertyInfo prop = InspireClaimRecord.GetType().GetProperty(string.Format("{0}{1}","INTERR_RCVR",index == 1? string.Empty:index.ToString()), BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                {
                    prop.SetValue(InspireClaimRecord, inter, null);
                }
                index++;
            });
        } 
        private void AddInsuredDetails()
        {
            var insured = Claim?.InvolvedParties.Where(p => p.Role.Contains(ApplicationConstants.Insured)).FirstOrDefault();
            var primaryAddress = insured.Addresses.Where(a => a.Type.ToDescritpionString() == ApplicationConstants.Primary).FirstOrDefault();
            var insAddress = insured.Addresses.Where(a => a.StreetAddress1 != null).FirstOrDefault();

            var address = GetAddress(ApplicationConstants.PolicyHolder, ApplicationConstants.Primary);
            if (address != null)
            {
                InspireClaimRecord.POL_HOL_ADDR_1 = address.StreetAddress1;
                InspireClaimRecord.POL_HOL_ADDR_2 = address.StreetAddress2;
                InspireClaimRecord.POL_HOL_ADDR_3 = address.StreetAddress3;
                InspireClaimRecord.POL_HOL_CTY = address.City;
                InspireClaimRecord.POL_HOL_ST = address.State;
                InspireClaimRecord.POL_HOL_ZIP = address.ZipCode;
                InspireClaimRecord.POL_HOL_COUNTRY = address.Country;
            }
            address = GetAddress(ApplicationConstants.Insured, ApplicationConstants.Primary);
            if (address != null)
            {
                InspireClaimRecord.INS_POL_HLD_NAME_1 = GetPolicyHolder(ApplicationConstants.Insured);
                InspireClaimRecord.INS_POL_HLD_NAME_2 = GetPolicyHolder(ApplicationConstants.SecondInsured);
                InspireClaimRecord.INS_ADDR_1 = address?.StreetAddress1;
                InspireClaimRecord.INS_ADDR_2 = address?.StreetAddress2;
                InspireClaimRecord.INS_ADDR_3 = address?.StreetAddress3;
                InspireClaimRecord.INS_CTY = address?.City;
                InspireClaimRecord.INS_ST = address?.State;
                InspireClaimRecord.INS_ZIP = address.ZipCode;
                InspireClaimRecord.INS_COUNTRY = address?.Country;
            }
            InspireClaimRecord.INS_PHN = GetPhone(false);
            InspireClaimRecord.INS_CONTACT_PHN = GetPhone(true);
            InspireClaimRecord.INS_CONTACT_EXT = GetExtension();
            InspireClaimRecord.INS_FEIN = insured?.TaxID;
            InspireClaimRecord.INS_ATTN = primaryAddress?.Attention;
        }

        private void AddClaimantDetails()
        {
            var claimant = Claim.InvolvedParties.Where(p => p.Role.Contains(ApplicationConstants.Claimant)).FirstOrDefault();
            var insured = Claim?.InvolvedParties.Where(p => p.Role.Contains(ApplicationConstants.Insured)).FirstOrDefault();
            var claimantAddress = claimant?.Addresses.Where(a => a.Type.ToDescritpionString() == ApplicationConstants.Primary).FirstOrDefault();
            var claimantPhone = claimant?.PhoneNumbers.Where(a => a.IsPrimary == true).FirstOrDefault();
            var claimantEmail = claimant?.EmailAddresses.Where(a => a.EmailAddressValue != null).FirstOrDefault();
            var insAddress = insured?.Addresses.Where(a => a.StreetAddress1 != null).FirstOrDefault();

            if (claimant != null)
            {
                if (!string.IsNullOrEmpty(WCCUserDataEntity.ClaimantName))
                    InspireClaimRecord.CLMT_NAME = WCCUserDataEntity.ClaimantName;
                else
                    InspireClaimRecord.CLMT_NAME = GetClaimantName();

                InspireClaimRecord.CLMT_FIRST_NAME = claimant.FirstName;
                InspireClaimRecord.CLMT_MIDDLE_NAME = claimant.MiddleName;
                InspireClaimRecord.CLMT_LAST_NAME = string.Format("{0} {1}", claimant.LastName, claimant.Suffix);
            }
            if (claimantAddress != null)
            {
                InspireClaimRecord.CLMT_ST_ADDR_1 = claimantAddress.StreetAddress1;
                InspireClaimRecord.CLMT_ST_ADDR_2 = claimantAddress.StreetAddress2;
                InspireClaimRecord.CLMT_ST_ADDR_3 = claimantAddress.StreetAddress3;
                InspireClaimRecord.CLMT_CTY = claimantAddress.City;
                InspireClaimRecord.CLMT_ST = claimantAddress.State;
                InspireClaimRecord.CLMT_ZIP = claimantAddress.ZipCode;
                InspireClaimRecord.CLMT_COUNTY = claimantAddress.County;
                InspireClaimRecord.CLMT_COUNTRY = claimantAddress.Country;
            }
            if (claimantPhone != null)
            {
                InspireClaimRecord.CLMT_PHN = String.Format("({0}) {1}-{2}", claimantPhone.AreaCode, claimantPhone.Exchange, claimantPhone.Number);
                InspireClaimRecord.CLMT_PHN_NO_EXT = claimantPhone.Extension;
            }
            InspireClaimRecord.CLMT_GENDER = claimant?.Gender;
            InspireClaimRecord.CLMT_MARITAL_STATUS = claimant?.MaritalStatus;
            InspireClaimRecord.CLMT_SOC_SEC_NO = claimant?.TaxID;
            InspireClaimRecord.CLMT_BIRTH_DT = ConvertDateFormat(claimant?.BirthDate);
            InspireClaimRecord.CLMT_DEATH_DT = ConvertDateFormat(claimant?.DeathDate);
            InspireClaimRecord.CLMT_OCCUPATION = claimant?.OccupationDescription;
            InspireClaimRecord.CLMT_EMAIL = claimantEmail?.EmailAddressValue;
            InspireClaimRecord.IND_MED_FACIL_NAME = GetRoleName(ApplicationConstants.IndustrialMedicineFacility);
            InspireClaimRecord.LAW_FIRM = GetRoleName(ApplicationConstants.PetitionersLawFirm);

            InspireClaimRecord.CLMT_EMPLOYER_ADDR = insAddress?.StreetAddress1;
            InspireClaimRecord.CLMT_EMPLOYER_CTY = insAddress?.City;
            InspireClaimRecord.CLMT_EMPLOYER_ST = insAddress?.State;
            InspireClaimRecord.CLMT_EMPLOYER_ZIP = insAddress?.ZipCode;
            InspireClaimRecord.DT_OF_SERVICE = ConvertDateFormat(WCCUserDataEntity.DateOfService, "MMMM dd, yyyy");
            InspireClaimRecord.EXAM_TIME = ConvertDateFormat(WCCUserDataEntity.TimeOfService, "hh:mm tt");
            InspireClaimRecord.CLMT_EXAM_DAY = ConvertDateFormat(WCCUserDataEntity.DateOfService, "dddd");

        }
        private void AddClaimPetitionNoDetails()
        {
            WCCUserDataEntity?.ClaimPetNumList?.ForEach(cl =>
            {
                WCC_DATARECORD_DELIMCLM_PETITION_NO_REC claim = new WCC_DATARECORD_DELIMCLM_PETITION_NO_REC();
                claim.CLM_FK = GetConfigValue(nameof (claim.CLM_FK));
                claim.CLM_PETITION_NO = cl;
                InspireRecordDelim.CLM_PETITION_NO_REC.Add(claim);
            });
        }
        private void AddMultipleProvider(List<AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address> addresses)
        {
            addresses?.ForEach(action =>
            {
                WCC_DATARECORD_DELIMMULTIPLE_PROVIDER provider = new WCC_DATARECORD_DELIMMULTIPLE_PROVIDER();
                provider.PROVIDER_NM_MULTI = action?.DisplayName;
                provider.PROVIDER_PHN_NUM_MULTI = action?.Phone;
                provider.PROVIDER_ST_ADD_1_MULTI = action?.Line1Tx;
                provider.PROVIDER_ST_ADD_2_MULTI = action?.Line2Tx;
                provider.PROVIDER_ST_ADD_3_MULTI = action?.Line3Tx;
                provider.PROVIDER_CTY_MULTI = action?.MunicipalityNm;
                provider.PROVIDER_ST_MULTI = action?.CountrySubdivisionNm;
                provider.PROVIDER_ZIP_MULTI = action?.PostalCd;
                provider.CLM_FK = GetConfigValue(nameof(provider.CLM_FK));
                InspireRecordDelim.MULTIPLE_PROVIDER.Add(provider);
            });
        }
        private void AddReSectionOption(string optName, string optValue)
        {
            if (!string.IsNullOrEmpty(optValue))
            {
                WCC_DATARECORD_DELIMWCC_RE_OPT reOpt = new WCC_DATARECORD_DELIMWCC_RE_OPT();
                reOpt.CLM_FK = GetConfigValue(nameof(reOpt.CLM_FK));
                reOpt.RE_OPT_NAME = optName;
                reOpt.RE_OPT_VAL = optValue;
                InspireRecordDelim.WCC_RE_OPT.Add(reOpt);
            }
        }
        private void AddInjuryBodyPart()
        {
            var bodyParts = Claim?.Incidents.SelectMany(i => i.InjuredBodyParts);
            foreach (var part in bodyParts)
            {
                WCC_DATARECORD_DELIMAFF_BODY_PART bodyPart = new WCC_DATARECORD_DELIMAFF_BODY_PART();
                bodyPart.CLM_FK = GetConfigValue(nameof(bodyPart.CLM_FK));
                bodyPart.BODY_PART = part.DetailedBodyPart;
                bodyPart.BODY_PART_CD = part.DetailedBodyPartCode;
                bodyPart.PRIMARY_IND = part.PrimaryBodyPartIndicator ? ApplicationConstants.YES:ApplicationConstants.NO;
                InspireRecordDelim.AFF_BODY_PART.Add(bodyPart);
            }
        }
        private void AddDenialDetails()
        {
            WCCUserDataEntity.ReasonsForDenial?.ForEach(d =>
            {
                WCC_DATARECORD_DELIMDENIAL denial = new WCC_DATARECORD_DELIMDENIAL();
                denial.CLM_FK = GetConfigValue(nameof(denial.CLM_FK));
                denial.REASON_DENIAL = d;
                InspireRecordDelim.DENIAL.Add(denial);
            });
        }
        private void AddCC()
        {
            WCCUserDataEntity?.CCDetails?.ForEach(x =>
            {
                WCC_DATARECORD_DELIMWCC_CC_OPT reOpt = new WCC_DATARECORD_DELIMWCC_CC_OPT();
                reOpt.CLM_FK = GetConfigValue(nameof(reOpt.CLM_FK));
                reOpt.CC_REF = x.References;
                reOpt.CC_BCC_IND = x.BCCEnabled;
                reOpt.CC_ADDRESSEE_NAME = x.Name;
                reOpt.CC_ADDRESSEE_ADDR_1 = x?.Address?.Addr1;
                reOpt.CC_ADDRESSEE_ADDR_2 = x?.Address?.Addr2;
                reOpt.CC_ADDRESSEE_CTY = x?.Address?.City;
                reOpt.CC_ADDRESSEE_ST = x?.Address?.State;
                reOpt.CC_ADDRESSEE_ZIP = x?.Address?.Zip;
                reOpt.CC_ADDRESSEE_POSTNET_INFO = x?.Address?.PostNet;
                InspireRecordDelim.WCC_CC_OPT.Add(reOpt);
            });
            if (!string.IsNullOrEmpty(WCCUserDataEntity?.RecipientCC))
                InspireClaimRecord.CC_RECIPIENT2 = WCCUserDataEntity?.RecipientCC;
        }
        private void AddDME()
        {
            WCCUserDataEntity?.DMEs?.ForEach(x =>
            {
                WCC_DATARECORD_DELIM_DME_DATA dme = new WCC_DATARECORD_DELIM_DME_DATA();
                dme.CLM_FK = GetConfigValue(nameof(dme.CLM_FK));
                dme.EQUIP_STATUS = x.EquipmentStatus;
                dme.EQUIP_DETAILS = x.EquipmentDetails;
                dme.DME_NOTES = x.DMENotes;
                InspireRecordDelim.DME.Add(dme);
            }); 
        }
        private void AddPhysicalTherapy()
        {
            if (WCCUserDataEntity.PhysicalTherapyInfo != null)
            {
                var pt = InspireRecordDelim.PHYSICAL_THERAPY;
                var ptUser = WCCUserDataEntity.PhysicalTherapyInfo;
                pt.SERVICE = ptUser.Service;
                pt.PRIMARY_BODY_PART = ptUser.PrimaryBodyPart;
                pt.DETAILED_BODY_PART = ptUser.DetailedBodyPart;
                pt.CERTIFICATION = ptUser.Cerrification;
                pt.REQUESTED_VISITS = ptUser.RequestedVisits;
                pt.TOTAL_VISITS = ptUser.TotalVisits;
                pt.AUTH_NUM_VISITS = ptUser.AutherNumberVisits;
                pt.APPROVAL_STATUS = ptUser.AprovalStatus;
                pt.DIAGNOSIS_CODE = ptUser.DiagnosisCode;
                pt.CLM_FK = GetConfigValue(nameof(pt.CLM_FK));
            }
        }
        private void AddTreatmentDetails()
        {
            WCCUserDataEntity?.AdditionalTreatment?.ForEach(x =>
            {
                WCC_DATARECORD_TRTMNT_PARENT_REC_DATA dme = new WCC_DATARECORD_TRTMNT_PARENT_REC_DATA();
                dme.CLM_FK = GetConfigValue(nameof(dme.CLM_FK));
                dme.INFO_ADD_TRTMNT = x;
                InspireRecordDelim.INFO_ADD_TRTMNT_PARENT_REC.Add(dme);
            });
            if (!string.IsNullOrEmpty(WCCUserDataEntity?.AdditionalTreatmentOther))
            {
                WCC_DATARECORD_TRTMNT_PARENT_REC_DATA dme = new WCC_DATARECORD_TRTMNT_PARENT_REC_DATA();
                dme.CLM_FK = GetConfigValue(nameof(dme.CLM_FK));
                dme.INFO_ADD_TRTMNT = ApplicationConstants.Other;
                dme.OTH_INFO_ADD_TRTMNT = WCCUserDataEntity?.AdditionalTreatmentOther;
                InspireRecordDelim.INFO_ADD_TRTMNT_PARENT_REC.Add(dme);
            }
        }
        private void AddOverPaymentDetails()
        {
            WCCUserDataEntity?.OverPaymentReason?.ForEach(x =>
            {
                WCC_DATARECORD_OVER_PAYMENT_REC_DATA dme = new WCC_DATARECORD_OVER_PAYMENT_REC_DATA();
                dme.CLM_FK = GetConfigValue(nameof(dme.CLM_FK));
                dme.OVERPYMNT_REASON = x;
                InspireRecordDelim.OVERPAYMENT_PARENT_REC.Add(dme);
            });
            if (!string.IsNullOrEmpty(WCCUserDataEntity?.OverPaymentOther))
            {
                WCC_DATARECORD_OVER_PAYMENT_REC_DATA dme = new WCC_DATARECORD_OVER_PAYMENT_REC_DATA();
                dme.CLM_FK = GetConfigValue(nameof(dme.CLM_FK));
                dme.OVERPYMNT_REASON = ApplicationConstants.Other;
                dme.OTH_OVERPYMNT_REASON = WCCUserDataEntity?.OverPaymentOther;
                InspireRecordDelim.OVERPAYMENT_PARENT_REC.Add(dme);
            }
        }
        private void AddMultiOverPaymentDetails()
        {
            WCCUserDataEntity?.OverPayCheck?.ForEach(x =>
            {
                WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA dme = new WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA();
                dme.CLM_FK = GetConfigValue(nameof(dme.CLM_FK));
                dme.CHK_NO_MULTI = x.Number;
                dme.CHK_DT_MULTI = ConvertDateFormat(x.Date);
                dme.CHK_AMT_MULTI = x.Amount;
                dme.DT_SERVICE_MULTI = ConvertDateFormat(x.DateOfService);
                dme.CHK_OVERPYMT_AMT_MULTI = x.Overpayment;
                InspireRecordDelim.MULTI_OVERPAYMENT_REC.Add(dme);
            });
            if (InspireRecordDelim.MULTI_OVERPAYMENT_REC.Count > 1 && WCCUserDataEntity.TotalCheckAmount > 0)
            {
                WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA dme = new WCC_DATARECORD_MULTI_OVERPAYMENT_REC_DATA();
                dme.CLM_FK = GetConfigValue(nameof(dme.CLM_FK));
                dme.TOT_CHK_AMT = ConvertAmountFormat(WCCUserDataEntity.TotalCheckAmount);
                InspireRecordDelim.MULTI_OVERPAYMENT_REC.Add(dme);
            }
        }    
        private void AddEmail()
        {
            InspireClaimRecord.EMAIL_IND = WCCUserDataEntity.EmailAddress is null ? null : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(WCCUserDataEntity.EmailAddress))
            {
                InspireClaimRecord.EMAIL_TO = WCCUserDataEntity.EmailAddress;
                InspireClaimRecord.EMAIL_IND = ApplicationConstants.YES;
                InspireClaimRecord.NJM_ENCRYPT = WCCUserDataEntity.EmailEncrypted ? ApplicationConstants.NJMEnCrypt : null;

                InspireClaimRecord.EMAIL_SUBJECT = string.IsNullOrEmpty(WCCUserDataEntity.EmailSubject) ? null: WCCUserDataEntity.EmailSubject;
                InspireClaimRecord.EMAIL_FROM = string.IsNullOrEmpty(WCCUserDataEntity.EmailFromAddress) ? null: WCCUserDataEntity.EmailFromAddress;
            }
        }
        private void AddFax()
        {
            InspireClaimRecord.FAX_IND = WCCUserDataEntity.FaxAddress is null ? null : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(WCCUserDataEntity.FaxAddress))
            {
                InspireClaimRecord.FAX_TO = WCCUserDataEntity.FaxAddress;
                InspireClaimRecord.FAX_IND = ApplicationConstants.YES;

                InspireClaimRecord.FAX_SUBJECT = string.IsNullOrEmpty(WCCUserDataEntity.FaxSubject) ? null : WCCUserDataEntity.FaxSubject;
                InspireClaimRecord.FAX_FROM = InputQueryParameters.UserDetails.UserEmail;
            }
        }
        private void AddAdmissionDetails()
        {
            List<AdhocCorrespondenceEditor.Shared.WCC.Procedure> procedures = new List<AdhocCorrespondenceEditor.Shared.WCC.Procedure>();

            if (WCCUserDataEntity.PrecertDetails != null)
            {
                var preCertify = WCCUserDataEntity.PrecertDetails;
                InspireClaimRecord.ADMISS_STATUS = preCertify.AdmissionStatus;
                InspireClaimRecord.PROVIDE_TAX_ID_AUTO = preCertify.ProvidertaxNumber;
                InspireClaimRecord.SURGERY_DT = preCertify.PreSurgeryDate;
                InspireClaimRecord.SURGERY_STATUS = preCertify.PreAuthorizedStatus;
                InspireClaimRecord.PROVIDER_NAME = preCertify.ProviderName;
                InspireClaimRecord.FACIL_NAME = preCertify.FacilityName;

                WCCUserDataEntity.PrecertDetails?.PrecertProcedureList.ForEach(x =>
                {
                    var proc = new WCC_DATARECORD_PROCEDURE_REC_DATA();
                    proc.CLM_FK = GetConfigValue(nameof(proc.CLM_FK));
                    proc.TABLE_TYPE = "Assist_CoSurg";
                    proc.ASSIST_TYPE = x.AssistantType;
                    proc.COSURG_STATUS = x.CoSurgeonStatus;
                    proc.PROCED_CODES = x.ProcedureCode;
                    proc.ASSIST_STATUS = x.AssistantStatus;
                    InspireRecordDelim.PROCEDURE.Add(proc);
                });

                var percets =  Claim?.Precertifications?.ToList()?.Where(x => x.PreCertificationNumber == WCCUserDataEntity?.PrecertDetails?.PreCertificationNumbe);
                foreach (var percet in percets)
                    procedures.AddRange(percet.Procedures);

                procedures?.ForEach(x =>
                {
                    var proc = new WCC_DATARECORD_PROCEDURE_REC_DATA();
                    proc.CLM_FK = GetConfigValue(nameof(proc.CLM_FK));
                    proc.TABLE_TYPE = "Provider";
                    proc.PROCED_CODES = x.ProcedureCode;
                    proc.PROVIDE_STATUS = x.ProviderStatus;
                    InspireRecordDelim.PROCEDURE.Add(proc);
                });
            }
        }
        private void AddReferredDetails()
        {
            if (WCCUserDataEntity.ReferredDetails != null)
            {
                var address = WCCUserDataEntity.ReferredDetails;
                InspireClaimRecord.REFERRED_BY = address.DisplayName;
                InspireClaimRecord.NJM_ATTNY_PHN = address.Phone;
                InspireClaimRecord.NJM_ATTNY_FAX = address.FaxDetails;
                InspireClaimRecord.NJM_ATTNY_EXT = address.PhoneExtension;
            }
        }
        private void AddChartDataDetails()
        {
            int chartNum = 0;
            WCCUserDataEntity.CharDetailsList?.ForEach(x =>
            {
                int index = 0;
                chartNum++;
                foreach (var label in x.Lable)
                {
                    var value = index < x.Value.Count ? x.Value[index] : null;
                    if (!string.IsNullOrEmpty(value) && !string.IsNullOrEmpty(label))
                    {
                        WCC_DATARECORD_DELIMNJM_CHART_DATA chart = new WCC_DATARECORD_DELIMNJM_CHART_DATA();
                        if (index == 0)
                            chart.CHART_TITLE = x.Chartlable;
                        chart.CHART_NO = Convert.ToString(chartNum);
                        chart.CHART_LABEL = label;
                        chart.CHART_VALUE = value;
                        chart.CLM_FK = GetConfigValue(nameof(chart.CLM_FK));
                        InspireRecordDelim.NJM_CHART_DATA.Add(chart);
                    }
                    index++;
                }
            });
            if (chartNum > 0)
                InspireClaimRecord.NO_CHARTS = chartNum.ToString();
        }
        private void AddFiveProviderDetails()
        {
            int index = 0;
            WCCUserDataEntity.FiveProviderDetails?.ForEach(x =>
            {
                //use reflection to set the property that comes from database row.
                var secongPartTag = string.Format("{0}{1}", "_", index); 
                var tagProvider = string.Format("{0}{1}", "PROVIDER", index == 0 ? string.Empty : secongPartTag);
                PropertyInfo prop = InspireClaimRecord.GetType().GetProperty(tagProvider, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord,x.DisplayName);

                var tagProviderAddr1 = string.Format("{0}{1}", "PROV_ST_ADDR1", index == 0 ? string.Empty : secongPartTag);
                prop = InspireClaimRecord.GetType().GetProperty(tagProviderAddr1, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, x.Line1Tx);

                var tagProviderAddr2 = string.Format("{0}{1}", "PROV_ST_ADDR2", index == 0 ? string.Empty : secongPartTag);
                prop = InspireClaimRecord.GetType().GetProperty(tagProviderAddr2, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, x.Line2Tx);

                var tagProviderAddr3 = string.Format("{0}{1}", "PROV_ST_ADDR3", index == 0 ? string.Empty : secongPartTag);
                prop = InspireClaimRecord.GetType().GetProperty(tagProviderAddr3, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, x.Line3Tx);

                var tagProviderCity = string.Format("{0}{1}", "PROV_CTY", index == 0 ? string.Empty : secongPartTag);
                prop = InspireClaimRecord.GetType().GetProperty(tagProviderCity, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, x.MunicipalityNm);

                var tagProviderSt = string.Format("{0}{1}", "PROV_ST", index == 0 ? string.Empty : secongPartTag);
                prop= InspireClaimRecord.GetType().GetProperty(tagProviderSt, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, x.CountrySubdivisionNm);

                var tagProviderZip = string.Format("{0}{1}", "PROV_ZIP", index == 0 ? string.Empty : secongPartTag);
                prop= InspireClaimRecord.GetType().GetProperty(tagProviderZip, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, x.PostalCd);

                var tagProviderPhone = string.Format("{0}{1}", "PROVIDER_PHN_NUM", index == 0 ? string.Empty : secongPartTag);
                prop= InspireClaimRecord.GetType().GetProperty(tagProviderPhone, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, x.Phone);

                index++;
            });
        }
        private void AddSurgeryIndicators()
        {
            if (!string.IsNullOrEmpty(WCCUserDataEntity.SurgeryCommentsAdditionalInformation))
                InspireClaimRecord.SURGERY_COMMENTS_ADDL_INFO = WCCUserDataEntity.SurgeryCommentsAdditionalInformation;
            
            if (WCCUserDataEntity.SurgicalLst != null)
            {
                PropertyInfo prop = null;
                foreach (var surgeryComment in WCCUserDataEntity.SurgicalLst)
                {
                    prop = InspireClaimRecord.GetType().GetProperty(surgeryComment.Key, BindingFlags.Public | BindingFlags.Instance);
                    if (null != prop && prop.CanWrite)
                        prop.SetValue(InspireClaimRecord, surgeryComment.Value ? ApplicationConstants.YES : ApplicationConstants.NO, null);
                }
            }
        }
        private void AddCheckAmount()
        {
            PropertyInfo prop = null;
            int index = 1;
            foreach (var check in WCCUserDataEntity.CheckAmount ?? Enumerable.Empty<string>())
            {
                var tagName = String.Format("{0}_{1}", "CHK_AMT",index);
                prop = InspireClaimRecord.GetType().GetProperty(tagName, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                    prop.SetValue(InspireClaimRecord, check, null);
                index++;
            }
        }
        private string GetPolicyHolder( string role)
        {
            var nameInsured = Claim.InvolvedParties.Where(p => p.Role.Contains(role));
            if (nameInsured.Any())
            {
                var person = nameInsured.Where(p => p.Type.ToDescritpionString() == ApplicationConstants.Person);
                if (person.Any()) //person
                {
                    return String.Format("{0} {1} {2} {3}", 
                         nameInsured.FirstOrDefault()?.FirstName,
                         nameInsured.FirstOrDefault()?.MiddleName,
                         nameInsured.FirstOrDefault()?.LastName,
                         nameInsured.FirstOrDefault()?.Suffix
                         );
                }
                person = nameInsured.Where(p => p.Type.ToDescritpionString() == ApplicationConstants.Company);
                if (person.Any()) //Organization
                {
                    return nameInsured.FirstOrDefault()?.Name;
                }
            }
            return null;
        }
        private string GetPhone( bool formatted = false)
        {
            var insured = Claim?.InvolvedParties.Where(p => p.Role.Contains(ApplicationConstants.Insured));
            var partyPhoneNumber = insured.SelectMany(p => p?.PhoneNumbers?.Where(p => p.IsPrimary == true)).FirstOrDefault();

            if (partyPhoneNumber != null)
            {
                var areaCode = partyPhoneNumber.AreaCode;
                var exchangeCode = partyPhoneNumber.Exchange;
                var lineCode = partyPhoneNumber.Number;

                if (areaCode != null && exchangeCode != null && lineCode != null)
                if (!formatted)
                    return String.Format("{0} {1} {2}", areaCode, exchangeCode, lineCode);
                else
                   return String.Format("({0}) {1}-{2}", areaCode, exchangeCode, lineCode);
            }
            return null;
        }
        private string GetTotalAmount(string accounType, string reportingCategory, string parentReportingCategoryCd = ApplicationConstants.Claim)
        {
            var finance = Claim?.FinancialReports.SelectMany(f => f.FinancialReportLineItems.Where(ff => ff.AccountTypeCd.ToDescritpionString() == accounType && ff.ReportingCategoryCd.ToDescritpionString() == reportingCategory && ff.ParentReportingCategoryCd == parentReportingCategoryCd)).FirstOrDefault();
            return finance != null ? ConvertAmountFormat(finance.Amount) : null;
        }
        private AdhocCorrespondenceEditor.Shared.WCC.Address GetAddress(string role, string type)
        {
            var polHolder = Claim.InvolvedParties.Where(p => p.Role.Contains(role));
            var address = polHolder.SelectMany(p => p.Addresses.Where(a => a.Type.ToDescritpionString() == type));
            return address.FirstOrDefault();
        }
        private string GetClaimantName()
        {
            var name = Claim?.InvolvedParties.Where(p => p.Role.Contains(ApplicationConstants.Claimant)).FirstOrDefault();
            return name == null ? null: string.Format("{0} {1} {2} {3}", name?.FirstName, name?.MiddleName, name?.LastName, name?.Suffix);
        }
        private string GetRoleName(string role)
        {
            var polHolder = Claim.InvolvedParties.Where(p => p.Role.Contains(role)).FirstOrDefault();
            return polHolder?.Name;
        }
        private string GetInsuredContact()
        {
            var polHolder = Claim.InvolvedParties.Where(p => p.PartyRelationships.Any(r => r.Relationship == "Primary Contact")).FirstOrDefault();
            return string.Format("{0} {1}", polHolder?.FirstName, polHolder?.LastName);
        }
        private string GetExtension()
        {
            var insured = Claim?.InvolvedParties.Where(p => p.Role.Contains(ApplicationConstants.Insured));
            var partyPhoneNumber = insured.SelectMany(p => p?.PhoneNumbers?.Where(p => p.IsPrimary == true)).FirstOrDefault();
            return partyPhoneNumber?.Extension;
        }
    }
}
