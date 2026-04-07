using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.BC
{
    public class BCSourceSystemEntity : SourceSystemBaseEntity
    {
        public RetrievePolicyInvoiceResponse retrievePolicyInvoiceDetailsOut { get; set; }
        public RetrieveInvoiceTransactionsResponse retrieveInvoiceTransactionsOut { get; set; }

        public RetrieveProducerStatementResponse retrieveProducerStatementDetailsOut { get; set; }
    }

    public class RetrieveInvoiceTransactionsResponse
    {
        public string BillingMethod { get; set; }
        public bool IsPolicyEscrow { get; set; }
        public bool IsPolicyEscrowSpecified { get; set; }
        public bool IsPolicyPrecisionPay { get; set; }
        public bool IsPolicyPrecisionPaySpecified { get; set; }
        public System.Nullable<decimal> PolicyPastDueAmt { get; set; }
        public bool PolicyPastDueAmtSpecified { get; set; }
        public System.Nullable<decimal> PolicyInstAmtDue { get; set; }
        public bool PolicyInstAmtDueSpecified { get; set; }
        public System.Nullable<decimal> PolicyTotBalDue { get; set; }
        public bool PolicyTotBalDueSpecified { get; set; }
        public PolicyPeriod LatestPolicyPeriod { get; set; }
        public AccountInvoice[] AccountInvoices { get; set; }
        public AccountViewTransactionDetails[] InvoiceLineItemsFrom360ForThePolicy { get; set; }
    }
    public class PolicyPeriod
    {
        public Account Account { get; set; }
        public System.Nullable<decimal> ActualPremiumAmount { get; set; }
        public bool ActualPremiumAmountSpecified { get; set; }
        public string BureauFileNumber_Ext { get; set; }
        public Cancellation Cancellation { get; set; }
        public PolicyPeriodContact[] Contacts { get; set; }
        public System.Nullable<decimal> CurrentOpenBalanceDue { get; set; }
        public bool CurrentOpenBalanceDueSpecified { get; set; }
        public string DBA { get; set; }
        public System.Nullable<decimal> DelinquentAmount { get; set; }
        public bool DelinquentAmountSpecified { get; set; }
        public System.Nullable<decimal> DueAmount { get; set; }
        public bool DueAmountSpecified { get; set; }
        public System.Nullable<decimal> EPAgreementPaymentAmount { get; set; }
        public bool EPAgreementPaymentAmountSpecified { get; set; }
        public System.Nullable<decimal> EstimatedPremiumAmount { get; set; }
        public bool EstimatedPremiumAmountSpecified { get; set; }
        public PolicyPeriodHOPolicyType_Ext HOPolicyType_Ext { get; set; }
        public System.Nullable<System.DateTime> IntentToCancelMailDate_Ext { get; set; }
        public bool IntentToCancelMailDate_ExtSpecified { get; set; }
        public string InvoiceDeliveryType_Ext { get; set; }
        public System.Nullable<bool> IsDirectDebit { get; set; }
        public bool IsDirectDebitSpecified { get; set; }
        public System.Nullable<bool> IsLCF_Ext { get; set; }
        public bool IsLCF_ExtSpecified { get; set; }
        public System.Nullable<decimal> LastPaymentAmountPosted { get; set; }
        public bool LastPaymentAmountPostedSpecified { get; set; }
        public System.Nullable<System.DateTime> LastPaymentAmountPostedDate { get; set; }
        public bool LastPaymentAmountPostedDateSpecified { get; set; }
        public Address LCFAddress_Ext { get; set; }
        public string LCFName_Ext { get; set; }
        public System.Nullable<decimal> NextInstallmentAmountDue { get; set; }
        public bool NextInstallmentAmountDueSpecified { get; set; }
        public System.Nullable<System.DateTime> NextInstallmentAmountDueDate { get; set; }
        public bool NextInstallmentAmountDueDateSpecified { get; set; }
        public System.Nullable<decimal> NotHonoredPaymentAmount_Ext { get; set; }
        public bool NotHonoredPaymentAmount_ExtSpecified { get; set; }
        public PolicyPeriodNotHonoredPaymentReason_Ext NotHonoredPaymentReason_Ext { get; set; }
        public System.Nullable<decimal> OriginalDelinequentAmount { get; set; }
        public bool OriginalDelinequentAmountSpecified { get; set; }
        public Invoice[] PlannedInvoices { get; set; }
        public Policy Policy { get; set; }
        public string PolicyNumber { get; set; }
        public System.Nullable<System.DateTime> PolicyPerEffDate { get; set; }
        public bool PolicyPerEffDateSpecified { get; set; }
        public System.Nullable<System.DateTime> PolicyPerExpirDate { get; set; }
        public bool PolicyPerExpirDateSpecified { get; set; }
        public PolicyPeriodContact PrimaryInsured { get; set; }
        public System.Nullable<decimal> RecentPaymentOnDlnqPolicy_Ext { get; set; }
        public bool RecentPaymentOnDlnqPolicy_ExtSpecified { get; set; }
        public PolicyPeriodRiskState RiskState { get; set; }
        public System.Nullable<System.DateTime> ScheduledCancellationDate_Ext { get; set; }
        public bool ScheduledCancellationDate_ExtSpecified { get; set; }
        public PolicyPeriodStatus Status { get; set; }
        public System.Nullable<decimal> TotalDueForPolicyPeriod { get; set; }
        public bool TotalDueForPolicyPeriodSpecified { get; set; }
        public System.Nullable<decimal> TotalAdjustedOutstandingAmount { get; set; }
        public bool TotalAdjustedOutstandingAmountSpecified { get; set; }
        public PolicyPeriodUWCompany UWCompany { get; set; }
        public string NJMIndustryOfferingCode_Ext { get; set; }
        public string ProductOfferingCode_Ext { get; set; }
        public string PolicyProductCode_Ext { get; set; }
        public string CLInvoiceDeliveryType_Ext { get; set; }
    }
    public class Account
    {
        public string AccountNumber { get; set; }
        public System.Nullable<bool> IsAccountPaperless_Ext { get; set; }
        public bool IsAccountPaperless_ExtSpecified { get; set; }
    }
 
    public class Cancellation
    {
        public System.Nullable<System.DateTime> ModificationDate { get; set; }

        public bool ModificationDateSpecified { get; set; }
    }

    public class PolicyPeriodContact
    {
        public Contact Contact { get; set; }
        public string DisplayName { get; set; }
        public System.Nullable<bool> IsCorrespondenceReceiver_Ext { get; set; }
        public bool IsCorrespondenceReceiver_ExtSpecified { get; set; }
        public PolPeriodContactRole[] Roles { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }
    public class Contact
    {
        public ContactEntityPerson entityPerson { get; set; }
        public Address[] AllAddresses { get; set; }
        public Address[] AllValidAddresses { get; set; }
        public string EmailAddress1 { get; set; }
        public string FaxPhone { get; set; }
        public string FaxPhoneCountry { get; set; }
        public string FaxPhoneExtension { get; set; }
        public string FaxPhoneValue { get; set; }
        public Address PrimaryAddress { get; set; }
        public string PrimaryPhoneValue { get; set; }
        public ContactSubtype Subtype { get; set; }
        public string WorkPhone { get; set; }
        public string WorkPhoneCountry { get; set; }
        public string WorkPhoneExtension { get; set; }
        public string WorkPhoneValue { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }
    public class ContactEntityPerson
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public ContactEntityPersonPrefix Prefix { get; set; }
        public ContactEntityPersonSuffix Suffix { get; set; }
    }
    public class ContactEntityPersonPrefix
    {
        public string DisplayName { get; set; }
    }
    public class ContactEntityPersonSuffix
    {
        public string DisplayName { get; set; }
    }
    public class Address
    {
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string AddressLine3 { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public AddressState State { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }
    public class AddressState
    {
        public string Code { get; set; }
    }
    public class ContactSubtype
    {
        public string Code { get; set; }
    }
    public class PolPeriodContactRole
    {
        public PolPeriodContactRoleRole Role { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public class PolPeriodContactRoleRole
    {
        public string Code { get; set; }
    }
    public class PolicyPeriodHOPolicyType_Ext
    {
        public string Code { get; set; }
    }
    public class PolicyPeriodNotHonoredPaymentReason_Ext
    {
        public string DisplayName { get; set; }
    }
    public class Invoice
    {
        public System.Nullable<decimal> AmountDue { get; set; }
        public bool AmountDueSpecified { get; set; }
        public System.Nullable<System.DateTime> PaymentDueDate { get; set; }
        public bool PaymentDueDateSpecified { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }
    public class Policy
    {
        public PolicyLOBCode LOBCode { get; set; }
        public ProducerCode ProducerCodeOfService_Ext { get; set; }
    }
    public class PolicyLOBCode
    {
        public string DisplayName { get; set; }
    }
    public class ProducerCode
    {
        public string Code { get; set; }
        public Producer Producer { get; set; }
    }
    public class Producer
    {
        public Address Address_Ext { get; set; }
        public string Name { get; set; }
        public string ParentProducerName_Ext { get; set; }
        public System.Nullable<bool> IsProducerPaperless_Ext { get; set; }
        public bool IsProducerPaperless_ExtSpecified { get; set; }
    }
    public class PolicyPeriodRiskState
    {
        public string Code { get; set; }
    }
    public class PolicyPeriodStatus
    {
        public string Code { get; set; }
    }
    public class PolicyPeriodUWCompany
    {

        public string Code { get; set; }
    }
    public class AccountViewTransactionDetails
    {
        public System.Nullable<decimal> BalanceDue { get; set; }
        public bool BalanceDueSpecified { get; set; }
        public string Description { get; set; }
        public System.Nullable<decimal> DueAmount { get; set; }
        public bool DueAmountSpecified { get; set; }
        public System.Nullable<decimal> InvoiceItemAmtDue { get; set; }
        public bool InvoiceItemAmtDueSpecified { get; set; }
        public System.Nullable<decimal> PaidAmount { get; set; }
        public bool PaidAmountSpecified { get; set; }
        public string PastDueIndicator { get; set; }
        public System.Nullable<int> PolicyYear { get; set; }
        public bool PolicyYearSpecified { get; set; }
        public System.Nullable<System.DateTime> TransactionDate { get; set; }
        public bool TransactionDateSpecified { get; set; }
        public System.Nullable<System.DateTime> TransactionEffectiveDate { get; set; }
        public bool TransactionEffectiveDateSpecified { get; set; }
        public string UnderwritingCompany { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }
    public class AccountInvoice
    {
        public System.Nullable<decimal> AmountDue { get; set; }
        public bool AmountDueSpecified { get; set; }
        public System.Nullable<decimal> CurrentInstallmentAmount { get; set; }
        public bool CurrentInstallmentAmountSpecified { get; set; }
        public string EarnedPremiumIndicatorOne { get; set; }
        public string EarnedPremiumIndicatorTwo { get; set; }
        public System.Nullable<System.DateTime> EventDate { get; set; }
        public bool EventDateSpecified { get; set; }
        public string FirstInstallmentIndicator { get; set; }
        public string InvoiceNumber { get; set; }
        public AccountViewTransactionDetails[] InvoiceLineItemsFrom360 { get; set; }
        public System.Nullable<decimal> PastDueAndCurrentInstallmentAmount { get; set; }
        public bool PastDueAndCurrentInstallmentAmountSpecified { get; set; }
        public string T15ReminderNoticeLetterIndicator { get; set; }
        public string LegalDunningLetterIndicator { get; set; }
        public System.Nullable<System.DateTime> PaymentDueDate { get; set; }
        public bool PaymentDueDateSpecified { get; set; }
        public PolicyPeriod PolicyPeriodForThisInvoice { get; set; }
        public string ReminderNoticeLetterIndicator { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class RetrievePolicyInvoiceResponse
    {

        public string BillingMethod { get; set; }

        public bool IsPolicyEscrow { get; set; }

        public bool IsPolicyEscrowSpecified { get; set; }
        public AccountInvoice[] AccountInvoices { get; set; }
        public bool IsPolicyPrecisionPay { get; set; }
        public bool IsPolicyPrecisionPaySpecified { get; set; }
    }

    public partial class RetrieveProducerStatementResponse
    {
        public ProducerStatement[] ProducerStatments { get; set; }
    }

    public partial class ProducerStatement
    {
        public Producer1 Producer { get; set; }

        public ProducerActivity[] ProducerActivity { get; set; }

        public System.Nullable<decimal> TotalAmountDue { get; set; }
        public bool TotalAmountDueSpecified { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class Producer1
    {

        public Address Address_Ext { get; set; }
        public string Name { get; set; }
        public string ParentProducerName_Ext { get; set; }
        public ProducerCode1[] ProducerCodes { get; set; }
    }

    public partial class ProducerActivity
    {
        public System.Nullable<decimal> BalanceAmount { get; set; }
        public bool BalanceAmountSpecified { get; set; }
        public System.Nullable<decimal> CommissionEarned { get; set; }
        public bool CommissionEarnedSpecified { get; set; }
        public System.Nullable<decimal> CommissionUnearned { get; set; }
        public bool CommissionUnearnedSpecified { get; set; }
        public System.Nullable<System.DateTime> EventDate { get; set; }
        public bool EventDateSpecified { get; set; }
        public PolicyPeriod RelatedPolicyPeriod { get; set; }
        public string TransactionName { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

    public partial class ProducerCode1
    {
        public string Code { get; set; }
        public int id { get; set; }
        public bool idSpecified { get; set; }
    }

}