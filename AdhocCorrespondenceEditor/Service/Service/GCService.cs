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
using GCSourceSystemData;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class GCService : ISourceSystemBase
    { 
        public SourceSystemBaseEntity GetData(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            return GetDataByClaimNumber(Details, helpers);
        }
        private SourceSystemBaseEntity GetDataByClaimNumber(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                RetrieveDocumentData request = new RetrieveDocumentData();
                request.Request = new();
                request.Request.BusinessApplication = Details.LOB;
                request.Request.DataID = Details.ClaimNumber;
                request.Request.CurrentUserID = Details.CurrentUserId;

                var client = new DocumentDataRepositoryClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.RetrieveDocumentData(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (!svcResponse.Response.Header.ErrorIn && svcResponse.Response.Header.ErrorInformation.Code == ErrorCodes.OK)
                    return (new MapperBuilder()).GetObject(svcResponse.Response);
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
                LogAsync.Exception(ex, ApplicationConstants.GetDataESB, "GCService Class");
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = ApplicationConstants.EsbCall,
                ErroDiscription = ApplicationConstants.EsbError
            };
        }
    }
}
