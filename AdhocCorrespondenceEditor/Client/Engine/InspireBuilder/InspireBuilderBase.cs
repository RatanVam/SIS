using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.Common;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using System.Xml;
using AdhocCorrespondenceEditor.Client.Common;
using System.Reflection;

namespace AdhocCorrespondenceEditor.Client
{
    public abstract class InspireBuilderBase : IDisposable
    {
        protected string TicketId { get; set; }
        protected RuleModel RuleModel { get; set; }
        protected string BaseUri { get; set; }

        protected OutputBase UserInputData { get; set; }
        protected SourceSystemBaseEntity SourceSystemData { get; set; }
        protected InputQueryParameters InputQueryParameters { get; set; }
        protected HttpClient HttpClient { get; set; }
        protected LoggerUtility loggerUtility;
        protected List<PolicyLookupEntity> PolicyLookupEntity { get; set; }
        protected List<ConfigurationEntity> ConfigurationLookupEntity { get; set; }
        protected List<RuleEntity> RuleEntity { get; set; }
        protected List<RuleLookupEntity> RuleLookupEntity { get; set; }

        protected DocumentDetails DocumentData { get; set; }
        public string Payload { get; set; }
        protected string LOB_Date_Format = "yyyy-MM-dd";

        protected abstract void ProcessPolicyAndAccountRecord();
        protected abstract void ProcessUserInputData();
        
        //Process the rules related to the given document.
        protected abstract void ProcessRules();

        protected abstract void CreateCustomTags();
        protected abstract void CreateInspireRequest();
        protected abstract string SeriliazeInspireRequest();

        protected virtual void AddPrinter(dynamic policyRecord, string archiveInd, string printInd)
        {
            policyRecord.ARCHIVE_IND = GetConfigValue(archiveInd);
            policyRecord.PRINT_IND = GetConfigValue(printInd);
            var printer = UserInputData.PrinterDetails;
            if (!string.IsNullOrEmpty(printer?.PrinterName))
            {
                policyRecord.PRINTER_NAME = printer.PrinterCode;
            }
        }
        protected virtual void AddPrinter(dynamic UserDataEntity, dynamic InspireRec)
        {
            string printInd = null;
            if (UserDataEntity.isUSMail)
                printInd = ApplicationConstants.PRINT_IND_BATCH;
            if (!string.IsNullOrEmpty(UserDataEntity.PrinterDetails.PrinterName))
                printInd = nameof(InspireRec.PRINT_IND);

            if (UserDataEntity.PrinterDetails.PrinterName == ApplicationConstants.Archive_Only)
                printInd = ApplicationConstants.PRINT_IND_NO;
            else if (!string.IsNullOrEmpty(UserDataEntity.PrinterDetails.PrinterName) && UserDataEntity.isUSMail)
                printInd = ApplicationConstants.PRINT_IND_BOTH;

            AddPrinter(InspireRec, nameof(InspireRec.ARCHIVE_IND), printInd);
        }


