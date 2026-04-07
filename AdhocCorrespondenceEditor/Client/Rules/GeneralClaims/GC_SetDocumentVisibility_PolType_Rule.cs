using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.GC;

namespace AdhocCorrespondenceEditor.Client
{
    public class GC_SetDocumentVisibility_PolType_Rule : RuleBase
    {
        public void FilterDocuments(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var GCSourceSystem = (GCSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity;
            string GC_AllowedPolicyTypes, GC_DocumentsExcludedByPolicyType;
            GC_AllowedPolicyTypes = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_AllowedPolicyTypes));
            GC_DocumentsExcludedByPolicyType = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_DocumentsExcludedByPolicyType));
            var policyType = GCSourceSystem?.Claim?.ClaimPolicy?.Type;
            if (!string.IsNullOrEmpty(policyType) && GC_AllowedPolicyTypes.Contains(policyType))
            {
                ruleModel.AceDataCollector.documentList.RemoveAll(x => GC_DocumentsExcludedByPolicyType.Contains(x.DocumentId.ToString()));
            }
        }
        }
}
