
namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class PLHoUmbDwUserEntity : PLOutputBase
    {
        public List<HO61Details> HO61DetailsList { get; set; } = new List<HO61Details>();

        public List<string> UpdateAppraisalNames { get; set; }

        public Address? CertificateHolderDetails { get; set; } 
        public string CertificateLocationTx { get; set; }

        public List<Address> CompleteAddresses { get; set; }
        public List<string> VacantLandInfo { get; set; }        
        public List<Address> NameOnDeedAddresses { get; set; } 
        public List<PropertyDetailInfo> PropertyDetails { get; set; } 

        public List<WatercarftInfoDetail> WatercarftInfoDetails { get; set; }
        public List<VehicleDetails> VehicleDetails { get; set; } 
        public List<BusinessUseDetails> BusinessDetails { get; set; }
        public List<DriveInfoDetails> DriverDetails { get; set; } 
        public List<AccidentInfo> AccidentInfoDetails { get; set; }

        public Address RiskLocation { get; set; } = new Address();

        public List<Address> InspectionAddresses { get; set; } 
        public List<Address> ClaimsHomeAddresses { get; set; } 
        public List<string> DriverRecName { get; set; } 
        public List<string> ClaimsAutoDriverName { get; set; } 

        public List<string> WithdrawalReasonDriverName { get; set; }
        public string WithdrawalCancelReason { get; set; }
        public string UnderlyingPolicy { get; set; }
        public Address InspectionPropertyLocation { get; set; } = new Address();
        public string InspectionVacantLandLocation { get; set; }
        public string NoticeofNonrenewalWithdrawalReason { get; set; }
        public string NoticeofNonrenewalReason { get; set; }
        public string NonrenewalWithdrawalCancelReason { get; set; }

        public string UnderlyingPolicyType { get; set; }

        public string InspireReasonTag { get; set; }
        public OHCancellationNonRenewal OHCancellationNonRenewalDetail { get; set; }
    }

    public class PropertyDetailInfo
    {
        public Address CompleteAddresses { get; set; } = new();
        public bool OccupancyType { get; set; }
        public bool Usage { get; set; }
        public bool ResidenceType { get; set; }
        public bool Pool { get; set; }
    }
    public class WatercarftInfoDetail
    {
        public string WatercraftDetails { get; set; }
        public bool WatercraftOwnership { get; set; }
        public bool WatercraftType { get; set; }
        public bool WatercraftYear { get; set; }
        public bool WatercraftMake { get; set; }
        public bool WatercraftLength { get; set; }
        public bool MaxHorsepower { get; set; }
        public bool UnderlyingPolicy { get; set; }
    }

    public class VehicleDetails
    {
        public string VehicleDetail { get; set; }
        public bool VehicleType { get; set; }
        public bool VehicleYear { get; set; }
        public bool VehicleMake { get; set; }
        public bool UnderlyingPolicy { get; set; }
        public bool VehicleOwnership { get; set; }
        public bool VehicleRegistration { get; set; }
    }
    public class BusinessUseDetails
    {
        public Address CompleteAddresses { get; set; } = new();
        public bool BusinessType { get; set; }
        public bool Telecommuting { get; set; }
        public bool NumberofClients { get; set; }
        public bool NumberofEmployees { get; set; }
        public bool Advertising { get; set; }
    }    
    public class DriveInfoDetails
    {
        public string DriverName { get; set; }
        public bool RelationshipApplicant { get; set; }
        public bool LicenseStatus { get; set; }
        public bool OwnInsurance { get; set; }
        public bool DateofBirth { get; set; }
        public bool DLNumberandState { get; set; }
        public bool YearFirstLicensed { get; set; }
        public bool PriorDL { get; set; }
        public bool ValidDL { get; set; }
    }

    public class AccidentInfo
    {
        public DateTime AccidentDate { get; set; }
        public string DriverName { get; set; }
        public string DriverNameEntered { get; set; }
        public bool AccidentDescription { get; set; }
        public bool ClaimStatus { get; set; }
        public bool PayoutAmount { get; set; }


    }

    public class OHCancellationNonRenewal
    {
        public bool IsNDEOffer { get; set; }
        public string LicensedFamilyMember { get; set; }
        public DateTime LicenseMVRSuspendedDate { get; set; }
        public string ClueReferenceNumber { get; set; }

        public string MidtermCancellationReason { get; set; }

        public string NonrenewalReason { get; set; }

    }


    public class HO61Details
    {
        public string ControlType { get; set; }

        public string Description { get; set; }
        public bool IsFloaterForm { get; set; }
        public bool IsDescAppraisal { get; set; }
        public string NumberOf { get; set; }
        public string ColorClarity { get; set; }
        public string ColorClarityText { get; set; }

        public bool IsCaratWeight { get; set; }
        public bool IsWatch { get; set; }
        public string WeightOf { get; set; }
        public string SeparateValue { get; set; }
        public bool IsFurs { get; set; }
        public bool IsLengthSweep { get; set; }
        public bool IsReceipt { get; set; }
        public string Certificates { get; set; }
        public string CertificateNumber { get; set; }
        public string FreeForm1 { get; set; }
        public string FreeForm2 { get; set; }

    }

}