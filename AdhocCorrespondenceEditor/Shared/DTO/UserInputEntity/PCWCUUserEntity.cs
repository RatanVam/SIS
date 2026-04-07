using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class PCWCUUserEntity : OutputBase
    {
        public Address? AddresseeAddress { get; set; } = new Address();
        public string? AddresseeName { get; set; }

        public List<ModeValues> ModeValues { get; set; } = new List<ModeValues>();
    }

    public class ModeValues
    {
        public string? Year { get; set; }
        public string? MOD { get; set; }
        public DateTime ModEffDate { get; set; }
        public DateTime ModExpDate { get; set; }
    }
}
