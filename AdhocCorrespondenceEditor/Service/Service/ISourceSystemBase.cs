using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Utility.Common;

namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public interface ISourceSystemBase
    {
        public SourceSystemBaseEntity GetData(SourceSystemInputRequest Details, ProxyServiceModelHelpers helpers);

    }
}
