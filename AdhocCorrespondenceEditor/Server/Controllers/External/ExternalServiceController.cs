using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Service.ServiceClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.Common;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using DocTypeLookupService;
using Microsoft.AspNetCore.Mvc;
using NJM.DotNetLibrary.Logging;
using OnBaseService;
using System.Net;
using System.ServiceModel;
using System.Text;
using System.Xml;

namespace AdhocCorrespondenceEditor.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExternalServiceController : ControllerBase
    {
        IACERepository _iACERepository;
        public ExternalServiceController(IACERepository dbContext)
        {
            _iACERepository = dbContext;
        }

        [HttpPost("esb")]
        public SourceSystemBaseEntity GetESBData([FromBody] SourceSystemInputRequest details)
        {
            var LOB = _iACERepository.GetLOB().Where(x => x.LOBName.ToUpper() == details.LOB.ToUpper()).FirstOrDefault();
            var urlDetails = _iACERepository.GetWebService().Where(x => x.LOBId == LOB?.LOBId && x.URLType.ToUpper() == ApplicationConstants.ESBUrl.ToUpper() && x.Environment.ToUpper() == details.Environment.ToUpper()).FirstOrDefault();
            if (urlDetails == null)
            {
                return new SourceSystemBaseEntity
                {
                    ErroCode = "ESB Config Error:",
                    ErroDiscription = $"ESB URL Not Configured Env: {details.Environment} LOB : {details.LOB}"
                };
            }
            details.URL = urlDetails.URL;
            var response = (new ServiceFactory()).GetDataESB(details, new Utility.Common.ProxyServiceModelHelpers(Utility.ConfigurationManager.GetInstance(), details.URL));
            if (Utility.ConfigurationManager.GetInstance().LogESBData)
                Utility.Logger.LogESBData(ApplicationConstants.ConvertedEsbData, response);
            return response;
        }

        [HttpGet("onbase/{documentName}")]
        public async Task<int> GetOnbaseId(string documentName)
        {
            var documentID = "0";
            try
            {
                var binding = new BasicHttpBinding();
                binding.CloseTimeout = binding.ReceiveTimeout = binding.SendTimeout = binding.OpenTimeout = new TimeSpan(0, Utility.ConfigurationManager.GetInstance().TimeOutErrorInMin, 0);

                getDocumentTypeIdByName request = new getDocumentTypeIdByName();
                request.request = new OnBaseDataRequestMessage();
                request.request.Header = new OnBaseService.RequestHeader { CorrelationContext = new OnBaseService.CorrelationContext { CorrelationId = "?" } };
                SourceSystemBaseEntity onbasedOC = new SourceSystemBaseEntity();
                request.request.Request = new OnbaseDataRequest { DocName = documentName };

                System.ServiceModel.EndpointAddress endpointAddress = new System.ServiceModel.EndpointAddress(Utility.ConfigurationManager.GetInstance().OnBaseURL);
                var client = new DocumentDataClient(binding, endpointAddress);
                var svcResponse = await client.getDocumentTypeIdByNameAsync(request);

                if(svcResponse.getDocumentTypeIdByNameResponse == null)
                {
                    LogAsync.Error("GetDocumentID", "Error getting the Onbase ID");
                    return 0;
                }
                if (svcResponse.getDocumentTypeIdByNameResponse.response.Header.ErrorIn)
                {
                    LogAsync.Error("GetDocumentID", svcResponse.getDocumentTypeIdByNameResponse.response.Header.ErrorInformation.Message + svcResponse.getDocumentTypeIdByNameResponse.response.Header.ErrorInformation.SystemId);
                    return 0;
                }
                documentID = svcResponse.getDocumentTypeIdByNameResponse.response.Response.DocId;
            }
            catch(Exception ex)
            {
                LogAsync.Exception(ex, "GetDocumentID", ex.Message);
            }
            return int.Parse(documentID);
        }
        [HttpGet("onbase/gc/{docType}")]
        public int GetOnbaseIdForGC(string docType)
        {
            int documentID = 0;
            try
            {
               lookupDocType lookupDocType = new lookupDocType();
                lookupDocType.request = new();
                lookupDocType.request.Header = new() { CorrelationContext = new DocTypeLookupService.CorrelationContext() { CorrelationId = Guid.NewGuid().ToString() } };
                lookupDocType.request.DocType = new() { DocTypeName = docType };
                var binding = new BasicHttpBinding();
                binding.CloseTimeout = binding.ReceiveTimeout = binding.SendTimeout = binding.OpenTimeout = new TimeSpan(0, Utility.ConfigurationManager.GetInstance().TimeOutErrorInMin, 0);
                System.ServiceModel.EndpointAddress endpointAddress = new System.ServiceModel.EndpointAddress(Utility.ConfigurationManager.GetInstance().GC_OnBaseURL);

                DocTypeLookupServiceClient docTypeLookupServiceClient = new DocTypeLookupServiceClient(binding,endpointAddress);
                var svcResponse = docTypeLookupServiceClient.lookupDocType(lookupDocType);
                if (svcResponse?.response?.DocType?.DocTypeID == null)
                {
                    LogAsync.Error("GetDocumentIdForGC", "Error getting the Onbase ID");
                    return 0;
                }
                if (svcResponse.response.Header?.ErrorIn == true)
                {
                    LogAsync.Error("GetDocumentIdForGC", svcResponse.response.Header.ErrorInformation.MessageTx + svcResponse.response.Header.ErrorInformation.SystemId);
                    return 0;
                }
                documentID = svcResponse.response.DocType.DocTypeID;
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, "GetDocumentIdForGC", ex.Message);
            }
            return documentID;
        }
        [HttpPost("inspire")]
        public async Task<string> PostInspireData([FromBody] InspireInputRequest requestDetails)
        {
            string errorMessage = string.Empty;
            try
            {
                string baseUrl = Utility.ConfigurationManager.GetInstance().InspireTicketIdURL;
                string actionMethod = Utility.ConfigurationManager.GetInstance().InspireSoapAction;
                string xmlPayload = requestDetails.XMLRequest;
                HttpResponseMessage response = await PostInspireRequest(baseUrl, xmlPayload, actionMethod);
                string content = await response.Content.ReadAsStringAsync();
                return content;
            }
            catch(Exception ex)
            {
                errorMessage = "<ErrorResponse><Message>Inspire Service Failed! " + ex.Message + "</Message></ErrorResponse>";
                LogAsync.Exception(ex, "Inspire Error:PostInspireData", errorMessage);
            }
            return errorMessage;
        }
        private async Task<HttpResponseMessage> PostInspireRequest(string baseUrl, string xmlPayload, string actionMethod)
        {
            using (var httpClient = new HttpClient())
            {
                var httpContent = new StringContent(xmlPayload, Encoding.UTF8, "text/xml");
                httpContent.Headers.Add("SOAPAction", actionMethod);

                return await httpClient.PostAsync(baseUrl, httpContent);
            }
        }  
    }
}
