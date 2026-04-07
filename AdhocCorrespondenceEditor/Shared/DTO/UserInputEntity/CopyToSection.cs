using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class CopyToSection
    {
        public string? CopyToName { get; set; }
        public string? CopyToCompanyName { get; set; }
        public string? CopyToAddressLine1 { get; set; }
        public string? CopyToAddressLine2 { get; set; }
        public string? CopyToAddressLine3 { get; set; }
        public string? CopyToCity { get; set; }
        public string? CopyToState { get; set; }
        public string? CopyToZIP { get; set; }
    }
}