        protected virtual void AddDocumentBasicTags(dynamic policyRecord, UserData userData,DocumentDetails documentData)
        {
            policyRecord.CREATOR_UID = userData.UserID;
            policyRecord.CREATOR_NAME = userData.UserName;
            policyRecord.CREATOR_INT = userData.UserInitials;
            policyRecord.CURR_DT = ConvertDateFormat(DateTime.Today, ApplicationConstants.CurrentDate_Format);
            policyRecord.LTR_CTGY = documentData.documentEntity.CategoryName;
            policyRecord.LTR_NAME = documentData.documentEntity.DocumentName;
            policyRecord.INBND_DOCTYPE = documentData.DocumentOnbaseID;
            policyRecord.OUTBND_DOCTYPE = documentData.documentEntity.DocumentType;
        }
        protected string GetConfigValue(string configKey)
        {
            var node = ConfigurationLookupEntity.Where(c => c.ConfigKey == configKey).FirstOrDefault();
            return node == null ? null: node.ConfigValue;
        }
        protected async Task<string> SendDataToInspireAsync()
        {
            string responseXml = null;
            string inputJson = this.SeriliazeInspireRequest();
            string xmlPayload = await HttpClient.GetStringAsync("Request/Inspire/GenericTemplate.xml");
            xmlPayload = xmlPayload.Replace("jldFilePlaceHolder", DocumentData.documentEntity.JldFilePath);
            xmlPayload = xmlPayload.Replace("serializeXMLPlaceHolder", inputJson);
            xmlPayload = xmlPayload.Replace("userNamePlaceHolder", InputQueryParameters.UserDetails.UserID);
            xmlPayload = xmlPayload.Replace("ticketJsonPlaceHolder", GetConfigValue("TICKET_JSON"));
            Payload    = xmlPayload;

            var details = new InspireInputRequest
            {
                XMLRequest = xmlPayload
            };

            var response = await HttpClient.PostAsJsonAsync($"api/externalservice/inspire/", details);
            try
            {
                responseXml = response.Content.ReadAsStringAsync().Result;
            }
            catch (Exception ex)
            {
                ErrorDetails errorDetails = new ErrorDetails();
                errorDetails.Error = "Inspire GetTicket service Error ";
                errorDetails.InnerException = ex.Message;
                loggerUtility.LogInfoAsync(LogType.Error, errorDetails.Error + errorDetails.InnerException);
            }
            return responseXml;
        }
        protected string GetResponseForClient(string response)
        {
            string responseMessage = string.Empty;
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(response);

            XmlNodeList urlNode = xmlDoc.GetElementsByTagName("ns2:URL");
            if (urlNode.Count > 0)
                responseMessage = urlNode[0].InnerText;
            else
            {
                string errorMessage = "";
                responseMessage = "Internal Service Error: Inspire Publish Error";
                XmlNodeList errorNodeCode = xmlDoc.GetElementsByTagName("ns2:ErrorCode");
                if (errorNodeCode.Count > 0) //errors from Inspire tag related issues
                {
                    XmlNodeList errorNodeMessage = xmlDoc.GetElementsByTagName("ns2:ErrorMessage");

                    if (errorNodeCode.Count > 0)
                        errorMessage = string.Format("Error Code:{0}", errorNodeCode[0].InnerText);
                    if (errorNodeMessage.Count > 0)
                        errorMessage += string.Format(", Error Message:{0}", errorNodeMessage[0].InnerText);

                    if (errorMessage.Contains(ApplicationConstants.HTTP_Error_404))
                        responseMessage = "Inspire Publish Access is Denied";
                }
                else
                {
                    errorNodeCode = xmlDoc.GetElementsByTagName("ErrorResponse");
                    if (errorNodeCode.Count > 0) //errors from midlleware. Could be related to any service or unknown 
                    {
                        errorMessage = string.Format("Error Code:{0}", errorNodeCode[0].InnerText);
                    }
                }
                loggerUtility.LogInfoAsync(LogType.Error, errorMessage);
            }
            return responseMessage;
        }
        private void InitializeData(HttpClient http, LoggerUtility logUtility, InputQueryParameters inputQueryParameters, OutputBase userinputData, SourceSystemBaseEntity sourceSystemData, AceDataCollector aceDataCollector)
        {
            HttpClient = http;
            loggerUtility = logUtility;
            UserInputData = userinputData;
            SourceSystemData = sourceSystemData;
            InputQueryParameters = inputQueryParameters;
            PolicyLookupEntity = aceDataCollector.policyLookupEntity;
            ConfigurationLookupEntity = aceDataCollector.configLookupEntity;
            DocumentData = aceDataCollector.documentData;
            RuleEntity = aceDataCollector.ruleEntity;
            RuleLookupEntity = aceDataCollector.ruleLookupEntity;
            BaseUri = aceDataCollector.baseUri;
        }
        //Template Method Pattern for publish
        public async Task<string> ProcessPublish(HttpClient http, LoggerUtility logUtility, InputQueryParameters inputQueryParameters, OutputBase userinputData, SourceSystemBaseEntity sourceSystemData, AceDataCollector aceDataCollector)
        {
            InitializeData(http,logUtility, inputQueryParameters, userinputData, sourceSystemData, aceDataCollector);
            CreateInspireRequest();
            ProcessPolicyAndAccountRecord();
            ProcessUserInputData();
            ProcessRules();
            CreateCustomTags();
            var response = await SendDataToInspireAsync();
            return GetResponseForClient(response);
        }
        //Template Method Pattern for Preview
        public async Task<string> ProcessPreview(HttpClient http, LoggerUtility logUtility, InputQueryParameters inputQueryParameters, OutputBase userinputData, SourceSystemBaseEntity sourceSystemData, AceDataCollector aceDataCollector)
        {
            try
            {
                InitializeData(http, logUtility, inputQueryParameters, userinputData, sourceSystemData, aceDataCollector);
                CreateInspireRequest();
                ProcessPolicyAndAccountRecord();
                ProcessUserInputData();
                ProcessRules();
                CreateCustomTags();
                return SeriliazeInspireRequest();
            }
            catch(Exception e)
            {
                loggerUtility.LogInfoAsync(LogType.Error, e);
                return null;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // free managed resources
                TicketId = null;
                UserInputData = null;
                SourceSystemData = null;
                InputQueryParameters = null;
            }           
        }

