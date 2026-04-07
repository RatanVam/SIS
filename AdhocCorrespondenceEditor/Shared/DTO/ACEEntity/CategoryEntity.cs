using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class CategoryEntity
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string CategoryFriendlyName { get; set; }
        public bool IsCategoryActive { get; set; }
        public string CategoryGroups { get; set; }
        public int  LOBId { get; set; }
        public string LOBName { get; set; }
        public string CategoryOrder { get; set; }

    }
}
