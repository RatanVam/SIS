using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class DocumentLogEntity
    {
        public int TransactionID { get; set; }
        public string UserID { get; set; }
        public Nullable<System.DateTime> CreateDateTime { get; set; }
        public string LOB { get; set; }
        public string LetterName { get; set; }
        public string Payload { get; set; }
        public string PolicyNumber { get; set; }
        public string Environment { get; set; }
        public string BaseState { get; set; }
        public string ClaimNumber { get; set; }
        public string QuoteNumber { get; set; }
        public string ProducerCode { get; set; }
        public string AccountNumber { get; set; }
    }
}
