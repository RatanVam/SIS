using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.PL;

namespace AdhocCorrespondenceEditor.Client
{
    public abstract class PLInspireBase : InspireBuilderBase
    {
        protected PLHoUmbDwUserEntity PLUserDataEntity { get; set; }
        protected PLSourceSystemEntity PLSourceSystemEntity { get; set; }
        protected PolicyPeriod SourcePolicyPeriod { get; set; }
        protected Policy SourcePolicy { get; set; }

        protected override void CreateInspireRequest()
        {
            SourcePolicyPeriod = PLSourceSystemEntity?.PolicyData?.Policy?.PolicyPeriod;           
            SourcePolicy = PLSourceSystemEntity?.PolicyData?.Policy;
        }
        protected virtual void AddPolicyConfigValues(dynamic destinationAccRecord)
        {
            // Get configuration values from config table
            destinationAccRecord.SRC_SYS = GetConfigValue(nameof(destinationAccRecord.SRC_SYS));
            destinationAccRecord.POL_PK = GetConfigValue(nameof(destinationAccRecord.POL_PK));
            destinationAccRecord.ARCHIVE_IND = GetConfigValue(nameof(destinationAccRecord.ARCHIVE_IND));
            destinationAccRecord.PRINT_IND = GetConfigValue(nameof(destinationAccRecord.PRINT_IND));
            destinationAccRecord.CURR_DT = ConvertDateFormat(DateTime.Today, "MMMM d, yyyy");
            destinationAccRecord.EMAIL_FROM = GetConfigValue(nameof(destinationAccRecord.EMAIL_FROM));
            destinationAccRecord.EMAIL_BODY = GetConfigValue(nameof(destinationAccRecord.EMAIL_BODY));
            destinationAccRecord.EMAIL_SUBJECT = GetConfigValue(nameof(destinationAccRecord.EMAIL_SUBJECT));
            destinationAccRecord.BARCODE_IND = GetConfigValue(nameof(destinationAccRecord.BARCODE_IND));
            destinationAccRecord.CERT_IND = GetConfigValue(nameof(destinationAccRecord.CERT_IND));
        }
        protected virtual void UserAddPolicyDetails(dynamic UserDataEntity, dynamic destinationAccRecord)
        {
            destinationAccRecord.EMAIL_IND = UserDataEntity.EmailAddress is null ? null : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(UserDataEntity.EmailAddress))
            {
                destinationAccRecord.EMAIL_TO = UserDataEntity.EmailAddress;
                destinationAccRecord.EMAIL_IND = ApplicationConstants.YES;
            }
            if (!string.IsNullOrEmpty(UserDataEntity.FaxAddress))
            {
                destinationAccRecord.FAX_IND = ApplicationConstants.YES;
                destinationAccRecord.RIGHTFAX_NUM = UserDataEntity?.FaxAddress;
                destinationAccRecord.FAX_SUBJECT = UserDataEntity?.FaxSubject;
            }
            if (UserDataEntity.LetterDate > DateTime.MinValue)
                destinationAccRecord.LTR_DT = ConvertDateFormat(UserDataEntity.LetterDate, "MMMM d, yyyy");

