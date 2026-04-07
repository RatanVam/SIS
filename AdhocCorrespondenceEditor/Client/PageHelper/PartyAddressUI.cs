namespace AdhocCorrespondenceEditor.Client.ControlClass
{
    public class PartyAddressUI
    {

        public string PartyID { get; set; }
        public string DisplayName { get; set; }
        public string FirstName { get; set; }
        public string MiddleFullName { get; set; }
        public string MiddleName { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string LastNameGenerationCd { get; set; }
        public string SubType { get; set; }
        public string Prefix { get; set; }
        public string Suffix { get; set; }
        public List<Address> PartyAddresses { get; set; }

        public string PartyType { get; set; }
        public string[] PartyRoles { get; set; }
        public bool IsOfficeOrManager { get; set; }
        public string EmployeeUserName { get; set; }
        public string Creds { get; set; }
        public string JobTitle { get; set; }
        public ElectronicDetails ElectronicsDetails { get; set; }
   }

    public class Address
    {
        public string AddresseeNameLine1Tx { get; set; }
        public string AddresseeNameLine2Tx { get; set; }
        public string Line1Tx { get; set; }
        public string Line2Tx { get; set; }
        public string Line3Tx { get; set; }
        public string Municipality { get; set; }
        public string CountrySubdivision { get; set; }
        public string PostalCd { get; set; }
        public string AddressUseCd { get; set; }
        public string Barcode { get; set; }
        public string Attention { get; set; }
        public string Country { get; set; }
        public string ID { get; set; }
    }

    public class ElectronicDetails
    {
        public List<string> EmailAddress { get; set; }
        public List<PhoneFaxDetails> PhoneFaxDetailList { get; set; }
    }

    public class PhoneFaxDetails
    {
        public string ID { get; set; }
        public bool IsPrimary { get; set; }
        public string Type { get; set; }
        public string AreaCode { get; set; }
        public string Exchange { get; set; }
        public string Number { get; set; }
        public string Extension { get; set; }
        public string Category { get; set; }
        
    }
}


