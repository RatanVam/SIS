using AdhocCorrespondenceEditor.Client.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Client
{
    public class DisplayOptionStatus
    {
        public DisplayOptionStatus(InputQueryParameters inputQuery)
        {
            string displayText = string.Empty;
            if (!string.IsNullOrEmpty(inputQuery.LOB))
                displayText = $"LOB : {inputQuery.LOB.ToUpper()}";

            if (!string.IsNullOrEmpty(inputQuery.AccountNumber))
                displayText = $"{displayText} Account Number : {inputQuery.AccountNumber}";
            else if (!string.IsNullOrEmpty(inputQuery.ProducerCode))
                displayText = $"{displayText} Producer Code : {inputQuery.ProducerCode}";
            else if (!string.IsNullOrEmpty(inputQuery.PolicyNumber))
                displayText = $"{displayText} Policy Number : {inputQuery.PolicyNumber}";
            else if (!string.IsNullOrEmpty(inputQuery.QuoteNumber))
                displayText = $"{displayText} Quote Number : {inputQuery.QuoteNumber}";
            else if (!string.IsNullOrEmpty(inputQuery.ClaimNumber))
                displayText = $"{displayText} Claim Number : {inputQuery.ClaimNumber}";
            if (!string.IsNullOrEmpty(inputQuery.AsOfDate))
            {
                DateTime asofDate = DateTime.Parse(inputQuery.AsOfDate);
                if (asofDate != DateTime.MinValue || asofDate != DateTime.MaxValue)
                    displayText = $"{displayText} As of Date : {asofDate.ToString("MM/dd/yyyy")}";
            }
            if (!string.IsNullOrEmpty(inputQuery.State))
                displayText = $"{displayText} State : {inputQuery.State}";

            DisplayText = displayText;
        }

        
        public bool IsIPXMLDisplay { get; set; } = false;
        public bool IsOPXMLDisplay { get; set; } = false;

        public bool IsPublishDisabled = true, IsXMLDisabled = true;
        public string DisplayText { get; set; } = String.Empty;

    }
}
