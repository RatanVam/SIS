using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.CL;
using AdhocCorrespondenceEditor.Shared.PCCA;

namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public class CLCAPartyAddressDT : IPartyAddressUIDT
    {

        public List<PartyAddressUI> GetPartAddress(SourceSystemBaseEntity sourceSystemEntity, bool isPrimaryAddress, bool includeCurrentUser)
        {
            var partyListData = ((CLSourceSystemEntity)sourceSystemEntity).PolicyData.Policy.PolicyPeriod.ListedParties.Select(x => x.Party).ToList();
            List<PartyAddressUI> partyList = new List<PartyAddressUI>();
            foreach (var party in partyListData)
            {
                if (party.Organization == null)
                {
                    partyList.Add(new PartyAddressUI
                    {
                        PartyID = party.PartyId,
                        DisplayName = party.Person.PersonName.UnparsedNameTx,
                        PartyAddresses = party.Person.Addresses.Select(x => new ControlClass.Address
                        {
                            AddresseeNameLine1Tx = x.Address.AddresseeNameLine1Tx,
                            AddresseeNameLine2Tx = x.Address.AddresseeNameLine2Tx,
                            Line1Tx = x.Address.Line1Tx,
                            Line2Tx = x.Address.Line2Tx,
                            Line3Tx = x.Address.Line3Tx,
                            Barcode = x.Address.Barcode,
                            PostalCd = x.Address.PostalCd,
                            CountrySubdivision = x.Address.CountrySubdivision.CountrySubdivisionNm,
                            Municipality = x.Address.Municipality[0].MunicipalityNm,
                            ID = x.Address.id
                        }).ToList(),
                        PartyRoles = party.PartyRoles
                    });
                }
                else
                {
                    partyList.Add(new PartyAddressUI
                    {
                        PartyID = party.PartyId,
                        DisplayName = party.Organization.OrganizationNm,
                        PartyAddresses = party.Organization.Addresses.Select(x => new ControlClass.Address
                        {
                            AddresseeNameLine1Tx = x.Address.AddresseeNameLine1Tx,
                            AddresseeNameLine2Tx = x.Address.AddresseeNameLine2Tx,
                            Line1Tx = x.Address.Line1Tx,
                            Line2Tx = x.Address.Line2Tx,
                            Line3Tx = x.Address.Line3Tx,
                            Barcode = x.Address.Barcode,
                            PostalCd = x.Address.PostalCd,
                            CountrySubdivision = x.Address.CountrySubdivision.CountrySubdivisionNm,
                            Municipality = x.Address.Municipality[0].MunicipalityNm,
                            ID = x.Address.id
                        }).ToList(),
                        PartyRoles = party.PartyRoles
                    });
                }
            }
            return partyList;
        }


    }
}
