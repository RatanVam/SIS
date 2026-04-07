using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class DenialReasonEnitity
    {
        public int DenialReasonMapId { get; set; }
        public string DenialReasonKey { get; set; }
        public string DenialReasonValue { get; set; }
        public int DocumentId { get; set; }
        public string? PolicyForm { get; set; }
        public string? PolicyState { get; set; }
        public string LOBName { get; set; }
        public string? PolicyType { get; set; }
    }
}
