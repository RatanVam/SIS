using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    public abstract class RuleBase
    {
        public string GetLookupValue(RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups, string key)
        {
            var lookupData = ruleLookups.Where(l => l.RuleItemId == ruleEntity.RuleItemId
                                           && l.LookupKey == key).FirstOrDefault();
            return lookupData == null ? null : lookupData.LookupValue;
        }
    }
}
