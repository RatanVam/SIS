using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.GC;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.Extentions;
using AdhocCorrespondenceEditor.Shared.GC;
using System.Reflection;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public class GCInspireBuilder : InspireBuilderBase
    {
        protected GCInspireEntity GCInspireEntity { get; set; }
        private GCUserEntity GCUserDataEntity { get; set; }
        private GCSourceSystemEntity GCSourceSystemEntity { get; set; }
        private CUSTOMER_DATARECORD_DELIMNJM_CLAIM_REC InspireClaimRecord;
        private CUSTOMER_DATARECORD_DELIM InspireRecordDelim;
        private string GC_Date_Formt = "MMMM d, yyyy";
        protected Claim Claim;
        protected Policy ClaimPolicy;

        protected override void CreateInspireRequest()
        {
            GCUserDataEntity = (GCUserEntity)UserInputData;
            GCSourceSystemEntity = (GCSourceSystemEntity)SourceSystemData;
            GCInspireEntity = new GCInspireEntity();

            InspireClaimRecord = GCInspireEntity.CustomerData.RECORD_DELIM.NJM_CLAIM_REC;
            InspireRecordDelim = GCInspireEntity.CustomerData.RECORD_DELIM;

            Claim = GCSourceSystemEntity?.Claim;
            ClaimPolicy = GCSourceSystemEntity.Claim?.ClaimPolicy;
        }
        protected override void ProcessUserInputData()
        {
            AddGeneralInputDetails();
            AddAddressDetails();
            AddAuthorDetails();
            AddResectionDetails();
            AddExposureDetails();
            AddGCVehDetails();
            AddClaimantVehDetails();
            AddComunicationDetails();
            AddParagraphDetails();
            AddMiscallaneousDetails();
            AddPreCertificationDetails();
            AddMultiOverPaymentDetails();
            AddAuditDelayDetails();
            AddSpecificRequiredInformation();
        }
        protected override void ProcessPolicyAndAccountRecord()
        {
            AddClaimGeneralDetails();
            AddClaimDatesAndAmounts();
            AddInsuranceDetails();
            AddInsuredDetails();
            AddClaimantDetails();
            AddRecordDelimTags();
        }
        private void AddAddressDetails()
        {
            AddPrimaryAddress(GCUserDataEntity.PrimaryAddresseeAddress);
            AddAttornyAddress(GCUserDataEntity.AttorneyNameAndAddress);
            AddClaimantAddress(GCUserDataEntity.ClaimantNameAddress);
            AddApplicantBenefitAddress(GCUserDataEntity.ApplicantBenefits);
            AddTrainingPhysicianAddress(GCUserDataEntity.PhysicianNmAndAddress);
            AddNJMHireAddress(GCUserDataEntity.NjmHiredName);
            AddMinorAddress(GCUserDataEntity.MinorDetails);
            AddVehicleOwnerAddress(GCUserDataEntity.VehicleOwnerAndAddress);
            AddAgencyAddress(GCUserDataEntity.AgencyNameAndAddress);
        }
        private void AddComunicationDetails()
        {
            AddPrinter(GCUserDataEntity, InspireClaimRecord);
            AddEmail();
            AddFax();
            AddPrintInd();
            AddCC();
        }
        private void AddPreCertificationDetails()
        {
            var record = InspireRecordDelim.PRECERT_CODE_REC;
            if (GCUserDataEntity.PrecertDetails != null)
            {
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK));
                record.PRECERT_ID = GCUserDataEntity.PrecertDetails?.ID;
            }
            if (GCUserDataEntity.PrecertDetailsComplete != null)
            {
                var preCertList = GCUserDataEntity.PrecertDetailsComplete;
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK));
                record.PRECERT_ID = preCertList?.ID;
                record.PRECERT_START_DATE = ConvertDateFormat(preCertList?.StartDate, ApplicationConstants.DateFormat_YMD);
                record.PRECERT_END_DATE = ConvertDateFormat(preCertList?.EndDate, ApplicationConstants.DateFormat_YMD);
                preCertList?.Determints.ForEach(Determint =>
                {
                    GC_DATARECORD_DETERMNT_ID_REC deterRecord = new GC_DATARECORD_DETERMNT_ID_REC();
                    deterRecord.CLM_FK = GetConfigValue(nameof(deterRecord.CLM_FK));
                    deterRecord.TOTAL_TREAT_APPR = Determint.TotalTreatmentsApproved.ToString();
                    deterRecord.TRMNT_REASON = Determint.TreatmentReason;
                    deterRecord.TRMNT_STATUS = Determint.TreatmentStatus;
                    deterRecord.APPEAL_STATUS = Determint.PresentStatus.ToString().ToLower();
                    deterRecord.DETERMNT_CODE = Determint.Code;
                    InspireRecordDelim.DETERMNT_ID_REC.Add(deterRecord);

                    Determint?.Procedures.ForEach(Procedure =>
                    {
                        GC_DATARECORD_PROCEDURE_CODE_REC proceRecord = new GC_DATARECORD_PROCEDURE_CODE_REC();
                        proceRecord.PRECERT_START_CODE = Procedure.StartCode;
                        proceRecord.PRECERT_END_CODE = Procedure.EndCode;
                        proceRecord.CLM_FK = GetConfigValue(nameof(proceRecord.CLM_FK));
                        proceRecord.DETERMNT_CODE_PROC = Procedure.DeterminationId;
                        proceRecord.PRECERT_ID_PROC = Procedure.PrecertificationId;
                        proceRecord.PRECERT_USER_DEF_GROUP = Procedure.UserDefinedGroup;
                        InspireRecordDelim.PROCEDURE_CODE_REC.Add(proceRecord);
                    });
                });
            }
            if (GCUserDataEntity.PrecertDetailsComplete != null)
            {
                var precert = GCUserDataEntity.PrecertDetailsComplete;
                InspireClaimRecord.PROVIDER_SYS = precert.ProviderSys;
                InspireClaimRecord.PROVIDER_PHONE = precert.providerPhn;
                InspireClaimRecord.DETMNTN_OB_KW = precert.TreatmntStatus;
                InspireClaimRecord.PRECERT_ID_OB_KW = precert.OBKW;
                InspireClaimRecord.SERVICE_DT_CAL = ConvertDateFormat(precert.ServiceDate);
            }
        }
        private void AddMultiOverPaymentDetails()
        {
            GCUserDataEntity.OverPayCheck?.ForEach(OverPayCheck =>
            {
                GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC record = new GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC();
                record.CHK_NO_MULTI = OverPayCheck.Number;
                record.CHK_DT_MULTI = ConvertDateFormat(OverPayCheck.Date);
                record.CHK_AMT_MULTI = OverPayCheck.Amount;
                record.DT_SERVICE_MULTI = ConvertDateFormat(OverPayCheck.DateOfService);
                record.CHK_OVERPYMT_AMT_MULTI = OverPayCheck.Overpayment;
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK));
                InspireRecordDelim.MULTI_OVERPAYMENT_REC.Add(record);
            });
            if (GCUserDataEntity.OverPayCheck?.Count > 1)
            {
                GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC record = new GC_DATARECORD_MULTI_OVERPAYMENT_CODE_REC();
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK));
                record.TOT_CHK_AMT = GCUserDataEntity.OverPayCheck.Sum(o => double.Parse(string.IsNullOrEmpty(o.Overpayment) ? "0" : o.Overpayment)).ToString();
                InspireRecordDelim.MULTI_OVERPAYMENT_REC.Add(record);
            }
        }
        private void AddAuditDelayDetails()
        {
            if (GCUserDataEntity.AuditDelayLst != null)
                foreach (var item in GCUserDataEntity.AuditDelayLst)
                {
                    PropertyInfo prop = InspireClaimRecord.GetType().GetProperty(item.Key, BindingFlags.Public | BindingFlags.Instance);
                    var value = item.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
                    if (null != prop && prop.CanWrite)
                    {
                        prop.SetValue(InspireClaimRecord, value, null);
                    }
                }
        }
        private void AddResectionDetails()
        {
            if (GCUserDataEntity.ReSectionDetails != null)
            {
                var reSection = GCUserDataEntity.ReSectionDetails;
                CUSTOMER_DATARECORD_DELIMNJM_RE_OPT reOpSection;
                if (!string.IsNullOrEmpty(reSection.LossLocation))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.LossLoc;
                    reOpSection.RE_OPT_VAL = reSection.LossLocation;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.YourClaimNo))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.YourClaimNo;
                    reOpSection.RE_OPT_VAL = reSection.YourClaimNo;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.YourPolicyNo))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.YourPolicyNo;
                    reOpSection.RE_OPT_VAL = reSection.YourPolicyNo;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.YourInsured))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.YourInsuredNo;
                    reOpSection.RE_OPT_VAL = reSection.YourInsured;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.YourClient))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.YourClientNo;
                    reOpSection.RE_OPT_VAL = reSection.YourClient;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.CaseCaption))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.CaseCaption;
                    reOpSection.RE_OPT_VAL = reSection.CaseCaption;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.YourFileNo))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.YourFileno;
                    reOpSection.RE_OPT_VAL = reSection.YourFileNo;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.DateofService))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.DateOfService;
                    reOpSection.RE_OPT_VAL = reSection.DateofService;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
                if (!string.IsNullOrEmpty(reSection.Claimant))
                {
                    reOpSection = new CUSTOMER_DATARECORD_DELIMNJM_RE_OPT();
                    reOpSection.CLM_FK = GetConfigValue(nameof(reOpSection.CLM_FK));
                    reOpSection.RE_OPT_NAME = ApplicationConstants.Yourclaimant;
                    reOpSection.RE_OPT_VAL = reSection.Claimant;
                    InspireRecordDelim.NJM_RE_OPT.Add(reOpSection);
                }
            }
        }
        private void AddExposureDetails()
        {
            var exposure = GCUserDataEntity.ExposureDetails;
            if (exposure != null)
            {
                InspireClaimRecord.EXPOSURE_NAME = exposure.Name;
                if (exposure.Name.Equals(ApplicationConstants.No_Coverage))
                    InspireClaimRecord.CLMT_ID = "0"; // Req: send 0 for No ocverage selection
                else
                    InspireClaimRecord.CLMT_ID = exposure.ClaimentID;
                InspireClaimRecord.EXPOSURE_TYPE = exposure.ExposureType;
                InspireClaimRecord.EXPOSURE_NUM = exposure.ExposureNumber.ToString().PadLeft(4, '0');
                InspireClaimRecord.JURISDICTION_STATE_AUTO = exposure.JurisdictionState;
                InspireClaimRecord.POL_DED_AUTO = exposure.Deductible;
                InspireClaimRecord.VEH_ACTUAL_CASH_VAL = exposure.txtCashValue;
                InspireClaimRecord.VEH_OLD_DAMAGE_AMT = exposure.OldDamageAmt;
                InspireClaimRecord.SALV_SUB_TOTL = exposure.SalvageSubTotal;

                InspireClaimRecord.TAX_AMT = exposure.TaxAmount;
                InspireClaimRecord.SALV_VALUE = exposure.SalvageValue;
                InspireClaimRecord.SALV_PD_DED = exposure.SalvagePDDed;
                InspireClaimRecord.SALV_OTHER = exposure.SalvageOther;
                InspireClaimRecord.SALV_NET_SETTL = exposure.SalvageNetSet;
                InspireClaimRecord.SALV_VEH_YEAR = exposure.SalvageVehYear;
                InspireClaimRecord.SALV_VEH_MAKE = exposure.SalvageVehMake;
                InspireClaimRecord.SALV_VEH_MODEL = exposure.SalvageVehModel;
                InspireClaimRecord.TOTL_LOSS_EST_AMT = exposure.TotalLossEst;
                InspireClaimRecord.SALV_TYPE_LOSS = exposure.SalvageTypeLoss;
                InspireClaimRecord.REPRESENT_STATUS = exposure.Represented ? "Represented" : "Not Represented";

            }
        }
        private void AddGCVehDetails()
        {
            var veh = GCUserDataEntity.Vehicle;
            if (veh != null)
            {
                InspireClaimRecord.VEH_YR = veh.Year;
                InspireClaimRecord.VEH_MK = veh.Make;
                InspireClaimRecord.VEH_MDL = veh.Model;
                InspireClaimRecord.VEH_VIN = veh.VIN;
            }
        }
        private void AddClaimantVehDetails()
        {
            var veh = GCUserDataEntity.VehicleClaimant;
            if (veh != null)
            {
                InspireClaimRecord.CLMT_VEH_YR = veh.Year;
                InspireClaimRecord.CLMT_VEH_MK = veh.Make;
                InspireClaimRecord.CLMT_VEH_MDL = veh.Model;
                InspireClaimRecord.CLMT_VEH_VIN = veh.VIN;
            }
        }
        private void AddPrimaryAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.PRI_ADDRESSEE_NAME = address.DisplayName;
                InspireClaimRecord.PRI_ADDRESSEE_ADDR_1 = address.Line1Tx;
                InspireClaimRecord.PRI_ADDRESSEE_ADDR_2 = address.Line2Tx;
                InspireClaimRecord.PRI_ADDRESSEE_ADDR_3 = address.Line3Tx;
                InspireClaimRecord.PRI_ADDRESSEE_CTY = address.MunicipalityNm;
                InspireClaimRecord.PRI_ADDRESSEE_ST = address.CountrySubdivisionNm;
                InspireClaimRecord.PRI_ADDRESSEE_ZIP = address.PostalCd;
                InspireClaimRecord.PRI_ADDRESSEE_POSTNET_INFO = address.PostNet;
            }
        }
        private void AddNJMHireAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.NJM_HIRED_IA_NAME = address.DisplayName;
                InspireClaimRecord.NJM_HIRED_IA_EMAIL = address.Email;
                InspireClaimRecord.NJM_HIRED_IA_PHONE = address.Phone;
            }
        }
        private void AddMinorAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.MINOR_NM = address.DisplayName;
                InspireClaimRecord.MINOR_ADDR = address.Line1Tx;
                InspireClaimRecord.MINOR_ADDR_2 = address.Line2Tx;
                InspireClaimRecord.MINOR_ADDR_CTY = address.MunicipalityNm;
                InspireClaimRecord.MINOR_ADDR_ST = address.CountrySubdivisionNm;
                InspireClaimRecord.MINOR_ADDR_ZIP = address.PostalCd;
            }
        }
        private void AddAttornyAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.ATTNY_NAME_AUTO = address.DisplayName;
                InspireClaimRecord.ATTNY_ST_ADDR1_AUTO = address.Line1Tx;
                InspireClaimRecord.ATTNY_ST_ADDR2_AUTO = address.Line2Tx;
                InspireClaimRecord.ATTNY_CTY_AUTO = address.MunicipalityNm;
                InspireClaimRecord.ATTNY_ST_AUTO = address.CountrySubdivisionNm;
                InspireClaimRecord.ATTNY_ZIP_AUTO = address.PostalCd;
            }
        }
        private void AddClaimantAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.CLMT_NAME = address.DisplayName;
                InspireClaimRecord.CLMT_ST_ADDR1_AUTO = address.Line1Tx;
                InspireClaimRecord.CLMT_ST_ADDR2_AUTO = address.Line2Tx;
                InspireClaimRecord.CLMT_CTY_AUTO = address.MunicipalityNm;
                InspireClaimRecord.CLMT_ST_AUTO = address.CountrySubdivisionNm;
                InspireClaimRecord.CLMT_ZIP_AUTO = address.PostalCd;
            }
            int index = 1;
            GCUserDataEntity.ClaimantNames?.ForEach(claimant =>
            {
                //use reflection to set the property that comes from database row.
                if (!string.IsNullOrEmpty(claimant))
                {
                    var tagName = string.Format("{0}{1}", "CLMT_NAME_", index);
                    PropertyInfo prop = InspireClaimRecord.GetType().GetProperty(tagName, BindingFlags.Public | BindingFlags.Instance);
                    if (null != prop && prop.CanWrite)
                    {
                        prop.SetValue(InspireClaimRecord, claimant, null);
                    }
                    index++;
                }
            });
        }
        private void AddParagraphDetails()
        {
            if (GCUserDataEntity.Paragraphs != null)
                foreach (var item in GCUserDataEntity.Paragraphs)
                {
                    //use reflection to set the property that comes from database row.
                    PropertyInfo prop = InspireClaimRecord.GetType().GetProperty(item.Key, BindingFlags.Public | BindingFlags.Instance);
                    if (null != prop && prop.CanWrite)
                    {
                        prop.SetValue(InspireClaimRecord, item.Value ? ApplicationConstants.YES : ApplicationConstants.NO, null);
                    }
                }
        }
        private void AddApplicantBenefitAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.APPLICANT_BENEFITS_NAME = address.DisplayName;
                InspireClaimRecord.APPLICANT_BENEFITS_ADDR_1 = address.Line1Tx;
                InspireClaimRecord.APPLICANT_BENEFITS_ADDR_2 = address.Line2Tx;
                InspireClaimRecord.APPLICANT_BENEFITS_CTY = address.MunicipalityNm;
                InspireClaimRecord.APPLICANT_BENEFITS_ST = address.CountrySubdivisionNm;
                InspireClaimRecord.APPLICANT_BENEFITS_ZIP = address.PostalCd;
            }
        }
        private void AddTrainingPhysicianAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                InspireClaimRecord.TRTNG_PHYS_NAME = address.DisplayName;
                InspireClaimRecord.TRTNG_PHYS_ST_ADDR1 = address.Line1Tx;
                InspireClaimRecord.TRTNG_PHYS_ST_ADDR2 = address.Line2Tx;
                InspireClaimRecord.TRTNG_PHYS_CTY = address.MunicipalityNm;
                InspireClaimRecord.TRTNG_PHYS_ST = address.CountrySubdivisionNm;
                InspireClaimRecord.TRTNG_PHYS_ZIP = address.PostalCd;
            }
        }
        private void AddAuthorDetails()
        {
            var auth = GCUserDataEntity.AuthorDetails;
            if (auth != null)
            {
                InspireClaimRecord.AUTHOR_NAME = auth.DisplayName;
                InspireClaimRecord.AUTHOR_EMAIL = auth.Email;
                InspireClaimRecord.AUTHOR_FAX = auth.FaxDetails;
                InspireClaimRecord.AUTHOR_TITL = auth.AuthorTitle;
                InspireClaimRecord.AUTHOR_WORK_PHN = auth.Phone;
                InspireClaimRecord.AUTHOR_WORK_EXT = auth.PhoneExtension;
                InspireClaimRecord.AUTHOR_CREDS = auth.Credentials;
                InspireClaimRecord.AUTHOR_EXEC_IND = auth.AuthorExecInd ? ApplicationConstants.YES : ApplicationConstants.NO;
                InspireClaimRecord.AUTHOR_UID = auth.AuthorUID;
                InspireClaimRecord.AUTHOR_UID_ARCH = auth.AuthorUIDArch;
                InspireClaimRecord.ADJUSTER_DIRECT_DIAL = auth.AdjDirectDial;
            }
        }
        private void AddGeneralInputDetails()
        {
            InspireClaimRecord.SEC_ADDRESSEE_NAME = GCUserDataEntity.SecondaryAddressee;
            InspireClaimRecord.GRTG_TYPLST = GCUserDataEntity.GreetingType;
            InspireClaimRecord.GRTG_VAL = GCUserDataEntity.GreetingValue;
            InspireClaimRecord.ATTN_TYPLST = GCUserDataEntity.AttentionType;
            InspireClaimRecord.ATTN_VAL = GCUserDataEntity.AttentionValue;
            InspireClaimRecord.CLMT_NAME_CONTACT = GCUserDataEntity.ClaimantNameContact;
            InspireClaimRecord.DECEASED_POL_HLD_NAME = GCUserDataEntity.DeceasedpolicyHolderNAME;
            InspireClaimRecord.PROVIDER = GCUserDataEntity.ProviderName;
            InspireClaimRecord.SUBRO_CARRIER_NAME = GCUserDataEntity.SubroCarrierName;

            InspireClaimRecord.CLMT_DOB = ConvertDateFormat(GCUserDataEntity.ClaimantNameAddressDOB, "yyyy-MM-dd");
            InspireClaimRecord.INS_CO_NM = GetInsuranceCompanyName(ClaimPolicy?.NjmInsuranceCompanyName);
            InspireClaimRecord.SENDING_LTR_TO = GCUserDataEntity.SendLtrTo;
        }
        private void AddClaimGeneralDetails()
        {
            InspireClaimRecord.POL_NO = ClaimPolicy?.PolicyNumber;
            InspireClaimRecord.POL_TYPE = ClaimPolicy?.Type;
            InspireClaimRecord.LOC_STATE = Claim?.SelectedLocation;
            InspireClaimRecord.POL_ST = ClaimPolicy?.PolicyState;
            InspireClaimRecord.POLICYFORM = ClaimPolicy?.PolicyForm;
            InspireClaimRecord.HOMEOWNERS_DED = ClaimPolicy?.PolicyDeductible;
            InspireClaimRecord.CLM_NO = Claim?.ClaimNumber;
            InspireClaimRecord.CLM_PK = GetConfigValue(nameof(InspireClaimRecord.CLM_PK));

            InspireClaimRecord.CURR_DT = ConvertDateFormat(DateTime.Today, GC_Date_Formt);
            InspireClaimRecord.SRC_SYS = GetConfigValue(nameof(InspireClaimRecord.SRC_SYS));
            InspireClaimRecord.LTR_CTGY = DocumentData.documentEntity.CategoryName;
            InspireClaimRecord.LTR_NAME = DocumentData.documentEntity.DocumentName;

            InspireClaimRecord.OUTBND_DOCTYPE = DocumentData.documentEntity.DocumentType;
            InspireClaimRecord.INBND_DOCTYPE = DocumentData.DocumentOnbaseID;
            InspireClaimRecord.CREATOR_UID = InputQueryParameters.UserDetails.UserID;
            InspireClaimRecord.CREATOR_INT = InputQueryParameters.UserDetails.UserInitials;
            InspireClaimRecord.CLM_PK = GetConfigValue(nameof(InspireClaimRecord.CLM_PK));
            InspireClaimRecord.INS_CO_NM = GetInsuranceCompanyName(ClaimPolicy?.NjmInsuranceCompanyName);
            InspireClaimRecord.INS_CO_ABBREV = GetInsuranceCompanyCode(ClaimPolicy?.NjmInsuranceCompanyName);
        }
        private void AddClaimDatesAndAmounts()
        {
            var medPay = ClaimPolicy?.Coverages.Where(c => c.Name == "MedPay").FirstOrDefault();
            if (medPay != null)
            {
                if (!string.IsNullOrEmpty(medPay.ExposureLimit))
                    InspireClaimRecord.MedPay_Policy_Limit = medPay.ExposureLimit;
                else
                    InspireClaimRecord.MedPay_Policy_Limit = medPay.IncidentLimit;
            }
            var pipLimit = ClaimPolicy?.PIPLimits;
            if (pipLimit != null)
            {
                InspireClaimRecord.MED_EXPENSE_LIMIT_PER_PERSON = pipLimit.MedicalExpense;
                InspireClaimRecord.INCOME_CONT_WEEKLY = pipLimit.IncomeContinuationWeekly;
                InspireClaimRecord.INCOME_CONT_MAX = pipLimit.IncomeContinuationMax;
                InspireClaimRecord.ESSENTIAL_SERV_DAILY_LMT = ConvertAmountFormat(pipLimit.EssentialServicesDayLimit);
                InspireClaimRecord.ESSENTIAL_SERV_MAX_LMT = ConvertAmountFormat(pipLimit.EssentialServicesMaxLimit);
                InspireClaimRecord.DEATH_BENEFITS_LMT = pipLimit.DeathBenefitsLimit;
                InspireClaimRecord.FUNERAL_BENEFITS_LMT = ConvertAmountFormat(pipLimit.FuneralBenefitsLimit);
                InspireClaimRecord.DEATH_WAGE_EXCLUSION = pipLimit.DeathWageExclusion;
            }

            var claimant = Claim?.InvolvedParties.Where(i => i.Role.Contains(ApplicationConstants.Claimant)).FirstOrDefault();
            InspireClaimRecord.CLMT_BIRTH_DT = ConvertDateFormat(claimant?.DateOfBirth);
            DateTime lossDate = Claim.DateOfLoss.ToLocalTime();
            InspireClaimRecord.CLM_LOSS_DT = ConvertDateFormat(lossDate, GC_Date_Formt);
            InspireClaimRecord.CLM_LOSS_TIME = lossDate.ToShortTimeString();

            if (lossDate != null)
            {
                InspireClaimRecord.TWO_WEEKS_AFTER_DOL = ConvertDateFormat(lossDate.AddDays(14));
                var threeyearExp = ConvertDateFormat(lossDate.AddYears(3));
                InspireClaimRecord.ThreeYearExpirationDate = threeyearExp;
                InspireClaimRecord.AccidentDate_3Years = threeyearExp;
                var oneyearExp = ConvertDateFormat(lossDate.AddYears(1));
                InspireClaimRecord.ONE_YEAR_EXP_DT = oneyearExp;
                InspireClaimRecord.AccidentDate_1Year = oneyearExp;
            }
            InspireClaimRecord.CLM_RPT_DT_AUTO = ConvertDateFormat(Claim?.AccidentReportDate.ToLocalTime(), GC_Date_Formt);
        }
        private void AddInsuranceDetails()
        {
            var juridiction = Claim?.InvolvedParties.Where(i => i.Exposures.Any(e => e.ExposureNumber != null)).FirstOrDefault();
            var vehState = Claim?.InvolvedVehicles.Where(v => v.State != null).FirstOrDefault();
            InspireClaimRecord.VEH_ST = vehState?.State;
            InspireClaimRecord.COVERAGE_TYPE_PIP = Claim?.Coverages.Where(x => x.Name == ApplicationConstants.GC_PIP)?.Count() > 0 ? ApplicationConstants.YES : null;
            InspireClaimRecord.COVERAGE_TYPE_MEDPAY = Claim?.Coverages.Where(x => x.Name == ApplicationConstants.MedPay)?.Count() > 0 ? ApplicationConstants.YES : null;
            //juridiction = Claim?.InvolvedParties.Where(i => i.Exposures.Any(e => e.ExposureJurisdictionState != null)).FirstOrDefault();
            //InspireClaimRecord.JURISDICTION_STATE_AUTO = juridiction?.Exposures.FirstOrDefault()?.ExposureJurisdictionState;
        }
        private void AddInsuredDetails()
        {
            var email = Claim?.InvolvedParties.Where(x => x.Role.Contains(ApplicationConstants.FirstInsured)).FirstOrDefault();
            var maincontact = Claim?.InvolvedParties.Where(x => x.Role.Contains(ApplicationConstants.MainContact)).FirstOrDefault();

            InspireClaimRecord.INS_POL_HLD_NAME_1 = GetPolicyHolder(ApplicationConstants.FirstInsured);
            InspireClaimRecord.INS_POL_HLD_NAME_2 = GetPolicyHolder(ApplicationConstants.SecondInsured);
            InspireClaimRecord.INS_POL_HLD_NAME_3 = GetPolicyHolder(ApplicationConstants.ThirdInsured);

            var address = GetAddress(ApplicationConstants.FirstInsured, ApplicationConstants.Primary);
            if (address != null)
            {
                InspireClaimRecord.FIRST_INS_ADDR = address.StreetAddress1;
                InspireClaimRecord.FIRST_INS_ADDR_2 = address.StreetAddress2;
                InspireClaimRecord.FIRST_INS_CTY = address.City;
                InspireClaimRecord.FIRST_INS_ST = address.State;
                InspireClaimRecord.FIRST_INS_ZIP = address.ZipCode;
            }
            InspireClaimRecord.LOC_OF_LOSS_SYS = Claim?.LossLocationState;
            InspireClaimRecord.INSD_MAIN_CNTCT_NAME = String.Format("{0} {1}", maincontact?.FirstName, maincontact?.LastName);
            InspireClaimRecord.INSD_EMAIL = email?.EmailAddresses.Where(x => x.EmailAddressValue != null)?.FirstOrDefault()?.EmailAddressValue;
        }
        private void AddClaimantDetails()
        {
            var addressState = Claim?.InvolvedParties.Where(x => x.Role.Contains(ApplicationConstants.FirstInsured)).FirstOrDefault();
            var address = Claim?.LossLocation.FirstOrDefault();
            InspireClaimRecord.CLM_LOSS_ADDR_1 = address?.StreetAddress1;
            InspireClaimRecord.CLM_LOSS_ADDR_2 = address?.StreetAddress2;
            InspireClaimRecord.CLM_LOSS_ADDR_3 = address?.StreetAddress3;
            InspireClaimRecord.CLM_LOSS_CTY = Claim?.LossLocationCity;
            InspireClaimRecord.CLM_LOSS_ST = Claim?.LossLocationState; ;
            InspireClaimRecord.INS_ST = addressState.Addresses.Where(x => x.State != null).FirstOrDefault()?.State;
        }
        private void AddRecordDelimTags()
        {
            AddEndoresementDetails();
            AddHSBEndorsementDetails();

            if (DocumentData.documentEntity.DocumentName == ApplicationConstants.Doc_LimitedPowerAttny)
                AddSalvageRepresentativeDetails();
        }

        private void AddSalvageRepresentativeDetails()
        {
            var salvages = Claim?.InvolvedParties.Where(p => p.Role.Contains(ApplicationConstants.SalvageRep));
            CUSTOMER_DATARECORD_DELIMSALVAGE_REP rep = new CUSTOMER_DATARECORD_DELIMSALVAGE_REP();
            foreach (var salvage in salvages)
            {

                if (salvage.Type.ToDescritpionString() != ApplicationConstants.Company)
                {
                    rep.SALVAGE_REP_NAME.Add((GetName(salvage.FirstName) + GetName(salvage.MiddleInitial) +
                         GetName(salvage.LastName) + GetName(salvage.Suffix)).Trim());
                }
                else
                    rep.SALVAGE_REP_NAME.Add(salvage.Name);

            }
            InspireRecordDelim.SALVAGE_REP = rep;

        }
        string GetName(string? Value)
        {
            return string.IsNullOrEmpty(Value) ? string.Empty : $"{Value} ";
        }
        private void AddEndoresementDetails()
        {
            var endoresments = ClaimPolicy?.Endorsements.Where(e => e.Type != "HSB Endorsement").ToList();
            endoresments.ForEach(e =>
            {
                CUSTOMER_DATARECORD_DELIMENDRS_NUM_W_ED_DT_REC record = new CUSTOMER_DATARECORD_DELIMENDRS_NUM_W_ED_DT_REC();
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK));
                record.ENDRS_NUM_W_ED_DT = e.FormNumber;
                record.ENDORSEMENT_NUMBER = e.FormNumber?.Split(" ")?.FirstOrDefault();
                record.ENDORSEMENT_LIMIT = e.Limit;
                InspireRecordDelim.ENDRS_NUM_W_ED_DT_REC.Add(record);
            });
        }
        private void AddHSBEndorsementDetails()
        {
            var endoresments = ClaimPolicy?.Endorsements.Where(e => e.Type == "HSB Endorsement").ToList();
            endoresments.ForEach(e =>
            {
                CUSTOMER_DATARECORD_DELIMHSB_END_REC record = new CUSTOMER_DATARECORD_DELIMHSB_END_REC();
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK));
                record.HSB_END = e.FormNumber;
                InspireRecordDelim.HSB_END_REC.Add(record);
            });
        }
        protected override void ProcessRules()
        {
            InitializeRules(GCUserDataEntity?.ExposureDetails?.ExposureType);
            ExecuteRules();
            TransferRuleResults(InspireClaimRecord); //Transfer the rule based values back to the main inspire object
        }
        protected override void CreateCustomTags()
        { }
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
                serializer.Serialize(writer, GCInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
            return null;
        }
        private string GetPolicyHolder(string role)
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
        private AdhocCorrespondenceEditor.Shared.GC.Address GetAddress(string role, string type)
        {
            var polHolder = Claim.InvolvedParties.Where(p => p.Role.Contains(role));
            var address = polHolder.SelectMany(p => p.Addresses.Where(a => a.Type.ToDescritpionString() == type));
            return address.FirstOrDefault();
        }
        private void AddEmail()
        {
            InspireClaimRecord.EMAIL_IND = GCUserDataEntity.EmailAddress is null ? null : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(GCUserDataEntity.EmailAddress))
            {
                InspireClaimRecord.EMAIL_TO = GCUserDataEntity.EmailAddress;
                InspireClaimRecord.EMAIL_IND = ApplicationConstants.YES;
                InspireClaimRecord.NJM_ENCRYPT = GCUserDataEntity.EmailEncrypted ? ApplicationConstants.NJMEnCrypt : null;

                InspireClaimRecord.EMAIL_SUBJECT = string.IsNullOrEmpty(GCUserDataEntity.EmailSubject) ? null : GCUserDataEntity.EmailSubject;
                InspireClaimRecord.EMAIL_FROM = string.IsNullOrEmpty(GCUserDataEntity.EmailFromAddress) ? null : GCUserDataEntity.EmailFromAddress;
            }
        }
        private void AddFax()
        {
            InspireClaimRecord.FAX_IND = GCUserDataEntity.FaxAddress is null ? null : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(GCUserDataEntity.FaxAddress))
            {
                InspireClaimRecord.FAX_TO = GCUserDataEntity.FaxAddress;
                InspireClaimRecord.FAX_IND = ApplicationConstants.YES;

                InspireClaimRecord.FAX_SUBJECT = string.IsNullOrEmpty(GCUserDataEntity.FaxSubject) ? null : GCUserDataEntity.FaxSubject;
                InspireClaimRecord.FAX_FROM = InputQueryParameters.UserDetails.UserEmail;
            }
        }
        private void AddPrintInd()
        {
            InspireClaimRecord.CERT_MAIL_IND = GCUserDataEntity.IsCertifiedMailIndicator ? ApplicationConstants.YES : ApplicationConstants.NO;
            if (GCUserDataEntity.PrinterDetails.PrinterName == ApplicationConstants.Archive_Only)
                InspireClaimRecord.PRINT_IND = GetConfigValue(nameof(InspireClaimRecord.PRINT_IND));
            if (GCUserDataEntity.IsPrintServicesBatch)
                InspireClaimRecord.PRINT_IND = ApplicationConstants.PRINT_IND_BATCH_ONLY;
            if (GCUserDataEntity.IsPrintServicesBatch && !string.IsNullOrEmpty(GCUserDataEntity.PrinterDetails.PrinterName))
                InspireClaimRecord.PRINT_IND = GetConfigValue(ApplicationConstants.PRINT_IND_BOTH);
        }
        private void AddCC()
        {
            GCUserDataEntity?.CCDetails?.ForEach(x =>
            {
                CUSTOMER_DATARECORD_DELIMNJM_CC_OPT reOpt = new CUSTOMER_DATARECORD_DELIMNJM_CC_OPT();
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
                InspireRecordDelim.NJM_CC_OPT.Add(reOpt);
            });
        }
        private void AddAgencyAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            InspireClaimRecord.AGENCY_NAME = address?.DisplayName;
            if (address != null && address.Line1Tx != null)
            {
                CUSTOMER_DATARECORD_DELIMNJM_CC_OPT reOpt = new CUSTOMER_DATARECORD_DELIMNJM_CC_OPT();
                reOpt.CLM_FK = GetConfigValue(nameof(reOpt.CLM_FK));
                reOpt.CC_REF = String.Empty;
                reOpt.CC_BCC_IND = String.Empty;
                reOpt.CC_ADDRESSEE_NAME = address.DisplayName;
                reOpt.CC_ADDRESSEE_ADDR_1 = address?.Line1Tx;
                reOpt.CC_ADDRESSEE_ADDR_2 = address?.Line2Tx;
                reOpt.CC_ADDRESSEE_CTY = address?.MunicipalityNm;
                reOpt.CC_ADDRESSEE_ST = address?.CountrySubdivisionNm;
                reOpt.CC_ADDRESSEE_ZIP = address?.PostalCd;
                reOpt.CC_ADDRESSEE_POSTNET_INFO = address.PostNet;
                InspireRecordDelim.NJM_CC_OPT.Add(reOpt);
            }
        }
        private void AddVehicleOwnerAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address address)
        {
            if (address != null)
            {
                GC_DATARECORD_VEHICLE_OWNER_REC record = InspireRecordDelim.VEH_OWNER_REC;
                var name = String.IsNullOrEmpty(GCUserDataEntity.VehicleOwnerName) ? address.DisplayName : null;
                if (GCUserDataEntity.NJMCCOpt)
                    InspireClaimRecord.VEH_OWN_NM = name;
                else
                    record.VEH_OWNERS_NAME = name;

                record.VEH_OWNERS_ADDR_1 = address.Line1Tx;
                record.VEH_OWNERS_ADDR_2 = address.Line2Tx;
                record.VEH_OWNERS_ADDR_3 = address.Line3Tx;
                record.VEH_OWNERS_CTY = address.MunicipalityNm;
                record.VEH_OWNERS_ST = address.CountrySubdivisionNm;
                record.VEH_OWNERS_ZIP = address.PostalCd;

                if (GCUserDataEntity.NJMCCOpt)
                {
                    CUSTOMER_DATARECORD_DELIMNJM_CC_OPT reOpt = new CUSTOMER_DATARECORD_DELIMNJM_CC_OPT();
                    reOpt.CLM_FK = GetConfigValue(nameof(reOpt.CLM_FK));
                    reOpt.CC_REF = String.Empty;
                    reOpt.CC_BCC_IND = String.Empty;
                    reOpt.CC_ADDRESSEE_NAME = address.DisplayName;
                    reOpt.CC_ADDRESSEE_ADDR_1 = address?.Line1Tx;
                    reOpt.CC_ADDRESSEE_ADDR_2 = address?.Line2Tx;
                    reOpt.CC_ADDRESSEE_CTY = address?.MunicipalityNm;
                    reOpt.CC_ADDRESSEE_ST = address?.CountrySubdivisionNm;
                    reOpt.CC_ADDRESSEE_ZIP = address?.PostalCd;
                    reOpt.CC_ADDRESSEE_POSTNET_INFO = address.PostNet;
                    InspireRecordDelim.NJM_CC_OPT.Add(reOpt);
                }
            }
        }
        private void AddMiscallaneousDetails()
        {
            InspireClaimRecord.ADJUSTERS_NAME = GCUserDataEntity.AdjusterName;
            InspireClaimRecord.ADJUSTERS_EXT = GCUserDataEntity.AdjusterExt;
            InspireClaimRecord.MISC_EXPLANATION = GCUserDataEntity.MiscExplanation;
            InspireClaimRecord.COMPANY_NAME_CONTACT_IF_NEEDED = GCUserDataEntity.ClaimantNameCompany;
            InspireClaimRecord.CLMT_NAME_CONTACT_2 = GCUserDataEntity.ClaimantNameContact2;
            InspireClaimRecord.NOT_CAUS_REL_OTHER_VALUE = GCUserDataEntity.NotcausallyrelatedOther;
            InspireClaimRecord.OTHER_DETAILS1_VALUE = GCUserDataEntity.OtherDetails;
            InspireClaimRecord.ADDTL_MED_DOC_VALUE = GCUserDataEntity.AdditionalMedicalDocumentation;
            InspireClaimRecord.IME_PHYS_NAME = GCUserDataEntity.IMEPhysicianName;
            InspireClaimRecord.PIP_DED = GCUserDataEntity.PIPData;
            InspireClaimRecord.BENEFITS_TERM_DT = ConvertDateFormat(GCUserDataEntity.BenefitsTerminationDate);
            InspireClaimRecord.OVERPYMNT_TYPE = GCUserDataEntity.PaymentType;
            InspireClaimRecord.DENIAL_REASON = GCUserDataEntity.DenialReason;
            GCUserDataEntity.HealthBenefits?.ForEach(x =>
            {
                CUSTOMER_DATARECORD_DELIMHEALTH_BEN_NOT_PROVIDED_REC record = new CUSTOMER_DATARECORD_DELIMHEALTH_BEN_NOT_PROVIDED_REC();
                record.HEALTH_BEN_NOT_PROVIDED = x;
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK));
                InspireRecordDelim.HEALTH_BEN_NOT_PROVIDED_REC.Add(record);
            });

            GCUserDataEntity.ImeParagraphs?.ForEach(tagName =>
            {
                //use reflection to set the property that comes from database row.
                PropertyInfo prop = InspireClaimRecord.GetType().GetProperty(tagName, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                {
                    prop.SetValue(InspireClaimRecord, ApplicationConstants.YES, null);
                }
            });

            int index = 1;
            GCUserDataEntity.ICDCodes?.ForEach(x =>
            {
                //use reflection to set the property that comes from database row.
                var tagName = string.Format("{0}{1}", "ICD9_CODE_", index);
                PropertyInfo prop = InspireClaimRecord.GetType().GetProperty(tagName, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                {
                    prop.SetValue(InspireClaimRecord, x, null);
                }
                index++;
            });

            GCUserDataEntity.OverpaymentReason?.ForEach(x =>
            {
                GC_DATARECORD_OVER_PAYMENT_REC_DATA record = new GC_DATARECORD_OVER_PAYMENT_REC_DATA();
                record.OVERPYMNT_REASON = x;
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK)); ;
                InspireRecordDelim.OVERPAYMENT_PARENT_REC.Add(record);
            });

            if (!String.IsNullOrEmpty(GCUserDataEntity.OverpaymentReasonOther))
            {
                GC_DATARECORD_OVER_PAYMENT_REC_DATA record = new GC_DATARECORD_OVER_PAYMENT_REC_DATA();
                record.OTH_OVERPYMNT_REASON = GCUserDataEntity.OverpaymentReasonOther;
                record.OVERPYMNT_REASON = ApplicationConstants.Other;
                record.CLM_FK = GetConfigValue(nameof(record.CLM_FK)); ;
                InspireRecordDelim.OVERPAYMENT_PARENT_REC.Add(record);
            }

            //phase 3 details
            InspireClaimRecord.LIENHOLDER_NAME = GCUserDataEntity.LienholderName;
            InspireClaimRecord.MORTGAGEE = GCUserDataEntity.MortgageeName;
            InspireClaimRecord.PARENT_NM = GCUserDataEntity.ParentName1;
            InspireClaimRecord.PARENT_NM_2 = GCUserDataEntity.ParentName2;
            InspireClaimRecord.PAYEE = GCUserDataEntity.PayeeName;
            InspireClaimRecord.SUPERVISOR_NM = GCUserDataEntity.SupervisorName;
            InspireClaimRecord.TORTFEASOR_NM = GCUserDataEntity.TortfeasorName;
            InspireClaimRecord.TORTFEASOR_INS_CAR = GCUserDataEntity.TortfeasorNameInsCar;
            InspireClaimRecord.VEH_OWN_INS = GCUserDataEntity.VehicleOwnerAndInsuranceName;
            InspireClaimRecord.VEH_SHOP_NAME = GCUserDataEntity.VehShopName;
            InspireClaimRecord.ADVERSE_SUBRO_PTY = GCUserDataEntity.SubroPartyName;
            if (!string.IsNullOrEmpty(GCUserDataEntity.PrimaryAddressee))
                InspireClaimRecord.PRI_ADDRESSEE_NAME = GCUserDataEntity.PrimaryAddressee;
            if (GCUserDataEntity.OutOfPocketRental.HasValue)
                InspireClaimRecord.OOP_RENTAL_INCLUDED = GCUserDataEntity.OutOfPocketRental.Value ? ApplicationConstants.YES : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(GCUserDataEntity.VehicleOwnerName))
                InspireClaimRecord.VEH_OWN_NM = GCUserDataEntity.VehicleOwnerName;
        }
        private void AddSpecificRequiredInformation()
        {
            var sri = GCUserDataEntity.SpecificRequiredInformation;
            if (sri != null)
            {
                InspireClaimRecord.COMP_AONI = sri.CompletedAffidavitOfNoInsurance ? "Y" : "N";
                InspireClaimRecord.COMP_PIP_APP = sri.CompletedPipApplication ? "Y" : "N";
                InspireClaimRecord.ID_DOCS = sri.IdentificationDocuments ? "Y" : "N";
                InspireClaimRecord.MARRIAGE_LICENSE = sri.MarriageLicense ? "Y" : "N";
                InspireClaimRecord.PROOF_OF_RESIDENCY = sri.ProofOfResidency ? "Y" : "N";
            }
        }
    }
}
