using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class PCCAVehicleParty
    {
        public string[]? PartyRole { get; set; }
        public Address? Address { get; set; } = new Address();

    }
}
