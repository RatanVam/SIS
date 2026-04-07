using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;

namespace AdhocCorrespondenceEditor.Shared.Common
{
    //public enum DocumentFlow { CSF }
    // Todo : For future inclusion of form type maybe required.
    //public enum LinkTypeEnum { Email, Text }
    public class EasySendInitiateRequest
    {
        
        public string DocumentFlow { get; }
        public string? DocumentContent { get; }
        public IReadOnlyDictionary<string, string> DocumentFlowData { get; }
        public string SourceSystem { get; }
       
        public string? LinkType { get; }
        public string? PhoneNumber { get; }
        public string? EmailAddress { get; }
        public string ReturnURL { get; }
        /// <summary>
        /// Edge Session ID needed to invoke Inspire via PC
        /// </summary>
        public string DocumentID { get; }
        public EasySendInitiateRequest(string documentFlow, string documentContent, string sourceSystem, string linkType, IReadOnlyDictionary<string, string> documentFlowData, string? phoneNumber, string emailAddress, string returnURL, string documentID = null )
        {
            DocumentFlow = documentFlow;
            DocumentContent = documentContent;
            DocumentFlowData = documentFlowData;
            SourceSystem = sourceSystem;
            LinkType = linkType;
            PhoneNumber = phoneNumber;
            EmailAddress = emailAddress;
            ReturnURL = returnURL;
            DocumentID = documentID;
        }
    }
    public class EasySendResponse
    {
        public string Url { get; set; }

        public string Error { get; set; }
    }

    public class EZSendRequestData
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public int Status { get; set; }
        public string Payload { get; set; }
        public string DocumentId { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public string PaperlessDocList { get; set; }
    }
    
}
