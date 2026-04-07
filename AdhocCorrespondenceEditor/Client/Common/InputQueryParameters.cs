using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Client
{
    public class InputQueryParameters
    {
        public string Env { get; set; } = String.Empty;
        public string LOB { get; set; } = String.Empty;
        public UserData UserDetails { get; set; }
        public string ProducerCode { get; set; } = String.Empty;
        public string PolicyNumber { get; set; } = String.Empty;
        public string State { get; set; } = String.Empty;
        public string AsOfDate { get; set; } = String.Empty;
        public string QuoteNumber { get; set; } = String.Empty;
        public string ClaimNumber { get; set; } = String.Empty;
        public string AccountNumber { get; set; } = String.Empty;
        public string Mode { get; set; } = String.Empty;

        public InputQueryParameters(string url)
        {
            var uriBuilder = new UriBuilder(url);
            var queryStrings = System.Web.HttpUtility.ParseQueryString(uriBuilder.Query);
            LOB = GetQueryParm(queryStrings, nameof(LOB));
            ProducerCode = GetQueryParm(queryStrings, nameof(ProducerCode));
            PolicyNumber = GetQueryParm(queryStrings, nameof(PolicyNumber));
            QuoteNumber = GetQueryParm(queryStrings, nameof(QuoteNumber));
            ClaimNumber = GetQueryParm(queryStrings, nameof(ClaimNumber));
            AccountNumber = GetQueryParm(queryStrings, nameof(AccountNumber));
            State = GetQueryParm(queryStrings, nameof(State));
            AsOfDate = GetQueryParm(queryStrings, nameof(AsOfDate));
            Env = GetQueryParm(queryStrings, nameof(Env));
            Mode = GetQueryParm(queryStrings, nameof(Mode));
        }

        string GetQueryParm(System.Collections.Specialized.NameValueCollection queryStrings, string parmName)
        {
            return queryStrings[parmName.Trim()] ?? "";
        }
    }

    public class UserData
    {
        public string UserName { get; set; } = String.Empty;
        public string UserID { get; set; } = String.Empty;
        public string UserRoles { get; set; } = String.Empty;
        public string UserInitials { get; set; }
        public string UserEmail { get; set; }
    }
}
