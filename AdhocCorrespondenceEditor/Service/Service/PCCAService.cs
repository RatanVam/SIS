using CommercialAuto;
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
    public class PCCAService : ISourceSystemBase
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
                request.RetrievePolicyByPolicyNumberRequestMessage = new RetrievePolicyByPolicyNumberRequestMessage();
                request.RetrievePolicyByPolicyNumberRequestMessage.PolicyNumber = Details.PolicyNumber;
                request.RetrievePolicyByPolicyNumberRequestMessage.AsOfDate = Details.AsOfDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:sszzz");
                if (Details.AsOfDate == DateTime.MinValue || Details.AsOfDate == DateTime.MaxValue)
                    request.RetrievePolicyByPolicyNumberRequestMessage.AsOfDateSpecified = false;
                else
                    request.RetrievePolicyByPolicyNumberRequestMessage.AsOfDateSpecified = true;
                request.RetrievePolicyByPolicyNumberRequestMessage.Header = new Header();
                request.RetrievePolicyByPolicyNumberRequestMessage.Header.Version = "1.0";
                request.RetrievePolicyByPolicyNumberRequestMessage.Header.CorrelationContext = new CorrelationContext();
                request.RetrievePolicyByPolicyNumberRequestMessage.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                request.RetrievePolicyByPolicyNumberRequestMessage.Header.Requestor = new Requestor();
                request.RetrievePolicyByPolicyNumberRequestMessage.Header.Requestor.SystemIdentity = "Master.PolicyRetrieval";
                request.RetrievePolicyByPolicyNumberRequestMessage.Header.Requestor.UserIdentity = "System";
                var client = new CAPolicyInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrievePolicyByPolicyNumber(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (svcResponse.RetrievePolicyByPolicyNumberResponseMessage.Policy != null)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.RetrievePolicyByPolicyNumberResponseMessage.Header.ErrorInformation.ErrorCd,
                        ErroDiscription = svcResponse.RetrievePolicyByPolicyNumberResponseMessage.Header.ErrorInformation.ErrorMessage
                    };
                }
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "PCPAService Class");
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
                request.RetrievePolicyByQuoteNumberRequestMessage = new RetrievePolicyByQuoteNumberRequestMessage();
                request.RetrievePolicyByQuoteNumberRequestMessage.QuoteNumber = Details.QuoteNumber;
                request.RetrievePolicyByQuoteNumberRequestMessage.AsOfDate = Details.AsOfDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:sszzz");
                if (Details.AsOfDate == DateTime.MinValue || Details.AsOfDate == DateTime.MaxValue)
                    request.RetrievePolicyByQuoteNumberRequestMessage.AsOfDateSpecified = false;
                else
                    request.RetrievePolicyByQuoteNumberRequestMessage.AsOfDateSpecified = true;
                request.RetrievePolicyByQuoteNumberRequestMessage.Header = new Header();
                request.RetrievePolicyByQuoteNumberRequestMessage.Header.Version = "1.0";
                request.RetrievePolicyByQuoteNumberRequestMessage.Header.CorrelationContext = new CorrelationContext();
                request.RetrievePolicyByQuoteNumberRequestMessage.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                request.RetrievePolicyByQuoteNumberRequestMessage.Header.Requestor = new Requestor();
                request.RetrievePolicyByQuoteNumberRequestMessage.Header.Requestor.SystemIdentity = "Master.PolicyRetrieval";
                request.RetrievePolicyByQuoteNumberRequestMessage.Header.Requestor.UserIdentity = "System";

                var client = new CAPolicyInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrievePolicyByQuoteNumber(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (svcResponse.RetrievePolicyByQuoteNumberResponseMessage.Policy != null)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.RetrievePolicyByQuoteNumberResponseMessage.Header.ErrorInformation.ErrorCd,
                        ErroDiscription = svcResponse.RetrievePolicyByQuoteNumberResponseMessage.Header.ErrorInformation.ErrorMessage
                    };
                }
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "PCPAService Class");
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = ApplicationConstants.EsbCall,
                ErroDiscription = ApplicationConstants.EsbError
            };
        }
    }
}