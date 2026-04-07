using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    public interface IRule
    {
        public void OnBaseKeyword1(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups);
        public void OnBaseKeyword2(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups);
        public void OnBaseKeyword3(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups);
        public void OnBaseKeyword4(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups);
        public void OnBaseKeyword5(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups);
    }
}
