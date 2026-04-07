using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.Extentions;
using AdhocCorrespondenceEditor.Shared.WCC;
namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public class WCCPartyAddressDT : IPartyAddressUIDT
    {
        public List<PartyAddressUI> GetPartAddress(SourceSystemBaseEntity sourceSystemEntity, bool isPrimaryAddress, bool includeCurrentUser)
        {
            List<PartyAddressUI> partyList = new List<PartyAddressUI>();
            var sourceSystemClaim = ((WCCSourceSystemEntity)sourceSystemEntity).Claim;
            if (sourceSystemClaim != null)
            {
                var InvolvedParties = sourceSystemClaim.InvolvedParties;
                if (includeCurrentUser && sourceSystemClaim.CurrentUser != null)
                {
                    InvolvedParties = sourceSystemClaim.InvolvedParties.Append(sourceSystemClaim.CurrentUser).ToArray();
                }
                return GetPartyAddress(partyList, InvolvedParties.Select(x => x).ToList());

            }
            return partyList;
        }

        List<PartyAddressUI> GetPartyAddress(List<PartyAddressUI> partyList, List<Party> contacts)
        {

            foreach (var party in contacts)
            {
                try
                {
                    List<ControlClass.Address> address = new List<ControlClass.Address>();
                    PartyAddressUI paryDetails = new PartyAddressUI();
                    paryDetails.PartyAddresses = new List<ControlClass.Address>();
                    if ((party.Type != PartyType.Person))
                        paryDetails.FirstName = party.Name;
                    else
                    {
                        paryDetails.FirstName = party.FirstName;
                        paryDetails.LastName = party.LastName;
                        paryDetails.LastNameGenerationCd = party.Suffix;
                        paryDetails.MiddleName = party.MiddleInitial;
                        paryDetails.MiddleFullName = party.MiddleName;
                    }
                    paryDetails.Name = party.Name;
                    paryDetails.JobTitle = party.JobTitle;
                    paryDetails.IsOfficeOrManager = party.IsOfficerOrManager;
                    paryDetails.EmployeeUserName = party.EmployeeUserName;
                    paryDetails.DisplayName = ((party.Type != PartyType.Person) ? party.Name
                        : GetName(party.FirstName) + GetName(party.MiddleInitial) +
                        GetName(party.LastName) + GetName(party.Suffix))?.Trim();

                    paryDetails.PartyRoles = party.Role;
                    paryDetails.PartyType = party.Type.ToString();
                    paryDetails.PartyID = party.id.ToString();

                    paryDetails.ElectronicsDetails = new ElectronicDetails();
                    paryDetails.ElectronicsDetails.EmailAddress = party.EmailAddresses?.Where(y => !string.IsNullOrEmpty(y.EmailAddressValue)).Select(x => x.EmailAddressValue).ToList();

                    if (party.PhoneNumbers?.Count() > 0)
                    {
                        paryDetails.ElectronicsDetails.PhoneFaxDetailList = new();
                        paryDetails.ElectronicsDetails.PhoneFaxDetailList.AddRange(
                            party.PhoneNumbers.Select(x => new PhoneFaxDetails
                            {
                                ID = x.id.ToString(),
                                Type = x.Type.ToString(),
                                IsPrimary = x.IsPrimary,
                                AreaCode = x.AreaCode,
                                Number = x.Number,
                                Exchange = x.Exchange,
                                Extension = x.Extension,
                                Category = x.Category.ToString()

                            }));
                    }
                    paryDetails.Creds = party.Credentials;
                    var sourcePartyAddress = party.Addresses;
                    foreach (var contact in sourcePartyAddress)
                        address.Add(new ControlClass.Address
                        {
                            AddressUseCd = contact.Category.ToDescritpionString(),
                            AddresseeNameLine1Tx = contact.StreetAddress1,
                            AddresseeNameLine2Tx = contact.StreetAddress2,
                            Line1Tx = contact.StreetAddress1,
                            Line2Tx = contact.StreetAddress2,
                            Line3Tx = contact.StreetAddress3,
                            PostalCd = contact.ZipCode,
                            CountrySubdivision = contact.State,
                            Municipality = contact.City,
                            Attention = contact.Attention,
                            Country = contact.Country,
                            Barcode = contact.BarCodeInfo,
                            ID = contact.id.ToString(),
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
