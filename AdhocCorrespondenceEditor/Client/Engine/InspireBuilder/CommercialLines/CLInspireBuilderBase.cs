using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;

namespace AdhocCorrespondenceEditor.Client
{
    public abstract class CLInspireBuilderBase : InspireBuilderBase
    {
        protected virtual void ProcessAccountRecord(string accountNumber,string OrganizationNameCd, 
            dynamic destinationAccRecord, Address userInputAddress,Printer printer)
        {
            destinationAccRecord.NJMAccountNumber = accountNumber;
            destinationAccRecord.SourceSystem = GetConfigValue(nameof(destinationAccRecord.SourceSystem));
            destinationAccRecord.OnBaseKeyword1 = GetConfigValue(nameof(destinationAccRecord.OnBaseKeyword1));
            destinationAccRecord.LineOfBusiness = GetConfigValue(nameof(destinationAccRecord.LineOfBusiness));
            destinationAccRecord.CLDocSource = GetConfigValue(nameof(destinationAccRecord.CLDocSource));
            destinationAccRecord.CurrentDate = DateTime.Now.ToString("MMMM d, yyyy");
            destinationAccRecord.PackageName = DocumentData.documentEntity.DocumentFriendlyName;
            destinationAccRecord.InboundDocType = DocumentData.DocumentOnbaseID;
            destinationAccRecord.OutboundDocType = DocumentData.documentEntity.DocumentType;

            destinationAccRecord.CreatorID = InputQueryParameters.UserDetails.UserID;
            destinationAccRecord.CREATOR_INT = InputQueryParameters.UserDetails.UserInitials;
            destinationAccRecord.AddresseeName = userInputAddress.DisplayName;
            var policyCoRecord = PolicyLookupEntity.Where(p => p.LookupTypeValue == "NJMCompany" && p.PolicyLookupItemValue == OrganizationNameCd).FirstOrDefault();
            destinationAccRecord.INS_CO_NM = (policyCoRecord == null) ? String.Empty : policyCoRecord.PolicyLookupItemCode;

            destinationAccRecord.AddresseeName = userInputAddress.DisplayName;
            destinationAccRecord.AddresseeAddressLine1 = userInputAddress.Line1Tx;
            destinationAccRecord.AddresseeAddressLine2 = userInputAddress.Line2Tx;
            destinationAccRecord.AddresseeAddressLine3 = userInputAddress.Line3Tx;
            destinationAccRecord.AddresseeCity = userInputAddress.MunicipalityNm;
            destinationAccRecord.AddresseeState = userInputAddress.CountrySubdivisionNm;
            destinationAccRecord.AddresseeZip = userInputAddress.PostalCd;

            destinationAccRecord.DocumentRecipient = GetConfigValue(nameof(destinationAccRecord.DocumentRecipient));

            if (printer.PrinterName == ApplicationConstants.Archive_Only)
            {
                destinationAccRecord.ArchiveInd = GetConfigValue(nameof(destinationAccRecord.ArchiveInd));
            }
            else
            {
                destinationAccRecord.ArchiveInd = GetConfigValue(nameof(destinationAccRecord.ArchiveInd));
                destinationAccRecord.PrintInd = GetConfigValue(nameof(destinationAccRecord.PrintInd));
                destinationAccRecord.PrinterName = printer.PrinterCode;
            }
        }
    }
}
