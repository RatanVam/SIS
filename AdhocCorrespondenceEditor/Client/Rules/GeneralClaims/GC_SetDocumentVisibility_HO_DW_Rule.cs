using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.GC;

namespace AdhocCorrespondenceEditor.Client
{
    public class GC_SetDocumentVisibility_HO_DW_Rule : RuleBase
    {
        public void FilterDocuments(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var GCSourceSystem = (GCSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity;
            string policyType = GCSourceSystem?.Claim?.ClaimPolicy?.Type;
            if (policyType?.ToLower() != "homeowners" && policyType?.ToLower() != "dwelling")
            {
                string GC_DocumentsExcludedBy_HO_DW;
                GC_DocumentsExcludedBy_HO_DW = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_DocumentsExcludedBy_HO_DW));
                ruleModel.AceDataCollector.documentList.RemoveAll(x => GC_DocumentsExcludedBy_HO_DW.Contains(x.DocumentId.ToString()));
            }
            else
            {
                string GC_DocumentsExcludedBy_OtherPolTypes;
                GC_DocumentsExcludedBy_OtherPolTypes = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_DocumentsExcludedBy_OtherPolTypes));
                ruleModel.AceDataCollector.documentList.RemoveAll(x => GC_DocumentsExcludedBy_OtherPolTypes.Contains(x.DocumentId.ToString()));
            }

            if (policyType?.ToLower() != "businessowners" && policyType?.ToLower() != "commercialpackagepolicy")
            {
                string GC_DocumentsExcludedBy_BOP_CPP = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(GC_DocumentsExcludedBy_BOP_CPP));
                ruleModel.AceDataCollector.documentList.RemoveAll(x => GC_DocumentsExcludedBy_BOP_CPP.Contains(x.DocumentId.ToString()));
            }
        }
    }
}
