using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class PLPAUserEntity : PLOutputBase
    {
        public DateTime LIC_MVR_SuspendDate { get; set; }
        public string SelectedDriverNameMVRSuspendDate { get; set; } // this is Special case where we need to display LICENSE_REGISTRATION_SUSPENSION_INDICATOR
        public List<string> ClueReferenceNumber { get; set; } //CLUE_REF_NO
        public DateTime CoverageEffectiveDate { get; set; } //COV_EFF_DT

        public DateTime NoticeNonrenewalEvent_DT { get; set; } //EVENT_DT
        public DateTime NoticeNonrenewalCLAIM_DT { get; set; } //CLAIM_DT
        public List<PolDriveInfo> PolicyDriverDetails { get; set; } //POL_DRVR_DESC--> DRVR_NAME
        public List<string> InvalidLicDriverName { get; set; } //INVALID_DRV--> INV_LIC_DRVR_NAME  // INV_LIC_IND = 'Y'
        public List<string> SuspendedLicDriverName { get; set; } //LIC_SUSP--> SUSP_LIC_DRVR_NAME // LIC_SUSP_IND='Y'
        public List<string> SuspendedDriversWhileDriving { get; set; } //SUSP_DRV--> SUSP_LIC_DRVR_NAME //SUSP_DRVR_IND= 'Y'
        public string ReasonNonrenewal { get; set; } //NON_RNWL_IND
        public string ReasonNonrenewalCancel { get; set; } //CNC_RSN
        public string ReasonNonrenewalInspireTag { get; set; } //NON_RNWL_IND
        public string Reason { get; set; }
        public string ReasonDeletionOfCoverage { get; set; } //DEL_COV_REAS_IND
        public string DeletionType { get; set; } //DEL_TYP

        public string ReasonDeletionOfCoverageOtherInfo { get; set; }
        public string DeletionTypeOtherInfo { get; set; } //DEL_TYP

        public string InspectionReason { get; set; } //INSPECTION_RESULTS
        public List<VehicleDiscription> VehicleDiscriptions { get; set; } //VEH_DESC
        public bool? VehicleInfoInd { get; set; } //VEH_INFO_IND

        public DateTime IDCardValidFrom { get; set; } //ID_CARD_VALID_FROM
        public DateTime IDCardValidTo { get; set; } //ID_CARD_VALID_TO

        public List<MRVRReference> MRVRReferences { get; set; } //POL_DRVR_DESC // MVR_CLUE_REF_INDICATOR = 'Y'
        public string ClaimNumber { get; set; } //CLAIMS_POL --> CLAIM_NUM
        public bool? IsNDEOffer { get; set; } //NDEOffer
        public DateTime LicenseMVRSuspendedDate { get; set; } //LicenseMVRSuspendedDate
        public List<ServiceEvent> ServiceEvents { get; set; } //SERVICE_EVNT
        public PIPIndicators AddedPip { get; set; } //HIGHER_LMT_NOT_SELECT_IND, OTHER_INS_IND, PIP_MED_EXP_IND, NON_REL_RESIDENT_IND
        public string CsfEffective { get; set; } //CSF_EFF
        public string CsfBlankPrefilled { get; set; }  //CSF_BLK_PREFLL
        public List<ClaimAccInformation> ClaimInformation { get; set; }//ACC_INFO
        public string SpouseParterName { get; set; }  //SPOUSE_PARTNER_NAME

        public List<ReinstCancelDates> ReinstCancelDates { get; set; } //REINSTATE_CNCL_DT

        public string SpouseDivorceInfo { get; set; }  //SEPARATE_DIVORCE_IND
        public string ClaimPolicyInd { get; set; }  //CLAIMS_POL_IND
        public string noofClaimReported { get; set; }  //NUM_CLM_RPT
        public List<ClaimOnPolicyInfo> ClaimOnPolicyDetails { get; set; } //CLAIMS_POL
        public string VehicleCoverageInd { get; set; }  //VERIFY_COV_IND
        public string InsuredYears { get; set; }  //NUM_YRS_INS
        public DateTime VehicleCoverageCancelDate { get; set; }  //CNC_EFF_DT
        
        public string Reconsideration { get; set; }  //RECONSIDER_IND 
        public string PolicyNumber { get; set; }  //PRIOR_POL_NO
        public string PiiorBalance { get; set; }  //PRIOR_BAL
        public string MidTermCancelationInd { get; set; }  //MIDTRM_CNCL_IND
        public DateTime LicenseSuspendedDate { get; set; }  //LIC_MVR_SUSPEND_DT
        public DateTime VehicleOperatingDate { get; set; }  //VEH_OPERTNG_DT
        public string ViolationReasonInd { get; set; }  //VIOL_RSN_IND

        public bool? DuiInd { get; set; } //DUI_IND

    }
    public class VehicleDiscription //VEH_DESC
    {
        public string VehicleId { get; set; }
        public short ModelYearNr { get; set; } //VEH_YR
        public string VehicleTradeNm { get; set; } //VEH_MK
        public string ModelNm { get; set; } //VEH_MDL
        public string ManufacturerVehicleIdentificationNr { get; set; } //VEH_VIN

        public string LeaseCoName { get; set; } //LEASE_CO_NAME

        public string ControlType { get; set; } //TITLE_IND, PURC_ORDR_IND, LEASE_AGREE_IND, REGSTR_IND, FIN_AGREE_IND

        public bool? VinInd { get; set; } //VEH_VIN_IND
        public bool? FinanceCompanyInd { get; set; } //VEH_FIN_IND
        public bool? LeaseCompanyInd { get; set; } //VEH_LEASE_IND
        public bool? VehicleCoverageInd { get; set; }  //VERIFY_COV_IND
        public string CollisionDeductible { get; set; } //COLL_DED
        public string OtherCollisionDeductible { get; set; } //OTH_THAN_COLL_DED
        public string CollisionPrem { get; set; } //COLL_PREM
        public string LiabilityPrem { get; set; } //LIAB_PREM
        public string OtherCollisionPrem { get; set; } //OTH_THAN_COLL_PREM
        public string PipMedLimitPrem { get; set; } //PIP_MED_LMT_PREM
        public string VehicleBodyType { get; set; } //VEH_BODY_TYPE
        public string StatedValue { get; set; }//ST_AMT
        public string FinanceCpyName { get; set; }//FINANCE_CO_NAME",
        public string FinanceCpyAddr1 { get; set; }//FINANCE_CO_ADDR_1
        public string FinanceCpyAddr2 { get; set; }//FINANCE_CO_ADDR_2
        public string FinanceCpyAddr3 { get; set; }//FINANCE_CO_ADDR_3
        public string FinanceCpyCity { get; set; }//FINANCE_CO_CTY", 
        public string FinanceCpyState { get; set; }//FINANCE_CO_ST", $
        public string FinanceCpyZip { get; set; }//FINANCE_CO_ZIP", 

        public string LeaseCpyAddr1 { get; set; }//LEASE_CO_ADDR_1
        public string LeaseCpyAddr2 { get; set; }//LEASE_CO_ADDR_2
        public string LeaseCpyAddr3 { get; set; }//LEASE_CO_ADDR_3
        public string LeaseCpyCity { get; set; }//LEASE_CO_CTY", 
        public string LeaseCpyState { get; set; }//LEASE_CO_ST", $
        public string LeaseCpyZip { get; set; }//LEASE_CO_ZIP", 


    }

    public class MRVRReference //POL_DRVR_DESC
    {
        public string SelectedDriverName { get; set; } //DRVR_NAME
        public string MVRReferenceNumber { get; set; } //MVR_REF_NUM1
    }
    public class ServiceEvent
    {
        public DateTime? Date { get; set; } //SERVICE_EVENT
        public string VehicleText { get; set; } //SERVICE_VEHICLE
        public string Description { get; set; } //SERVICE_DESC
    }

    public class ClaimAccInformation //ACC_INFO
    {
        public DateTime ClaimDate { get; set; } //ACC_DT
        public bool? DriverNmCheck { get; set; } //ACC_INFO_NAME_IND
        public bool? PoliceReportCheck { get; set; } //ACC_INFO_POLICE_RPT_IND
        public bool? InsLtrCheck { get; set; } //ACC_INFO_INS_LTR_IND
    }

    public class PolDriveInfo //POL_DRVR_DESC
    {
        public string DriverName { get; set; } //DRVR_NAME

        public int? DriverDOBYear { get; set; } //DRVR_YR_BRTH

        public bool? ProofCovInd { get; set; } //PROOF_COV_IND 


        public bool? DriverNameInd { get; set; } //OTH_RES_DRVR_NAME_IND
        public bool? DateOfBirth { get; set; }  //OTH_RES_DOB_IND
        public bool? MaritalStatus { get; set; } //OTH_RES_MARITAL_IND
        public bool? RelationToApplicant { get; set; } //OTH_RES_REL_IND
        public bool? InsuranceInfo { get; set; } //OTH_RES_INS_IND
        public bool? LicenseInfo { get; set; } //OTH_RES_LIC_IND
        public bool? ValidLicenceInfo { get; set; } //OTH_RES_VLD_LIC_IND
        public bool? PriorLicenseInfo { get; set; } //OTH_RES_PRIOR_LIC_IND
        public bool? ProofOfResidency { get; set; } //OTH_RES_NOT_LEGAL_IND
        public bool? OtherHouseholdInd { get; set; } //OTH_RES_IND
        public bool? NameInd { get; set; } //DRVR_NAME_IND
        public bool? GenderInd { get; set; } //DRVR_GNDR_IND
        public bool? DateOfBirthInd { get; set; } //DRVR_DOB_IND
        public bool? LicenseNumberInd { get; set; } //DRVR_LIC_IND
        public bool? LicenseStateInd { get; set; } //DRVR_LIC_ST_IND
        public bool? DateFirstLicensedInd { get; set; } //DRVR_DT_LIC_IND
    }

    public class ReinstCancelDates //REINSTATE_CNCL_DT
    {
        public DateTime ReinstateDate { get; set; } //REINSTD_DT
        public DateTime CancelDate { get; set; } //CNCL_DT
    }

    public class ClaimOnPolicyInfo
    {
        public string NJMClaimNo { get; set; } //CLAIM_NUM
        public DateTime? NJMClaimDate { get; set; } //CLAIM_DT
        public string NJMClaimDiscription { get; set; } //CLAIM_DESC

    }
    public class PIPIndicators
    {
        public bool? HIGHER_LMT_NOT_SELECT_IND { get; set; }  //HIGHER_LMT_NOT_SELECT_IND,
        public bool? OTHER_INS_IND { get; set; }   //OTHER_INS_IND, //
        public bool? PIP_MED_EXP_IND { get; set; }   //PIP_MED_EXP_IND, 
        public bool? NON_REL_RESIDENT_IND { get; set; }   //NON_REL_RESIDENT_IND
    }

}