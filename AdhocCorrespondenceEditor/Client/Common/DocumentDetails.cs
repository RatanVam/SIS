using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    public class DocumentDetails
    {
        public List<DocumentControlEntity> documentControlList { get; set; }
        public DocumentEntity documentEntity { get; set; }
        public string DocumentOnbaseID { get; set; }

        public List<DocumentDropdownChildControlEntity> DocumentChildControlEntity { get; set; }


    }
}
