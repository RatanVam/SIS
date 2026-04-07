using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.Common;
using AdhocCorrespondenceEditor.Shared.DTO.ACEEntity;
using AdhocCorrespondenceEditor.Utility.Cache;
using Microsoft.AspNetCore.Mvc;
using NJM.DotNetLibrary.Logging;

namespace AdhocCorrespondenceEditor.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LookupController : ControllerBase
    {
        IACERepository _iAceRepository;
        ICacheHelper _iCacheHelper;

        public LookupController(IACERepository dbContext, ICacheHelper cacheHelper)
        {
            _iAceRepository = dbContext;
            _iCacheHelper = cacheHelper;
        }

        [HttpGet("webservice")]
        public IEnumerable<WebServiceEntity> GetWebService()
        {
            IEnumerable<WebServiceEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetWebService,out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetWebService, _iAceRepository.GetWebService());

            return  _iCacheHelper.Get(ApplicationConstants.SPGetWebService, items);
        }

        [HttpGet("webservice/{lobName}/{urlType}/{environment}")]
        public IActionResult GetWebService(string lobName, string urlType, string environment)
        {
            var webServices = GetWebService();
            var webService = webServices.Where(x => x.LOBName.ToUpper() == lobName.ToUpper() && x.URLType == urlType && x.Environment.ToUpper() == environment.ToUpper()).FirstOrDefault();
            if (webService == null)
                webService = new WebServiceEntity();
            return Ok(webService);
        }

        [HttpGet("GetWebServiceSearch")]
        public IActionResult GetWebServiceSearch()
        {
            return Ok(Utility.ConfigurationManager.GetInstance().InspireSearchURL);
        }

        [HttpGet("GetAppSettings")]
        public IActionResult GetAppSettings()
        {
            return Ok(new AppSettingEntity
            {
                LogDocumentsInDB = Utility.ConfigurationManager.GetInstance().LogDocumentsInDB,
                ShowXMLs = Utility.ConfigurationManager.GetInstance().ShowXMLs,
                ShowSimulator= Utility.ConfigurationManager.GetInstance().ShowSimulator,
                InspireClientId = Utility.ConfigurationManager.GetInstance().InspireClientId,
                InspireClientSecret = Utility.ConfigurationManager.GetInstance().InspireClientSecret,
                TimeOutErrorInMin = Utility.ConfigurationManager.GetInstance().TimeOutErrorInMin
            });
        }

        [HttpGet("printer")]
        public IEnumerable<PrinterLookupEntity> GetPrinter()
        {
            IEnumerable<PrinterLookupEntity> items = null;

            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetPrinterLookup, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetPrinterLookup, _iAceRepository.GetPrinterLookupData());

            return _iCacheHelper.Get(ApplicationConstants.SPGetPrinterLookup, items);
        }

        [HttpGet("printer/{lobname}")]
        public IActionResult GetPrinter(string lobName)
        {
            var printers = GetPrinter();
            var printer = printers.Where(x => x.LOBName.ToUpper() == lobName.ToUpper());

            if (printer == null)
                printer = new List<PrinterLookupEntity>();
            return Ok(printer);
        }

        [HttpGet("policylookup")]
        public IEnumerable<PolicyLookupEntity> GetPolicyLookup()
        {
            IEnumerable<PolicyLookupEntity> items = null;

            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetPolicyLookup, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetPolicyLookup, _iAceRepository.GetPolicyLookupData());

            return _iCacheHelper.Get(ApplicationConstants.SPGetPolicyLookup, items);

        }

        [HttpGet("genericlookup")]
        public IEnumerable<GenericLookupEntity> GetGenericLookup()
        {
            IEnumerable<GenericLookupEntity> items = null;

            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetGenericLookup, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetGenericLookup, _iAceRepository.GetGenericLookupData());

            return _iCacheHelper.Get(ApplicationConstants.SPGetGenericLookup, items);
        }
        [HttpGet("documentdropdownlookupdata")]
        public IEnumerable<DocumentDropdownLookupDataEntity> GetDocumentDropdownLookupData()
        {
            IEnumerable<DocumentDropdownLookupDataEntity> items = null;

            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetDocumentDropdownDataLookup, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetDocumentDropdownDataLookup, _iAceRepository.GetDocumentDropdownLookupData());

            return _iCacheHelper.Get(ApplicationConstants.SPGetDocumentDropdownDataLookup, items);
        }

        [HttpGet("documentdropdownlookupdata/{lobName}/{documentId}/{keyName}")]
        public IActionResult GetDocumentDropdownLookupData(string lobName, int documentId, string keyName)
        {
            var lookupData = GetDocumentDropdownLookupData();
            var lookup = lookupData.Where(x => x.LOBName.ToUpper() == lobName.ToUpper() && x.DocumentDropdownLookupTypeCode.ToUpper() == keyName.ToUpper() && x.DocumentId == documentId);
            if (!lookup.Any())
                lookup = lookupData.Where(x => x.LOBName.ToUpper() == lobName.ToUpper() && x.DocumentDropdownLookupTypeCode.ToUpper() == keyName.ToUpper() && x.DocumentId == -999);
            if (lookup == null)
                lookup = new List<DocumentDropdownLookupDataEntity>();
            return Ok(lookup.OrderBy(x => x.DocumentDropdownLookupItemOrder));

        }

        [HttpGet("documentdropdownlookupdata/{keyName}")]
        public IActionResult GetDocumentDropdownLookupData(string keyName)
        {
            var lookupData = GetDocumentDropdownLookupData();
            var lookup = lookupData.Where(x => x.DocumentDropdownLookupTypeCode.ToUpper() == keyName.ToUpper());
            if (lookup == null)
                lookup = new List<DocumentDropdownLookupDataEntity>();
            return Ok(lookup.OrderBy(x => x.DocumentDropdownLookupItemOrder));
        }
        [HttpGet("documentdropdownlookupdata/{lobName}/{keyName}")]
        public IActionResult GetDocumentDropdownLookupData(string lobName, string keyName)
        {
            var lookupData = GetDocumentDropdownLookupData();
            var lookup = lookupData.Where(x => x.DocumentDropdownLookupTypeCode.ToUpper() == keyName.ToUpper() && x.LOBName.ToUpper() == lobName.ToUpper());

            if (lookup == null)
                lookup = new List<DocumentDropdownLookupDataEntity>();
            return Ok(lookup.OrderBy(x => x.DocumentDropdownLookupItemOrder));
        }

        [HttpGet("documentdropdownchildcontrol")]
        public IEnumerable<DocumentDropdownChildControlEntity> GetDocumentDropdownChildcontrol()
        {
            IEnumerable<DocumentDropdownChildControlEntity> items = null;

            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetDocumentDropdownChildControl, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetDocumentDropdownChildControl, _iAceRepository.GetDocumentDropdownChildControl());

            return _iCacheHelper.Get(ApplicationConstants.SPGetDocumentDropdownChildControl, items);
        }
        [HttpGet("documentdropdownchildcontrol/{documentId}")]
        public IActionResult GetDocumentDropdownChildcontrol(int documentId)
        {
            var lookupData = GetDocumentDropdownChildcontrol();
            var lookup = lookupData.Where(x => x.DocumentId == documentId);
            if (lookup == null)
                lookup = new List<DocumentDropdownChildControlEntity>();
            return Ok(lookup);
        }


        [HttpGet("configuration")]
        public IEnumerable<ConfigurationEntity> GetConfigurationData()
        {
            IEnumerable<ConfigurationEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPConfigurationLookup, out items))
                _iCacheHelper.Put(ApplicationConstants.SPConfigurationLookup, _iAceRepository.GetConfigurationLookupData());

            return _iCacheHelper.Get(ApplicationConstants.SPConfigurationLookup, items);
        }
        [HttpGet("configuration/{lobName}")]
        public IActionResult GetConfigurationDatabyLob(string lobName)
        {
            var lookupData = GetConfigurationData();
            var lookup = lookupData.Where(x => x.LOBName.ToUpper() == lobName.ToUpper());
            if (lookup == null)
                lookup = new List<ConfigurationEntity>();
            return Ok(lookup);
        }
        private IEnumerable<DenialReasonEnitity> GetDenialReasonsFromCache()
        {
            IEnumerable<DenialReasonEnitity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetDenialReasons, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetDenialReasons, _iAceRepository.GetDenialReasons());

            return _iCacheHelper.Get(ApplicationConstants.SPGetDenialReasons, items);
        }

        [HttpPost("DenialReasons")]
        public IActionResult GetDenialReasons([FromBody] DenialReasonRequest request)
        {
            var lookupdata = GetDenialReasonsFromCache().Where(x => 
                request.LobName == x.LOBName 
                && request.DocumentId == x.DocumentId 
                && (request.PolicyForm == x.PolicyForm || x.PolicyForm == null) 
                && (request.PolicyState == x.PolicyState || x.PolicyState == null)
                && (request.PolicyType == x.PolicyType || x.PolicyType == null));
            if (lookupdata == null)
                lookupdata = new List<DenialReasonEnitity>();
            return Ok(lookupdata);
        }

        [HttpGet("rule")]
        public IEnumerable<RuleEntity> GetRules()
        {
            IEnumerable<RuleEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetRule, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetRule, _iAceRepository.GetRule());

            return _iCacheHelper.Get(ApplicationConstants.SPGetRule, items);
        }

        [HttpGet("ruleLookup")]
        public IEnumerable<RuleLookupEntity> GetRuleLookup()
        {
            IEnumerable<RuleLookupEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetRuleLookup, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetRuleLookup, _iAceRepository.GetRuleLookup());

            return _iCacheHelper.Get(ApplicationConstants.SPGetRuleLookup, items);
        }


        [HttpGet("clearcache")]
        public IActionResult ClearCache()
        {
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPolicyLookup);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetDocumentDropdownDataLookup);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetDocument);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetCategoty);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetDocumentControl);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetGenericLookup);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetLOB);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPrinterLookup);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetWebService);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPConfigurationLookup);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetDenialReasons);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetRule);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetRuleLookup);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetDocumentDropdownChildControl);
            _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPrinter);

            return Ok();
        }
    }
}
