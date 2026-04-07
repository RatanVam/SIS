using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class PrinterLookupEntity : PrinterEntity
    {
        public int LOBPrinterId { get; set; }
        public int LOBId { get; set; }
        public int? CategoryId { get; set; }
        public string? CategoryFriendlyName { get; set; }
        public string? DocumentFriendlyName { get; set; }
        public int? DocumentId { get; set; }
        public string LOBName { get; set; }
        public int PrinterOrder { get; set; }
        public string LOBType { get; set; }

    }
}
