using AdhocCorrespondenceEditor.Client.Pages;
using Microsoft.Extensions.Configuration;


namespace AdhocCorrespondenceEditor.Client.Common
{
    public class EzSendConfiguration
    {

        private readonly IConfiguration _config;

        public EzSendConfiguration(IConfiguration config)
        {
            _config = config;
        }


    }
}
