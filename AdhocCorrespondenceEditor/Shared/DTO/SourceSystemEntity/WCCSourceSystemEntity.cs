
using System.ComponentModel;

namespace AdhocCorrespondenceEditor.Shared.WCC
{
    public class WCCSourceSystemEntity : SourceSystemBaseEntity
    {
        public Claim Claim { get; set; }
    }


    public partial class PhysicalTherapy
    {

        public string ServiceType { get; set; }
        public string PrimaryBodyPart { get; set; }

        public string DetailedBodyPart { get; set; }


        public string Certification { get; set; }

        public string RequestedVisits { get; set; }

        public string TotalVisitsToDate { get; set; }
        public string AuthorizedVisits { get; set; }
        public string Approved { get; set; }
        public string DiagnosisCode { get; set; }
        public string ID { get; set; }
    }

    public partial class Procedure
    {

        public string ProcedureCode { get; set; }
        public string ProviderStatus { get; set; }
        public string CoSurgeonStatus { get; set; }
        public string AssistantType { get; set; }
        public string AssistantStatus { get; set; }
        public int id { get; set; }
    }


    public partial class Precertification
    {

        public string ReviewType { get; set; }
        public string ProvidertaxNumber { get; set; }
        public string ProviderName { get; set; }
        public string FacilityName { get; set; }
        public string PreAuthorizedStatus { get; set; }
        public string AdmissionStatus { get; set; }
        public string PreSurgeryDate { get; set; }
        public string PreCertificationNumber { get; set; }
        public Procedure[] Procedures { get; set; }
        public int id { get; set; }
    }


    public partial class DMEDetail
    {

        public string EquipmentDetails { get; set; }
        public string Notes { get; set; }
        public int id { get; set; }
    }


    public partial class FinancialReportLineItem
    {
        public FinancialReportLineItemAccountTypeCd AccountTypeCd { get; set; }

        public FinancialReportLineItemReportingCategoryCd ReportingCategoryCd { get; set; }
        public string ParentReportingCategoryCd { get; set; }
        public decimal Amount { get; set; }
    }


    public enum FinancialReportLineItemAccountTypeCd
    {


        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Adjusted Paid")]
        [Description("Adjusted Paid")]
        AdjustedPaid,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Open Reserves")]
        [Description("Open Reserves")]
        OpenReserves,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Net Total Incurred")]
        [Description("Net Total Incurred")]
        NetTotalIncurred,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Open Recovery Reserves")]
        [Description("Open Recovery Reserves")]
        OpenRecoveryReserves,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Remaining Reserves")]
        [Description("Remaining Reserves")]
        RemainingReserves,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Future Payments")]
        [Description("Future Payments")]
        FuturePayments,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Over Payment Recovery")]
        [Description("Over Payment Recovery")]
        OverPaymentRecovery,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Subrogation Recovery")]
        [Description("Subrogation Recovery")]
        SubrogationRecovery
    }

    public enum FinancialReportLineItemReportingCategoryCd
    {


        Indemnity,


        Medical,


        Claim,


        Perm,


        Temp,
    }


    public partial class FinancialReport
    {

        public FinancialReportReportCd ReportCd { get; set; }

        public bool ReportCdSpecified { get; set; }


        public FinancialReportLineItem[] FinancialReportLineItems { get; set; }

    }


    public enum FinancialReportReportCd
    {

        [System.Xml.Serialization.XmlEnumAttribute("Claim Summary")]
        [Description("Claim Summary")]
        ClaimSummary,
    }


    public partial class NJMAgreedBodyPartImpairment
    {

        public string id
        {
            get; set;
        }


        public string DetailedBodyPartCode
        {
            get; set;
        }

        public string DetailedBodyPart
        {
            get; set;
        }




        public bool PrimaryBodyPartIndicator
        {
            get; set;
        }




        public bool PrimaryBodyPartIndicatorSpecified
        {
            get; set;
        }




        public int PercentImpairmentWholeNumber
        {
            get; set;
        }



        public bool PercentImpairmentWholeNumberSpecified
        {
            get; set;
        }



        public string PercentImpairmentFraction
        {
            get; set;
        }
    }


    public partial class MatterStatus
    {











        public string LitigationStatus
        {
            get; set;
        }



        public string TrialVenueCityCode
        {
            get; set;
        }



        public System.DateTime ListingDate
        {
            get; set;
        }



