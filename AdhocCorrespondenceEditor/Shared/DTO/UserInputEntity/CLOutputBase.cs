using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class CLOutputBase : OutputBase
    {
        public Address? AddresseeAddress { get; set; } = new Address();

    }
}
