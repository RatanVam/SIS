using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace AdhocCorrespondenceEditor.Shared.PL
{
    public class PLSourceSystemEntity : SourceSystemBaseEntity
    {
        public RetrievePolicyByPolicyNumberResponseMessage PolicyData { get; set; }
    }
    public class RetrievePolicyByPolicyNumberResponseMessage
    {
        public Policy Policy { get; set; }
        public CoverageStatus CoverageStatus { get; set; }
    }

    public partial class Policy
    {
        public string PolicyNumber { get; set; }
        public string LineOfBusinessCd { get; set; }
        public string PolicyTypeCd { get; set; }
        public System.DateTime InceptionDt { get; set; }
        public bool InceptionDtSpecified { get; set; }
        public string ConvertedIn { get; set; }
        public string BaseStateCd { get; set; }
        public Organization UnderwritingCompany { get; set; }
        public PolicyPeriod PolicyPeriod { get; set; }
        public NotableEvent[] NotableEvents { get; set; }
        public SpecialDividend[] SpecialDividends { get; set; }
        public string id { get; set; }

        public string AccountPreferredEmail { get; set; }
    }

    public partial class NotableEvent
    {

        public string EventNumber { get; set; }
        public string EventCategoryCd { get; set; }
        public string EventTypeCd { get; set; }
        public string EventStatusCd { get; set; }
        public System.DateTime EventCreationDt { get; set; }
        public bool EventCreationDtSpecified { get; set; }
        public System.DateTime EventChangeEffectiveDt { get; set; }
        public bool EventChangeEffectiveDtSpecified { get; set; }
        public System.DateTime EventCloseDt { get; set; }
        public bool EventCloseDtSpecified { get; set; }
        public string EventDescriptionTx { get; set; }
        public string[] EventReason { get; set; }
        public string id { get; set; }
    }

    public partial class SpecialDividend
    {
        public short CreatedYr { get; set; }
        public bool CreatedYrSpecified { get; set; }
        public short DividendYr { get; set; }
        public bool DividendYrSpecified { get; set; }
        public decimal DividendAm { get; set; }
        public bool DividendAmSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class Organization
    {
        public string OrganizationNm { get; set; }
        public string OrganizationNameCd { get; set; }
        public string OrganizationTypeNm { get; set; }
        public PartyAddress[] Addresses { get; set; }
        public PartyEmailAddress[] EmailAddresses { get; set; }
        public PartyPhoneNumber[] Telephones { get; set; }
        public string id { get; set; }
    }

    public partial class PartyAddress
    {
        public Address Address { get; set; }
        public string TerritoryCd { get; set; }
        public string PartyUseCd { get; set; }
        public string AddressUseCd { get; set; }
        public string PrimaryAddressIn { get; set; }
        public string id { get; set; }
    }
    public partial class Address
    {
        public string AddresseeNameLine1Tx { get; set; }
        public string AddresseeNameLine2Tx { get; set; }
        public string Line1Tx { get; set; }
        public string Line2Tx { get; set; }
        public string Line3Tx { get; set; }
        public Municipality[] Municipality { get; set; }
        public CountrySubdivision CountrySubdivision { get; set; }
        public string PostalCd { get; set; }
        public string PostalExtensionCd { get; set; }
        public string Barcode { get; set; }
        public string id { get; set; }
    }

    public partial class Municipality
    {
        public string MunicipalityNm { get; set; }
        public string MunicipalityTypeCd { get; set; }
        public string id { get; set; }
    }

    public partial class CountrySubdivision
    {
        public string CountrySubdivisionNm { get; set; }
        public string CountrySubdivisionTypeCd { get; set; }
        public string id { get; set; }
    }
    public partial class PartyEmailAddress
    {
        public EmailAddress EmailAddress { get; set; }
        public string PartyUseCd { get; set; }
        public string id { get; set; }
    }

    public partial class EmailAddress
    {
        public string UnparsedEmailAddress { get; set; }
        public string LocalPart { get; set; }
        public string Domain { get; set; }
        public string id { get; set; }
    }

    public partial class PartyPhoneNumber
    {
        public string PartyUseCd { get; set; }
        public string TransmissionContentCd { get; set; }
        public string TransmissionTechnologyCd { get; set; }
        public PhoneNumber PhoneNumber { get; set; }
        public string id { get; set; }
    }

    public partial class PhoneNumber
    {
        public string UnparsedPhoneNr { get; set; }
        public string AreaCd { get; set; }
        public string ExchangeId { get; set; }
        public string SubscriberLineId { get; set; }
        public string ExtensionId { get; set; }
        public string id { get; set; }
    }

    public partial class PolicyPeriod
    {
        public string QuoteNumber { get; set; }
        public System.DateTime StartDt { get; set; }
        public bool StartDtSpecified { get; set; }
        public System.DateTime EndDt { get; set; }
        public bool EndDtSpecified { get; set; }
        public string RenewedIn { get; set; }
        public System.DateTime RenewalDt { get; set; }
        public bool RenewalDtSpecified { get; set; }
        public string StatusCd { get; set; }
        public short DividendYr { get; set; }
        public bool DividendYrSpecified { get; set; }
        public string TotalDividendAm { get; set; }
        public bool TotalDividendAmSpecified { get; set; }
        public double TotalAdjustDividendAm { get; set; }
        public bool TotalAdjustDividendAmSpecified { get; set; }
        public System.DateTime EndorsementEffectiveDt { get; set; }
        public bool EndorsementEffectiveDtSpecified { get; set; }
        public System.DateTime CancellationDt { get; set; }
        public bool CancellationDtSpecified { get; set; }
        public string CancellationReason { get; set; }
        public string ManualEndorsementIn { get; set; }
        public string SecondaryPolicyIn { get; set; }
        public PolicyLine[] PolicyLines { get; set; }
        public PartyListing[] ListedParties { get; set; }
        public PolicyLocation PolicyLocation { get; set; }
        public NotableEvent[] NotableEvents { get; set; }
        public RelatedPolicy[] RelatedPolicies { get; set; }
        public string PolicyMailingAddressIn { get; set; }
        public string id { get; set; }
    }

    public partial class RelatedPolicy
    {
        public string RelationshipReasonCd { get; set; }
        public Policy Policy { get; set; }
        public string id { get; set; }
    }

    public partial class PolicyLine
    {
        public UmbrellaLine UmbrellaLine { get; set; }


        public HomeownersLine HomeownersLine { get; set; }

        public string id { get; set; }
    }
    public partial class UmbrellaLine
    {

        public HouseholdMember[] HouseholdMembers { get; set; }
        public CoverageElectionParameter[] CoverageElectionParameters { get; set; }
        public Policy[] UnderlyingPolicies { get; set; }
        public Discount[] Discounts { get; set; }
        public SummaryAmount[] SummaryAmounts { get; set; }
        public VehicleExposure[] VehicleExposures { get; set; }
        public WatercraftExposure[] WatercraftExposures { get; set; }
        public LocationExposure[] LocationExposures { get; set; }
        public ExposureIndicators[] ExposureIndicators { get; set; }
        public string SpouseOfPrimaryNamedInsured { get; set; }
        public string id { get; set; }
    }

    public partial class HouseholdMember
    {
        public Person Person { get; set; }
        public string HouseholdMemeberStatusCd { get; set; }
        public string FamilyRemarks { get; set; }
        public string id { get; set; }
    }

    public partial class CoverageElectionParameter
    {
        public string CoverageTypeCd { get; set; }
        public string CoverageParameterTypeCd { get; set; }
        public string CoverageParameterValueTx { get; set; }
        public string CoverageParameterUnformattedValueTx { get; set; }
        public string CoverageParameterPremiumAm { get; set; }
        public string id { get; set; }
    }

    public partial class PartyListing
    {
        public Party Party { get; set; }
        public string id { get; set; }
    }
    public partial class Party
    {
        public string PartyId { get; set; }
        public Person Person { get; set; }
        public Organization Organization { get; set; }
        public FinancialInstitution FinancialInstitution { get; set; }
        public CertificateOfInsurance CertificateOfInsurance { get; set; }
        public string PartyTypeCd { get; set; }
        public string[] PartyRoles { get; set; }
        public string[] RelationshipCd { get; set; }
        public string id { get; set; }
    }

    public partial class Person
    {
        public PersonalName PersonName { get; set; }
        public string SecondGivenNameInitial { get; set; }
        public System.DateTime BirthDt { get; set; }
        public bool BirthDtSpecified { get; set; }
        public string GenderCd { get; set; }
        public string MaritalStatusCd { get; set; }
        public string FirstLicensedMonthAndYr { get; set; }
        public string OccupationDescriptionTx { get; set; }
        public VehicleDriverLicense VehicalDriverLicense { get; set; }
        public PartyAddress[] Addresses { get; set; }
        public PartyEmailAddress[] EmailAddresses { get; set; }
        public PartyPhoneNumber[] Telephones { get; set; }
        public string id { get; set; }
    }
    public partial class PersonalName
    {
        public string UnparsedNameTx { get; set; }
        public string NameSalutationCd { get; set; }
        public string FirstGivenNm { get; set; }
        public string SecondGivenNm { get; set; }
        public string FamilyNm { get; set; }
        public string FamilyNameGenerationCd { get; set; }
        public string ProfessionalQualificationCd { get; set; }
        public string EducationalDegreeCd { get; set; }
        public string MothersMaidenNm { get; set; }
        public string FathersMotherMaidenNm { get; set; }
        public string PersonalNameFormatCd { get; set; }
        public string DisplayNameTx { get; set; }
        public string id { get; set; }
    }

    public partial class VehicleDriverLicense
    {
        public string IssuingCountryCd { get; set; }
        public string IssuingAdministrativeCountrySubdivisionCd { get; set; }
        public string LicenseId { get; set; }
        public string LicenseStatusCd { get; set; }
        public System.DateTime LicenseStatusDt { get; set; }
        public bool LicenseStatusDtSpecified { get; set; }
        public string LicenseClassCd { get; set; }
        public string VehicleTypeCd { get; set; }
        public string RestrictionTypeCd { get; set; }
        public System.DateTime LicenseEffectiveDt { get; set; }
        public bool LicenseEffectiveDtSpecified { get; set; }
        public System.DateTime LicenseExpirationDt { get; set; }
        public bool LicenseExpirationDtSpecified { get; set; }
        public System.DateTime ReinstatementDt { get; set; }
        public bool ReinstatementDtSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class FinancialInstitution
    {
        public Organization Organization { get; set; }
        public string LoanNr { get; set; }
        public string ClauseNm { get; set; }
        public string EscrowIn { get; set; }
        public string id { get; set; }
    }
    public partial class PolicyLocation
    {
        public Address Address { get; set; }
        public string TerritoryCd { get; set; }
        public string id { get; set; }
    }

    public partial class CoverageStatus
    {

        public System.DateTime AsOfDt { get; set; }
        public bool AsOfDtSpecified { get; set; }
        public string StatusIn { get; set; }
        public string id { get; set; }
    }

    public partial class Discount
    {
        public string DiscountReasonCd { get; set; }
        public string DiscountPc { get; set; }
        public bool DiscountPcSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class SummaryAmount
    {
        public string AmountTypeCd { get; set; }
        public string AmountTypeCategoryCd { get; set; }
        public string SummaryAm { get; set; }
        public bool SummaryAmFieldSpecified { get; set; }
        public string id { get; set; }
    }

    public partial class VehicleExposure
    {
        public Vehicle Vehicle { get; set; }
        public string id { get; set; }
    }

    public partial class Vehicle
    {
        public string VehicleId { get; set; }
        public string ManufacturerVehicleIdentificationNr { get; set; }
        public string ModelYearNr { get; set; }
        public string VehicleTradeNm { get; set; }
        public string ModelNm { get; set; }
        public string BodyCategoryCd { get; set; }
        public string VehicleTypeCd { get; set; }
        public string VehicleSubTypeCd { get; set; }
        public string ISOBodyCd { get; set; }
        public string CylinderNumberCd { get; set; }
        public string ISOSymbol { get; set; }
        public VehicleFeature[] VehicleFeatures { get; set; }
        public string id { get; set; }
    }

    public partial class VehicleFeature
    {
        public string FeatureTypeCd { get; set; }
        public string FeatureCd { get; set; }
        public string DescriptionTx { get; set; }
        public string id { get; set; }
    }
    public partial class WatercraftExposure
    {
        public Watercraft Watercraft { get; set; }
        public string id { get; set; }
    }
    public partial class Watercraft
    {
        public string ManufacturerIdentificationNr { get; set; }
        public short ModelYearNr { get; set; }
        public bool ModelYearNrSpecified { get; set; }
        public string WatercraftTradeNm { get; set; }
        public string ModelNm { get; set; }
        public string BodyLengthCd { get; set; }
        public string WatercraftTypeCd { get; set; }
        public string HorsePowerTypeCd { get; set; }
        public string id { get; set; }
    }
    public partial class LocationExposure
    {
        public string LocationTypeCd { get; set; }
        public string OccupancyTypeCd { get; set; }
        public Address Address { get; set; }
        public string id { get; set; }
    }
    public partial class ExposureIndicators
    {
        public string FamilyMemberIn { get; set; }
        public string LicensedFamilyMembersIn { get; set; }
        public AutoMobileIndicators[] AutoMobileIndicators { get; set; }
        public MotorCycleIndicators[] MotorCycleIndicators { get; set; }
        public RecreationalMotorVehicleIndicators[] RecreationalMotorVehicleIndicators { get; set; }
        public WatercraftIndicators[] WatercraftIndicators { get; set; }
        public string BoatSlipIn { get; set; }
        public VacatLandIndicators[] VacatLandIndicators { get; set; }
        public string RentalPropertyIn { get; set; }
        public string ExcessUnAndUnderInsuredMotoritsIn { get; set; }
        public string id { get; set; }
    }

    public partial class AutoMobileIndicators
    {
        public string AutoMobileIn { get; set; }
        public string CompanyPersonalAutoCountNr { get; set; }
        public string PrivatePassengerCountNr { get; set; }
        public string MotorHomesCountNr { get; set; }
        public string AntiquesRUCExoticCountNr { get; set; }
        public string id { get; set; }
    }
    public partial class MotorCycleIndicators
    {
       public string MotorCycleIn { get; set; }
        public string MotorCyleCountNr { get; set; }
        public string MopedCountNr { get; set; }
        public string id { get; set; }
    }

    public partial class RecreationalMotorVehicleIndicators
    {
        public string RecreationalVehicleIn { get; set; }
        public string ATVsCountNr { get; set; }
        public string GolfCartsCountNr { get; set; }
        public string SnowMobilesCountNr { get; set; }
        public string DirtBikesCountNr { get; set; }
        public string MopedsCountNr { get; set; }
        public string DuneBuggysNr { get; set; }
        public string OtherRecreationalVehicleCountNr { get; set; }
        public string id { get; set; }
    }
    public partial class WatercraftIndicators
    {
        public string WatercraftIn { get; set; }
        public string SailBoatLengthOver39CountNr { get; set; }
        public string SailBoatLengthBW2639CountNr { get; set; }
        public string SailBoatLengthLess26CountNr { get; set; }
        public string PowerBoatLengthOver39CountNr { get; set; }
        public string PowerBoatLengthBW2639CountNr { get; set; }
        public string PowerBoatLengthLess26CountNr { get; set; }
        public string id { get; set; }
    }
    public partial class VacatLandIndicators
    {
        public string VacantLandIn { get; set; }
        public string LotAndBlock { get; set; }
        public string id { get; set; }
    }


    public partial class HomeownersLine
    {
        public CoverageElectionParameter[] CoveragesElectionParameters { get; set; }
        public DwellingCoverageListing[] ListedDwellings { get; set; }
        public string FormTypeCd { get; set; }
        public System.DateTime TenureDt { get; set; }
        public bool TenureDtSpecified { get; set; }
        public Discount[] PolicyDiscounts { get; set; }
        public SummaryAmount[] SummaryAmounts { get; set; }
        public NonCoverageCharge[] NonCoverageCharges { get; set; }
        public string ExtendedCoverageIn { get; set; }
        public Form[] PolicyFormPatterns { get; set; }
        public string VandalismMLSCMischiefCoverageIn { get; set; }
        public string ModFuncValueIn { get; set; }
        public string OtherInsuredLocationIn { get; set; }
        public string PolicyDiscountsIn { get; set; }
        public string WorkersCompensationIn { get; set; }
        public string id { get; set; }
    }
    public partial class DwellingCoverageListing
    {
        public DwellingAddress DwellingAddress { get; set; }
        public string DwellingTypeCd { get; set; }
        public DwellingUsage DwellingUsage { get; set; }
        public string RCTCoverageIn { get; set; }
        public Party[] AssociatedParties { get; set; }
        public ScheduledItem[] ScheduledItems { get; set; }
        public string ReplacementCostAm { get; set; }
        public string Occupancy { get; set; }
        public string MortgageeIn { get; set; }
        public string id { get; set; }
    }

    public partial class DwellingAddress
    {
        public Address Address { get; set; }
        public string id { get; set; }
    }

    public partial class DwellingUsage
    {
        public string DwellingUsageCd { get; set; }
        public string id { get; set; }
    }
    public partial class Form
    {
        public string FormNr { get; set; }
        public string FormDescriptionNm { get; set; }
        public string EditionDt { get; set; }
        public bool IncludeInDeclarationPageIn { get; set; }
        public bool IncludeInDeclarationPageInSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class ScheduledItem
    {
        public string EndorsementTypeCd { get; set; }
        public string ScheduledItemTypeCd { get; set; }
        public string ScheduledItemDescriptionTx { get; set; }
        public string id { get; set; }
    }

    public partial class NonCoverageCharge
    {
        public string ChargeReasonCd { get; set; }
        public string ChargeAm { get; set; }
        public string id { get; set; }
    }
    public partial class CertificateOfInsurance
    {
        public string CertificateHolderNm { get; set; }
        public string CertificateLocationTx { get; set; }
        public Person Person { get; set; }
        public Organization Organization { get; set; }
        public string CertificateOfInsuranceTypeCd { get; set; }
        public string id { get; set; }
    }
}
