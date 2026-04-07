using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Service.Mapper;
using NJM.DotNetLibrary.Logging;
using AdhocCorrespondenceEditor.Utility.Common;
using AdhocCorrespondenceEditor.Utility;
using AdhocCorrespondenceEditor.Repository;
using PCHODWSourceSystemData;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class PCDWService : ISourceSystemBase
    {

        public SourceSystemBaseEntity GetData(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            if (string.IsNullOrEmpty(Details.PolicyNumber))
                return GetDataByQuoteNumber(Details, helpers);
            else
                return GetDataByPolicyNumber(Details, helpers);
        }

        public SourceSystemBaseEntity GetDataByPolicyNumber(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                retrievePolicyByPolicyNumber request = new retrievePolicyByPolicyNumber();
                request.retrievePolicyByPolicyNumberReqMsg = new RetrievePolicyByPolicyNumberRequestMessage();
                request.retrievePolicyByPolicyNumberReqMsg.PolicyNumber = Details.PolicyNumber;
                request.retrievePolicyByPolicyNumberReqMsg.AsOfDate = Details.AsOfDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:sszzz");
                if (Details.AsOfDate == DateTime.MinValue || Details.AsOfDate == DateTime.MaxValue)
                    request.retrievePolicyByPolicyNumberReqMsg.AsOfDateSpecified = false;
                else
                    request.retrievePolicyByPolicyNumberReqMsg.AsOfDateSpecified = true;
                request.retrievePolicyByPolicyNumberReqMsg.Header = new ();
                request.retrievePolicyByPolicyNumberReqMsg.Header.id = "1.0";
                request.retrievePolicyByPolicyNumberReqMsg.Header.CorrelationContext = new CorrelationContext();
                request.retrievePolicyByPolicyNumberReqMsg.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                var client = new HOPolicyInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrievePolicyByPolicyNumber(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (svcResponse.retrievePolicyByPolicyNumberRespMsg.Policy != null)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.retrievePolicyByPolicyNumberRespMsg.Header.ErrorInformation.CodeTx,
                        ErroDiscription = svcResponse.retrievePolicyByPolicyNumberRespMsg.Header.ErrorInformation.MessageTx
                    };
                }
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "PCDWService Class");
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = ApplicationConstants.EsbCall,
                ErroDiscription = ApplicationConstants.EsbError
            };
        }


        public SourceSystemBaseEntity GetDataByQuoteNumber(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                retrievePolicyByQuoteNumber request = new retrievePolicyByQuoteNumber();
                request.retrievePolicyByQuoteNumberReqMsg = new RetrievePolicyByQuoteNumberRequestMessage();
                request.retrievePolicyByQuoteNumberReqMsg.QuoteNumber = Details.QuoteNumber;
                request.retrievePolicyByQuoteNumberReqMsg.AsOfDate = Details.AsOfDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:sszzz"); // in proxy class convert DateTime to string
                if (Details.AsOfDate == DateTime.MinValue || Details.AsOfDate == DateTime.MaxValue)
                    request.retrievePolicyByQuoteNumberReqMsg.AsOfDateSpecified = false;
                else
                    request.retrievePolicyByQuoteNumberReqMsg.AsOfDateSpecified = true;
                request.retrievePolicyByQuoteNumberReqMsg.Header = new();
                request.retrievePolicyByQuoteNumberReqMsg.Header.id = "1.0";
                request.retrievePolicyByQuoteNumberReqMsg.Header.CorrelationContext = new CorrelationContext();
                request.retrievePolicyByQuoteNumberReqMsg.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();

                var client = new HOPolicyInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrievePolicyByQuoteNumber(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (svcResponse.retrievePolicyByQuoteNumberRespMsg.Policy != null)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.retrievePolicyByQuoteNumberRespMsg.Header.ErrorInformation.CodeTx,
                        ErroDiscription = svcResponse.retrievePolicyByQuoteNumberRespMsg.Header.ErrorInformation.MessageTx
                    };
                }
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "PCDWService Class");
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = ApplicationConstants.EsbCall,
                ErroDiscription = ApplicationConstants.EsbError
            };
        }
    }
}