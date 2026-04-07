using BCSourceSystemData;
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
    public class BCPAService : ISourceSystemBase
    {
        public SourceSystemBaseEntity GetData(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {

            if (!Details.IsItUseDates || ! Details.IsManualInvoice)
            {
                return GetDataByInvoice(Details, helpers);
            }
            return GetDataByPolicyNumber(Details, helpers); 

        }

        private SourceSystemBaseEntity GetDataByPolicyNumber(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                retrievePolicyInvoiceDetails request = new retrievePolicyInvoiceDetails();
                request.retrievePolicyInvoiceDetailsIn = new ();
                request.retrievePolicyInvoiceDetailsIn.PolicyNumber = Details.PolicyNumber;
                if(Details.IsManualInvoice && Details.IsItUseDates)
                {
                    request.retrievePolicyInvoiceDetailsIn.StartDateSpecified = true;
                    request.retrievePolicyInvoiceDetailsIn.EndDateSpecified = true;
                    request.retrievePolicyInvoiceDetailsIn.StartDate = Details.StartDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss");
                    request.retrievePolicyInvoiceDetailsIn.EndDate = Details.EndDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss");
                }
                request.retrievePolicyInvoiceDetailsIn.Header = new RequestHeader();
                request.retrievePolicyInvoiceDetailsIn.Header.CorrelationContext = new CorrelationContext();
                request.retrievePolicyInvoiceDetailsIn.Header.CorrelationContext.CorrelationId = helpers.guid.ToString();

                var client = new WCUBillingDataServiceClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrievePolicyInvoiceDetails(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (!svcResponse.retrievePolicyInvoiceDetailsOut.Header.ErrorInSpecified)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.retrievePolicyInvoiceDetailsOut.Header.ErrorInformation.CodeTx,
                        ErroDiscription = svcResponse.retrievePolicyInvoiceDetailsOut.Header.ErrorInformation.MessageTx
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

        private SourceSystemBaseEntity GetDataByInvoice(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                
                //retrieveInvoiceTransactions request = new ();
                var request = new retrieveInvoiceTransactions();
                request.retrieveInvoiceTransactionsIn = new();
                request.retrieveInvoiceTransactionsIn.PolicyNumber = Details.PolicyNumber;

                request.retrieveInvoiceTransactionsIn.Header = new RequestHeader();
                request.retrieveInvoiceTransactionsIn.Header.CorrelationContext = new CorrelationContext();
                request.retrieveInvoiceTransactionsIn.Header.CorrelationContext.CorrelationId = helpers.guid.ToString("D");

                var client = new WCUBillingDataServiceClient(helpers.binding, helpers.endpointAddress);
                var svcResponse = client.retrieveInvoiceTransactions(request);
                if (helpers.LogEsbData)
                {
                    Logger.LogESBData(ApplicationConstants.EsbRequest, request);
                    Logger.LogESBData(ApplicationConstants.OriginalEsbData, svcResponse);
                }
                if (!svcResponse.retrieveInvoiceTransactionsOut.Header.ErrorInSpecified)
                    return (new MapperBuilder()).GetObject(svcResponse);
                else
                {
                    return new SourceSystemBaseEntity
                    {
                        ErroCode = svcResponse.retrieveInvoiceTransactionsOut.Header.ErrorInformation.CodeTx,
                        ErroDiscription = svcResponse.retrieveInvoiceTransactionsOut.Header.ErrorInformation.MessageTx
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