            //address related information
            var address = UserDataEntity?.AddresseeAddress;
            if (address != null)
            {
                destinationAccRecord.ADDRESSEE_NAME = address?.DisplayName;
                destinationAccRecord.ADDRESSEE_NAME_2 = UserDataEntity.AddresseeAddress2;
                destinationAccRecord.ADDRESSEE_NAME_3 = UserDataEntity.AddresseeAddress3;
                destinationAccRecord.GREETING_NAME = UserDataEntity.GreetingName;
                destinationAccRecord.ADDRESSEE_ADDR_1 = address.Line1Tx;
                destinationAccRecord.ADDRESSEE_ADDR_2 = address.Line2Tx;
                destinationAccRecord.ADDRESSEE_ADDR_3 = address.Line3Tx;
                destinationAccRecord.ADDRESSEE_CTY = address.MunicipalityNm; ;
                destinationAccRecord.ADDRESSEE_ST = address.CountrySubdivisionNm;
                destinationAccRecord.ADDRESSEE_ZIP = address.PostalCd;
            }
        }
        protected virtual void AddPolicyGeneralDetails(dynamic destinationAccRecord)
        {
            destinationAccRecord.INBND_DOCTYPE = DocumentData.DocumentOnbaseID;
            destinationAccRecord.LTR_CTGY = DocumentData.documentEntity.CategoryName;
            destinationAccRecord.LTR_NAME = DocumentData.documentEntity.DocumentName;
            destinationAccRecord.OUTBND_DOCTYPE = DocumentData.documentEntity.DocumentType;
            destinationAccRecord.CREATOR_UID = InputQueryParameters.UserDetails.UserID;
            destinationAccRecord.CREATOR_NAME = InputQueryParameters.UserDetails.UserName;
            destinationAccRecord.CREATOR_INT = InputQueryParameters.UserDetails.UserInitials;
        }
        protected virtual void AddPolicyGeneralOtherDetails(dynamic destinationAccRecord)
        {
            destinationAccRecord.POL_NO = GetPolicyNumber();
            destinationAccRecord.POL_NO_PAD = GetPolicyPad();
            destinationAccRecord.INS_CO_NM = GetInsuranceCompanyName(SourcePolicy?.UnderwritingCompany?.OrganizationNameCd);
            destinationAccRecord.QUOTE_NUM = SourcePolicyPeriod?.QuoteNumber;
            destinationAccRecord.POL_ST = SourcePolicy?.BaseStateCd;
            destinationAccRecord.NAMED_INSD_1 = GetNameInsured(ApplicationConstants.PrimaryNamedInsured);
            destinationAccRecord.NAMED_INSD_2 = GetNameInsured(ApplicationConstants.SecondaryNamedInsured);
            destinationAccRecord.NAMED_INSD_3 = GetNameInsured(ApplicationConstants.OtherNamedInsured);
            destinationAccRecord.NAMED_INSD_4 = GetNameInsured(ApplicationConstants.OtherNamedInsured, 1);
            destinationAccRecord.NAMED_INSD_5 = GetNameInsured(ApplicationConstants.OtherNamedInsured, 2);
            destinationAccRecord.NAMED_INSD_6 = GetNameInsured(ApplicationConstants.OtherNamedInsured, 3);

            var address = GetHomeAddress(ApplicationConstants.Address_Home);
            if (address?.Address != null)
            {
                destinationAccRecord.HOME_ADDR_1 = address.Address.Line1Tx;
                destinationAccRecord.HOME_ADDR_2 = address.Address.Line2Tx;
                destinationAccRecord.HOME_ADDR_3 = address.Address.Line3Tx;
                destinationAccRecord.HOME_CTY = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.CITY, address.Address);
                destinationAccRecord.HOME_ST = address.Address.CountrySubdivision.CountrySubdivisionNm;
                destinationAccRecord.HOME_ZIP = address.Address.PostalCd;
            }
            address = GetHomeAddress(ApplicationConstants.Address_Mailing);
            if (address?.Address != null)
            {
                destinationAccRecord.POL_MAIL_ADDR_1 = address.Address.Line1Tx;
                destinationAccRecord.POL_MAIL_ADDR_2 = address.Address.Line2Tx;
                destinationAccRecord.POL_MAIL_ADDR_3 = address.Address.Line3Tx;
                destinationAccRecord.POL_MAIL_CTY = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.CITY, address.Address);
                destinationAccRecord.POL_MAIL_ST = address.Address.CountrySubdivision.CountrySubdivisionNm;
                destinationAccRecord.POL_MAIL_ZIP = address.Address.PostalCd;
            }

            destinationAccRecord.PRIM_INSD_EMAIL = null;//This source location in ESB doesn't exist.  
                                                        //  destinationAccRecordord.FORM_TYPE = SourcePolicyPeriod.PolicyLines.Where (p=>p.UmbrellaLine != null).FirstOrDefault().UmbrellaLine.;
                                                        //  destinationAccRecordord.ESCROW_IND = SourcePolicyPeriod.PolicyLines.Where(p=>p.UmbrellaLine != null).FirstOrDefault().UmbrellaLine.F
            destinationAccRecord.POL_MAILING_ADD_IND = SourcePolicyPeriod.PolicyMailingAddressIn;
        }
        protected virtual void CreateCustomTags(dynamic destinationAccRecord)
        {
            //Add special tags 
            destinationAccRecord.LTR_NAME_REC.POL_FK = GetConfigValue(nameof(destinationAccRecord.LTR_NAME_REC.POL_FK));
            destinationAccRecord.LTR_NAME_REC.LTR_NAME_BATCH = DocumentData.documentEntity.DocumentName;
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
        protected virtual string GetNameInsured(string role, int position = 0)
        {
            string name = String.Empty;
            var namedInsured = SourcePolicyPeriod.ListedParties.Where(l => l.Party.PartyRoles.Contains(role));
            if (namedInsured?.Count() > position)
            {
                var insured = namedInsured.ElementAt(position).Party.Person;
                if(insured != null)
                 name = string.Format("{0} {1} {2} {3} {4}",
                    insured.PersonName.NameSalutationCd,
                    insured.PersonName.FirstGivenNm,
                    insured.SecondGivenNameInitial,
                    insured.PersonName.FamilyNm,
                    insured.PersonName.FamilyNameGenerationCd);
            }
            return name;
        }
        private PartyAddress GetHomeAddress(string addressCd)
        {
            var namedInsured = SourcePolicyPeriod?.ListedParties?.Where(l => l.Party.PartyRoles.Contains(ApplicationConstants.PrimaryNamedInsured));
            namedInsured = namedInsured.Where(l => l.Party.Person.Addresses != null);
            return namedInsured.FirstOrDefault()?.Party?.Person?.Addresses.Where(a => a.AddressUseCd == addressCd).FirstOrDefault();
        }
        private string GetPolicyNumber()
        {
            var policyNumber = SourcePolicy?.PolicyNumber;
            if (!string.IsNullOrEmpty(policyNumber) && policyNumber != ApplicationConstants.Unassigned)
            {
                return String.Format("{0}-{1}", policyNumber.Substring(0, policyNumber.Length - 1), policyNumber.Last());
            }
            return null;
        }
        private string GetPolicyPad()
        {
            var policyNumber = SourcePolicy?.PolicyNumber;
            if (!string.IsNullOrEmpty(policyNumber) && policyNumber != ApplicationConstants.Unassigned)
            {
                var polNumPad = string.Format("000000000{0}", policyNumber);
                return polNumPad.Substring(policyNumber.Length - 1, 9);
            }
            return null;
        }
    }
}
