

namespace AdhocCorrespondenceEditor.Shared.Common
{
    public class ExternalEzsendApiSubmit
    {

        public string processName { get; set; }
        public string? transactionType { get; set; }
        public string linkType { get; set; }
        public string emailAddress { get; set; }
        public string phoneNumber { get; set; }
        public string sourceSystem { get; set; }
        public string stateCode { get; set; }
        public string userId { get; set; }
        public string jobNumber { get; set; }
        public string? policyNumber { get; set; }
        public string documentSessionId { get; set; }
        public string policyEffectiveDate { get; set; }
        public string PANJMBuyersGuideFlag { get; set; }
        public bool? IsPaperless { get; set; }//DG-20780/20781 Added IsPaperless/jobLob/isCSF 
        public string? jobLob { get; set; }
        public bool IsCSF { get; set; }
        public string UserName { get; set; }


    }
}
