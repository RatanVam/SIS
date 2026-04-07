using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class DocumentControlEntity
    {
        public int ControlId { get; set; }
        public string ControlDescription { get; set; }
        public int DocumentControlId { get; set; }
        public string ControlName { get; set; }
        public int DocumentId { get; set; }
        public int ControlOrder { get; set; }

    }
}
