using AdhocCorrespondenceEditor.Shared.Common;
using AdhocCorrespondenceEditor.Client.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
using System.Text.Json.Serialization;
using System.Text.RegularExpressions;

namespace AdhocCorrespondenceEditor.Client
{
    public class EZSendRequest
    {

      
        public int Id { get; set; }
        public string userId { get; set; }        
 
        public DocumentFlowData documentFlowData { get; set; }

        public string csfEffective { get; set; }
        public string jobLob { get; set; }
        public string? policyNumber { get; set; } // new requirement 15967
        [Required]
        public string jobNumber { get; set; }
        public string PackageName { get; set; } = "";
        public string jobState { get; set; }
        public string transactionType { get; set; }
        [Required]
        public string documentFlow { get; set; }  
        public string documentSessionID { get; set; }  
        public string ContactMethod { get; set; }
        public string policyEffectiveDate { get; set; }
        public string PANJMBuyersGuideFlag {  get; set; }
        public string PaperlessDocList { get; set; }
        [JsonIgnore]
        public bool IsPaperless => documentFlowData?.PaperlessDocList?.Split(',', StringSplitOptions.RemoveEmptyEntries).Any(item => item.Contains("Paperless", StringComparison.OrdinalIgnoreCase))== true;
        //DG-20780/20781 Added IsCSF Logic
        [JsonIgnore]
        public bool IsCSF => IsPaperless && documentFlowData?.PaperlessDocList?.Split(',', StringSplitOptions.RemoveEmptyEntries).Length > 1;

        [Phone(ErrorMessage = "Phone number is required.")]
        //[Required(ErrorMessage = "Phone number is required.")]
        [RegularExpression(@"^\([2-9][0-9]{2}\) (?!000)[0-9]{3}-[0-9]{4}$", ErrorMessage = "Please enter a valid mobile number.")]
        [ConditionalValidation(nameof(IsPhoneNumberRequired), ErrorMessage = "Phone number is required.")]
        public string phoneNumber { get; set; } = "";
        public bool PhoneNumberMessageShown { get; set; }
        public string sourceSystem {  get; set; }
      
        [Required(ErrorMessage = "Email address is required.")]
        [RegularExpression(@"^(([^<>()\[\]\\.,;:\s@\""]+(\.[^<>()\[\]\\.,;:\s@\""]+)*)|("".+""))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$", ErrorMessage = "Please enter a valid email.")]
        [ConditionalValidation(nameof(IsEmailRequired), ErrorMessage = " ")]
        public string emailAddress { get; set; }
        [EmailAddress(ErrorMessage = "")]
        [ConditionalValidation(nameof(isEmailRequiredText), ErrorMessage = " ")]
        [RegularExpression(@"^(([^<>()\[\]\\.,;:\s@\""]+(\.[^<>()\[\]\\.,;:\s@\""]+)*)|("".+""))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$", ErrorMessage = "Please enter a valid email.")]
        public string emailAddressText {  get; set; }



        public bool isEmailValid { get; set; }
        public bool isUiPhoneValid { get; set; } 

        public RequestStatus Status { get; set; }
        [JsonPropertyName("isMobilePhone")]
        public bool isMobilePhone { get; set; }

        public string returnURL { get; set; }
        public bool mike { get; set; } = false;
        public bool IsPhoneNumberRequired => ContactMethod == "Text";
        public bool IsEmailRequired => ContactMethod == "Email";
        public bool isEmailRequiredText => ContactMethod == "Text";
        public string UserName {  get; set; }
        
    }


    public class DocumentFlowData
    {

        public string policyNumber { get; set; }
        public string jobNumber { get; set; }
        public string jobState { get; set; }
        public string transactionType { get; set; }
        public string csfEffective {  get; set; }
        public string jobLob { get; set; }
        public string policyEffectiveDate { get; set; }
        public string PANJMBuyersGuideFlag { get; set; }
        public string PaperlessDocList { get; set; }
        public string userName { get; set; }
    }

  
}

