using System.ComponentModel.DataAnnotations;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class Printer
    {
        public string PrinterName { get; set; }
        [Required]
        public string PrintInd { get; set; } = string.Empty;

        public string PrinterCode { get; set; } = string.Empty;
    }
}
