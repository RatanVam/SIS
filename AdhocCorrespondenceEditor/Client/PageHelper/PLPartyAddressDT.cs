using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.PL;

namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public class PLPartyAddressDT : IPartyAddressUIDT
    {
        public List<PartyAddressUI> GetPartAddress(SourceSystemBaseEntity sourceSystemEntity, bool isPrimaryAddress,bool includeCurrentUser)
        {
            List<PartyAddressUI> partyList = new List<PartyAddressUI>();
            if (((PLSourceSystemEntity)sourceSystemEntity).PolicyData != null)
                return GetPartyAddress(partyList, ((PLSourceSystemEntity)sourceSystemEntity).PolicyData.Policy.PolicyPeriod.ListedParties.Select(x=>x.Party).ToList()).OrderBy(x=>x.DisplayName).ToList();
            return partyList;
        }

        List<PartyAddressUI> GetPartyAddress(List<PartyAddressUI> partyList, List<Party> contacts)
        {

            foreach (var party in contacts)
            {

                try
                {
                    if (party.Person == null && party.Organization == null)
                        continue;

                    List<ControlClass.Address> address = new List<ControlClass.Address>();
                    PartyAddressUI paryDetails = new PartyAddressUI();
                    paryDetails.PartyAddresses = new List<ControlClass.Address>();
                    if ((party.PartyTypeCd.ToUpper() != ApplicationConstants.Person.ToUpper()))
                        paryDetails.FirstName = party.Organization?.OrganizationNm;
                    else
                    {
                        paryDetails.FirstName = party.Person?.PersonName?.FirstGivenNm;
                        paryDetails.LastName = party.Person?.PersonName?.FamilyNm;
                        paryDetails.LastNameGenerationCd = party.Person?.PersonName?.FamilyNameGenerationCd;
                        paryDetails.MiddleName = party.Person?.SecondGivenNameInitial;
                    }

                    paryDetails.DisplayName = (party.PartyTypeCd.ToUpper() != ApplicationConstants.Person.ToUpper()) ? party.Organization?.OrganizationNm
                        : (GetName(party.Person?.PersonName?.NameSalutationCd?.ToUpper() == ApplicationConstants.EstateOf.ToUpper() ? party.Person?.PersonName?.NameSalutationCd : string.Empty) +
                        GetName(party.Person?.PersonName?.FirstGivenNm) + GetName(party.Person?.SecondGivenNameInitial) +
                        GetName(party.Person?.PersonName?.FamilyNm) + GetName(party.Person?.PersonName?.FamilyNameGenerationCd))?.Trim();

                    paryDetails.PartyRoles = party.PartyRoles;
                    paryDetails.PartyType = party.PartyTypeCd;
                    paryDetails.PartyID = party.id;
                    if (party.Person != null)
                        paryDetails.ElectronicsDetails = new ElectronicDetails
                        {
                            EmailAddress = party.Person.EmailAddresses?.Select(x => x.EmailAddress?.UnparsedEmailAddress).ToList()
                        };
                    var sourcePartyAddress = (party.Organization != null && party.PartyTypeCd.ToUpper() != ApplicationConstants.Person.ToUpper()) ? party.Organization.Addresses : party.Person?.Addresses;
                    foreach (var contact in sourcePartyAddress)
                        address.Add(new ControlClass.Address
                        {
                            AddressUseCd = contact.AddressUseCd,
                            AddresseeNameLine1Tx = contact.Address?.AddresseeNameLine1Tx,
                            AddresseeNameLine2Tx = contact.Address?.AddresseeNameLine2Tx,
                            Line1Tx = contact.Address?.Line1Tx,
                            Line2Tx = contact.Address?.Line2Tx,
                            Line3Tx = contact.Address?.Line3Tx,
                            PostalCd = contact.Address?.PostalCd,
                            CountrySubdivision = contact.Address?.CountrySubdivision?.CountrySubdivisionNm,
                            Municipality = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.CITY, contact.Address),
                            ID = contact.Address?.id.ToString(),
                        });
                    paryDetails.PartyAddresses.AddRange(address);
                    partyList.Add(paryDetails);
                }
                catch (Exception ex)
                {

                }
            }
            return partyList;
        }
        string GetName(string? Value)
        {
            return string.IsNullOrEmpty(Value) ? string.Empty : $"{Value} ";
        }
    }
}