        public bool ListingDateSpecified
        {
            get; set;
        }



        public int JudgeId
        {
            get; set;
        }



        public bool JudgeIdSpecified
        {
            get; set;
        }



        public NJMAgreedBodyPartImpairment[] BodyPartImpairments
        {
            get; set;
        }



        public int id
        {
            get; set;
        }
    }

    public partial class Matter
    {









        public string CaseNumber
        {
            get; set;
        }



        public string CPReceivedDate
        {
            get; set;
        }



        public string DocketNumber
        {
            get; set;
        }



        public string JurisdictionState
        {
            get; set;
        }



        public MatterStatus[] MatterStatuses
        {
            get; set;
        }



        public int id
        {
            get; set;
        }
    }


    public partial class InjuredBodyPart
    {









        public string DetailedBodyPartCode
        {
            get; set;
        }



        public string DetailedBodyPart
        {
            get; set;
        }



        public bool PrimaryBodyPartIndicator
        {
            get; set;
        }



        public bool PrimaryBodyPartIndicatorSpecified
        {
            get; set;
        }



        public string GeneralAreaOfBody
        {
            get; set;
        }



        public int id
        {
            get; set;
        }
    }


    public partial class Incident
    {








        public string IncidentType
        {
            get; set;
        }



        public string DetailedInjuryTypeCode
        {
            get; set;
        }



        public string DetailedInjuryType
        {
            get; set;
        }



        public string GeneralInjuryType
        {
            get; set;
        }



        public InjuredBodyPart[] InjuredBodyParts
        {
            get; set;
        }
    }


    public partial class Vehicle
    {








        public string Year
        {
            get; set;
        }



        public string Make
        {
            get; set;
        }



        public string Model
        {
            get; set;
        }



        public string Vin
        {
            get; set;
        }



        public int id
        {
            get; set;
        }
    }

    public partial class PartyRelationship
    {






        public int RelationshipPartyId
        {
            get; set;
        }



        public bool RelationshipPartyIdSpecified
        {
            get; set;
        }



        public string Relationship
        {
            get; set;
        }
    }


    public partial class BenefitPaid
    {














        public string BenefitDescription
        {
            get; set;
        }


        public System.DateTime PaidFromDate
        {
            get; set;
        }



        public bool PaidFromDateSpecified
        {
            get; set;
        }


        public System.DateTime PaidToDate
        {
            get; set;
        }



        public bool PaidToDateSpecified
        {
            get; set;
        }



        public int PaidWeeksNumber
        {
            get; set;
        }



        public bool PaidWeeksNumberSpecified
        {
            get; set;
        }



        public int PaidDaysNumber
        {
            get; set;
        }



        public bool PaidDaysNumberSpecified
        {
            get; set;
        }



        public double PaidToDateAmount
        {
            get; set;
        }



        public bool PaidToDateAmountSpecified
        {
            get; set;
        }
    }


    public partial class WorkStatus
    {






        public string Status
        {
            get; set;
        }



        public System.DateTime EffectiveDate
        {
            get; set;
        }



        public bool EffectiveDateSpecified
        {
            get; set;
        }
    }


    public partial class EmploymentRelationship
    {






























        public int EmployerID
        {
            get; set;
        }



        public bool EmployerIDSpecified
        {
            get; set;
        }



        public double WeeklyCompensationRate
        {
            get; set;
        }



        public bool WeeklyCompensationRateSpecified
        {
            get; set;
        }


        public System.DateTime LastWorkedDate
        {
            get; set;
        }



        public bool LastWorkedDateSpecified
        {
            get; set;
        }


        public System.DateTime ReturnToWorkDate
        {
            get; set;
        }



        public bool ReturnToWorkDateSpecified
        {
            get; set;
        }



        public int DaysWorkedPerWeekNumber
        {
            get; set;
        }



        public bool DaysWorkedPerWeekNumberSpecified
        {
            get; set;
        }



        public double WageAmount
        {
            get; set;
        }



        public bool WageAmountSpecified
        {
            get; set;
        }



        public string PayPeriod
        {
            get; set;
        }



        public string DepartmentCode
        {
            get; set;
        }



        public string ClassCode
        {
            get; set;
        }


        public System.DateTime HireDate
        {
            get; set;
        }



        public bool HireDateSpecified
        {
            get; set;
        }



        public string HireState
        {
            get; set;
        }


