using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class MultiUserEntity : OutputBase
    {
        public Address? DistributionPartnerInfo { get; set; } = new Address();
        public Address? DistributionRepInfo { get; set; } = new Address();
        public Address? UnderWriterInfoID { get; set; } = new Address();

        public Address? AddresseeAddress { get; set; } = new Address();
        public List<string> Quotations { get; set; } = new List<string>();

        public int TotalPremium { get; set; }
    }
}
