using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.BC;

namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public class BCPartyAddressDT : IPartyAddressUIDT
    {

        public List<PartyAddressUI> GetPartAddress(SourceSystemBaseEntity sourceSystemEntity, bool isPrimaryAddress, bool includeCurrentUser)
        {
            List<PartyAddressUI> partyList = new List<PartyAddressUI>();
            if (((BCSourceSystemEntity)sourceSystemEntity).retrieveInvoiceTransactionsOut != null)
            {
                GetPartyAddress(partyList, ((BCSourceSystemEntity)sourceSystemEntity).retrieveInvoiceTransactionsOut.AccountInvoices.SelectMany(x => x.PolicyPeriodForThisInvoice.Contacts).DistinctBy(y => y.DisplayName).ToList(), isPrimaryAddress);
                GetPartyAddress(partyList, ((BCSourceSystemEntity)sourceSystemEntity).retrieveInvoiceTransactionsOut.LatestPolicyPeriod.Contacts.DistinctBy(y => y.DisplayName).ToList(), isPrimaryAddress);
            }
            else if (((BCSourceSystemEntity)sourceSystemEntity).retrievePolicyInvoiceDetailsOut != null)
                GetPartyAddress(partyList, ((BCSourceSystemEntity)sourceSystemEntity).retrievePolicyInvoiceDetailsOut.AccountInvoices.SelectMany(x => x.PolicyPeriodForThisInvoice.Contacts).DistinctBy(y => y.DisplayName).ToList(), isPrimaryAddress);
            return partyList;
        }

        List<PartyAddressUI> GetPartyAddress(List<PartyAddressUI> partyList, List<PolicyPeriodContact> contacts, bool isPrimaryAddress)
        {

            foreach (var party in contacts)
            {
                try
                {
                    if (party.Contact == null)
                        continue;
                    if (partyList.Any(x => x.DisplayName == party.DisplayName))
                        continue;

                    List<ControlClass.Address> address = new List<ControlClass.Address>();
                    if (isPrimaryAddress)
                    {
                        address.Add(new ControlClass.Address
                        {
                            AddresseeNameLine1Tx = party.Contact.PrimaryAddress?.AddressLine1,
                            AddresseeNameLine2Tx = party.Contact.PrimaryAddress?.AddressLine2,
                            Line1Tx = party.Contact.PrimaryAddress?.AddressLine1,
                            Line2Tx = party.Contact.PrimaryAddress?.AddressLine2,
                            Line3Tx = party.Contact.PrimaryAddress?.AddressLine3,
                            PostalCd = party.Contact.PrimaryAddress?.PostalCode,
                            CountrySubdivision = party.Contact.PrimaryAddress?.State.Code,
                            Municipality = party.Contact.PrimaryAddress?.City,
                            ID = party.Contact.PrimaryAddress?.id.ToString(),
                        });
                    }
                    else
                    {
                        foreach (var y in party.Contact.AllValidAddresses)
                        {
                            address.Add(new ControlClass.Address
                            {
                                AddresseeNameLine1Tx = y?.AddressLine1,
                                AddresseeNameLine2Tx = y?.AddressLine2,
                                Line1Tx = y?.AddressLine1,
                                Line2Tx = y?.AddressLine2,
                                Line3Tx = y?.AddressLine3,
                                PostalCd = y?.PostalCode,
                                CountrySubdivision = y?.State.Code,
                                Municipality = y?.City,
                                ID = y?.id.ToString(),
                            });
                        }
                    }
                    partyList.Add(new PartyAddressUI
                    {
                        PartyID = party.id.ToString(),
                        DisplayName = party.DisplayName,
                        FirstName = party.Contact.entityPerson?.FirstName,
                        MiddleName = party.Contact.entityPerson?.MiddleName,
                        LastName = party.Contact.entityPerson?.LastName,
                        SubType = party.Contact.Subtype?.Code,
                        Prefix = party.Contact.entityPerson?.Prefix?.DisplayName,
                        Suffix = party.Contact.entityPerson?.Suffix?.DisplayName,
                        PartyAddresses = address,
                        PartyRoles = party.Roles.Select(x => x.Role.Code).ToArray()
                    });
                }
                catch (Exception ex)
                {

                }
            }
                return partyList;
        }
    }
}
