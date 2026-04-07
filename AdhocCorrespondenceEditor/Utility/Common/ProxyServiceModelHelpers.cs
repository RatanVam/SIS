using System.ServiceModel;
namespace AdhocCorrespondenceEditor.Utility.Common
{
    public class ProxyServiceModelHelpers
    {
        public Guid guid;
        public TimeSpan timeoutSpan;
        public BasicHttpBinding binding;
        public System.ServiceModel.EndpointAddress endpointAddress;
        public bool LogEsbData;
        public ProxyServiceModelHelpers(AppSettings appSettings, string uRL)
        {
            guid = Guid.NewGuid();
            timeoutSpan = new TimeSpan(0, appSettings.TimeOutErrorInMin, 0);
            binding = new BasicHttpBinding();
            binding.CloseTimeout = binding.ReceiveTimeout = binding.SendTimeout = binding.OpenTimeout = timeoutSpan;
            binding.MaxReceivedMessageSize = appSettings.MaxReceivedMessageSize;
            endpointAddress = new System.ServiceModel.EndpointAddress(uRL);
            LogEsbData = appSettings.LogESBData;
        }
    }
}
