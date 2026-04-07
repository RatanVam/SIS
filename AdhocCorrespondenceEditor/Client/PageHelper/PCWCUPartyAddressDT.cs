using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.WCU;

namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public class PCWCUPartyAddressDT : IPartyAddressUIDT
    {

        public List<PartyAddressUI> GetPartAddress(SourceSystemBaseEntity sourceSystemEntity, bool isPrimaryAddress, bool includeCurrentUser)
        {
            List<PartyAddressUI> partyList = new List<PartyAddressUI>();
            if (((PCWCUSourceSystemEntity)sourceSystemEntity).PolicyData != null)
                return GetPartyAddress(partyList, ((PCWCUSourceSystemEntity)sourceSystemEntity).PolicyData.Policy.PolicyPeriod.InvolvedParties.ToList());
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
                    paryDetails.FirstName = party.Person != null ? party.Person.PersonName.FirstGivenNm : party.Organization.OrganizationNm;
                    paryDetails.LastName = party.Person != null ? party.Person.PersonName.FamilyNm : string.Empty;
                    paryDetails.MiddleName = party.Person != null ? party.Person.PersonName.SecondGivenNm : string.Empty;

                    paryDetails.DisplayName = (party.Person == null && party.PartyTypeCd.ToUpper() != ApplicationConstants.Person.ToUpper()) ? party.Organization.OrganizationNm
                        : (GetName(party.Person?.PersonName.NameSalutationCd) +
                        GetName(party.Person?.PersonName.FirstGivenNm) + GetName(party.Person?.PersonName.SecondGivenNm) +
                        GetName(party.Person?.PersonName.FamilyNm) + GetName(party.Person?.PersonName.FamilyNameGenerationCd));

                    paryDetails.PartyRoles = new string[] { party.PartyTypeCd };
                    paryDetails.PartyID = party.id;
                    var sourcePartyAddress = (party.Organization != null && party.PartyTypeCd.ToUpper() != ApplicationConstants.Person.ToUpper()) ? party.Organization.Addresses : party.Person?.Addresses;
                    foreach (var contact in sourcePartyAddress)
                        address.Add(new ControlClass.Address
                        {
                            AddresseeNameLine1Tx = contact.Address?.AddresseeNameLine1Tx,
                            AddresseeNameLine2Tx = contact.Address?.AddresseeNameLine2Tx,
                            Line1Tx = contact.Address?.Line1Tx,
                            Line2Tx = contact.Address?.Line2Tx,
                            Line3Tx = contact.Address?.Line3Tx,
                            PostalCd = contact.Address?.PostalCd,
                            CountrySubdivision = contact.Address?.CountrySubdivision?.CountrySubdivisionNm,
                            Municipality = contact.Address?.Municipality.Count() > 0 ? contact.Address?.Municipality?.Where(x => x.MunicipalityTypeCd.ToUpper() == ApplicationConstants.CITY.ToUpper()).FirstOrDefault().MunicipalityNm : string.Empty,
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
