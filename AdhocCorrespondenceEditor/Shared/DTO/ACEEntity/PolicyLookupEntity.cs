using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class PolicyLookupEntity
    {
        public int PolicyLookupItemId { get; set; }
        public string PolicyLookupItemCode { get; set; }
        public string PolicyLookupItemValue { get; set; }
        public bool IsPolicyLookupItemActive { get; set; }
        public int PolicyLookupItemOrder { get; set; }
        public string PolicyLookupTypeId { get; set; }
        public string LookupTypeValue { get; set; }

    }
}
