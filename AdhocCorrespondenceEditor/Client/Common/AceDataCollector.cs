using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using Microsoft.AspNetCore.Components.WebAssembly.Http;
using System.ComponentModel.DataAnnotations;

namespace AdhocCorrespondenceEditor.Client
{
    public class AceDataCollector
    {
        public AceDataCollector (string lOBName, string state)
        {
            LOBName = lOBName;
            State = state;
        }
        public string LOBName { get; set; }
        public string State { get; set; }
        public SourceSystemBaseEntity SourceSystemEntity;
        public List<CategoryEntity> categoryList = new List<CategoryEntity>();
        public List<DocumentEntity> documentList = new List<DocumentEntity>();
        public List<PrinterLookupEntity> printerLookupEntities = new List<PrinterLookupEntity>();
        public List<PolicyLookupEntity> policyLookupEntity = new List<PolicyLookupEntity>();
        public List<GenericLookupEntity> genericLookupEntity = new List<GenericLookupEntity>();
        public List<ConfigurationEntity> configLookupEntity = new List<ConfigurationEntity>();
        public List<RuleEntity> ruleEntity = new List<RuleEntity>();
        public List<RuleLookupEntity> ruleLookupEntity = new List<RuleLookupEntity>();
        public string baseUri = string.Empty;

        public ErrorDetails errorDetails = new ErrorDetails();
        public string TicketID = string.Empty;

        public DocumentDetails documentData = new DocumentDetails();
        public OutputBase UserSelection;

        //This delegate can be used to point to methods
        //which return void .
        public delegate void MyEventHandler(bool isValidate);

        //This event can cause any method which conforms
        //to MyEventHandler to be called.
        public event MyEventHandler DocumentSubmitted;

        public Action<bool,int> HideClaimViolation;

        public Action<bool> HideMVRReference;
        public Action<bool> HideFaxControl;
        public Action<bool> HideCCBCControl;
        public Action<string, bool> GCParagraph;
        public Action<string> SendEmailFromControl;
        public string EmailFromControl;

        public void OnClick(bool isValidate)
        {
            errorDetails.Error = string.Empty;
            UserSelection = new ClinetOutputDirector().GetUserDataBuilder(SourceSystemEntity);
            DocumentSubmitted(isValidate);
            if (UserSelection == null || (!UserSelection.isUSMail && string.IsNullOrEmpty(UserSelection.EmailAddress) && (string.IsNullOrEmpty(UserSelection.FaxAddress) || string.IsNullOrEmpty(UserSelection.FaxSubject)) && string.IsNullOrEmpty(UserSelection.PrinterDetails?.PrintInd) && !UserSelection.IsPrintServicesBatch))
            {
                errorDetails.IsOutputInValid = true;
                errorDetails.Error = "Please enter all the mandatory(*) fields";
            }
            else
                errorDetails.IsOutputInValid = false;

        }

        public string GetTextColorClass(string? value, bool firstRendeValue)
        {
            if (string.IsNullOrEmpty(value) && !firstRendeValue)
                return "rz-border-color-danger";
            else
                return ".rz-border-color-base-600";

        }
        public string GetTextColorClass(bool value, bool firstRendeValue)
        {
            if (value && !firstRendeValue)
                return "rz-border-color-danger";
            else
                return ".rz-border-color-base-600";

        }

        public string GetTextColorClassCalander(string? value, bool firstRendeValue)
        {
            if (string.IsNullOrEmpty(value) && !firstRendeValue)
                return "rz-datepicker-calendar";
            return string.Empty;
        }
    }
}
