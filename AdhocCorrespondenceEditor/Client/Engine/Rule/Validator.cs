using AdhocCorrespondenceEditor.Shared;
using System.Reflection;

namespace AdhocCorrespondenceEditor.Client
{
    public class Validator
    {
        public static bool Validate(List<RuleEntity> rules)
        {
            rules.ForEach( rule => ValidateRule(rule));
            return true;
        }
        private static bool ValidateRule(RuleEntity rule)
        {
            //placeholder for future validation checks
            return true;
        }
    }
}
