using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Service.Mapper;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Utility;
using AdhocCorrespondenceEditor.Utility.Common;
using NJM.DotNetLibrary.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WCCSourceSystemData;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class WCCService : ISourceSystemBase
    { 
        public SourceSystemBaseEntity GetData(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            return GetDataByClaimNumber(Details, helpers);
        }
        private SourceSystemBaseEntity GetDataByClaimNumber(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                GetCorrespondenceData request = new GetCorrespondenceData();
                request.Request = new();
                request.Request.Header = new();
                request.Request.Header.CorrelationContext = new CorrelationContext();
                request.Request.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();
                request.Request.Request = new();
                request.Request.Request.BusinessApplicationID = WCCSourceSystemData.Client.WCC;
                request.Request.Request.DataID = Details.ClaimNumber;
                request.Request.Request.CurrentUserID = Details.CurrentUserId;

                var client = new CorrespondenceDataClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.GetCorrespondenceData(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (!svcResponse.Response.Header.ErrorIn && svcResponse.Response.Header.ErrorInformation.Code == ErrorCodes.OK)
                    return (new MapperBuilder()).GetObject(svcResponse.Response.Response);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.Response.Header.ErrorInformation.Code.ToString(),
                        ErroDiscription = svcResponse.Response.Header.ErrorInformation.Message
                    };
                }
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "WCCService Class");
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = ApplicationConstants.EsbCall,
                ErroDiscription = ApplicationConstants.EsbError
            };
        }
    }
}
