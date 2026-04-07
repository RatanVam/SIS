namespace AdhocCorrespondenceEditor.Client.Common
{
    public static class ApplicationConstants
    {
        /* general lob related constants */
        public const string LOB_PC_CA = "PC-CA";
        public const string LOB_PC_CGL = "PC-CGL";
        public const string LOB_PC_BOP = "PC-BOP";
        public const string LOB_PC_CUMB = "PC-CUMB";
        public const string LOB_PC_MULTI = "PC-MULTI";
        public const string LOB_BC_PA = "BC-PA";
        public const string LOB_BC_WCU = "BC-WCU";
        public const string LOB_PC_PA = "PC-PA";
        public const string LOB_PC_HO = "PC-HO";
        public const string LOB_PC_DW = "PC-DW";
        public const string LOB_PC_UMB = "PC-UMB";
        public const string LOB_GC = "GC";
        public const string LOB_WCC = "WCC";
        public const string LOB_PC_WCU = "PC-WCU";

        //following used in BC
        public const string LOB_PA = "PA";
        public const string LOB_HO = "HO";
        public const string LOB_PUP = "PUP";
        public const string LOB_CA = "CA";
        public const string LOB_CGL = "CGL";
        public const string LOB_BOP = "BOP";
        public const string LOB_CUMB = "CUMB";
        public const string LOB_CPP = "CPP";
        public const string LOB_WC = "WC";
        public const string LOB_DW = "DW";
        public const string LOB_UMB = "UMB";
        public const string LOB_GL = "GL";
        public const string LOB_PLA = "PLA";
        public const string LOB_WCU = "WC";

        public const string Mode_Simulator = "Simulator";

        public static readonly string Archive_Only = "Archive Only";
        public static readonly string NoDataMsg = "Information not provided by source";
        public const string ADgroupspermissionsError = "Please check your AD groups permissions";
        public static readonly string Unassigned = "Unassigned";
        public static readonly string Person = "Person";
        public static readonly string Organization = "Organization";
        public static readonly string Company = "Company";
        public static readonly string EstateOf = "ESTATE OF";
        public static readonly string LookupData = "LookupData";
        public static readonly string ControlType = "ControlType";
        public static readonly string NamedInsured = "Named Insured";
        public static readonly string AdditionalInsured = "Additional Insured";
        public static readonly string AdditionalInterest = "Additional Interest";
        public static readonly string AdditionalInterestNoSpace = "AdditionalInterest";
        public static readonly string BureauID = "BureauID";
        public static readonly string Workers_Compensation = "Workers Compensation";
        public static readonly string NJC = "NJC";
        public static readonly string WCU_Correspondence = "WCU  Correspondence";
        public static readonly string HTTP_Error_404 = "404";
        public static readonly string CurrentDate_Format = "MMMM d, yyyy";
        public static readonly string DateFormat = "M/d/yyyy";
        public static readonly string DateFormat_YMD = "yyyy-MM-dd";
        public static readonly string CurrentUser = "Current User";
        public static readonly string Address_Home = "Home";
        public static readonly string Address_Inspection = "Inspection";
        public static readonly string Address_Mailing = "Mailing";
        public static readonly string Address_Complete = "COMPLETE";
        public static readonly string Address_Deed = "DEED";
        public static readonly string Address_Risk = "Risk";
        public static readonly string PRINT_IND_BOTH = "PRINT_IND_BOTH";
        public static readonly string PRINT_IND_BATCH = "PRINT_IND_BATCH";
        public static readonly string PRINT_IND_BATCH_ONLY = "BATCH";

        public static readonly string PRINT_IND_NO = "PRINT_IND_NO";
        public static readonly string CITY = "CITY";
        public static readonly string TOWNSHIP = "TOWNSHIP";
        public static readonly string COUNTY = "COUNTY";
        public static readonly string Accident = "ACCIDENT";
        public static readonly string Driver = "DRIVER";
        public static readonly string Property = "PROPERTY";
        public static readonly string Property_Info = "PROPERTY_INFO";


        public const string PLFirstAddresseeInformationRoles = "Primary Named Insured,Secondary Named Insured,AdditionalInsured,HO Interested Party,HO Named Insured,Other Named Insured,PUP Interested Party,Spouse,Broker,Executor Executrix,Guardian,ThirdParty,Trust,Trustee,Power Of Attorney,Additional Interest,Household Member,Additional Named Insured,Organization";
        public const string PrimaryNamedInsured = "Primary Named Insured";
        public const string SecondaryNamedInsured = "Secondary Named Insured";
        public const string OtherNamedInsured = "Other Named Insured";
        public const string TertiaryNamedInsured = "Tertiary Named Insured";
        public const string Spouse = "Spouse";

        public const string Collision = "Collision";
        public const string Comprehensive = "Comprehensive";
        public const string Liability = "Liability";
        public const string Liability_Limit = "Liability Limit";
        public const string TotalBasicPremium = "Total Basic Premium";
        public const string TotalBasicPremiumFullTort = "Total Basic Premium Full Tort";
        public const string UnInsuredMotorist = "UnInsured UnderInsured Motorist";
        public const string PIP = "Personal Injury Protection";
        public const string PIP_Ded = "PIP Deductible";
        public const string PIP_Health = "Health Insurance";
        public const string PIP_Lawsuit_Limit = "Limitation on Lawsuit";
        public const string PIP_Lawsuit_No_Limit = "No Limitation on Lawsuit";
        public const string PIP_NJM = "NJM";
        public const string PIP_Non_Med_Exp = "PIP Non Medical Benefits";
        public const string PIP_Med_Exp = "PIP Medical Expense Limit";
        public const string Health_Ins_Primary = "Health insurance primary";
        public const string Limit_Lawsuit = "Limitation on Lawsuit";
        public const string No_Limit_Lawsuit = "No Limitation on Lawsuit";
        public const string Limitation = "Limitation";
        public const string No_Limitation = "NoLimitation";
        public const string PA_UnInsuredMotorist = "UnInsured Motorist";
        public const string PA_UnInsuredMotoristLimit = "Uninsured Motorist Limit";
        public const string PA_UnderInsuredMotorist = "UnderInsured Motorist";
        public const string PA_UnderInsuredMotoristLimit = "Underinsured Motorist Limit";
        public const string No_Coverage = "No Coverage";

        public const string PA_UMEQLIABLimit = "UMEQLIABLimit";
        public const string PA_UMLTLIABLimit = "UMLTLIABLimit";
        public const string PA_EUIMLimit = "EUIMLimit";
        public const string PA_UMUIMStandardLimit = "UMUIMStandardLimit";
        public const string PA_UMUIMConversionLimit = "UMUIMConversionLimit";
        public const string PA_Double_BI_Limit = "Double BI Limit";
        public const string PA_BI_Limit = "BI Limit";
        public const string PA_Minimum_Limit = "Minimum Limit";
        public const string PA_Premium = "Premium";
        public const string PA_Total_Cost_RPT_Amount = "Total Cost RPT Amount";
        public const string PA_Total_Policy_Premium_Fullpay_Option3 = "Total Policy Premium Fullpay Option3";
        public const string PA_Total_Policy_Premium_Fullpay_Option1 = "Total Policy Premium Fullpay Option1";
        public const string PA_Total_Policy_Premium = "Total Policy Premium";   //ST092024: New field where TOT_PREM will be passed by ESB.

        //562096
        public const string PA_CSF_PIPLimit1Mil_HighDollar = "CSF PIPLimit1Mil HighDollar";
        public const string PA_CSF_PIPLimit1Mil_LowDollar = "CSF PIPLimit1Mil LowDollar";
        public const string PA_CSF_PIPLimit1Mil_HighPer = "CSF PIPLimit1Mil HighPer";
        public const string PA_CSF_PIPLimit1Mil_LowPer = "CSF PIPLimit1Mil LowPer";
        public const string PA_CSF_PIPLimit150K_HighDollar = "CSF PIPLimit150K HighDollar";
        public const string PA_CSF_PIPLimit150K_LowDollar = "CSF PIPLimit150K LowDollar";
        public const string PA_CSF_PIPLimit150K_HighPer = "CSF PIPLimit150K HighPer";
        public const string PA_CSF_PIPLimit150K_LowPer = "CSF PIPLimit150K LowPer";
        public const string PA_CSF_PIPLimit75K_HighDollar = "CSF PIPLimit75K HighDollar";
        public const string PA_CSF_PIPLimit75K_LowDollar = "CSF PIPLimit75K LowDollar";
        public const string PA_CSF_PIPLimit75K_HighPer = "CSF PIPLimit75K HighPer";
        public const string PA_CSF_PIPLimit75K_LowPer = "CSF PIPLimit75K LowPer";
        public const string PA_CSF_PIPLimit50K_HighDollar = "CSF PIPLimit50K HighDollar";
        public const string PA_CSF_PIPLimit50K_LowDollar = "CSF PIPLimit50K LowDollar";
        public const string PA_CSF_PIPLimit50K_HighPer = "CSF PIPLimit50K HighPer";
        public const string PA_CSF_PIPLimit50K_LowPer = "CSF PIPLimit50K LowPer";
        public const string PA_CSF_PIPLimit15K_HighDollar = "CSF PIPLimit15K HighDollar";
        public const string PA_CSF_PIPLimit15K_LowDollar = "CSF PIPLimit15K LowDollar";
        public const string PA_CSF_PIPLimit15K_HighPer = "CSF PIPLimit15K HighPer";
        public const string PA_CSF_PIPLimit15K_LowPer = "CSF PIPLimit15K LowPer";
        public const string PA_CSF_PIPDED500_HighDollar = "CSF PIPDED500 HighDollar";
        public const string PA_CSF_PIPDED500_LowDollar = "CSF PIPDED500 LowDollar";
        public const string PA_CSF_PIPDED500_HighPer = "CSF PIPDED500 HighPer";
        public const string PA_CSF_PIPDED500_LowPer = "CSF PIPDED500 LowPer";
        public const string PA_CSF_PIPDED1000_HighDollar = "CSF PIPDED1000 HighDollar";
        public const string PA_CSF_PIPDED1000_LowDollar = "CSF PIPDED1000 LowDollar";
        public const string PA_CSF_PIPDED1000_HighPer = "CSF PIPDED1000 HighPer";
        public const string PA_CSF_PIPDED1000_LowPer = "CSF PIPDED1000 LowPer";
        public const string PA_CSF_PIPDED2000_HighDollar = "CSF PIPDED2000 HighDollar";
        public const string PA_CSF_PIPDED2000_LowDollar = "CSF PIPDED2000 LowDollar";
        public const string PA_CSF_PIPDED2000_HighPer = "CSF PIPDED2000 HighPer";
        public const string PA_CSF_PIPDED2000_LowPer = "CSF PIPDED2000 LowPer";
        public const string PA_CSF_PIPDED2500_HighDollar = "CSF PIPDED2500 HighDollar";
        public const string PA_CSF_PIPDED2500_LowDollar = "CSF PIPDED2500 LowDollar";
        public const string PA_CSF_PIPDED2500_HighPer = "CSF PIPDED2500 HighPer";
        public const string PA_CSF_PIPDED2500_LowPer = "CSF PIPDED2500 LowPer";
        public const string PA_CSF_LawsuitOptions_HighDollar = "CSF LawsuitOptions HighDollar";
        public const string PA_CSF_LawsuitOptions_LowDollar = "CSF LawsuitOptions LowDollar";
        public const string PA_CSF_LawsuitOptions_HighPer = "CSF LawsuitOptions HighPer";
        public const string PA_CSF_LawsuitOptions_LowPer = "CSF LawsuitOptions LowPer";
        public const string PA_CSF_PIPNonMedical_HighDollar = "CSF PIPNonMedical HighDollar";
        public const string PA_CSF_PIPNonMedical_LowDollar = "CSF PIPNonMedical LowDollar";
        public const string PA_CSF_PIPNonMedical_HighPer = "CSF PIPNonMedical HighPer";
        public const string PA_CSF_PIPNonMedical_LowPer = "CSF PIPNonMedical LowPer";

        public const string PIP_Tot_Family = "Total Supplemental Family Member Liability Coverage Premium";
        public const string PIP_Tot_Pre = "Total Policy Full PIP Premium";
        public const string PIP_Waiver_Per = "PIP Waiver Percentage";
        public const string PIP_Waived_Pre = "Total Policy Waived PIP Premium";
        public const string PIP_Health_Ins = "Health Insurance Policy";

        public const string PA_LawsuitThreshold = "Lawsuit Threshold";
        public const string PA_LawsuitThresholdLimit = "Lawsuit Threshold Limit";
        public const string PA_License_Suspended = "Suspended";
        public const string PA_License_Own_Ins = "Own Insurance";

        public const string PA_Tort = "Tort";
        public const string PA_TortOption = "Tort Option";
        public const string PA_Registration = "Registration";
        public const string PA_Blank = "Blank";

        public static readonly string YES = "Y";
        public static readonly string NO = "N";
        public const string PLCompleteAddressTypes = "Vacant Land,Property";
        public const string PLVacantLandType = "Vacant Land";
        public const string PLDriverInfoTypes = "Active DL,Suspended,International,Permit";

        public const string ObtainedUnderlyingPolicies = "Obtained Underlying Policies";
        //public const string AutoDrivingRecord = "Auto-Driving Record";
        //public const string DrivingRecordAtFaultAccidents = "Driving Record-At Fault Accidents";
        //public const string DrivingRecordAllOtherClaims = "Driving Record-All Other Claims";
        //public const string DrivingRecordMotorVehicleHistory = "Driving Record-Motor Vehicle History";
        //public const string AtfaultAccidentViolations = "At-fault accident/Violations";

        public static readonly string Dear = "Dear";
        public static readonly string And = "and";
        public static readonly string Both = "both";

        public const string Attention = "Attention";
        public const string Greeting = "Greeting";


        public const string ClientPagesNamespace = "AdhocCorrespondenceEditor.Client.Shared.";

        //following used in PL
        public const string Coverage_A_Dwelling = "Coverage A - Dwelling";
        public const string Coverage_B_Dwelling = "Coverage B - Other Structures";
        public const string Coverage_C_Dwelling = "Coverage C - Personal Property";
        public const string Coverage_D_Dwelling = "Coverage D - Fair Rental Value";
        public const string Coverage_E_Dwelling = "Coverage E - Additional Living Expenses";
        public const string Coverage_F_Dwelling = "Coverage F - Medical Payments to Others";
        public const string Coverage_I_Dwelling = "Section I Deductible";
        public const string Coverage_D_Home = "Coverage D - Loss of Use";
        public const string Coverage_E_Home = "Coverage E - Personal Liability";
        public const string Coverage_Wind_Hail_Ded_Home = "Windstorm/HailDeductible";


        //Ho Values
        public const string NotAdded = "Not Added";
        public const string Declined = "Declined-AI";
        public const string Added = "Added";

        // PL-Auto
        public const string CooperationDutiesAfterAcc = "Cooperation-Duties after Acc";
        public const string Finance = "Finance";
        public const string Financed = "Financed";
        public const string Additional = "Additional";
        public const string Lessor = "Lessor";
        public const string Leased = "Leased";
        public const string Owned = "Owned";
        public const string LienHolder = "Lien Holder";
        public const string PACollisionCov = "PACollisionCov";
        public const string PALiabilityCov = "PALiabilityCov";
        public const string PAComprehensiveCov = "PAComprehensiveCov";
        public const string PA_CSF_Effective_MidTerm_Change = "M";
        public const string DocNameMatureDriverCourse = "Mature Driver Course";
        public const string DocNameMatureDriverAccidentPreventionCourseDiscount = "Mature Driver Accident Prevention Course Discount";

        /// <summary>       
        /// Document Names
        /// </summary>
        public const string Doc_MD_MidTerm_Cancel = "MD Midterm Cancel";
        public const string Doc_UM_UIM_Form2 = "UM-UIM Form 2";
        public const string Doc_LimitedPowerAttny = "Limited Power of Attorney";
        public const string Doc_NJM_NJ_StandardCSF = "NJM NJ Standard CSF";

        public const string Doc_Manual_Invoice = "Manual Invoice";
        public const string Doc_Policyholder_Accounting_Statement = "Policyholder Accounting Statement";
        public const string DocNameExpModLetterBiddingDates = "Exp Mod Letter Bidding-Dates";
        public const string DocNameOHNoticeofNonrenewal = "OH Notice of Nonrenewal";

        public const string DocNameNoticeofNonrenewal = "Notice of Nonrenewal";
        public const string DocNameNoticeofNonrenewalWithdrawal = "Notice of Nonrenewal Withdrawal";
        public const string DocNameMidtermCancelWithdrawal = "Midterm Cancel Withdrawal";

        //WCC
        public const string PolicyNum = "Policy Number";
        public const string ClaimPetitionNum = "Claim Petition Number";
        public const string StateIdNum = "State ID Number";
        public const string CPNum = "CP Numbers";
        public const string DocketNum = "Docket Number";
        public const string ListDate = "Listing Date";
        public const string NYWCBNum = "NY WCB Number";
        public const string ReferenceNum = "Reference Number";
        public const string PolicyHolder = "Policy holder";
        public const string Time_AM = "AM";
        public const string Time_PM = "PM";
        public const string NetTotalIncurred = "Net Total Incurred";
        public const string Indemnity = "Indemnity";
        public const string Medical = "Medical";
        public const string OpenReserves = "Open Reserves";
        public const string Temp = "Temp";
        public const string Perm = "Perm";
        public const string AdjustedPaid = "Adjusted Paid";
        public const string Claim = "Claim";
        public const string Primary = "Primary";
        public const string Insured = "Insured";
        public const string SecondInsured = "SecondInsured";
        public const string Claimant = "Claimant";
        public const string NJMEnCrypt = "NJMENCRYPT";
        public const string IndustrialMedicineFacility = "Industrial Medicine Facility";
        public const string PetitionersLawFirm = "Petitioners Law Firm";
        public const string Other = "Other";
        //WCC Ends here

        //GC
        public const string FirstInsured = "FirstInsured";
        public const string ThirdInsured = "ThirdInsured";
        public const string MainContact = "MainContact";
        public const string GC_PIP = "PIP";
        public const string MedPay = "MedPay";
        public const string Med_Pay = "Med Pay";
        public const string SalvageRep = "Salvage Representative";
        public const string LossLoc = "Loss Location:";
        public const string YourClaimNo = "Your Claim No:";
        public const string YourPolicyNo = "Your Policy No:";
        public const string YourInsuredNo = "Your Insured:";
        public const string YourClientNo = "Your Client:";
        public const string CaseCaption = "Case Caption:";
        public const string YourFileno = "Your File No:";
        public const string DateOfService = "Date(s) of Service:";
        public const string Yourclaimant = "Claimant:";
        public const string Multiple = "Multiple";

        //GC ends here

        /// API Calls URLS
        public const string UrlDocumentDropDown = "api/Lookup/documentdropdownlookupdata/";
        public const string UrlLookupGetAppSettings = "api/Lookup/GetAppSettings/";
        public const string UrlReferenceDataCategory = "api/referenceData/category/";
        public const string UrlLookupPrinter = "api/Lookup/printer/";
        public const string UrlPrinter = "api/printer";
        public const string UrlPrinterMap = "api/printerlookup";
        public const string UrlUpdatePrinterMap = "api/printerlookup/update/";
        public const string UrlAddPrinterMap = "api/printerlookup/add/";
        public const string UrlAddPrinter = "api/printer/add/";
        public const string UrlUpdatePrinter = "api/printer/update/";
        public const string UrlLookupRule = "api/Lookup/rule/";
        public const string UrlLookupRuleLookup = "api/Lookup/ruleLookup/";
        public const string UrlLookupPolicyLookup = "api/Lookup/policylookup/";
        public const string UrlLookupGenericLookup = "api/Lookup/genericlookup/";
        public const string UrlLookupconfiguration = "api/Lookup/configuration/";
        public const string UrlLookupDenialReasons = "api/Lookup/DenialReasons/";
        public const string UrlExternalServiceEsb = "api/externalservice/esb/";
        public const string UrlUser = "api/User/";
        public const string UrlLookupGetWebServiceSearch = "api/Lookup/GetWebServiceSearch/";
        public const string UrlReferenceDataDocument = "api/referenceData/document/";
        public const string UrlReferenceDataLob = "api/referenceData/lob/";
        public const string UrlReferenceDataDocumentcontrol = "api/referenceData/documentcontrol/";
        public const string UrlLookupDataDocumentChildcontrol = "api/Lookup/documentdropdownchildcontrol/";
        public const string UrlExternalserviceOnbase = "api/externalservice/onbase/";
        public const string UrlLookupWebservice = "api/Lookup/webservice/";
        public const string UrlDocumentlog = "api/documentlog";
        public const string UrlEzsendRequest = "api/EZSend/getrequest/";
        public const string UrlUpdateEZSendUser = "api/EZSend/updateuser/";
        public const string UrlUpdateEZSendStatus = "api/EZSend/updatestatus/";
        public const string UrlSubmitEzSend = "api/EZSend/ezsendsubmit/";
        public const string UrlValidatePhone = "api/EZSend/validatephone/";



        public static readonly Dictionary<string, string> TransactionType =
            new Dictionary<string, string>
        {
                {"Submission","New Bus"},
                {"Rewrite","Rewrite"},
                {"Renewal","Renewal"}
        };

        public static readonly Dictionary<string, string> Quote =
            new Dictionary<string, string>
        {
                {"Commercial Package Policy","C"},
                {"Commercial Auto","A"},
                {"General Liability","G"},
                {"Workers Compensation","W"},
                {"Businessowners","B"},
                {"Commercial Umbrella","U"}
        };

        public static readonly Dictionary<string, string> PolicyLine =
            new Dictionary<string, string>
        {
                {"Commercial Property Line (v7)","Commercial Property"},
                {"Crime Line","Commercial Crime"},
                {"Commercial Inland Marine Line","Commercial Inland Marine"},
                {"General Liability (v7)","General Liability"}
        };

        public static readonly Dictionary<string, string> LineOfBusiness =
            new Dictionary<string, string>
        {
                {"CommercialPackagePolicy","Commercial Package Policy"},
                {"CA7Line","Commercial Auto"},
                {"WorkersCompLine","Workers Compensation"},
                {"GL7Line","General Liability"},
                {"BP7Line","Businessowners"},
                {"CommercialUmbrellaLine_CUE","Commercial Umbrella"}
        };

        //BC Related

        public static readonly Dictionary<string, string> BCOutBoundType =
            new Dictionary<string, string>
        {
                {"PA","POLDOC  Correspondence"},
                {"HO","POLDOC  Correspondence"},
                {"PUP","POLDOC  Correspondence"},
                {"CA","CL  Correspondence"},
                {"CGL","CL  Correspondence"},
                {"BOP","CL  Correspondence"},
                {"CUMB","CL  Correspondence"},
                {"WC","WCU  Correspondence"},
                {"CPP","CL  Correspondence"}

        };
        public static readonly Dictionary<string, string> BCObKeyword4 =
            new Dictionary<string, string>
        {
                {"WC","WORKERS COMP"},
                {"PA","AUTO"},
                {"Homeowners","HOME"},
                {"Dwelling","DWELLING"},
                {"PUP","UMBRELLA"},
                {"CA","COMMERCIAL AUTO"},
                {"CGL","GENERAL LIABILITY"},
                {"BOP","BUSINESS OWNERS"},
                {"CUMB","COMMERCIAL UMBRELLA"},
                {"CPP","COMMERCIAL PACKAGE POLICY"}
        };

        public static readonly Dictionary<string, string> BCLineOfBusiness =
            new Dictionary<string, string>
        {
                {"WC","WC"},
                {"PA","PLA"},
                {"Homeowners","HO"},
                {"Dwelling","DW"},
                {"PUP","UMB"},
                {"CA","CA"},
                {"CGL","GL"},
                {"BOP","BOP"},
                {"CUMB","CUMB"},
                {"CPP","CPP"}
         };
        public static readonly Dictionary<string, string> BCProductType =
            new Dictionary<string, string>
        {
                {"WC","WORKERS COMP"},
                {"PA","Personal Auto"},
                {"Homeowners","Homeowners"},
                {"Dwelling","Dwelling"},
                {"PUP","Umbrella"},
                {"CA","Commercial Auto"},
                {"CGL","General Liability"},
                {"BOP","Business Owners"},
                {"CUMB","Commercial Umbrella"},
                {"CPP","Commercial Package Policy"}
         };

        public static readonly Dictionary<string, string> BCObKeyword5 =
new Dictionary<string, string>
 {
                {"DD-Remove from Direct Debit","DIRECT DEBIT"},
                {"DD-Waiting for New Funding","DIRECT DEBIT"},
                {"DD-Remove Multiple Cancel Pymts","DIRECT DEBIT"},
                {"PL Request Reissue of Check","CASH MANAGEMENT"},
                {"PL BC Blank Letter Template","CASH MANAGEMENT"},
                {"PL Claim Settlement","CASH MANAGEMENT"},
                {"PL Direct Debit Letter","CASH MANAGEMENT"},
                {"PL Not Honored Pymt Request Replace","CASH MANAGEMENT"},
                {"PL Policyholder Acct Statement","CASH MANAGEMENT"},
                {"PL Partial Pymt Pending CN Stands","CASH MANAGEMENT"},
                {"PL Return Pymts","CASH MANAGEMENT"},
                {"PL Pymt Accepted CN Stands","CASH MANAGEMENT"}  ,
                {"Manual Invoice","CASH MANAGEMENT"},
                {"PL Not Honored Pymt on Pending CN",""}
};

        public static readonly Dictionary<string, string> BCObKeyword6 =
        new Dictionary<string, string>
         {
                {"PL Not Honored Pymt on Pending CN","NOT HONORED PYMT PEND CANCEL"},
                {"PL Loss Payee NH Pymt CN DT Stands","NOT HONORED PYMT CANCEL DT STANDS"},
                {"PL Not Honored Pymt Orig CN DT Stnd","NOT HONORED PYMT CANCEL DT STANDS"},
                {"PL Partial Pymt Pending CN Stands","PARTIAL PYMT PEND CANCEL STANDS"},
                {"PL Pymt Accepted CN Stands","CANCELLATION"},
                {"PL Return Pymt Letter","CANCELLATION"},
                {"Manual Invoice","INVOICE"}
         };
        public static readonly Dictionary<string, string> BCObKeyword10 =
                new Dictionary<string, string>
            {
                {"PL Partial Pymt Pending CN Stands","PARTIAL PYMT PEND CANCEL STANDS"},
                {"PL Not Honored Pymt on Pending CN","NOT HONORED PYMT PEND CANCEL"},
                {"PL Not Honored Pymt Orig CN DT Stnd","NOT HONORED PYMT CANCEL DT STANDS"},
                {"PL Return Pymts","NOT HONORED PYMT CANCEL DT STANDS"},
                {"PL Return Pymt Letter","CANCELLATION"}
            };
        public static readonly Dictionary<string, string> BCEmailSubjectByPolicy =
          new Dictionary<string, string>
      {
               { LOB_HO, "Homeowners"},
               {LOB_DW, "Dwelling" },
               {LOB_PLA, "Automobile" },
               {LOB_UMB, "Umbrella" }
       };

        public static readonly List<string> PLPolicyTypes = new List<string> {
            LOB_DW,
            LOB_HO,
            LOB_PLA,
            LOB_UMB };


    }

}
