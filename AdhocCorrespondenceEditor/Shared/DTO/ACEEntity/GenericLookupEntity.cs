using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class GenericLookupEntity
    {
        public int GenericLookupItemId { get; set; }
        public string GenericLookupItemCode { get; set; }
        public string GenericLookupItemValue { get; set; }
        public bool IsGenericLookupItemActive { get; set; }
        public int GenericLookupItemOrder { get; set; }
        public int LookupTypeId { get; set; }
        public string LookupTypeValue { get; set; }

    }
}
