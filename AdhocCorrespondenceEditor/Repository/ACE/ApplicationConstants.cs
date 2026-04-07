using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Repository
{
    public static class ApplicationConstants
    {
        public const string SPGetLOB = "GetLOB";
        public const string SPGetCategoty = "GetCategory";
        public const string SPGetDocument = "GetDocument";
        public const string SPGetDocumentControl = "GetDocumentControl";
        public const string SPGetWebService = "GetWebService";
        public const string SPGetPrinterLookup = "GetPrinterLookupData";
        public const string SPDeletePrinter = "DeletePrinter";
        public const string SPAddPrinterMap = "InsertPrinterMap";
        public const string SPUpdatePrinterMap = "UpdatePrinterMap";
        public const string SPUpdatePrinter = "UpdatePrinter";
        public const string SPAddPrinter = "InsertPrinter";
        public const string SPGetPrinter = "GetPrinter";
        public const string SPGetPolicyLookup = "GetPolicyLookupData";
        public const string SPGetGenericLookup = "GetGenericLookupData";
        public const string SPGetDocumentDropdownDataLookup = "GetDocumentDropdownLookupData";
        public const string SPGetDocumentDropdownChildControl = "GetDocumentDropdownChildControl";
        public const string SPInsertocumentLog = "InsertDocumentLog";
        public const string SPConfigurationLookup = "GetConfigurationLookup";
        public const string SPGetDenialReasons = "GetDenialReasons";
        public const string SPGetRule = "GetRule";
        public const string SPGetRuleLookup = "GetRuleLookup";
        public const string SPGetEZSendRequest = "GetEZSendRequest";
        public const string SPInsertEzSendRequest = "InsertEZSendRequest";
        public const string SPUpdateUserEZSendRequest = "UpdateUserEZSendRequest";
        public const string SPUpdateStatusEZSendRequest = "UpdateStatusEZSendRequest";

        public static readonly string ESBUrl = "ESBUrl";
        public static readonly string ConvertedEsbData = "Converted ESB Data";
        public static readonly string EsbRequest = "ESB Request";
        public static readonly string OriginalEsbData = "Original ESB Data";
        public static readonly string EsbCall = "ESB Call";
        public static readonly string GetDataESB = "Get Data ESB";
        public static readonly string EsbError = "ESB Error: While getting the Data from source system";

    }
}
