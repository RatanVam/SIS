using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class CLUserEntity : CLOutputBase
    {      
        public List<PCCAVehicleParty>? PCCAVehicleParties { get; set; } = new List<PCCAVehicleParty>();

        public PCCAVehicle? PCCAVehicle { get; set; } 

    }
}
