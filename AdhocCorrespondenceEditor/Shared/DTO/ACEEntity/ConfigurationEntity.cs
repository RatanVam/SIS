using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class ConfigurationEntity
    {
        public long LOBId { get; set; }
        public string LOBName { get; set; }
        public int DocumentId { get; set; }
        public string ConfigKey { get; set; }
        public string ConfigValue { get; set; }
    }
}
