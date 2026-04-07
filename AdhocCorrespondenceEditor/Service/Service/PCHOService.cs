using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Service.Mapper;
using NJM.DotNetLibrary.Logging;
using AdhocCorrespondenceEditor.Utility.Common;
using AdhocCorrespondenceEditor.Utility;
using AdhocCorrespondenceEditor.Repository;
using PCHODWSourceSystemData;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class PCHOService : ISourceSystemBase
    {

        public SourceSystemBaseEntity GetData(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers)
        {
            return (new PCDWService()).GetData(Details, helpers);
        }
    }
}