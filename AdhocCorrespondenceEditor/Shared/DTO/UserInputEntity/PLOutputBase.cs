using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class PLOutputBase : OutputBase
    {
        public Address? IDCardAddress { get; set; } = new Address(); //INS_ADDR_1,INS_ADDR_2,INS_ADDR_3,INS_CTY,INS_ST,INS_ZIP
        public Address? AddresseeAddress { get; set; } = new Address();
        public string AddresseeAddress2 { get; set; }
        public string AddresseeAddress3 { get; set; }
        public string GreetingName { get; set; }
        public DateTime LetterDate { get; set; } = DateTime.MinValue;
        public List<DrivingRecord> DrivingRecordDetails { get; set; }
        public string SelectedDriverName { get; set; } //DRVR_NAME

        public List<string> PolicyNumberSelected { get; set; }

    }


    public class DrivingRecord
    {
        public string DriverName { get; set; }
        public string ActivityDescription { get; set; }
        public string AdverseDataSource { get; set; }
        public DateTime EventDate { get; set; }
        public DateTime PostingPayoutDate { get; set; }
        public string MVRReferenceNumber { get; set; }
        public string mvrDrivingName { get; set; }
        public string ExposureDataSource{ get; set; }
        public System.Nullable<decimal> PayoutAmount { get; set; }
        

    }
}
