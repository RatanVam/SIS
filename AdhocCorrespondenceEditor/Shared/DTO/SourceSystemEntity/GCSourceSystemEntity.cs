
using System.ComponentModel;

namespace AdhocCorrespondenceEditor.Shared.GC
{
    public class GCSourceSystemEntity : SourceSystemBaseEntity
    {
        public Claim Claim { get; set; }
    }

    public partial class Claim
    {
        public string ClaimNumber { get; set; }
        public System.DateTime DateOfLoss { get; set; }
        public bool DateOfLossSpecified { get; set; }
        public string LossCause { get; set; }
        public Address[] LossLocation { get; set; }
        public string LossLocationCity { get; set; }
        public string LossLocationState { get; set; }
        public Policy ClaimPolicy { get; set; }
        public Party[] InvolvedParties { get; set; }
        public Vehicle[] InvolvedVehicles { get; set; }
        public System.DateTime AccidentReportDate { get; set; }
        public bool AccidentReportDateSpecified { get; set; }
        public Financial[] Financials { get; set; }
        public Coverages[] Coverages { get; set; }
        public string SelectedLocation { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
        public Party CurrentUser { get; set; }
    }

    public partial class Address
    {
        public AddressCategory Category { get; set; }
        public bool CategorySpecified { get; set; }
        public AddressType Type { get; set; }
        public bool TypeSpecified { get; set; }
        public string StreetAddress1 { get; set; }
        public string StreetAddress2 { get; set; }
        public string StreetAddress3 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string BarCodeInfo { get; set; }
        public int id { get; set; }
    }

    public enum AddressCategory
    {
        /// <remarks/>
        Home,
        /// <remarks/>
        Business,
        /// <remarks/>
        Other,
        /// <remarks/>
        Policy,
        /// <remarks/>
        Mailing,
        /// <remarks/>
        Temporary,
        /// <remarks/>
        None,
        /// <remarks/>
        Invalid,
    }

    public enum AddressType
    {
        /// <remarks/>
        Primary,
        /// <remarks/>
        None,
    }

