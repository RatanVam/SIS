using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCWCUOnbaseRule : RuleBase, IRule
    {
        public void OnBaseKeyword1(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var pol = ruleModel.PolicyNumber;
            ruleModel.OB_KEYWORD1 = (pol == null ? null : pol.Substring(0, pol.Length - 2));
        }

        public void OnBaseKeyword2(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            //inspireEntity.OB_KEYWORD2 = ConvertDateFormat(ruleModel.StartDt, "yyyy"); 
        }

        public void OnBaseKeyword3(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var account = ruleModel.AccountNumber;
            ruleModel.AccountNumber =  string.IsNullOrEmpty(account) ? null : account.Substring(0, account.Length - 1);
        }

        public void OnBaseKeyword4(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            ruleModel.OB_KEYWORD4 = GetLookupValue(ruleEntity,ruleLookups,"OB4");
        }

        public void OnBaseKeyword5(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            ruleModel.OB_KEYWORD5 = GetLookupValue(ruleEntity, ruleLookups, "OB5");
        }

        public void OnBaseKeyword6(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            ruleModel.OB_KEYWORD6 = ruleModel.QuoteNumber;
        }
        public void OnBaseKeyword12(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            ruleModel.OB_KEYWORD12 = GetLookupValue(ruleEntity, ruleLookups, "OB12");
        }
    }
}
