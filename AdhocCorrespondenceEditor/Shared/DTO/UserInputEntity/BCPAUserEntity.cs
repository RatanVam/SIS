using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class BCUserEntity : OutputBase
    {
        public bool IsDBASelected { get; set; }
        public Address? AddresseeAddress { get; set; } = new Address();
        public string AddresseeAddress2 { get; set; } 

        public string AttentionName { get; set; }
        public string RemittanceIndicator { get; set; }
    }
}
