using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class SourceSystemInputRequest
    {
        public string PolicyNumber { get; set; }
        public string QuoteNumber { get; set; }

        public string AccountNumber { get; set; }
        public string ClaimNumber { get; set; }
        public string ProducerCode { get; set; }

        public DateTime AsOfDate { get; set; }

        public string LOB { get; set; }

        public string Environment { get; set; }
        public string URL { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }
        public string CurrentUserId { get; set; }

        public bool IsItUseDates { get; set; }

        public bool IsManualInvoice { get; set; }

    }

}
