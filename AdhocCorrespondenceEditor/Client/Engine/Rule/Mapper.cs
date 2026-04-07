using AdhocCorrespondenceEditor.Shared;
using System.Reflection;

namespace AdhocCorrespondenceEditor.Client
{
    public static class Mapper
    {
        // Its a pre determined number for DocumentId to represent all documents
        // for that specific Lob/Category
        private const int DocumentId_For_All_Docs = -999;
        public static List<RuleEntity> Map(RuleModel inspireEntity, List<RuleEntity> rules, string baseUri)
        {
            var currentRuleEntity = MapRules(inspireEntity, rules, baseUri);
            return currentRuleEntity;
        }
        private static List<RuleEntity> MapRules(RuleModel inspireEntity, List<RuleEntity> rules, string baseUri)
        {
           // Logger.LogInfoAsync(string.Format("Entered method {0} {1}", MethodBase.GetCurrentMethod().Name, MethodBase.GetCurrentMethod().DeclaringType.ToString()), baseUri);
            var rule = rules.
                            Where(r =>  r.LobName == inspireEntity.LOBName 
                                  &&    (r.CategoryId == inspireEntity.CategoryId
                                            || r.CategoryId == null)
                                  &&    (r.DocumentId == inspireEntity.DocumentId 
                                            || r.DocumentId == DocumentId_For_All_Docs)
                                  &&    r.EffectiveDate <=  DateTime.UtcNow
                                  &&    (r.ExpirationDate >= DateTime.UtcNow 
                                            || r.ExpirationDate == null)
                                  &&    r.RuleGroupName == inspireEntity.RuleGroup.ToString()
                            ).OrderBy(o=>o.ExecutionOrder).ToList();
 
            return rule;
        }
    }
}
