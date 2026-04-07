using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.GC;

namespace AdhocCorrespondenceEditor.Client
{
    public class GC_SetDocumentVisibility_PropDamage_Rule:RuleBase
    {
        public void FilterDocuments(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var GCSourceSystem = (GCSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity;
            string GC_AllowedVehicleStates;

            GC_AllowedVehicleStates = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_AllowedVehicleStates));
            var vehicleState = GCSourceSystem?.Claim?.InvolvedVehicles?.FirstOrDefault()?.State;
            if (!string.IsNullOrEmpty(vehicleState) && GC_AllowedVehicleStates.Contains(vehicleState))
            {
                    ruleModel.State = vehicleState;
            }
        }
    }
}
