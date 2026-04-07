using System.Reflection;
using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.PL;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCUMBInspireBuilder : PLInspireBase
    {
        protected UMBInspireEntity UMBInspireEntity { get; set; }
        protected CUSTOMER_DATARECORD_DELIM InspireCustomerRec;
        protected CUSTOMER_DATARECORD_DELIMUMBRELLA_REC InspireUmbrellaRec;

        protected override void CreateInspireRequest()
        {
            PLUserDataEntity = (PLHoUmbDwUserEntity)UserInputData;
            PLSourceSystemEntity = (PLSourceSystemEntity)SourceSystemData;
            UMBInspireEntity = new UMBInspireEntity();

            InspireCustomerRec = UMBInspireEntity.CustomerData.RECORD_DELIM;
            InspireUmbrellaRec = UMBInspireEntity.CustomerData.RECORD_DELIM.UMBRELLA_REC;
            base.CreateInspireRequest();
        }
        protected override void ProcessPolicyAndAccountRecord()
        {
            AddPolicyConfigValues(InspireUmbrellaRec);
            AddPolicyGeneralDetails(InspireUmbrellaRec);
            AddPolicyGeneralOtherDetails(InspireUmbrellaRec);
            AddPolicyDatesAndAmounts();
            AddPolicyIndicators();
        }
        protected override void ProcessRules()
        {
            InitializeRules(InspireUmbrellaRec.QUOTE_NUM, SourcePolicyPeriod.StartDt);//Create RuleModel by passing your required values
            ExecuteRules();
            TransferRuleResults(InspireUmbrellaRec); //Transfer the rule based values back to the main inspire object
        }
        protected override void CreateCustomTags()
        {
            //Add special tags 
            InspireCustomerRec.LTR_NAME_REC = new CUSTOMER_DATARECORD_DELIMLTR_NAME_REC();
            CreateCustomTags(InspireCustomerRec);
        }
        protected override string SeriliazeInspireRequest()
        {
            return Utility.SeriliazeInspireRequest(typeof(CUSTOMER_DATA), UMBInspireEntity.CustomerData);
        }
        protected override void ProcessUserInputData()
        {
            AddPrinter(PLUserDataEntity,InspireUmbrellaRec);

            UserAddExposures();
           
            //Risk Cancellation/Withdrawl policy info
            UserAddDrivingRecord();
            UserAddMidtermCancel();
            UserAddRiskLocation();
            UserAddOHMidTermCancel();
            UserAddCancelWithDrawl();
        }
        private void UserAddExposures()
        {
            UserAddPolicyDetails(PLUserDataEntity,InspireUmbrellaRec);
            UserAddCompleteAddress();
            UserAddVacantLand();
            UserAddNameOnDeed();

            UserAddWaterCraft();
            UserAddVehicle();
            UserAddBusinessUseOnProperty();
            UserAddDriverInfo();
            UserAddAccidentInfo();
            UserAddPropertyDetails();

            UserAddClaimVoilation();
            UserAddDriverName();
            UserAddClaimDrivers();
            UserAddClaimsHome(PLUserDataEntity?.ClaimsHomeAddresses, ApplicationConstants.Address_Home);
            UserAddClaimsHome(PLUserDataEntity?.InspectionAddresses, ApplicationConstants.Address_Inspection);
            UserAddAdditionalPolicies();
        }   
        private void AddPolicyDatesAndAmounts()
        {
            var umbrellaLine = SourcePolicyPeriod.PolicyLines.Where(p => p.UmbrellaLine != null).FirstOrDefault()?.UmbrellaLine;
            var summary = umbrellaLine.SummaryAmounts.Where(s => s.SummaryAm != null);
            var lmtOfLiability = umbrellaLine.CoverageElectionParameters.Where(c => c.CoverageParameterTypeCd == "Liability Limit").FirstOrDefault();
            var totalPremium = umbrellaLine.SummaryAmounts.Where(s => s.AmountTypeCd == "Total Policy Premium").FirstOrDefault();
            var subPolPremium = umbrellaLine.SummaryAmounts.Where(s => s.AmountTypeCd == "Subtotal Policy Premium").FirstOrDefault();
            var njPligaPremium = umbrellaLine.SummaryAmounts.Where(s => s.AmountTypeCd == "NJ PLIGA Charge").FirstOrDefault();
            var totalReturnPremium = umbrellaLine.SummaryAmounts.Where(s => s.AmountTypeCd == "Premium").FirstOrDefault();
            var dividend = umbrellaLine.CoverageElectionParameters.Where(s => s.CoverageParameterTypeCd == "dividend").FirstOrDefault();

            InspireUmbrellaRec.POL_EFF_DT = ConvertDateFormat(SourcePolicyPeriod.StartDt, LOB_Date_Format);
            InspireUmbrellaRec.POL_EXP_DT = ConvertDateFormat(SourcePolicyPeriod.EndDt, LOB_Date_Format);
            //InspireUmbrellaRec.ENDRS_EFF_DT = ConvertDateFormat(SourcePolicyPeriod.EndorsementEffectiveDt, LOB_Date_Format);
            //InspireUmbrellaRec.TOT_PREM = ConvertAmountFormat(summary.FirstOrDefault()?.SummaryAm);
            InspireUmbrellaRec.LMT_LIAB = lmtOfLiability?.CoverageParameterUnformattedValueTx;
            InspireUmbrellaRec.TOT_POL_PREM = ConvertAmountFormat(totalPremium?.SummaryAm);
            InspireUmbrellaRec.SUB_POL_PREM = ConvertAmountFormat(subPolPremium?.SummaryAm);
            InspireUmbrellaRec.PLIGA = ConvertAmountFormat(njPligaPremium?.SummaryAm); 
            InspireUmbrellaRec.PRIOR_POL_PD_YR = SourcePolicyPeriod.DividendYr.ToString();
            InspireUmbrellaRec.TOT_ADD_RETURN_PREM = ConvertAmountFormat(totalReturnPremium?.SummaryAm);
            //InspireUmbrellaRecord.ESCROW_IND = umbrella.UmbrellaLine.UnderlyingPolicies
            InspireUmbrellaRec.DIVIDEND = dividend?.CoverageParameterUnformattedValueTx;
            //InspireUmbrellaRecord.ADJ_TOT_DIV = SourcePolicyPeriod.PUPRegularDividendAmount;
            InspireUmbrellaRec.POL_MAILING_ADD_IND = SourcePolicyPeriod.PolicyMailingAddressIn;
        }
        private void AddPolicyIndicators()
        {
            var umbrella = SourcePolicyPeriod.PolicyLines.Where(p=>p.UmbrellaLine != null).FirstOrDefault();
            var exposures = umbrella.UmbrellaLine.ExposureIndicators.ToList();
            var motorInd = exposures.SelectMany(e => e.MotorCycleIndicators.Where(x => x.MotorCycleIn != null));
            var autoInd = exposures.SelectMany(e => e.AutoMobileIndicators.Where(x => x.AutoMobileIn != null));
           // var residenceInd = exposures.SelectMany(e => e.ResidencePremisesIndicator.Where(x => x.AutoMobileIn != null));
            var landInd = exposures.SelectMany(e => e.VacatLandIndicators.Where(x => x.VacantLandIn != null));
            var waterInd = exposures.SelectMany(e => e.WatercraftIndicators.Where(x => x.WatercraftIn != null));
            var rvInd = exposures.SelectMany(e => e.RecreationalMotorVehicleIndicators.Where(x => x.RecreationalVehicleIn != null));

            InspireUmbrellaRec.MOTORCYCLE_IND = motorInd.Any() ? motorInd.FirstOrDefault()?.MotorCycleIn :null ;
            InspireUmbrellaRec.AUTOMOBILE_IND = autoInd.Any() ? autoInd.FirstOrDefault()?.AutoMobileIn : null;
           // InspireUmbrellaRecord.RES_PREM_IND = "";
            InspireUmbrellaRec.VACANT_LAND_IND = landInd.Any() ? landInd.FirstOrDefault()?.VacantLandIn : null;
            InspireUmbrellaRec.WATERCRAFT_IND = waterInd.Any() ? waterInd.FirstOrDefault()?.WatercraftIn : null;
            InspireUmbrellaRec.FAM_MEM_IND = exposures.FirstOrDefault()?.FamilyMemberIn;
            InspireUmbrellaRec.RV_IND = rvInd.Any() ? rvInd.FirstOrDefault()?.RecreationalVehicleIn : null; 
            InspireUmbrellaRec.UM_UIM_IND = exposures.FirstOrDefault()?.ExcessUnAndUnderInsuredMotoritsIn;
            InspireUmbrellaRec.RENTAL_PROP_IND = exposures.FirstOrDefault()?.RentalPropertyIn;
            InspireUmbrellaRec.BOAT_SLIP_IND = exposures.FirstOrDefault()?.BoatSlipIn; 
        }
        private void UserAddCompleteAddress()
        {
            if (PLUserDataEntity?.CompleteAddresses != null)
            {
                AddAddress(PLUserDataEntity.CompleteAddresses, ApplicationConstants.Address_Complete);
                InspireUmbrellaRec.AI_COMP_ADDR = PLUserDataEntity.CompleteAddresses.Count() > 0 ?
                                                    ApplicationConstants.YES : ApplicationConstants.NO;
            }
        }
        private void UserAddNameOnDeed()
        {
            if (PLUserDataEntity?.NameOnDeedAddresses != null)
            {
                AddAddress(PLUserDataEntity.NameOnDeedAddresses, ApplicationConstants.Address_Deed);
                InspireUmbrellaRec.AI_NAME_DEED = PLUserDataEntity.NameOnDeedAddresses.Count() > 0 ?
                                                    ApplicationConstants.YES : ApplicationConstants.NO;
            }
        }
        private void UserAddBusinessUseOnProperty()
        {
            PLUserDataEntity?.BusinessDetails?.ForEach(business =>
               {
                   var inspRecord = new CUSTOMER_DATARECORD_DELIMPROP_DET_INFO();
                   inspRecord.RSK_LOC_ADDR_1 = business.CompleteAddresses.Line1Tx;
                   inspRecord.RSK_LOC_ADDR_2 = business.CompleteAddresses.Line2Tx;
                   inspRecord.RSK_LOC_ADDR_3 = business.CompleteAddresses.Line3Tx;
                   inspRecord.RSK_LOC_CTY = business.CompleteAddresses.MunicipalityNm;
                   inspRecord.RSK_LOC_ST = business.CompleteAddresses.CountrySubdivisionNm;
                   inspRecord.RSK_LOC_ZIP = business.CompleteAddresses.PostalCd;
                   inspRecord.TLC = business.Telecommuting ? ApplicationConstants.YES : null;
                   inspRecord.TYPE_BUS = business.BusinessType ? ApplicationConstants.YES : null;
                   inspRecord.NUM_CLIENTS = business.NumberofClients ? ApplicationConstants.YES : null;
                   inspRecord.NUM_EMP = business.NumberofEmployees ? ApplicationConstants.YES : null;
                   inspRecord.ADVERTISE = business.Advertising ? ApplicationConstants.YES : null;
                   inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                   inspRecord.PROP_INFO_TYPE = GetConfigValue(string.Format("{0}_{1}", nameof(InspireCustomerRec.PROP_DET_INFO), ApplicationConstants.Property));
                   InspireCustomerRec.PROP_DET_INFO.Add(inspRecord);
               });
            if (PLUserDataEntity?.BusinessDetails!= null)
            InspireUmbrellaRec.AI_BUS_USE = PLUserDataEntity.BusinessDetails.Count() > 0 ?
                                            ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void UserAddPropertyDetails()
        {
            PLUserDataEntity?.PropertyDetails?.ForEach(property =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMPROP_DET_INFO();
                inspRecord.RSK_LOC_ADDR_1 = property.CompleteAddresses.Line1Tx;
                inspRecord.RSK_LOC_ADDR_2 = property.CompleteAddresses.Line2Tx;
                inspRecord.RSK_LOC_ADDR_3 = property.CompleteAddresses.Line3Tx;
                inspRecord.RSK_LOC_CTY = property.CompleteAddresses.MunicipalityNm;
                inspRecord.RSK_LOC_ST = property.CompleteAddresses.CountrySubdivisionNm;
                inspRecord.RSK_LOC_ZIP = property.CompleteAddresses.PostalCd;
                inspRecord.OCC_TYPE = property.OccupancyType ? ApplicationConstants.YES : null;
                inspRecord.USAGE = property.Usage ? ApplicationConstants.YES : null;
                inspRecord.RES_TYPE = property.ResidenceType ? ApplicationConstants.YES : null;
                inspRecord.POOL = property.Pool ? ApplicationConstants.YES : null;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.PROP_INFO_TYPE = GetConfigValue(string.Format("{0}_{1}", nameof(InspireCustomerRec.PROP_DET_INFO), ApplicationConstants.Property_Info));
                InspireCustomerRec.PROP_DET_INFO.Add(inspRecord);
            });
            if (PLUserDataEntity?.PropertyDetails != null)
               InspireUmbrellaRec.AI_PROP_INFO = PLUserDataEntity.PropertyDetails.Count() > 0 ?
                                            ApplicationConstants.YES : ApplicationConstants.NO;

        }
        private void UserAddWaterCraft()
        {
            PLUserDataEntity?.WatercarftInfoDetails?.ForEach(watercraft =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMWTRCRFT_DET();
                inspRecord.WTRCFT = watercraft.WatercraftDetails;
                inspRecord.WTRCFT_OWN = watercraft.WatercraftOwnership ? ApplicationConstants.YES : null;
                inspRecord.WTRCFT_TYPE = watercraft.WatercraftType ? ApplicationConstants.YES : null;
                inspRecord.WTRCFT_YEAR = watercraft.WatercraftYear ? ApplicationConstants.YES : null;
                inspRecord.WTRCFT_MAKE = watercraft.WatercraftMake ? ApplicationConstants.YES : null;
                inspRecord.MAX_HP = watercraft.MaxHorsepower ? ApplicationConstants.YES : null;
                inspRecord.WTRCFT_LGTH = watercraft.WatercraftLength ? ApplicationConstants.YES : null;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.WTRCFT_UNDRLY_POL = watercraft.UnderlyingPolicy ? ApplicationConstants.YES : null;
                InspireCustomerRec.WTRCRFT_DET.Add(inspRecord);
            });
            if (PLUserDataEntity?.WatercarftInfoDetails != null)
                InspireUmbrellaRec.AI_WTRCRFT = PLUserDataEntity.WatercarftInfoDetails.Count() > 0 ?
                                                ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void UserAddVehicle()
        {
            PLUserDataEntity?.VehicleDetails?.ForEach(vehicle =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMVEH_DET();
                inspRecord.VEH = vehicle.VehicleDetail;
                inspRecord.VEH_TYPE = vehicle.VehicleType ? ApplicationConstants.YES : null;
                inspRecord.VEH_MAKE = vehicle.VehicleMake ? ApplicationConstants.YES : null;
                inspRecord.VEH_UNDRLY_POL = vehicle.UnderlyingPolicy ? ApplicationConstants.YES : null;
                inspRecord.VEH_REG = vehicle.VehicleRegistration ? ApplicationConstants.YES : null;
                inspRecord.VEH_OWN = vehicle.VehicleOwnership ? ApplicationConstants.YES : null;
                inspRecord.VEH_YEAR = vehicle.VehicleYear ? ApplicationConstants.YES : null;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                InspireCustomerRec.VEH_DET.Add(inspRecord);
            });
            if (PLUserDataEntity?.VehicleDetails != null) 
                InspireUmbrellaRec.AI_VEH = PLUserDataEntity.VehicleDetails.Count() > 0 ?
                                                ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void AddAddress(List<AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address> addresses, string type)
        {
            addresses?.ForEach(address =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMPROP_DET_INFO();
                inspRecord.RSK_LOC_ADDR_1 = address.Line1Tx;
                inspRecord.RSK_LOC_ADDR_2 = address.Line2Tx;
                inspRecord.RSK_LOC_ADDR_3 = address.Line3Tx;
                inspRecord.RSK_LOC_CTY = address.MunicipalityNm;
                inspRecord.RSK_LOC_ST = address.CountrySubdivisionNm;
                inspRecord.RSK_LOC_ZIP = address.PostalCd;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.PROP_INFO_TYPE = GetConfigValue(string.Format("{0}_{1}", nameof(InspireCustomerRec.PROP_DET_INFO), type));
                InspireCustomerRec.PROP_DET_INFO.Add(inspRecord);
             });
        }
        private void UserAddVacantLand()
        {
            PLUserDataEntity?.VacantLandInfo?.ForEach(vacLand =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMLOT_REC();
                inspRecord.LOT_AND_BLOCK = string.IsNullOrEmpty(vacLand) ? null: vacLand;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.PROP_INFO_TYPE = GetConfigValue(nameof(InspireCustomerRec.LOT_REC));
                InspireCustomerRec.LOT_REC.Add(inspRecord);
            });
            if (PLUserDataEntity?.VacantLandInfo != null)
                InspireUmbrellaRec.AI_VACNT_LAND = PLUserDataEntity.VacantLandInfo.Count() > 0 ?
                                            ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void UserAddDriverInfo()
        {
            PLUserDataEntity?.DriverDetails?.ForEach(driver =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMDRIVER_DET();
                inspRecord.DRVR_NAME = driver.DriverName;
                inspRecord.OWN_INS = driver.OwnInsurance ? ApplicationConstants.YES : null;
                inspRecord.REL_APPLCNT = driver.RelationshipApplicant ? ApplicationConstants.YES : null;
                inspRecord.LIC_STATUS = driver.LicenseStatus ? ApplicationConstants.YES : null;
                inspRecord.DOB = driver.DateofBirth ? ApplicationConstants.YES : null;
                inspRecord.DL_NUM_ST = driver.DLNumberandState ? ApplicationConstants.YES : null;
                inspRecord.YR_FRST_LIC = driver.YearFirstLicensed ? ApplicationConstants.YES : null;
                inspRecord.PR_DL = driver.PriorDL ? ApplicationConstants.YES : null;
                inspRecord.VAL_DL = driver.ValidDL ? ApplicationConstants.YES : null;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.DRVR_INFO_TYPE = GetConfigValue(string.Format("{0}_{1}", nameof(InspireCustomerRec.DRIVER_DET), ApplicationConstants.Driver));
                InspireCustomerRec.DRIVER_DET.Add(inspRecord);
            });
            if (PLUserDataEntity?.DriverDetails != null) 
                InspireUmbrellaRec.AI_DRVR_INFO = PLUserDataEntity.DriverDetails.Count() > 0 ?
                                                ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void UserAddAccidentInfo()
        {
            PLUserDataEntity?.AccidentInfoDetails?.ForEach(accident =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMDRIVER_DET();
                inspRecord.DRVR_NAME = accident.DriverName;
                inspRecord.ACC_DT = ConvertDateFormat(accident.AccidentDate, LOB_Date_Format);
                inspRecord.DRVR_NAME = accident.DriverName;
                inspRecord.ACC_DESC = accident.AccidentDescription ? ApplicationConstants.YES : null;
                inspRecord.CLM_STATUS = accident.ClaimStatus ? ApplicationConstants.YES : null;
                inspRecord.PYOUT_AMT = accident.PayoutAmount ? ApplicationConstants.YES : null;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.DRVR_INFO_TYPE = GetConfigValue(string.Format("{0}_{1}", nameof(InspireCustomerRec.DRIVER_DET), ApplicationConstants.Accident));
                InspireCustomerRec.DRIVER_DET.Add(inspRecord);
            });
            if (PLUserDataEntity?.AccidentInfoDetails != null)
                InspireUmbrellaRec.AI_ACC_INFO = PLUserDataEntity?.AccidentInfoDetails?.Count() > 0 ?
                                            ApplicationConstants.YES : ApplicationConstants.NO;
        }
        private void UserAddClaimVoilation()
        {
            PLUserDataEntity?.DrivingRecordDetails?.ForEach(claim =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMDRIVER_DET();
                inspRecord.DRVR_NAME = claim.mvrDrivingName;
                inspRecord.ACCIDENT_VIOLATION_DRIVER_NAME = claim.DriverName;
                inspRecord.ACCIDENT_VIOLATION_EVENT_DATE = ConvertDateFormat(claim.EventDate,LOB_Date_Format);
                inspRecord.ACCIDENT_VIOLATION_POSTING_PAYOUT_DATE = ConvertDateFormat(claim.PostingPayoutDate, LOB_Date_Format);
                inspRecord.MVRReferenceNumber = claim.MVRReferenceNumber;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.ADVERSE_DATA_SOURCE = claim.AdverseDataSource;
                inspRecord.ACTIVITY_DESCRIPTION = claim.ActivityDescription;
                inspRecord.DRVR_RECS = GetConfigValue(nameof(inspRecord.DRVR_RECS));
                inspRecord.DRVR_INFO_TYPE = GetConfigValue(string.Format("{0}_{1}", nameof(InspireCustomerRec.DRIVER_DET), ApplicationConstants.Driver));
                InspireCustomerRec.DRIVER_DET.Add(inspRecord);
            });
        }
        private void UserAddDriverName()
        {
            if (!string.IsNullOrEmpty(PLUserDataEntity.SelectedDriverName))
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMDRIVER_DET();
                inspRecord.DRVR_NAME = PLUserDataEntity.SelectedDriverName;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                InspireCustomerRec.DRIVER_DET.Add(inspRecord);
            }
        }
        private void UserAddClaimDrivers()
        {
            PLUserDataEntity?.ClaimsAutoDriverName?.ForEach(driver =>
            {
                {
                    var inspRecord = new CUSTOMER_DATARECORD_DELIMDRIVER_DET();
                    inspRecord.DRVR_NAME = driver;
                    inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                    inspRecord.CLMS_AUTO = GetConfigValue(nameof(inspRecord.CLMS_AUTO));
                    InspireCustomerRec.DRIVER_DET.Add(inspRecord);
                }
            });
        }
        private void UserAddClaimsHome(List<AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address> addresses, string type)
        {
            if (addresses != null)
            addresses?.ForEach(claimHome =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMPROP_DET_INFO();
                inspRecord.RSK_LOC_ADDR_1 = claimHome.Line1Tx;
                inspRecord.RSK_LOC_ADDR_2 = claimHome.Line2Tx;
                inspRecord.RSK_LOC_ADDR_3 = claimHome.Line3Tx;
                inspRecord.RSK_LOC_CTY = claimHome.MunicipalityNm;
                inspRecord.RSK_LOC_ST = claimHome.CountrySubdivisionNm;
                inspRecord.RSK_LOC_ZIP = claimHome.PostalCd;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                if (type.Equals(ApplicationConstants.Address_Home))
                    inspRecord.CLMS_HOME = GetConfigValue(nameof(inspRecord.CLMS_HOME));
                else
                    inspRecord.INSPECT_PROP = GetConfigValue(nameof(inspRecord.INSPECT_PROP));

                InspireCustomerRec.PROP_DET_INFO.Add(inspRecord);
            });
        }
        private void UserAddMidtermCancel()
        {
           if (PLUserDataEntity?.InspectionPropertyLocation !=null)
            {
                AddAddress(PLUserDataEntity?.InspectionPropertyLocation);
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity.InspectionVacantLandLocation))
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMLOT_REC();
                inspRecord.LOT_AND_BLOCK = PLUserDataEntity.InspectionVacantLandLocation;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                InspireCustomerRec.LOT_REC.Add(inspRecord);
            }
            InspireUmbrellaRec.UNLY_POL = PLUserDataEntity?.UnderlyingPolicy;
            if (!string.IsNullOrEmpty(PLUserDataEntity?.NonrenewalWithdrawalCancelReason))
            {
                InspireUmbrellaRec.MDTRM_CNC_IND = PLUserDataEntity?.NonrenewalWithdrawalCancelReason;
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity?.WithdrawalCancelReason))
            {
                InspireUmbrellaRec.CNC_WTHDR_RSN = PLUserDataEntity?.WithdrawalCancelReason;
                InspireUmbrellaRec.UNLY_POL_TYPE = PLUserDataEntity?.UnderlyingPolicyType;
            }

            if (!string.IsNullOrEmpty(PLUserDataEntity?.NoticeofNonrenewalReason))
            {
                InspireUmbrellaRec.NONRNWL_IND = PLUserDataEntity.NoticeofNonrenewalReason;
            }
            if (!string.IsNullOrEmpty(PLUserDataEntity?.NoticeofNonrenewalWithdrawalReason))
            {
                InspireUmbrellaRec.NONRNWL_WTHDR_RSN = PLUserDataEntity.NoticeofNonrenewalWithdrawalReason;
                if (InspireUmbrellaRec.NONRNWL_WTHDR_RSN == ApplicationConstants.ObtainedUnderlyingPolicies)
                    InspireUmbrellaRec.UNLY_POL_TYPE = PLUserDataEntity?.UnderlyingPolicyType;
            }
        }
        private void UserAddOHMidTermCancel()
        {
            var ohioDetail = PLUserDataEntity?.OHCancellationNonRenewalDetail;
            string reason = string.Empty;
            if (ohioDetail != null)
            {
                if (ohioDetail.LicenseMVRSuspendedDate > DateTime.MinValue)
                {
                    var inspRecord = new CUSTOMER_DATARECORD_DELIMDRIVER_DET();
                    inspRecord.LicenseMVRSuspendedDate = ConvertDateFormat(ohioDetail.LicenseMVRSuspendedDate, LOB_Date_Format);
                    inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                    InspireCustomerRec.DRIVER_DET.Add(inspRecord);
                }
                if (!string.IsNullOrEmpty(ohioDetail.LicensedFamilyMember))
                {
                    var familyRec = new CUSTOMER_DATARECORD_DELIMFAMILY_REC();
                    familyRec.LICENSE_FAM_MEM = ohioDetail.LicensedFamilyMember;
                    familyRec.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                    InspireCustomerRec.FAMILY_REC.Add(familyRec);
                }
                InspireUmbrellaRec.CLUEReferenceNumber = ohioDetail?.ClueReferenceNumber;
                InspireUmbrellaRec.NDEOffer = (bool)ohioDetail?.IsNDEOffer ? ApplicationConstants.YES : ApplicationConstants.NO;
            }
            if (!string.IsNullOrEmpty(ohioDetail?.MidtermCancellationReason))
            {
                reason = ohioDetail?.MidtermCancellationReason;
                InspireUmbrellaRec.MIDTRM_CNCL_IND = reason;
            }else if (!string.IsNullOrEmpty(ohioDetail?.NonrenewalReason))
            {
                reason = ohioDetail?.NonrenewalReason;
                InspireUmbrellaRec.NONRNWL_IND = reason;
            }
            //use reflection to set the property that comes from database row.
            if (!string.IsNullOrEmpty(reason) && !string.IsNullOrEmpty(PLUserDataEntity.InspireReasonTag))
            {
                PropertyInfo prop = InspireUmbrellaRec.GetType().GetProperty(PLUserDataEntity.InspireReasonTag, BindingFlags.Public | BindingFlags.Instance);
                if (null != prop && prop.CanWrite)
                {
                    prop.SetValue(InspireUmbrellaRec, ApplicationConstants.YES, null);
                }
            }
        }
        private void UserAddCancelWithDrawl()
        {
            PLUserDataEntity?.WithdrawalReasonDriverName?.ForEach( driver =>
            {
                var familyRec = new CUSTOMER_DATARECORD_DELIMFAMILY_REC();
                familyRec.LICENSE_FAM_MEM = driver;
                familyRec.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                InspireCustomerRec.FAMILY_REC.Add(familyRec);
            });
        }
        private void UserAddRiskLocation()
        {
            if (PLUserDataEntity.RiskLocation != null)
            {
                AddAddress(PLUserDataEntity?.RiskLocation);
            }
        }
        private void AddAddress(AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity.Address home)
        {
            if (null != home && !string.IsNullOrEmpty(home.Line1Tx))
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMPROP_DET_INFO();
                inspRecord.RSK_LOC_ADDR_1 = home.Line1Tx;
                inspRecord.RSK_LOC_ADDR_2 = home.Line2Tx;
                inspRecord.RSK_LOC_ADDR_3 = home.Line3Tx;
                inspRecord.RSK_LOC_CTY = home.MunicipalityNm;
                inspRecord.RSK_LOC_ST = home.CountrySubdivisionNm;
                inspRecord.RSK_LOC_ZIP = home.PostalCd;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                InspireCustomerRec.PROP_DET_INFO.Add(inspRecord);
            }
        }
        private void UserAddDrivingRecord()
        {
            PLUserDataEntity?.DriverRecName?.ForEach(driver =>
            {
                var inspRecord = new CUSTOMER_DATARECORD_DELIMDRIVER_DET();
                inspRecord.DRVR_NAME = driver;
                inspRecord.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                inspRecord.DRVR_RECS = GetConfigValue(nameof(inspRecord.DRVR_RECS));
                inspRecord.DRVR_INFO_TYPE = GetConfigValue(string.Format("{0}_{1}", nameof(InspireCustomerRec.DRIVER_DET), ApplicationConstants.Driver));
                InspireCustomerRec.DRIVER_DET.Add(inspRecord);
            });
        }
        private void UserAddAdditionalPolicies()
        {
            PLUserDataEntity?.PolicyNumberSelected?.ForEach(policy =>
            {
                var polNum = new CUSTOMER_DATARECORD_DELIMADDL_POL_NUM();
                polNum.ADDL_POLNUM = policy;
                polNum.POL_FK = GetConfigValue(nameof(InspireUmbrellaRec.POL_PK));
                InspireCustomerRec.ADDL_POL_NUM.Add(polNum);
            });
        }
    }
}
