using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.Common
{
    public class DenialReasonRequest
    {
        public string LobName {  get; set; }
        public string PolicyState { get; set; }
        public string? PolicyForm { get;set; }
        public int DocumentId { get; set; }
        public string? PolicyType { get; set; }
    }
}
