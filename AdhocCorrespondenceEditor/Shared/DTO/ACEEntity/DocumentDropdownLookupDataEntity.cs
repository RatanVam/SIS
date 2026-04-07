using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class DocumentDropdownLookupDataEntity
    {
        public int DocumentId { get; set; }
        public int LOBId { get; set; }
        public string LOBName { get; set; }
        public string DocumentDropdownLookupTypeCode { get; set; }
        public string DocumentDropdownLookupTypeLabelName { get; set; }
        public string DocumentDirection { get; set; }
        public int DocumentDropdownLookupItemId { get; set; }
        public string DocumentDropdownLookupItemCode { get; set; }
        public string DocumentDropdownLookupItemValue { get; set; }
        public int DocumentDropdownLookupItemTypeId { get; set; }
        public int DocumentDropdownLookupItemOrder { get; set; }
        public string InspireTag { get; set; }
        public string DocumentDropdownLookupItemAdditionalValue { get; set; }
    }
}



