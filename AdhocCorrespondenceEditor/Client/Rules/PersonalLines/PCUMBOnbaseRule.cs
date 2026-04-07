using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCUMBOnbaseRule : RuleBase, IRule
    {
        public void OnBaseKeyword1(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var pol = ruleModel.PolicyNumber;
            ruleModel.OB_KEYWORD1 = (string.IsNullOrEmpty(pol) ? null : pol.Substring(0,pol.Length-1));
        }

        public void OnBaseKeyword2(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var startDate = ruleModel.PolicyStartDate;
            ruleModel.OB_KEYWORD2 = (startDate == null ? null : startDate.Year.ToString());
        }

        public void OnBaseKeyword3(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            ruleModel.OB_KEYWORD3 = GetLookupValue(ruleEntity, ruleLookups, "OB3");
        }

        public void OnBaseKeyword4(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            ruleModel.OB_KEYWORD4 = GetLookupValue(ruleEntity, ruleLookups, "OB4");
        }

        public void OnBaseKeyword5(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var quote = ruleModel.QuoteNumber;
            ruleModel.OB_KEYWORD5 = string.IsNullOrEmpty(quote) ? null: quote;
        }
    }
}
