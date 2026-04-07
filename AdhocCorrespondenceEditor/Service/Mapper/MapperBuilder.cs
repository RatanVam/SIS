using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.CL;
using NJM.DotNetLibrary.Logging;


namespace AdhocCorrespondenceEditor.Service.Mapper
{
    public class MapperBuilder
    {

        public SourceSystemBaseEntity GetObject(object sourceObject)
        {
            try
            {
                AutoMapper.Mapper mapper;
                switch (sourceObject)
                {
                    case CommercialAuto.retrievePolicyByQuoteNumberResponse:
                    case CommercialAuto.retrievePolicyByPolicyNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperPCCA();
                        return mapper.Map<CLSourceSystemEntity>(sourceObject);
                    case CommercialBOP.retrievePolicyByPolicyNumberResponse:
                    case CommercialBOP.retrievePolicyByQuoteNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperBOP();
                        return mapper.Map<CLSourceSystemEntity>(sourceObject);
                    case CommercialCGL.retrievePolicyByPolicyNumberResponse:
                    case CommercialCGL.retrievePolicyByQuoteNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperCGL();
                        return mapper.Map<CLSourceSystemEntity>(sourceObject);
                    case CommercialUMB.retrievePolicyByPolicyNumberResponse:
                    case CommercialUMB.retrievePolicyByQuoteNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperCUMB();
                        return mapper.Map<CLSourceSystemEntity>(sourceObject);
                    case CommercialMulti.retrieveAccountInformationResponse:
                        mapper = MapperConfig.InitializeAutomapperMulti();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.PCMulti.PCMultiSourceSystemEntity>(sourceObject);
                    case BCSourceSystemData.retrievePolicyInvoiceDetailsResponse:
                    case BCSourceSystemData.retrieveInvoiceTransactionsResponse:
                        mapper = MapperConfig.InitializeAutomapperBCPA();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.BC.BCSourceSystemEntity>(sourceObject);
                    case BCSourceSystemData.retrieveProducerStatementDetailsResponse:
                    case BCSourceSystemData.RetrieveProducerStatementResponse:
                        mapper = MapperConfig.InitializeAutomapperBCPA();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.BC.BCSourceSystemEntity>(sourceObject);
                    case WCUSourceSystemData.retrievePolicyByPolicyNumberResponse:
                    case WCUSourceSystemData.retrievePolicySummaryByQuoteNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperPCWCU();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.WCU.PCWCUSourceSystemEntity>(sourceObject);
                    case PCUMBSourceSystemData.retrievePolicyByPolicyNumberResponse:
                    case PCUMBSourceSystemData.retrievePolicyByQuoteNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperPCUMB();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.PL.PLSourceSystemEntity>(sourceObject);
                    case PCHODWSourceSystemData.retrievePolicyByPolicyNumberResponse:
                    case PCHODWSourceSystemData.retrievePolicyByQuoteNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperPCDWHO();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.PL.PLSourceSystemEntity>(sourceObject);
                    case PCPASourceSystemData.retrievePolicyByPolicyNumberResponse:
                    case PCPASourceSystemData.retrievePolicyByQuoteNumberResponse:
                        mapper = MapperConfig.InitializeAutomapperPCPA();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.PCPA.PLAutoSourceSystemEntity>(sourceObject);
                    case WCCSourceSystemData.CorrespondenceDataResponse:
                        mapper=MapperConfig.InitializeAutomapperWCC();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.WCC.WCCSourceSystemEntity>(sourceObject);
                    case GCSourceSystemData.CorrespondenceDataResponse:
                        mapper = MapperConfig.InitializeAutomapperGC();
                        return mapper.Map<AdhocCorrespondenceEditor.Shared.GC.GCSourceSystemEntity>(sourceObject);
                    default:
                        return new SourceSystemBaseEntity
                        {
                            ErroCode = "No Mapper File",
                            ErroDiscription = "Mapper file for the LOB is not configured in Mapper Builder",
                        };
                }
            }
            catch (Exception ex)
            {
                LogAsync.Exception(ex, "GetObject", "MapperBuilder");
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = "No Mapper File",
                ErroDiscription = "Mapper file for the LOB is not configured in Mapper Builder",
            };
        }
    }
}

