using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.PCPA;
using AdhocCorrespondenceEditor.Client.Common;
using System.Globalization;
namespace AdhocCorrespondenceEditor.Client
{
    public class PCPAUiRule : RuleBase
    {
        public void FilterDocuments(RuleModel ruleModel, RuleEntity ruleEntity, List<RuleLookupEntity> ruleLookups)
        {
            if (ruleModel?.AceDataCollector?.SourceSystemEntity == null) return;
            var sourceSystemPolicyLines = ((PLAutoSourceSystemEntity)ruleModel.AceDataCollector.SourceSystemEntity)?.PolicyData?.Policy?.PolicyPeriod?.PolicyLines?.Where(x => x.PersonalAutoLine != null).FirstOrDefault();
            if (sourceSystemPolicyLines?.PersonalAutoLine != null && sourceSystemPolicyLines.PersonalAutoLine.PolicyInceptionDtSpecified)
            {
                DateTime? policyInceptionDate = sourceSystemPolicyLines?.PersonalAutoLine.PolicyInceptionDt;
                DateTime cutoffDate = DateTime.MaxValue;
                string DocumentExcludeListInRange, DocumentExcludeListOutofRange;
                var datestring = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(cutoffDate));
                //if (!string.IsNullOrEmpty(datestring))
                //    cutoffDate = DateTime.ParseExact(datestring, ApplicationConstants.DateFormat, CultureInfo.InvariantCulture);

                var formats = new[] { ApplicationConstants.DateFormat };
                if (!DateTime.TryParseExact(datestring, formats, CultureInfo.InvariantCulture, DateTimeStyles.None, out cutoffDate))
                    return;
                DocumentExcludeListInRange = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(DocumentExcludeListInRange));
                DocumentExcludeListOutofRange = ApplicationClassUtility.GetVariableText(ruleModel.AceDataCollector.configLookupEntity, nameof(DocumentExcludeListOutofRange));
                if (policyInceptionDate < cutoffDate)
                    RemoveDocument(DocumentExcludeListOutofRange, ruleModel.AceDataCollector.documentList);
                else
                    RemoveDocument(DocumentExcludeListInRange, ruleModel.AceDataCollector.documentList);
            }
        }
        private void RemoveDocument(string documentName, List<DocumentEntity> documentList)
        {
            var docnames = documentName?.Split(",");
            var doc = documentList?.Where(x => docnames.Contains(x.DocumentId.ToString())).FirstOrDefault();
            if (doc != null)
                documentList.Remove(doc);
        }

    }
}
