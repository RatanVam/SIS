using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.PL;

namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public class PCUMBNamesAddress
    {
        public static List<string> GetPersonName(List<PartyAddressUI> partyDetails)
        {
            List<string> partyLst = new();
            foreach (var loc in partyDetails)
            {
                string name = loc.DisplayName;
                partyLst.Add(name);
            }
            return partyLst.OrderBy(x => x).ToList();
        }

        public static List<PartyAddressUI> GetPersonName(List<HouseholdMember> locations)
        {
            List<PartyAddressUI> partyLst = new();
            foreach (var loc in locations)
            {
                string name = loc.Person.PersonName.FirstGivenNm;
                name += string.IsNullOrEmpty(loc.Person.PersonName.SecondGivenNm) ? string.Empty : $" {loc.Person.PersonName.SecondGivenNm}";
                name += string.IsNullOrEmpty(loc.Person.PersonName.FamilyNm) ? string.Empty : $" {loc.Person.PersonName.FamilyNm}";

                var obj = new PartyAddressUI
                {
                    PartyID = loc.id,
                    DisplayName = name
                };
                partyLst.Add(obj);
            }
            return partyLst.OrderBy(x=>x.DisplayName).ToList();
        }

        public static List<ControlClass.Address> GetAddress(List<LocationExposure> locations)
        {
            List<ControlClass.Address> partyLst = new();
            foreach (var loc in locations)
            {
                partyLst.Add(new ControlClass.Address
                {
                    AddresseeNameLine1Tx = loc.Address?.AddresseeNameLine1Tx,
                    AddresseeNameLine2Tx = loc.Address?.AddresseeNameLine2Tx,
                    Line1Tx = loc.Address?.Line1Tx,
                    Line2Tx = loc.Address?.Line2Tx,
                    Line3Tx = loc.Address?.Line3Tx,
                    PostalCd = loc.Address?.PostalCd,
                    CountrySubdivision = loc.Address?.CountrySubdivision?.CountrySubdivisionNm,
                    Municipality = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.CITY, loc.Address),
                    ID = loc.Address?.id.ToString()
                });
            }
            return partyLst;
        }
    }
}
