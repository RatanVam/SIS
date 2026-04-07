using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Utility.Common
{
    public static class RegexUtill
    {
        public static string GetADGroups(string ServerVariableGroups)
        {
            if(string.IsNullOrEmpty(ServerVariableGroups))
                return ServerVariableGroups;
            List<string> results = new List<string>();
            Regex regexObj = new Regex("CN=Inspire.+?,");
            Match matchResults = regexObj.Match(ServerVariableGroups);
            while (matchResults.Success)
            {
                string modifyMatchResult = matchResults.ToString();
                modifyMatchResult = modifyMatchResult.Replace("CN=", "");
                modifyMatchResult = modifyMatchResult.Replace(",", "");
                results.Add(modifyMatchResult);
                matchResults = matchResults.NextMatch();
            }
            results.ToArray();
            return string.Join(",", results);
        }

    }
}
