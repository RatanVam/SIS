using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.GC;

namespace AdhocCorrespondenceEditor.Client
{
    public class GC_SetLtrValue_PAExplainLtr_Rule : RuleBase
    {
        public void SetLtrValue(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            var GCSourceSystem = (GCSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity;
            var ClaimPolicy = GCSourceSystem?.Claim?.ClaimPolicy;
            var pipLimit = ClaimPolicy?.PIPLimits;
            if (pipLimit != null)
            {
                ruleModel.CLMT_MAX_WAGE_LOSS = pipLimit.ClaimantMaxWageLoss;
                ruleModel.CLMT_MNTHLY_WAGE_LOSS = pipLimit.ClaimantMonthlyWageLoss;
                ruleModel.COMB_1ST_PARTY_BEN = pipLimit.CombinationFirstPartyBenefits;
                ruleModel.DEATH_BENEFIT_AMT = pipLimit.DeathBenefitAmount;
                ruleModel.EXTRAORD_MED_EXP = pipLimit.ExtraordinaryMedExpenses;
                ruleModel.FUNERAL_EXP_AMT = pipLimit.FuneralExpenseAmount;
                ruleModel.MED_EXPENSES = pipLimit.MedExpenses;
                ruleModel.TORT_OPT = pipLimit.TortOption;
            }
            var pip = ClaimPolicy?.Coverages.Where(c => c.Name == "PIP").FirstOrDefault();
            if (pip != null)
            {
                var coverageTerms = pip.CoverageTerms;
                foreach (var coverageTerm in coverageTerms)
                {
                    if (coverageTerm.Type == "Work Loss Benefit"
                        || coverageTerm.Type == "Work Loss Benefits Limit"
                        || coverageTerm.Type == "Work Loss Benefits Coverage")
                    {
                        ruleModel.CLMT_MNTHLY_WAGE_LOSS = string.IsNullOrEmpty(coverageTerm.Value) ? coverageTerm.ValueType : coverageTerm.Value;
                    }
                    if (coverageTerm.Type == "Combination First Party Benefit"
                        || coverageTerm.Type == "Combination First Party Benefits Coverage"
                        || coverageTerm.Type == "Combination First Party Benefits Limit")
                    {
                        ruleModel.COMB_1ST_PARTY_BEN = string.IsNullOrEmpty(coverageTerm.Value) ? coverageTerm.ValueType : coverageTerm.Value;
                    }
                    if (coverageTerm.Type == "Accidental Death Benefit"
                        || coverageTerm.Type == "Accidental Death Benefits Coverage"
                        || coverageTerm.Type == "Accidental Death Benefits Limit")
                    {
                        ruleModel.DEATH_BENEFIT_AMT = string.IsNullOrEmpty(coverageTerm.Value) ? coverageTerm.ValueType : coverageTerm.Value;
                    }
                    if (coverageTerm.Type == "Extraordinary Medical Benefit"
                        || coverageTerm.Type == "Extraordinary Medical Benefits Coverage Limit")
                    {
                        ruleModel.EXTRAORD_MED_EXP = coverageTerm.Value;
                    }
                    if (coverageTerm.Type == "Funeral Expense Benefit"
                        || coverageTerm.Type == "Funeral Expenses"
                        || coverageTerm.Type == "Funeral"
                        || coverageTerm.Type == "Funeral Expense Benefits Coverage"
                        || coverageTerm.Type == "Funeral Expense Benefits Limit")
                    {
                        ruleModel.FUNERAL_EXP_AMT = string.IsNullOrEmpty(coverageTerm.Value) ? coverageTerm.ValueType : coverageTerm.Value;
                    }
                    if (coverageTerm.Type == "Medical Expense Limit"
                        || coverageTerm.Type == "Medical Expense Benefit"
                        || coverageTerm.Type == "Medical Expense Benefits Coverage"
                        || coverageTerm.Type == "Medical Expense Benefits Limit")
                    {
                        ruleModel.MED_EXPENSES = string.IsNullOrEmpty(coverageTerm.Value) ? coverageTerm.ValueType : coverageTerm.Value;
                    }
                }
                if (ruleModel.SelectedExposureType == "PIP")
                {
                    if (!string.IsNullOrEmpty(ruleModel.COMB_1ST_PARTY_BEN))
                        ruleModel.PIP_MEDPAY_LIMITS = ruleModel.MED_EXPENSES;
                    else if (!string.IsNullOrEmpty(pip.ExposureLimit))
                        ruleModel.PIP_MEDPAY_LIMITS = pip.ExposureLimit;
                    else
                        ruleModel.PIP_MEDPAY_LIMITS = pip.IncidentLimit;
                }
            }
        }
    }
}

