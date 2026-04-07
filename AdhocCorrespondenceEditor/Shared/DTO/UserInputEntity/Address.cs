using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class Address
    {
        public string? DisplayName { get; set; }
        public string? Line1Tx { get; set; }
        public string? Line2Tx { get; set; }
        public string? Line3Tx { get; set; }
        public string? MunicipalityNm { get; set; }
        public string? CountrySubdivisionNm { get; set; }
        public string? PostalCd { get; set; }
        public string? Phone { get; set; }
        public string? PostNet { get; set; }
        public string? Country { get; set; }

        public string? PhoneExtension { get; set; }
        public string? Email { get; set; }

        public string FaxDetails { get; set; }

        public string Credentials { get; set; }
    }
}
