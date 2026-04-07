namespace AdhocCorrespondenceEditor.Shared
{
    public class PrinterLookupRequest
    {
        public string PrinterName { get; set; }
        public string PrinterCode { get; set; }
        public int LOBPrinterId { get; set; }
        public int? CategoryId { get; set; }
        public int? DocumentId { get; set; }
        public string LOBName { get; set; }
        public string UserId { get; set; }
    }
}
