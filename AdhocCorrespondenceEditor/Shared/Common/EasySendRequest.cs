using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;


namespace AdhocCorrespondenceEditor.Shared.Common
{
    public enum RequestStatus { START, SUCCESS, COMPLETED }
    public class EasySendRequest
    {
        public string? EasySendRequestId { get; set; }
        public string? DocumentFlow { get; set; }
        public byte[]? DocumentContent { get; set; }
        public IReadOnlyDictionary<string, string> DocumentFlowData { get; set; }
        public string? SourceSystem { get; set; }
        public string? LinkType { get; set; }
        public string? PhoneNumber { get; set; }
        public string? EmailAddress { get; set; }
        public string? ReturnURL { get; set; }
        public RequestStatus Status { get; set; }
        public string? UserID { get; set; } = String.Empty;
        /// <summary>
        /// Edge Session ID needed to invoke Inspire via PC
        /// </summary>
        public string DocumentSessionID { get; set; }
        public EasySendRequest(EasySendInitiateRequest request)
        {
            DocumentFlow = request.DocumentFlow;
           // DocumentContent = Convert.FromBase64String(request.DocumentContent);
            DocumentFlowData = request.DocumentFlowData;
            SourceSystem = request.SourceSystem;
           // LinkType = request.LinkType;
            PhoneNumber = request.PhoneNumber;
            EmailAddress = request.EmailAddress;
            ReturnURL = Uri.UnescapeDataString(request.ReturnURL);
            Status = RequestStatus.START;
            UserID = string.Empty;
            DocumentSessionID = request.DocumentID;
        }
        public string this[string key]
        {
            get => this.DocumentFlowData[key];
        }
    }
}
