using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.WCU
{
    public class PCWCUSourceSystemEntity : SourceSystemBaseEntity
    {
        public RetrievePolicyResponseMessage PolicyData { get; set; }
    }

    public class RetrievePolicyResponseMessage
    {
        public Policy Policy { get; set; }
    }


    public partial class Policy
    {
        public string PolicyNumber { get; set; }
        public Account Account { get; set; }
        public PolicyPeriod PolicyPeriod { get; set; }
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
    public partial class IdentificationDetails
    {
        public string IdentificationTypeCd { get; set; }
        public string IdentificationCd { get; set; }
        public string IssuingCountrySubdivisionCd { get; set; }
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

    public partial class PartyAddress
    {
        public Address Address { get; set; }
        public string PartyUseCd { get; set; }
        public string AddressUseCd { get; set; }
        public bool PrimaryAddressIn { get; set; }
        public bool PrimaryAddressInSpecified { get; set; }
        public string id { get; set; }
    }

    public partial class Organization
    {
        public string OrganizationNm { get; set; }
        public string OrganizationNameCd { get; set; }
        public string OrganizationTypeNm { get; set; }
        public PartyAddress[] Addresses { get; set; }
        public PartyPhoneNumber[] Telephones { get; set; }
        public Trade[] Trades { get; set; }
        public IdentificationDetails[] OfficialIdentifications { get; set; }
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

    public partial class Person
    {
        public PersonalName PersonName { get; set; }
        public string JobTitle { get; set; }
        public Organization Organization { get; set; }
        public PartyAddress[] Addresses { get; set; }
        public PartyPhoneNumber[] Telephones { get; set; }
        public IdentificationDetails[] OfficialIdentifications { get; set; }
        public string id { get; set; }
    }

    public partial class Party
    {
        public Person Person { get; set; }
        public Organization Organization { get; set; }
        public string PartyTypeCd { get; set; }
        public string[] PartyRoles { get; set; }
        public bool CoverageExcludedIn { get; set; }
        public bool CoverageExcludedInSpecified { get; set; }
        public string id { get; set; }
    }



    public partial class PolicyLine
    {
        public Trade[] Trades { get; set; }
        public string[] CoveredStates { get; set; }
        public string id { get; set; }
    }

    public partial class PolicyPeriod
    {
        public PolicyLine[] PolicyLines { get; set; }
        public Party[] InvolvedParties { get; set; }
        public Organization UnderwritingCompany { get; set; }
        public string QuoteNr { get; set; }
        public System.DateTime StartDt { get; set; }
        public bool StartDtSpecified { get; set; }
        public System.DateTime EndDt { get; set; }
        public bool EndDtSpecified { get; set; }
        public System.DateTime CancellationDt { get; set; }
        public bool CancellationDtSpecified { get; set; }
        public System.Nullable<System.DateTime> PendingCancellationDt { get; set; }
        public bool PendingCancellationDtSpecified { get; set; }
        public string CancellationReason { get; set; }
        public System.DateTime InceptionDt { get; set; }
        public bool InceptionDtSpecified { get; set; }
        public string StatusCd { get; set; }
        public string BaseState { get; set; }
        public bool AssignedRiskIn { get; set; }
        public bool AssignedRiskInSpecified { get; set; }
        public string id { get; set; }
    }

    public partial class Account
    {
        public string AccountNo { get; set; }
        public string OrganizationTypeNm { get; set; }
        public string id { get; set; }
    }


}