

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class ClaimsOutputBase : OutputBase
    {
        public List<CCDetail> CCDetails { get; set; }

    }


    public class CCDetail
    {
        public string BCCEnabled { get; set; } //CC_BCC_IND
        public CCAddress Address { get; set; }
        public string References { get; set; }//CC_REF;
        public string Name { get; set; } //CC_ADDRESSEE_NAME;

    }

    public class OverPayCheck
    {
        public string Number { get; set; } //CHK_NO_MULTI
        public DateTime? Date { get; set; } //CHK_DT_MULTI
        public string Amount { get; set; } //CHK_AMT_MULTI
        public DateTime? DateOfService { get; set; } //  DT_SERVICE_MULTI
        public string Overpayment { get; set; }  // CHK_OVERPYMT_AMT_MULTI
    }
}
