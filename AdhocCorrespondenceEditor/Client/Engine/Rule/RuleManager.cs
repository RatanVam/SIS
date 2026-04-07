using AdhocCorrespondenceEditor.Shared;
using System.Reflection;

namespace AdhocCorrespondenceEditor.Client
{
    public static class RuleManager
    {
        public static bool Run(RuleModel ruleModel , List<RuleEntity> rules, List<RuleLookupEntity> ruleLookups, string baseUri)
        {

            var currentRules =  Mapper.Map(ruleModel, rules,baseUri);
            
            Validator.Validate(currentRules);
            
            Rule.Execute(ruleModel, currentRules,ruleLookups,baseUri);

            return true;
        }
    }
}
