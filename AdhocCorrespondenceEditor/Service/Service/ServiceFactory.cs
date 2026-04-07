using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Utility.Common;
using NJM.DotNetLibrary.Logging;


namespace AdhocCorrespondenceEditor.Service.ServiceClass
{
    public class ServiceFactory
    {
        public SourceSystemBaseEntity GetDataESB(SourceSystemInputRequest details, ProxyServiceModelHelpers helpers)
        {
            try
            {
                ISourceSystemBase serviceObject;
                var type = typeof(ISourceSystemBase);
                serviceObject = (ISourceSystemBase)Activator.CreateInstance(Type.GetType($"{type.Namespace}.{details.LOB.Replace("-", "")}Service"));

                if (serviceObject == null)
                    return new SourceSystemBaseEntity{
                    ErroCode = "Service Factory Not Configured",
                    ErroDiscription = $"Service Factory Not Configured Env: {details.Environment} LOB : {details.LOB}"
                };
                return serviceObject.GetData(details, helpers);
            }
            catch(Exception ex)
            {
                LogAsync.Exception(ex, "GetDataESB", ex.Message);
            }
            return new SourceSystemBaseEntity
            {
                ErroCode = "ESB ACE Error",
                ErroDiscription = $"ESB Error: While getting the Data from source system"
            };
        }
    }
}
