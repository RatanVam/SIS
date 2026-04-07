using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.ACEEntity
{
    public class AppSettingEntity
    {
        public bool ShowXMLs { get; set; }
        public bool ShowSimulator { get; set; }
        public bool LogDocumentsInDB { get; set; }
        public string InspireClientId { get; set; }
        public string InspireClientSecret { get; set; }

        public int TimeOutErrorInMin { get; set; }
    }
}
