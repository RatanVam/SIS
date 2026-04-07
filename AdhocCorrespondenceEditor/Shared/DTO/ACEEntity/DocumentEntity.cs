using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class DocumentEntity
    {
		public int DocumentId { get; set; }
		public string DocumentName { get; set; }
		public string DocumentFriendlyName { get; set; }
		public bool IsDocumentActive { get; set; }
		public string BaseState { get; set; }
		public string JldFilePath { get; set; }
		public string DocumentType { get; set; }
		public int DocumentOrder { get; set; }
		public string CategoryName { get; set; }
		public int CategoryId { get; set; }
		public string CategoryFriendlyName { get; set; }
		public bool IsCategoryActive { get; set; }
		public string DocumentOtherType { get; set; }

	}
}