        public System.DateTime InjuryDateWorkStartTime
        {
            get; set;
        }



        public bool InjuryDateWorkStartTimeSpecified
        {
            get; set;
        }



        public bool LastDayWorkedFullPayIndicator
        {
            get; set;
        }



        public bool LastDayWorkedFullPayIndicatorSpecified
        {
            get; set;
        }



        public System.DateTime OutOfWorkDt
        {
            get; set;
        }



        public bool OutOfWorkDtSpecified
        {
            get; set;
        }


        public System.DateTime MaximumMedicalImprovementDt
        {
            get; set;
        }



        public bool MaximumMedicalImprovementDtSpecified
        {
            get; set;
        }



        public WorkStatus[] WorkStatuses
        {
            get; set;
        }
    }


    public partial class Address
    {

        public AddressCategory Category
        {
            get; set;
        }


        public bool CategorySpecified
        {
            get; set;
        }



        public AddressType Type
        {
            get; set;
        }



        public bool TypeSpecified
        {
            get; set;
        }



        public string Attention
        {
            get; set;
        }



        public string StreetAddress1
        {
            get; set;
        }



        public string StreetAddress2
        {
            get; set;
        }



        public string StreetAddress3
        {
            get; set;
        }



        public string City
        {
            get; set;
        }



        public string State
        {
            get; set;
        }



        public string ZipCode
        {
            get; set;
        }



        public string County
        {
            get; set;
        }



        public string Country
        {
            get; set;
        }



        public string BarCodeInfo
        {
            get; set;
        }



        public int id
        {
            get; set;
        }
    }


    public enum AddressCategory
    {


        Home,


        Business,


        Other,


        Policy,


        Mailing,


