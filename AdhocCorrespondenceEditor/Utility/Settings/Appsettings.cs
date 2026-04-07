using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Utility
{
    public class AppSettings
    {
        public string OnBaseURL { get; set; }
        public string GC_OnBaseURL { get; set; }

        public string InspireTicketIdURL { get; set; }
        public string InspirePublishURL { get; set; }
        public string InspirePreviewURL { get; set; }
        public string InspireSearchURL { get; set; }
        public string InspireSoapAction { get; set; }

        public bool ShowXMLs { get; set; }
        public bool ShowSimulator { get; set; }

        public int TimeOutErrorInMin { get; set; }
        public long MaxReceivedMessageSize { get; set; }
        public bool LogDocumentsInDB { get; set; }
        public bool LogESBData { get; set; }
        public string SM_ACEGroups { get; set; }
        public string SM_Proxy { get; set; }
        public string EzsendApiEndpoint {  get; set; }
        public string ValidatePhoneEndpoint { get; set; }

        public string InspireClientId { get; set; }
        public string InspireClientSecret { get; set; }
    }
}
