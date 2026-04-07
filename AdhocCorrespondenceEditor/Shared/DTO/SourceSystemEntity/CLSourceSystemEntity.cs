using AdhocCorrespondenceEditor.Shared.PCCA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.CL
{
    public class CLSourceSystemEntity : SourceSystemBaseEntity
    {
        public RetrievePolicyByPolicyNumberResponseMessage PolicyData { get; set; }

    }
    public class RetrievePolicyByPolicyNumberResponseMessage
    {
        public Policy Policy { get; set; }
    }

    public class Policy
    {

        public string PolicyNumber { get; set; }
        public Organization UnderwritingCompany { get; set; }

        public Account Account { get; set; }
        public string LineOfBusinessCd { get; set; }

        public string PolicyTypeCd { get; set; }
        public string BaseStateCd { get; set; }
        public string PolicyProductCd { get; set; }
        public string IndustryOfferingCd { get; set; }
        public PolicyPeriod PolicyPeriod { get; set; }
        public string id { get; set; }
    }

    public class Organization
    {

        public string OrganizationNm { get; set; }
        public string OrganizationNameCd { get; set; }
        public string OrganizationTypeNm { get; set; }
        public PartyAddress[] Addresses { get; set; }
        public string id { get; set; }
    }
    public class PartyAddress
    {


        public Address Address { get; set; }
        public string TerritoryCd { get; set; }
        public string PartyUseCd { get; set; }
        public string AddressUseCd { get; set; }
        public bool PrimaryAddressIn { get; set; }
        public bool PrimaryAddressInSpecified { get; set; }
        public string id { get; set; }
    }

    public class Address
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

    public class Municipality
    {
        public string MunicipalityNm { get; set; }
        public string MunicipalityTypeCd { get; set; }
        public string id { get; set; }
    }

    public class CountrySubdivision
    {
        public string CountrySubdivisionNm { get; set; }
        public string CountrySubdivisionTypeCd { get; set; }
        public string id { get; set; }
    }


    public partial class Account
    {
        public string AccountNo { get; set; }
        public string OrganizationTypeNm { get; set; }
        public string id { get; set; }
    }

    public class PolicyPeriod
    {
        public string QuoteNumber { get; set; }
        public DateTime InceptionDt { get; set; }
        public bool InceptionDtSpecified { get; set; }
        public DateTime StartDt { get; set; }
        public bool StartDtSpecified { get; set; }
        public DateTime EndDt { get; set; }
        public bool EndDtSpecified { get; set; }
        public bool RenewedIn { get; set; }
        public bool RenewedInSpecified { get; set; }
        public DateTime RenewalDt { get; set; }
        public bool RenewalDtSpecified { get; set; }
        public DateTime CancellationDt { get; set; }
        public bool CancellationDtSpecified { get; set; }
        public string CancellationReason { get; set; }
        public DateTime ChangeEffectiveDt { get; set; }
        public bool ChangeEffectiveDtSpecified { get; set; }
        public string StatusCd { get; set; }
        public short DividendYr { get; set; }
        public bool DividendYrSpecified { get; set; }
        public double TotalDividendAm { get; set; }
        public bool TotalDividendAmSpecified { get; set; }
        public PolicyLine[] PolicyLines { get; set; }
        public PartyListing[] ListedParties { get; set; }
        public string NJBIAMembershipMemberNm { get; set; }
        public string NJBIAMembershipMemberNumber { get; set; }
        public string id { get; set; }
    }


    public class Party
    {

        public string PartyId { get; set; }
        public Person Person { get; set; }
        public Organization Organization { get; set; }
        public string PartyTypeCd { get; set; }
        public string[] PartyRoles { get; set; }
        public string id { get; set; }
    }


    public class Person
    {
        public PersonalName PersonName { get; set; }
        public string SecondGivenNameInitial { get; set; }

        public DateTime BirthDt { get; set; }
        public bool BirthDtSpecified { get; set; }
        public string GenderCd { get; set; }

        public string MaritalStatusCd { get; set; }

        public string FirstLicensedMonthAndYr { get; set; }
        public PartyAddress[] Addresses { get; set; }

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

    public class CoverageElectionParameter
    {

        public string CoverageTypeCd { get; set; }
        public string CoverageParameterTypeCd { get; set; }
        public string CoverageParameterValueTx { get; set; }
        public string CoverageParameterUnformattedValueTx { get; set; }
        public string CoverageParameterPremiumAm { get; set; }
        public string id { get; set; }
    }


    public class PartyListing
    {

        public Party Party { get; set; }
        public string VehicleDriverExclusionReasonCd { get; set; }
        public bool UnderwritingConcernIn { get; set; }
        public bool UnderwritingConcernInSpecified { get; set; }
        public string DriverStatusCd { get; set; }
        public string id { get; set; }
    }

    public class PolicyLine
    {
        public string id { get; set; }

        public CommercialAutoLine CommercialAutoLine { get; set; }

    }
}
