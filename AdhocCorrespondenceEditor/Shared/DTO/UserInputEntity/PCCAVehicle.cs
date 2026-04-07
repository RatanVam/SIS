using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity
{
    public class PCCAVehicle
    {
        public string? RecordKey { get; set; }
        public string? Year { get; set; }
        public string? Make { get; set; }
        public string? Model { get; set; }
        public string? SerialNumber { get; set; }
        public string? LossPayeeSeqNo { get; set; }
        public string? RegisteredTo { get; set; }
        public string? CoverageParameterTypeCd { get; set; }


        public List<CoverageDetail>? CoverageTypes { get; set; } = new List<CoverageDetail>();
        public string? CoverageParameterValue { get; set; }
    }


    public class CoverageDetail
    {
        public string? CoverageTypeCd { get; set; }
        public string? CoverageParameterTypeCd { get; set; }

        public string? CoverageParameterUnformattedValueTx { get; set; }
    }
}
