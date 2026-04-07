using AdhocCorrespondenceEditor.Shared;
using System.Reflection;

namespace AdhocCorrespondenceEditor.Client
{
    public static class Rule
    {
        public static bool Execute(RuleModel inspireEntity, List<RuleEntity> rules, List<RuleLookupEntity> ruleLookups, string baseUri)
        {
            try
            {
                rules.ForEach(rule => ExecuteRule(inspireEntity,rule, ruleLookups, baseUri));
                return true;
            }
            catch (Exception ex)
            {
                Logger.LogInfoAsync(ex, baseUri);
                return false;
            }
        }
        private static bool ExecuteRule(RuleModel inspireEntity, RuleEntity rule, List<RuleLookupEntity> ruleLookups, string baseUri)
        {
            try
            {
               // Logger.LogInfoAsync(string.Format("Entered method {0} {1}", MethodBase.GetCurrentMethod().Name, MethodBase.GetCurrentMethod().DeclaringType.ToString()), baseUri);

                // Get a type from the string 
                Type type = Type.GetType(String.Format("{0}", rule.RuleNamespace));

                // Create an instance of that type
                Object obj = Activator.CreateInstance(type);

                // Retrieve the method you are looking for
                if (type != null)
                {
                    MethodInfo methodInfo = type.GetMethod(rule.RuleMethod);
                    if (methodInfo != null)
                    {
                        // Invoke the method on the instance we created above
                        methodInfo.Invoke(obj, new object[] { inspireEntity,rule, ruleLookups });
                    }
                }
            }
            catch(Exception ex)
            {
                throw new Exception($"Lob={rule.LobName} => Rule {rule.RuleId} failed. Policy or Quote Number {inspireEntity.PolicyNumber}{inspireEntity.QuoteNumber} ", ex);
            }
            return true;
        }
    }
}
