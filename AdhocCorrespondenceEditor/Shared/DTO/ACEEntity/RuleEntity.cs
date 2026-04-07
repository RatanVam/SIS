using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class RuleEntity
    {
        #region "Attributes"
        public int RuleId { get; set; }
        public string RuleName { get; set; } = String.Empty;
        public string RuleNamespace { get; set; } = String.Empty;
        public string RuleMethod { get; set; } = String.Empty;
        public int ExecutionOrder { get; set; }
        public int RuleItemId { get; set; }
        public int LobId { get; set; }
        public int? CategoryId { get; set; }
        public int? DocumentId { get; set; }
        public string LobName { get; set; } = String.Empty;
        public string CategoryName { get; set; } = String.Empty;
        public string DocumentName { get; set; } = String.Empty;
        public DateTime EffectiveDate { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public string RuleGroupName { get; set; } = String.Empty;
        #endregion
    }
}