    public partial class Policy
    {
        public string PolicyNumber { get; set; }
        public string EffectiveDate { get; set; }
        public string ExpirationDate { get; set; }
        public string PolicyForm { get; set; }
        public string PolicyState { get; set; }
        public string PolicyDeductible { get; set; }
        public string PIPDeductible { get; set; }
        public string Deductible { get; set; }
        public string Type { get; set; }
        public bool TypeSpecified { get; set; }
        public string ProductCode { get; set; }
        public string NjmInsuranceCompanyName { get; set; }
        public Endorsements[] Endorsements { get; set; }
        public Coverages[] Coverages { get; set; }
        public Blankets[] Blankets { get; set; }
        public PIPLimits PIPLimits { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class CoverageTerm
    {
        public string Type { get; set; }
        public string Value { get; set; }
        public string ValueType { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Coverages
    {
        public string Name { get; set; }
        public string Type { get; set; }
        public string Deductible { get; set; }
        public string ExposureLimit { get; set; }
        public string IncidentLimit { get; set; }
        public string Notes { get; set; }
        public Building Building { get; set; }
        public string RUNumber { get; set; }
        public Address RiskLocation { get; set; }
        public CoverageTerm[] CoverageTerms { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Endorsements
    {
        public string Name { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string Limit { get; set; }
        public string MoldLimit { get; set; }
        public string FormNumber { get; set; }
        public string Vehicle { get; set; }
        public Building Building { get; set; }
        public Classification Classification { get; set; }
        public string LocationNumber { get; set; }
        public Address PolicyLocation { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Building
    {
        public string Description { get; set; }
        public string Number { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Classification
    {
        public string Code { get; set; }
        public string Description { get; set; }
        public int Number { get; set; }
        public bool NumberSpecified { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Blankets
    {
        public string Type { get; set; }
        public string TotalLimit { get; set; }
        public string Number { get; set; }
        public BlanketCoverages[] BlanketCoverages { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class PIPLimits
    {
        public string ClaimantMaxWageLoss { get; set; }
        public string ClaimantMonthlyWageLoss { get; set; }
        public string CombinationFirstPartyBenefits { get; set; }
        public string DeathBenefitAmount { get; set; }
        public string DeathBenefitsLimit { get; set; }
        public string DeathWageExclusion { get; set; }
        public decimal EssentialServicesDayLimit { get; set; }
        public bool EssentialServicesDayLimitSpecified { get; set; }
        public decimal EssentialServicesMaxLimit { get; set; }
        public bool EssentialServicesMaxLimitSpecified { get; set; }
        public string ExtraordinaryMedExpenses { get; set; }
        public decimal FuneralBenefitsLimit { get; set; }
        public bool FuneralBenefitsLimitSpecified { get; set; }
        public string FuneralExpenseAmount { get; set; }
        public string IncomeContinuationMax { get; set; }
        public string IncomeContinuationWeekly { get; set; }
        public string MedExpenses { get; set; }
        public string MedicalExpense { get; set; }
        public string TortOption { get; set; }
    }

    public partial class BlanketCoverages
    {
        public string Limit { get; set; }
        public string Coverage { get; set; }
        public Building Building { get; set; }
        public Classification Classification { get; set; }
        public string LocationNumber { get; set; }
        public Address PolicyLocation { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Party
    {
        public string[] Role { get; set; }
        public PartyType Type { get; set; }
        public bool TypeSpecified { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string MiddleInitial { get; set; }
        public string LastName { get; set; }
        public string Prefix { get; set; }
        public string Suffix { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public bool DateOfBirthSpecified { get; set; }
        public string JobTitle { get; set; }
        public string EmployeeUserName { get; set; }
        public string EmployeeNumber { get; set; }
        public string DisplayName { get; set; }
        public string Department { get; set; }
        public string Credentials { get; set; }
        public bool IsOfficerOrManager { get; set; }
        public bool IsOfficerOrManagerSpecified { get; set; }
        public string EmployerName { get; set; }
        public PhoneNumber[] PhoneNumbers { get; set; }
        public EmailAddress[] EmailAddresses { get; set; }
        public Address[] Addresses { get; set; }
        public Exposure[] Exposures { get; set; }
        public int id { get; set; }
        public int refId { get; set; }
        public bool refIdSpecified { get; set; }
    }

    //public enum PartyRole
    //{
    //    /// <remarks/>
    //    FirstInsured,
    //    /// <remarks/>
    //    SecondInsured,
    //    /// <remarks/>
    //    ThirdInsured,
    //    /// <remarks/>
    //    User,
    //    /// <remarks/>
    //    MainContact,
    //    /// <remarks/>
    //    AlternateContact,
    //    /// <remarks/>
    //    OrganizationContact,
    //    /// <remarks/>
    //    Other,
    //    /// <remarks/>
    //    Claimant,
    //    /// <remarks/>
    //    Lienholder,
    //}

    public enum PartyType
    {
        /// <remarks/>
        Person,
        /// <remarks/>
        Company,
        /// <remarks/>
        Other,
        /// <remarks/>
        Place,
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
        public int id { get; set; }
    }

    public enum PhoneNumberCategory
    {
        /// <remarks/>
        Home,
        /// <remarks/>
        Business,
        /// <remarks/>
        Mobile,
        /// <remarks/>
        Other,
    }

    public enum PhoneNumberType
    {
        /// <remarks/>
        Number,
        /// <remarks/>
        Fax,
        /// <remarks/>
        Other,
    }

    public partial class EmailAddress
    {
        public string EmailAddressValue { get; set; }
        public int id { get; set; }
    }

    public partial class Exposure
    {
        public string ExposureType { get; set; }
        public int ExposureNumber { get; set; }
        public bool ExposureNumberSpecified { get; set; }

        public string ExposureJurisdictionState { get; set; }
        public string Deductible { get; set; }
        public bool Represented { get; set; }
        public string SalvageActualCashValue { get; set; }
        public string SalvageDeductible { get; set; }
        public string SalvageNetSettlement { get; set; }
        public string SalvageOldDamageAmount { get; set; }
        public string SalvageOtherAdjustments { get; set; }
        public string SalvageRepresentative { get; set; }
        public string SalvageSubTotal { get; set; }
        public string SalvageTaxAmount { get; set; }
        public string SalvageTotalLossEstimate { get; set; }
        public string SalvageTypeOfLoss { get; set; }
        public string SalvageValue { get; set; }
        public string SalvageVehicleMake { get; set; }
        public string SalvageVehicleModel { get; set; }
        public string SalvageVehicleYear { get; set; }
        public System.DateTime SalvageFacilityConctactDate { get; set; }
        public bool SalvageFacilityConctactDateSpecified { get; set; }
        public string SalvageStockNumber { get; set; }
        public System.DateTime SalvageTitleReceivedDate { get; set; }
        public bool SalvageTitleReceivedDateSpecified { get; set; }
        public System.DateTime SalvageTitleSentDate { get; set; }
        public bool SalvageTitleSentDateSpecified { get; set; }
        public string SalvageService { get; set; }
        public Precertification[] Precertifications { get; set; }
        public int id { get; set; }
    }

    public partial class Procedure
    {
        public string StartCode { get; set; }
        public string EndCode { get; set; }
        public string UserDefinedGroup { get; set; }
        public int id { get; set; }
    }

    public partial class Determination
    {
        public string DeterminationId { get; set; }
        public bool IsAppealPresent { get; set; }
        public bool IsAppealPresentSpecified { get; set; }
        public string TreatmentReason { get; set; }
        public string TreatmentStatus { get; set; }
        public int TotalTreatmentsApproved { get; set; }
        public bool TotalTreatmentsApprovedSpecified { get; set; }
        public Procedure[] Procedures { get; set; }
        public int id { get; set; }
    }

    public partial class Precertification
    {
        public string PrecertificationId { get; set; }
        public System.DateTime StartDate { get; set; }
        public bool StartDateSpecified { get; set; }
        public System.DateTime EndDate { get; set; }
        public bool EndDateSpecified { get; set; }
        public Party Provider { get; set; }
        public Determination[] Determinations { get; set; }
        public int id { get; set; }
    }

    public partial class Transaction
    {
        public string CostType { get; set; }
        public string CostCategory { get; set; }
        public string Status { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Financial
    {
        public Transaction[] Transactions { get; set; }
        public Check[] Checks { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Check
    {
        public string CheckNumber { get; set; }
        public string NetAmount { get; set; }
        public string PayToName { get; set; }
        public string MailingAddress { get; set; }
        public System.DateTime IssueDate { get; set; }
        public bool IssueDateSpecified { get; set; }
        public string PaymentType { get; set; }
        public string Status { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Vehicle
    {
        public string Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Vin { get; set; }
        public string State { get; set; }
        public string LossParty { get; set; }
        public int id { get; set; }
    }
}