        #region Rules
        protected void InitializeRules(
                string quoteNumber=null,
                DateTime? policyStartDate=null,
                string policyNumber=null
            )
        {
            //initialize the rule model to hold the source object values
            RuleModel = new RuleModel(InputQueryParameters.LOB,
                                      InputQueryParameters.PolicyNumber,
                                      InputQueryParameters.QuoteNumber,
                                      InputQueryParameters.AccountNumber,
                                      DocumentData.documentEntity.CategoryId,
                                      DocumentData.documentEntity.DocumentId);

            if (!string.IsNullOrEmpty(quoteNumber))
                RuleModel.QuoteNumber = quoteNumber;
            if (policyStartDate.HasValue)
                RuleModel.PolicyStartDate = policyStartDate.Value;
            if (string.IsNullOrEmpty(RuleModel.PolicyNumber) && !string.IsNullOrEmpty(policyNumber) && policyNumber != ApplicationConstants.Unassigned)
                RuleModel.PolicyNumber = policyNumber;
        }
        protected void InitializeRules(string? ExposureType)
        {
            AceDataCollector aceDataCollector = new(InputQueryParameters.LOB, InputQueryParameters.State);
            aceDataCollector.SourceSystemEntity = SourceSystemData;

            //initialize the rule model to hold the source object values
            RuleModel = new RuleModel(InputQueryParameters.LOB,
                                      aceDataCollector,
                                      DocumentData.documentEntity.CategoryId,
                                      DocumentData.documentEntity.DocumentId,
                                      ExposureType);
        }
        protected void ExecuteRules()
        {
            RuleManager.Run(RuleModel, RuleEntity, RuleLookupEntity, BaseUri); // execute the rules
        }
        //This method populates the results from RuleModel to corresponding inspire object
        protected void TransferRuleResults(dynamic InspirePolicyRecord)
        {
            foreach (PropertyInfo sourceProperty in RuleModel.GetType().GetProperties())
            {
                PropertyInfo destProperty = InspirePolicyRecord.GetType().GetProperty(sourceProperty.Name);
                if (destProperty != null)
                {
                    destProperty.SetValue(
                            InspirePolicyRecord,
                            sourceProperty.GetValue(RuleModel, null),
                            null);
                }
            }
        }
        #endregion

        protected string ConvertToDate(string date, string format = "MM/dd/yyyy")
        {
            DateTime myDate;
            if (DateTime.TryParse(date, out myDate))
            {
                return myDate.ToString(format);
            }
            return string.Empty;
        }
        protected string ConvertDateFormat(DateTime? date, string format = "MM/dd/yyyy")
        {
            if (date <= DateTime.MinValue) return null;
            return date.HasValue ? date.Value.ToString(format) : null;
        }
        protected string ConvertDateFormat(string date, string format = "MM/dd/yyyy")
        {
            return string.IsNullOrEmpty(date) ? null : ConvertDateFormat(DateTime.Parse(date), format); 
        }
        protected string ConvertAmountFormat(decimal? amount, string format = "{0:0.00}")
        {
            return amount.HasValue ?  String.Format(format, amount) : null ;
        }
        protected string ConvertAmountFormat(double amount, string format = "{0:0.00}")
        {
            return String.Format(format, amount) ;
        }
        protected string ConvertAmountFormat(string? amount, string format = "{0:0.00}")
        {
            if (string.IsNullOrEmpty(amount)) return null;
            decimal d = decimal.Parse(amount);
            return amount != null ? String.Format(format, d) : null;
        }
        protected string ConvertAmountFormat(decimal? amount, string defaultValue,  string format = "{0:0.00}")
        {
            return amount.HasValue ? String.Format(format, amount) : defaultValue;
        }
        protected string GetInsuranceCompanyName(string orgNameCode)
        {
            var policyCoRecord = PolicyLookupEntity.Where(p => p.LookupTypeValue == "NJMCompany" && p.PolicyLookupItemCode == orgNameCode).FirstOrDefault();
            return (policyCoRecord == null) ? String.Empty : policyCoRecord.PolicyLookupItemValue;
        }
        protected string GetInsuranceCompanyCode(string orgNameCode)
        {
            var policyCoRecord = PolicyLookupEntity.Where(p => p.LookupTypeValue == "InsCompany" && p.PolicyLookupItemCode == orgNameCode).FirstOrDefault();
            return (policyCoRecord == null) ? String.Empty : policyCoRecord.PolicyLookupItemValue;
        }

    }
}
