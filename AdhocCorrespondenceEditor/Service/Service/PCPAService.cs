using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Service.Mapper;
using NJM.DotNetLibrary.Logging;
using AdhocCorrespondenceEditor.Utility.Common;
using AdhocCorrespondenceEditor.Utility;
using AdhocCorrespondenceEditor.Repository;
using PCPASourceSystemData;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class PCPAService : ISourceSystemBase
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
                request.retrievePolicyByPolicyNumberReqMsg.Filters = new Filter[] { new Filter { FilterKey = "AsOfDate", FilterValue = Details.AsOfDate.ToUniversalTime().ToString("yyyy-MM-dd") } };
                request.retrievePolicyByPolicyNumberReqMsg.Header = new ();
                request.retrievePolicyByPolicyNumberReqMsg.Header.CorrelationContext = new CorrelationContext();
                request.retrievePolicyByPolicyNumberReqMsg.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                var client = new PolicyInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
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
                request.retrievePolicyByQuoteNumberReqMsg.Filters = new Filter[] { new Filter { FilterKey = "AsOfDate", FilterValue = Details.AsOfDate.ToUniversalTime().ToString("yyyy-MM-dd") } };
                request.retrievePolicyByQuoteNumberReqMsg.Header = new();
                request.retrievePolicyByQuoteNumberReqMsg.Header.CorrelationContext = new CorrelationContext();
                request.retrievePolicyByQuoteNumberReqMsg.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();

                var client = new PolicyInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
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