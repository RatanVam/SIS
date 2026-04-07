using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace AdhocCorrespondenceEditor.Shared.PCPA
{
    public class PLAutoSourceSystemEntity : SourceSystemBaseEntity
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
        public PolicyComment[] PolicyComments { get; set; }
        public Account Account { get; set; }
        public PolicyPeriod PolicyPeriod { get; set; }
        public NotableEvent[] NotableEvents { get; set; }
        public SpecialDividend[] SpecialDividends { get; set; }
        public string id { get; set; }
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
    }
    public partial class Organization
    {

        public string OrganizationNm { get; set; }
        public string OrganizationNameCd { get; set; }
        public string OrganizationTypeNm { get; set; }
        public PartyAddress[] Addresses { get; set; }
        public PartyPhoneNumber[] Telephones { get; set; }
        public EmailAddress[] EmailAddresses { get; set; }
        public Trade[] Trades { get; set; }
        public IdentificationDetails[] OfficialIdentifications { get; set; }
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
    }
    public partial class Municipality
    {
        public string MunicipalityNm { get; set; }
        public string MunicipalityTypeCd { get; set; }
    }

    public partial class CountrySubdivision
    {
        public string CountrySubdivisionNm { get; set; }
        public string CountrySubdivisionTypeCd { get; set; }
    }

    public partial class EmailAddress
    {
        public string UnparsedEmailAddress { get; set; }
        public string LocalPart { get; set; }
        public string Domain { get; set; }
    }

    public partial class PartyPhoneNumber
    {
        public string PartyUseCd { get; set; }
        public string TransmissionContentCd { get; set; }
        public string TransmissionTechnologyCd { get; set; }
        public PhoneNumber PhoneNumber { get; set; }
        public bool PrimaryPhoneIn { get; set; }
        public bool PrimaryPhoneInSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class PhoneNumber
    {
        public string UnparsedPhoneNr { get; set; }
        public string AreaCd { get; set; }
        public string ExchangeId { get; set; }
        public string SubscriberLineId { get; set; }
        public string ExtensionId { get; set; }
    }

    public partial class PolicyPeriod
    {
        public string QuoteNumber { get; set; }
        public System.DateTime InceptionDt { get; set; }
        public bool InceptionDtSpecified { get; set; }
        public System.DateTime StartDt { get; set; }
        public bool StartDtSpecified { get; set; }
        public System.DateTime EndDt { get; set; }
        public bool EndDtSpecified { get; set; }
        public bool RenewedIn { get; set; }
        public bool RenewedInSpecified { get; set; }
        public System.DateTime RenewalDt { get; set; }
        public bool RenewalDtSpecified { get; set; }
        public System.DateTime CancellationDt { get; set; }
        public bool CancellationDtSpecified { get; set; }
        public string CancellationReason { get; set; }
        public System.DateTime ChangeEffectiveDt { get; set; }
        public bool ChangeEffectiveDtSpecified { get; set; }
        public Organization UnderwritingCompany { get; set; }
        public string StatusCd { get; set; }
        public string BaseStateCd { get; set; }
        public short DividendYr { get; set; }
        public bool DividendYrSpecified { get; set; }
        public double TotalDividendAm { get; set; }
        public bool TotalDividendAmSpecified { get; set; }
        public PolicyLine[] PolicyLines { get; set; }
        public PartyListing[] ListedParties { get; set; }
        public NotableEvent[] NotableEvents { get; set; }
        public AssociatedPolicy[] AssociatedPolicies { get; set; }
        public PolicyLocation PolicyLocation { get; set; }
        public string NJBIAMembershipMemberNm { get; set; }
        public string NJBIAMembershipMemberNumber { get; set; }
        public string id { get; set; }
    }

    public partial class AssociatedPolicy
    {
        public string PolicyId { get; set; }
        public string PolicyProvider { get; set; }
        public string AssociationReasonCd { get; set; }
    }

    public partial class PolicyLine
    {

        public PersonalAutoLine PersonalAutoLine { get; set; }
        public string id { get; set; }
    }

    public partial class CoverageElectionParameter
    {
        public string CoverageTypeCd { get; set; }
        public string CoverageParameterTypeCd { get; set; }
        public string CoverageParameterValueTx { get; set; }
        public string CoverageParameterUnformattedValueTx { get; set; }
        public string CoverageParameterPremiumAm { get; set; }
        public bool UMUIMLessThanLiabilityIn { get; set; }
        public bool UMUIMLessThanLiabilityInSpecified { get; set; }
        public string UMUIMLimitOrder { get; set; }
        public string id { get; set; }
    }
    public partial class PartyListing
    {
        public Party Party { get; set; }
        public ActivityRecord[] AssociatedActivities { get; set; }
        public Discount[] PartyDiscounts { get; set; }
        public string VehicleDriverExclusionReasonCd { get; set; }
        public bool UnderwritingConcernIn { get; set; }
        public bool UnderwritingConcernInSpecified { get; set; }
        public string DriverStatusCd { get; set; }
        public string id { get; set; }
    }
    public partial class Party
    {
        public string PartyId { get; set; }
        public Person Person { get; set; }
        public Organization Organization { get; set; }
        public string PartyTypeCd { get; set; }
        public string[] PartyRoles { get; set; }
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
        public VehicleDriverLicense VehicleDriverLicense { get; set; }
        public PartyAddress[] Addresses { get; set; }
        public EmailAddress[] EmailAddresses { get; set; }
        public PartyPhoneNumber[] Telephones { get; set; }
        public IdentificationDetails[] OfficialIdentifications { get; set; }
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
        public bool StatusIn { get; set; }
        public bool StatusInSpecified { get; set; }
    }

    public partial class Discount
    {
        public string DiscountReasonCd { get; set; }
        public double DiscountPc { get; set; }
        public bool DiscountPcSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class SummaryAmount
    {
        public string AmountTypeCd { get; set; }
        public string AmountTypeCategoryCd { get; set; }
        public decimal SummaryAm { get; set; }
        public bool SummaryAmSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class RatingWorksheet
    {
        public string RatingTypeCd { get; set; }
        public decimal Amount { get; set; }
        public bool AmountSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class Vehicle
    {
        public string VehicleId { get; set; }
        public string ManufacturerVehicleIdentificationNr { get; set; }
        public short ModelYearNr { get; set; }
        public bool ModelYearNrSpecified { get; set; }
        public string VehicleTradeNm { get; set; }
        public string ModelNm { get; set; }
        public string BodyCategoryCd { get; set; }
        public string VehicleTypeCd { get; set; }
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
    }
    public partial class Account
    {
        public string AccountNo { get; set; }

        public EmailAddress PreferredEmail { get; set; }
        public string OrganizationTypeNm { get; set; }
        public string id { get; set; }
    }
    public partial class PolicyComment
    {
        public string CommentTx { get; set; }
        public string CommentTypeCd { get; set; }
        public System.DateTime CommentDt { get; set; }
        public bool CommentDtSpecified { get; set; }
        public string id { get; set; }
    }

    public partial class IdentificationDetails
    {
        public string IdentificationTypeCd { get; set; }
        public string IdentificationCd { get; set; }
        public string IssuingCountrySubdivisionCd { get; set; }
        public string id { get; set; }
    }
    public partial class Trade
    {

        public string TradeNm { get; set; }
        public string RelatedPartyNm { get; set; }
        public bool PrimaryTradeNameIn { get; set; }
        public bool PrimaryTradeNameInSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class PersonalAutoLine
    {
        public VehicleCoverageListing[] VehicleCoverageDetails { get; set; }
        public Report[] AssociatedReports { get; set; }
        public Discount[] PolicyDiscounts { get; set; }
        public CoverageElectionParameter[] CoverageElectionParameters { get; set; }
        public NonCoverageCharge[] NonCoverageCharges { get; set; }
        public SummaryAmount[] SummaryAmounts { get; set; }
        public RatingWorksheet[] RatingWorksheets { get; set; }
        public bool UIMLessThanLiabilityIn { get; set; }
        public bool UIMLessThanLiabilityInSpecified { get; set; }
        public bool UMLessThanLiabilityIn { get; set; }
        public bool UMLessThanLiabilityInSpecified { get; set; }
        public System.DateTime PolicyInceptionDt { get; set; }
        public bool PolicyInceptionDtSpecified { get; set; }
        public bool UMUIMLTLiabilityIn { get; set; }
        public bool UMUIMLTLiabilityInSpecified { get; set; }
        public bool EnhancedUIMIn { get; set; }
        public bool EnhancedUIMInSpecified { get; set; }
        public bool UMUIMEqualtoLiabilityIn { get; set; }
        public bool UMUIMEqualtoLiabilityInSpecified { get; set; }
        public string id { get; set; }
    }
    public partial class Report
    {
        public string ReportTypeCd { get; set; }
        public string ReportReferenceId { get; set; }
        public string id { get; set; }
    }
    public partial class ActivityRecord
    {
        public string ActivityTypeCd { get; set; }
        public string ActivityDescriptionTx { get; set; }
        public string ActivityCd { get; set; }
        public string ActivitySourceCd { get; set; }
        public System.DateTime ActivityDt { get; set; }
        public bool ActivityDtSpecified { get; set; }
        public System.DateTime ActivityPostingDt { get; set; }
        public bool ActivityPostingDtSpecified { get; set; }
        public string ActivitySeverityCd { get; set; }
        public bool ActivityImpactOnRatingIn { get; set; }
        public bool ActivityImpactOnRatingInSpecified { get; set; }
        public bool ActivityWaivedIn { get; set; }
        public bool ActivityWaivedInSpecified { get; set; }
        public string id { get; set; }
    }

    public partial class VehicleCoverageListing
    {
        public Vehicle Vehicle { get; set; }
        public Party[] AssociatedParties { get; set; }
        public Party[] ExcludedParties { get; set; }
        public CoverageElectionParameter[] Coverages { get; set; }
        public VehicleUsage VehicleUsage { get; set; }
        public string VehicleSpecialtyTypeCd { get; set; }
        public Address GarageLocation { get; set; }
        public bool JointOwnershipIn { get; set; }
        public bool JointOwnershipInSpecified { get; set; }
        public string OwnershipTypeCd { get; set; }
        public Discount[] VehicleDiscounts { get; set; }
        public double TotalPremiumAm { get; set; }
        public bool TotalPremiumAmSpecified { get; set; }
        public IDCardEffectiveDate[] IDCardEffectiveDates { get; set; }
        public string id { get; set; }
    }
    public partial class IDCardEffectiveDate
    {
        public System.DateTime ValidFrom { get; set; }
        public bool ValidFromSpecified { get; set; }
        public System.DateTime ValidTo { get; set; }
        public bool ValidToSpecified { get; set; }
        public string id { get; set; }
    }

    public partial class VehicleUsage
    {
        public string VehicleUsageCd { get; set; }
        public short OneWayMileageNr { get; set; }
        public bool OneWayMileageNrSpecified { get; set; }
        public short DaysPerWeekNr { get; set; }
        public bool DaysPerWeekNrSpecified { get; set; }
    }

    public partial class NonCoverageCharge
    {
        public string ChargeReasonCd { get; set; }
        public double ChargeAm { get; set; }
        public bool ChargeAmSpecified { get; set; }
    }

}
