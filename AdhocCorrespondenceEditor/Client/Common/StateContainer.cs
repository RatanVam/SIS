using AdhocCorrespondenceEditor.Shared;
using System.Xml;

namespace AdhocCorrespondenceEditor.Client
{
    public class StateContainer
    {
        public SourceSystemBaseEntity XMLValue { get; set; }
        public string LOB { get; set; } = String.Empty;
        public string AsOfDate { get; set; } = String.Empty;
        public string State { get; set; } = String.Empty;
        public string Env { get; set; } = String.Empty;
        public string PolicyNumber { get; set; } = String.Empty;
        public string QuoteNumber { get; set; } = String.Empty;
        public string AccountNumber { get; set; } = String.Empty;
        public string ProducerCode { get; set; } = String.Empty;
        public string ClaimNumber { get; set; } = String.Empty;

    }
}
