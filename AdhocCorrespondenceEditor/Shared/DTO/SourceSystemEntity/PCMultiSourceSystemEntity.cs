using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.PCMulti
{
    public class PCMultiSourceSystemEntity : SourceSystemBaseEntity
    {
        public RetrieveAccountInformationResponseMessage RetrieveAccountInformationResponseMessage { get; set; }
    }

    public partial class RetrieveAccountInformationResponseMessage
    {

        public AccountInformationMessage AccountInformation { get; set; }
    }
        public partial class AccountInformationMessage
    {
        public string AccountNumber { get; set; }
        public PolicyTransactionDetailsDTO[] PolicyTransactions { get; set; }
        public System.Nullable<bool> IsSuccessful { get; set; }
        public bool IsSuccessfulSpecified { get; set; }
        public AccountRoleInformationDTO AccountHolderContactInfo { get; set; }
        public AccountRoleInformationDTO[] DistributionPartnerInfo { get; set; }
        public AccountRoleInformationDTO[] DistributionRepInfo { get; set; }
        public AccountRoleInformationDTO[] UnderWriterInfo { get; set; }
    }

    public partial class PolicyTransactionDetailsDTO
    {
        public string EffectiveDate { get; set; }
        public string ExpirationDate { get; set; }
        public string QuoteID { get; set; }
        public SubLineDTO[] SubLineInfo { get; set; }
        public string TermType { get; set; }
        public string TransactionStatus { get; set; }
        public string TransactionType { get; set; }
        public string LineOfBusiness { get; set; }
        public string UnderwritingCompany { get; set; }
        public System.Nullable<decimal> TotalPremium { get; set; }
        public bool TotalPremiumSpecified { get; set; }
    }
    public partial class SubLineDTO
    {

        public string PolicyLine { get; set; }
        public System.Nullable<decimal> Premium { get; set; }
        public bool PremiumSpecified { get; set; }
    }
    public partial class AccountRoleInformationDTO
    {
        public string Name { get; set; }
        public ADSAddressDTO RoleAddress { get; set; }
        public string ProducerCode { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
    }

    public partial class ADSAddressDTO
    {
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string AddressLine3 { get; set; }
        public string City { get; set; }
        public string County { get; set; }
        public string PostalCode { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string AddressType { get; set; }
    }

}