        Temporary,


        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Trial Venue")]
        [Description("Trial Venue")]
        TrialVenue,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Temp Check Address")]
        [Description("Temp Check Address")]
        TempCheckAddress,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("PCN Address")]
        [Description("PCN Address")]
        PCNAddress,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("DBA Address")]
        [Description("DBA Address")]
        DBAAddress,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Settlement Contact Address")]
        [Description("Settlement Contact Address")]
        SettlementContactAddress,

        /// <remarks/>
        [System.Xml.Serialization.XmlEnumAttribute("Special Mailing Address")]
        [Description("Special Mailing Address")]
        SpecialMailingAddress,
    }


    public enum AddressType
    {


        Primary,


        None,
    }

    public partial class EmailAddress
    {


        public string EmailAddressValue
        {
            get;
            set;
        }




        public bool IsPrimary { get; set; }



        public bool IsPrimarySpecified { get; set; }



        public int id { get; set; }
    }


    public partial class PhoneNumber
    {

        public PhoneNumberCategory Category { get; set; }
        public bool CategorySpecified { get; set; }


        public PhoneNumberType Type { get; set; }



        public bool TypeSpecified { get; set; }



        public string AreaCode { get; set; }



        public string Exchange { get; set; }



        public string Number { get; set; }


        public string Extension { get; set; }



        public bool IsPrimary { get; set; }


        public bool IsPrimarySpecified { get; set; }



        public int id { get; set; }
    }

    public enum PhoneNumberCategory
    {


        Home,


        Business,


        Mobile,


        Other,
    }


    public enum PhoneNumberType
    {


        Number,


        Fax,


        Other,
    }


    public partial class Party
    {


        public string[] Role { get; set; }



        public PartyType Type { get; set; }




        public string Name { get; set; }




        public string FirstName { get; set; }




        public string MiddleName { get; set; }




        public string MiddleInitial { get; set; }




        public string LastName { get; set; }




        public string Prefix { get; set; }




        public string Suffix { get; set; }




        public string JobTitle { get; set; }




        public string EmployeeUserName { get; set; }




        public string EmployeeNumber { get; set; }




        public string Credentials { get; set; }




        public bool IsOfficerOrManager { get; set; }




        public bool IsOfficerOrManagerSpecified { get; set; }




        public string EmployerName { get; set; }




        public PhoneNumber[] PhoneNumbers { get; set; }




        public EmailAddress[] EmailAddresses { get; set; }




        public Address[] Addresses { get; set; }



        public System.DateTime BirthDate { get; set; }



        public bool BirthDateSpecified { get; set; }



        public System.DateTime DeathDate { get; set; }




        public bool DeathDateSpecified { get; set; }




        public string TaxID { get; set; }




        public EmploymentRelationship[] EmploymentRelationships { get; set; }




        public string OccupationDescription { get; set; }




        public string Gender { get; set; }




        public string MaritalStatus { get; set; }




        public int DependentsNumber { get; set; }




        public bool DependentsNumberSpecified { get; set; }



        public BenefitPaid[] BenefitsPaid { get; set; }




        public PartyRelationship[] PartyRelationships { get; set; }




        public int id { get; set; }

    }
    public enum PartyType
    {


        Person,


        Company,


        Place,
    }


    public partial class Policy
    {


        public string PolicyNumber { get; set; }


        public string PolicyNumberWithOutCheckDigit { get; set; }


        public string PIPDeductible { get; set; }




        public PolicyType Type { get; set; }



        public string NjmInsuranceCompanyName { get; set; }


        public string NjmInsuranceCompanyTaxID { get; set; }


        public System.DateTime EffectiveDate { get; set; }

        public System.DateTime ExpirationDate { get; set; }



        public string NjmCompanyCd { get; set; }


        public string PolicyCounty { get; set; }


        public string Subtype { get; set; }

        public int id { get; set; }
    }

    public enum PolicyType
    {


        PersonalAuto,


        BusinessAuto,


        Truckers,


        Homeowners,


        Dwelling,


        Flood,

        [System.Xml.Serialization.XmlEnumAttribute("Workers\'Compensation")]
        [Description("Workers\'Compensation")]
        WorkersCompensation,
    }

    public partial class Subrogation
    {
        public double NetSettlementAmount { get; set; }


        public bool NetSettlementAmountSpecified { get; set; }



        public double GrossLienAmount { get; set; }



        public double NetLienAmount { get; set; }



        public double ActualConselFeesAmount
        {
            get; set;
        }
        public bool ActualConselFeesAmountSpecified { get; set; }
        public double ActualSuitExpenseAmount { get; set; }
        public bool ActualSuitExpenseAmountSpecified { get; set; }
        public double FuturePaymentPercent { get; set; }
        public double ActualMedicalPaidAmount { get; set; }

        public double ActualTempPaidAmount { get; set; }

        public double ActualPermPaidAmount { get; set; }

        public double ActualFuneralPaidAmount { get; set; }

        public double StatutoryPermPaidAmount { get; set; }
    }
    public partial class Claim
    {


        public string ClaimNumber { get; set; }

        public Subrogation[] Ex_Subrogation { get; set; }
        public System.DateTime DateOfLoss { get; set; }

        public System.DateTime TimeOfLoss { get; set; }

        public string EarliestCPReceivedDate { get; set; }

        public string LossLocationAddress1 { get; set; }

        public string LossLocationAddress2 { get; set; }

        public string LossLocationAddress3 { get; set; }

        public string LossLocationCity { get; set; }

        public string LossLocationState { get; set; }

        public string LossLocationZipCode { get; set; }

        public Policy ClaimPolicy { get; set; }

        public Party[] InvolvedParties { get; set; }

        public Vehicle[] InvolvedVehicles { get; set; }

        public bool NJMEmployeeClaimIndicator { get; set; }

        public string ClaimDescription { get; set; }

        public string AccidentTypeCode { get; set; }

        public string LossCauseCode { get; set; }

        public string LossCause { get; set; }

        public System.DateTime ClaimantReportedDate { get; set; }


        public System.DateTime LossReportedDate { get; set; }


        public int DaysReportedLateNumber { get; set; }

        public string ClaimJurisdictionState { get; set; }

        public string MailToPayToDescription { get; set; }

        public bool InjuredOnEmployerPremisesIndicator { get; set; }


        public bool SafetyEquipmentProividedIndicator { get; set; }

        public bool SafetyEquipmentUsedIndicator { get; set; }


        public string StateClaimNumber { get; set; }

        public string ClaimType { get; set; }

        public string BoardWNumber { get; set; }

        public System.DateTime CreateDate { get; set; }

        public Incident[] Incidents { get; set; }

        public Matter[] Matters { get; set; }

        public string ClaimStatusCd { get; set; }

        public FinancialReport[] FinancialReports { get; set; }


        public DMEDetail[] DMEDetails { get; set; }

        public Precertification[] Precertifications { get; set; }


        public Party CurrentUser { get; set; }
        public PhysicalTherapy[] PhysicalTherapys { get; set; }

    }

}