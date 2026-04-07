using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class OutputBase
    {
        public Printer? PrinterDetails { get; set; } = new Printer();

        public bool IsPrintServicesBatch { get; set; }//CERT_MAIL_IND
        public bool IsCertifiedMailIndicator { get; set; }//PRINT_IND
        public List<CopyToSection>? CopiesTo { get; set; } = new List<CopyToSection>();

        public string EmailAddress { get; set; }
        public string EmailFromAddress { get; set; }
        public string EmailSubject { get; set; }
        public bool EmailEncrypted { get; set; }
        public string FaxAddress { get; set; }
        public string FaxSubject { get; set; }
        public bool isUSMail { get; set; }

    }
}
