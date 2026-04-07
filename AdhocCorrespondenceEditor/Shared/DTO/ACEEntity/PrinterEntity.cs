using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class PrinterEntity
    {
        [Required]
        public int PrinterId { get; set; }
        public string PrinterName { get; set; }
        public string PrinterCode { get; set; }
        public bool IsPrinterActive { get; set; }
    }
}
