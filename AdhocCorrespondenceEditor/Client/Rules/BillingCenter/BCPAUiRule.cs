using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.BC;
using AdhocCorrespondenceEditor.Client.Common;
namespace AdhocCorrespondenceEditor.Client
{
    public class BCPAUiRule : RuleBase
    {
        public void SetEmailControlVisibility(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            if (ruleModel.AceDataCollector == null) return;
            var BCSourceSystem = (BCSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity;
            PolicyPeriod policyPeriod = null;
            if (BCSourceSystem.retrievePolicyInvoiceDetailsOut != null)
            {
                policyPeriod = BCSourceSystem.retrievePolicyInvoiceDetailsOut.AccountInvoices[0].PolicyPeriodForThisInvoice;
            }
            else if (BCSourceSystem.retrieveInvoiceTransactionsOut != null)
            {
                policyPeriod = BCSourceSystem.retrieveInvoiceTransactionsOut.AccountInvoices[0].PolicyPeriodForThisInvoice;
            }
            if (policyPeriod != null)
            {
                string lob = GetLineOfBusiness(policyPeriod);
                if (!ApplicationConstants.PLPolicyTypes.Contains(lob))
                {
                    var EmailControl = ruleModel.AceDataCollector.documentData.documentControlList.FirstOrDefault(x => x.ControlName == "EmailwCheckbox");
                    ruleModel.AceDataCollector.documentData.documentControlList.Remove(EmailControl);
                }
            }
        }
        private string GetLineOfBusiness(PolicyPeriod policyPeriod)
        {
            string lob = policyPeriod.Policy.LOBCode.DisplayName;
            if (lob == ApplicationConstants.LOB_HO)
                lob = policyPeriod.HOPolicyType_Ext.Code;

            ILookup<string, string> lookup = ApplicationConstants.BCLineOfBusiness.
                                    ToLookup(x => x.Key, x => x.Value);
            if(lookup.Contains(lob))
            return lookup[lob].SingleOrDefault();
            return String.Empty;
        }
    }
}
