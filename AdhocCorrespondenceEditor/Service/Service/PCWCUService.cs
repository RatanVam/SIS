using WCUSourceSystemData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Service.Mapper;
using NJM.DotNetLibrary.Logging;
using System.Xml.Serialization;
using AdhocCorrespondenceEditor.Utility.Common;
using AdhocCorrespondenceEditor.Utility;
using AdhocCorrespondenceEditor.Repository;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class PCWCUService : ISourceSystemBase
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
                request.retrievePolicyByPolicyNumberReqMsg = new ();
                request.retrievePolicyByPolicyNumberReqMsg.PolicyNumber = Details.PolicyNumber;
                request.retrievePolicyByPolicyNumberReqMsg.Header = new ();
                request.retrievePolicyByPolicyNumberReqMsg.Header.CorrelationContext = new CorrelationContext();
                request.retrievePolicyByPolicyNumberReqMsg.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                Filter[] fiter = { new Filter { FilterKey = "CheckDigitIn", FilterValue = "true" } };
                request.retrievePolicyByPolicyNumberReqMsg.Filters = fiter;
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
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "PCWCUService Class");
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
                retrievePolicySummaryByQuoteNumber request = new ();
                request.retrievePolicySummaryByQuoteNumberReqMsg = new ();
                request.retrievePolicySummaryByQuoteNumberReqMsg.QuoteNumber = Details.QuoteNumber;
                request.retrievePolicySummaryByQuoteNumberReqMsg.Header = new ();
                request.retrievePolicySummaryByQuoteNumberReqMsg.Header.CorrelationContext = new CorrelationContext();
                request.retrievePolicySummaryByQuoteNumberReqMsg.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                Filter[] fiter = { new Filter { FilterKey = "CheckDigitIn", FilterValue = "true" } };
                request.retrievePolicySummaryByQuoteNumberReqMsg.Filters = fiter;
                var client = new PolicyInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrievePolicySummaryByQuoteNumber(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (svcResponse.retrievePolicySummaryByQuoteNumberRespMsg.Policy != null)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.retrievePolicySummaryByQuoteNumberRespMsg.Header.ErrorInformation.CodeTx,
                        ErroDiscription = svcResponse.retrievePolicySummaryByQuoteNumberRespMsg.Header.ErrorInformation.MessageTx
                    };
                }
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "PCWCUService Class");
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = ApplicationConstants.EsbCall,
                ErroDiscription = ApplicationConstants.EsbError
            };
        }
    }
}