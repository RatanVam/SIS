using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class DocumentDropdownChildControlEntity
    {
        public int DocumentId { get; set; }
        public string DocumentName { get; set; }
        public string DocumentFriendlyName { get; set; }
        public int DocumentDropdownLookupItemId { get; set; }
        public string DocumentDropdownLookupItemCode { get; set; }
        public string DocumentDropdownLookupItemValue { get; set; }
        public string ControlName { get; set; }
    }
}
