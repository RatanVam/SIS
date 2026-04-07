using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.PCPA;
using AdhocCorrespondenceEditor.Shared.PL;

namespace AdhocCorrespondenceEditor.Client.Common
{
    public static class ApplicationClassUtility
    {

        public static string GetMunicipalityByType(string type, object addressObj)
        {
            switch (addressObj)
            {
                case AdhocCorrespondenceEditor.Shared.PL.Address:
                    return ((AdhocCorrespondenceEditor.Shared.PL.Address)addressObj)?.
                        Municipality?.Where(x => x.MunicipalityTypeCd?.ToUpper().Trim() == type.ToUpper().Trim()).FirstOrDefault()?.MunicipalityNm;
                case AdhocCorrespondenceEditor.Shared.PCPA.Address:
                    return ((AdhocCorrespondenceEditor.Shared.PCPA.Address)addressObj)?.
                        Municipality?.Where(x => x.MunicipalityTypeCd?.ToUpper().Trim() == type.ToUpper().Trim()).FirstOrDefault()?.MunicipalityNm;
                default:
                    return string.Empty;
            }
        }

        public static List<string> GetPLPolicyNumbers(object sourceObject)
        {
            switch (sourceObject)
            {
                case AdhocCorrespondenceEditor.Shared.PL.PLSourceSystemEntity:
                    return ((PLSourceSystemEntity)sourceObject).PolicyData.Policy.PolicyPeriod.RelatedPolicies.Select(x => x.Policy.PolicyNumber).ToList();
                case AdhocCorrespondenceEditor.Shared.PCPA.PLAutoSourceSystemEntity:
                    return ((PLAutoSourceSystemEntity)sourceObject).PolicyData.Policy.PolicyPeriod.AssociatedPolicies.Where(y=>y.AssociationReasonCd != "Health Insurance Policy").Select(x => x.PolicyId).ToList();
                default:
                    return new List<string>();
            }
        }

        public static List<string> GetChildControl(List<DocumentDropdownChildControlEntity> docChildControlList, int itemID)
        {
            var controls = docChildControlList?.Where(x => x.DocumentDropdownLookupItemId == itemID);
            return controls.Count() > 0 ? controls.Select(x => x.ControlName).ToList() : new List<string>();
        }

        public static List<string> GetChildControl(List<DocumentDropdownChildControlEntity> docChildControlList, string itemCode)
        {
            var controls = docChildControlList?.Where(x => x.DocumentDropdownLookupItemCode.ToUpper() == itemCode.ToUpper());
            return controls.Count() > 0 ? controls.Select(x=>x.ControlName).ToList(): new List<string>();
        }
        public static string GetVariableText(List<ConfigurationEntity> docConfigurationList, string itemCode, int docID)
        {
            var variables = docConfigurationList?.Where(x => x.ConfigKey.ToUpper().Trim() == itemCode.ToUpper().Trim() && x.DocumentId == docID);
            return variables.Count() > 0 ? variables.FirstOrDefault().ConfigValue : GetVariableText(docConfigurationList, itemCode);
        }
        public static string GetVariableText(List<ConfigurationEntity> docConfigurationList, string itemCode)
        {
            var variables = docConfigurationList?.Where(x => x.ConfigKey.ToUpper().Trim() == itemCode.ToUpper().Trim() && x.DocumentId == 0);
            return variables.Count() > 0 ? variables.FirstOrDefault().ConfigValue : string.Empty;
        }
    }
}
