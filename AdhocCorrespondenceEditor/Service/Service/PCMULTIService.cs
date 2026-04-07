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
using CommercialMulti;
using AdhocCorrespondenceEditor.Utility.Common;
using AdhocCorrespondenceEditor.Utility;
using AdhocCorrespondenceEditor.Repository;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class PCMULTIService : ISourceSystemBase
    {

        public SourceSystemBaseEntity GetData(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
                return GetDataByPolicyNumber(Details, helpers);
        }

        public SourceSystemBaseEntity GetDataByPolicyNumber(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                retrieveAccountInformation request = new retrieveAccountInformation();
                request.RetrieveAccountInformationRequestMessage = new();
                request.RetrieveAccountInformationRequestMessage.AccountNumber = Details.AccountNumber;
                request.RetrieveAccountInformationRequestMessage.Header = new Header();
                request.RetrieveAccountInformationRequestMessage.Header.Version = "1.0";
                request.RetrieveAccountInformationRequestMessage.Header.CorrelationContext = new CorrelationContext();
                request.RetrieveAccountInformationRequestMessage.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                request.RetrieveAccountInformationRequestMessage.Header.Requestor = new Requestor();
                request.RetrieveAccountInformationRequestMessage.Header.Requestor.SystemIdentity = "ICE";
                request.RetrieveAccountInformationRequestMessage.Header.Requestor.UserIdentity = "user";

                var client = new CommercialMulti.AccountInfomationRetrieverClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrieveAccountInformation(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (svcResponse.RetrieveAccountInformationResponseMessage.AccountInformation != null)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.RetrieveAccountInformationResponseMessage.Header.ErrorInformation.ErrorCd,
                        ErroDiscription = svcResponse.RetrieveAccountInformationResponseMessage.Header.ErrorInformation.ErrorMessage
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