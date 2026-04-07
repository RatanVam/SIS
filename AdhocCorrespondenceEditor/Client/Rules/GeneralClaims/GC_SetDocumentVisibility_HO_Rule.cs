using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.GC;

namespace AdhocCorrespondenceEditor.Client
{
    public class GC_SetDocumentVisibility_HO_Rule : RuleBase
    {
        public void FilterDocuments(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var GCSourceSystem = (GCSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity;
            string GC_AllowedPolicyTypeForHO, GC_SupportedSelectedStates;
           
            GC_AllowedPolicyTypeForHO = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_AllowedPolicyTypeForHO));
            GC_SupportedSelectedStates = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_SupportedSelectedStates));
            var policyType = GCSourceSystem?.Claim?.ClaimPolicy?.Type;
            if (!string.IsNullOrEmpty(policyType) && GC_AllowedPolicyTypeForHO.Contains(policyType))
            {
                var selectedLocation = GCSourceSystem?.Claim?.SelectedLocation;
                if (!string.IsNullOrEmpty(selectedLocation) && GC_SupportedSelectedStates.Contains(selectedLocation))
                {
                    ruleModel.Location = selectedLocation;
                }
            }
        }
    }
}
