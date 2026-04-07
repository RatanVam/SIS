using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.GC;

namespace AdhocCorrespondenceEditor.Client
{
    public class GC_SetPipMedpaylmts_Rule : RuleBase
    {
        public void SetPipMedpaylmts(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var GCSourceSystem = (GCSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity;
            var ClaimPolicy = GCSourceSystem?.Claim?.ClaimPolicy;
            if (!string.IsNullOrEmpty(ruleModel.SelectedExposureType))
            {
                string exposureLimit = null;
                if (ruleModel.SelectedExposureType == "Med Pay" || ruleModel.SelectedExposureType == "MedPay")
                {
                    exposureLimit = ClaimPolicy?.Coverages.Where(c => c.Name == ruleModel.SelectedExposureType || c.Name == "MedPay").FirstOrDefault()?.ExposureLimit;
                    if (string.IsNullOrEmpty(exposureLimit))
                        exposureLimit = ClaimPolicy?.Coverages.Where(c => c.Name == ruleModel.SelectedExposureType || c.Name == "MedPay").FirstOrDefault()?.IncidentLimit;
                }
                else
                {
                    exposureLimit = ClaimPolicy?.Coverages.Where(c => c.Name == ruleModel.SelectedExposureType).FirstOrDefault()?.ExposureLimit;
                    if (string.IsNullOrEmpty(exposureLimit))
                        exposureLimit = ClaimPolicy?.Coverages.Where(c => c.Name == ruleModel.SelectedExposureType).FirstOrDefault()?.IncidentLimit;
                }
                ruleModel.PIP_MEDPAY_LIMITS = exposureLimit;
            }
        }
    }
}
