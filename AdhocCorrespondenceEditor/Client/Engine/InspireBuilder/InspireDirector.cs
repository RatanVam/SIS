using AdhocCorrespondenceEditor.Client.Common;

namespace AdhocCorrespondenceEditor.Client
{
    public class InspireDirector
    {
        public InspireBuilderBase GetInspireBuilder(string lob, string producerCode)
        {
            switch (lob)
            {
                case ApplicationConstants.LOB_PC_CA:    return new PCCAInspireBuilder();
                case ApplicationConstants.LOB_PC_BOP:   return new PCBOPInspireBuilder();
                case ApplicationConstants.LOB_PC_CGL:   return new PCCGLInspireBuilder();
                case ApplicationConstants.LOB_PC_CUMB:  return new PCCUMBInspireBuilder();
                case ApplicationConstants.LOB_PC_MULTI: return new PCMultiInspireBuilder();
                case ApplicationConstants.LOB_BC_PA:    return new BCPAInspireBuilder();
                case ApplicationConstants.LOB_BC_WCU:   return string.IsNullOrEmpty(producerCode) 
                                                            ? new BCWCUInspireBuilder() 
                                                            : new BCWCUProducerCodeInspireBuilder();
                case ApplicationConstants.LOB_PC_WCU:   return new PCWCUInspireBuilder();
                case ApplicationConstants.LOB_WCC:      return new WCCInspireBuilder();
                case ApplicationConstants.LOB_PC_UMB:   return new PCUMBInspireBuilder();
                case ApplicationConstants.LOB_PC_DW:    return new PCDWInspireBuilder();
                case ApplicationConstants.LOB_PC_HO:    return new PCHOInspireBuilder();
                case ApplicationConstants.LOB_PC_PA:    return new PCPAInspireBuilder();
                case ApplicationConstants.LOB_GC:       return new GCInspireBuilder();

                default: throw new Exception("Invalid line of business code has been passed. Please send a valid lob code");
            }
        }
    }
}
