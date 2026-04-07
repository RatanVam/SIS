using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    // This entity will be used as independent entity to be passed to Rules Engine
    // Rules engine will manipulate this entity attributes based on rules configured
    // Then it will be duty of source program to utilise these changed attributes 
    public class RuleModel
    {
        public string LOBName { get; set; }
        public int? CategoryId { get; set; } = null;
        public int? DocumentId { get; set; } = null;
        public string PolicyNumber { get; set; } 
        public string QuoteNumber { get; set; } 
        public string AccountNumber { get; set; }
        public AceDataCollector AceDataCollector { get; set; }
        public DateTime PolicyStartDate { get; set; }

        public string OB_KEYWORD1 { get; set; }
        public string OB_KEYWORD2 { get; set; }
        public string OB_KEYWORD3 { get; set; }
        public string OB_KEYWORD4 { get; set; }
        public string OB_KEYWORD5 { get; set; }
        public string OB_KEYWORD6 { get; set; }
        public string OB_KEYWORD7 { get; set; }
        public string OB_KEYWORD8 { get; set; }
        public string OB_KEYWORD9 { get; set; }
        public string OB_KEYWORD10 { get; set; }
        public string OB_KEYWORD11 { get; set; }
        public string OB_KEYWORD12 { get; set; }
        public RuleGroup RuleGroup { get; set; } = RuleGroup.BusinessRule;
        public string State = null;
        public string Location = null;

        public string CLMT_MAX_WAGE_LOSS { get; set; } 
        public string CLMT_MNTHLY_WAGE_LOSS { get; set; }
        public string COMB_1ST_PARTY_BEN { get; set; }
        public string DEATH_BENEFIT_AMT { get; set; }
        public string EXTRAORD_MED_EXP { get; set; }
        public string FUNERAL_EXP_AMT { get; set; }
        public string MED_EXPENSES { get; set; }
        public string TORT_OPT { get; set; }
        public string PIP_MEDPAY_LIMITS { get; set; }
        public string SelectedExposureType { get; set; }
        
        public RuleModel(string lob, string policyNumber, string quoteNumber, string accountNumber, int? categoryId, int? documentId)
        {
            LOBName = lob;
            PolicyNumber = policyNumber;
            QuoteNumber = quoteNumber;
            AccountNumber = accountNumber;
            CategoryId = categoryId;
            DocumentId = documentId;
        }
        public RuleModel(string lob,AceDataCollector aceDataCollector, int? categoryId, int? documentId,  RuleGroup ruleGroup, string policyNumber, string quoteNumber, string accountNumber)
        {
            LOBName = lob;
            AceDataCollector = aceDataCollector;
            CategoryId = categoryId;
            DocumentId = documentId;
            RuleGroup = ruleGroup;
            PolicyNumber = policyNumber;
            QuoteNumber = quoteNumber;
            AccountNumber = accountNumber;
        }
        public RuleModel(string lob, AceDataCollector aceDataCollector, int? categoryId, int? documentId, string selectedExposureType = "")
        {
            LOBName = lob;
            AceDataCollector = aceDataCollector;
            CategoryId = categoryId;
            DocumentId = documentId;
            SelectedExposureType = selectedExposureType;
        }
    }
}
