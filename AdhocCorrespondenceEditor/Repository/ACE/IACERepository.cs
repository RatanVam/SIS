using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.Common;
using AdhocCorrespondenceEditor.Shared.DTO.ACEEntity;

namespace AdhocCorrespondenceEditor.Repository
{
    public interface IACERepository
    {
        public IEnumerable<LOBEntity> GetLOB();
        public IEnumerable<CategoryEntity> GetCategory();
        public IEnumerable<DocumentEntity> GetDocument();
        public IEnumerable<DocumentControlEntity> GetDocumentControl();
        public IEnumerable<GenericLookupEntity> GetGenericLookupData();
        public IEnumerable<PrinterLookupEntity> GetPrinterLookupData();
        public IEnumerable<PrinterEntity> GetPrinter();
        public int DeletePrinter(int LOBPrinterId,string userId);
        public int AddPrinter(PrinterRequest printerEntity);
        public int UpdatePrinter(PrinterRequest printerEntity);
        public int AddPrinterMap(PrinterLookupRequest printerLookupEntity);
        public int UpdatePrinterMap(PrinterLookupRequest printerLookupEntity);
        public IEnumerable<PolicyLookupEntity> GetPolicyLookupData();
        public IEnumerable<WebServiceEntity> GetWebService();
        public IEnumerable<DocumentDropdownLookupDataEntity> GetDocumentDropdownLookupData();
        public IEnumerable<DocumentDropdownChildControlEntity> GetDocumentDropdownChildControl();
        public int InsertDocumentLog(DocumentLogEntity documentLogEntity);
        public IEnumerable<ConfigurationEntity> GetConfigurationLookupData();
        public IEnumerable<RuleEntity> GetRule();
        public IEnumerable<RuleLookupEntity> GetRuleLookup();
        public IEnumerable<EZSendRequestData> GetEZSendRequest(string docId);
        public int InsertEasySendRequest(EasySendRequest request);
        public int UpdateUserEZSendRequest(string UserId, int Id);
        public int UpdateStatusEZSendRequest(int Status, int Id);
        public IEnumerable<DenialReasonEnitity> GetDenialReasons();
    }
}
