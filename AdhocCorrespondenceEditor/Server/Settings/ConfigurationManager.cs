using NJM.DotNetLibrary.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace AdhocCorrespondenceEditor.Utility
{

    public sealed class ConfigurationManager
    {

        private ConfigurationManager()
        {
            Instance = ConfigManager.GetSection<AppSettings>();
        }

        private static AppSettings Instance = null;
        public static AppSettings GetInstance()
        {
           
                if (Instance == null)
                    new ConfigurationManager();
                return Instance;
        }
    }

}
