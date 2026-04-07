namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.Multi
{
    public class CLMultiInspireEntity : InspireBase
    {
        public CustomerData CustomerData { get; set; } = new CustomerData();
    }

    // NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class CustomerData
    {

        private CustomerDataRecordDelim recordDelimField = new CustomerDataRecordDelim();

        /// <remarks/>
        public CustomerDataRecordDelim RecordDelim
        {
            get
            {
                return this.recordDelimField;
            }
            set
            {
                this.recordDelimField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelim
    {

        private CustomerDataRecordDelimAccountRecord accountRecordField = new CustomerDataRecordDelimAccountRecord();

        private CustomerDataRecordDelimTableOfContents tableOfContentsField = new CustomerDataRecordDelimTableOfContents();

        private CustomerDataRecordDelimMultiLineQuote multiLineQuoteField = new CustomerDataRecordDelimMultiLineQuote();

        private CustomerDataRecordDelimCopyTo[] copiesToField;

        /// <remarks/>
        public CustomerDataRecordDelimAccountRecord AccountRecord
        {
            get
            {
                return this.accountRecordField;
            }
            set
            {
                this.accountRecordField = value;
            }
        }

        /// <remarks/>
        public CustomerDataRecordDelimTableOfContents TableOfContents
        {
            get
            {
                return this.tableOfContentsField;
            }
            set
            {
                this.tableOfContentsField = value;
            }
        }

        /// <remarks/>
        public CustomerDataRecordDelimMultiLineQuote MultiLineQuote
        {
            get
            {
                return this.multiLineQuoteField;
            }
            set
            {
                this.multiLineQuoteField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlArrayItemAttribute("CopyTo", IsNullable = false)]
        public CustomerDataRecordDelimCopyTo[] CopiesTo
        {
            get
            {
                return this.copiesToField;
            }
            set
            {
                this.copiesToField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimAccountRecord
    {

        private string recordKeyField;

        private string nJMAccountNumberField;

        private string addresseeCompanyNameField;

        private string addresseeAddressLine1Field;

        private string addresseeAddressLine2Field;

        private string addresseeAddressLine3Field;

        private string addresseeCityField;

        private string addresseeStateField;

        private string addresseeZipField;

        private string insuranceCompanyNameField;

        private string addresseeNameField;

        private string lineOfBusinessField;

        private string sourceSystemField;

        private string cLDocSourceField;

        private string documentRecipientField;

        private string packageNameField;

        private string inboundDocTypeField;

        private string outboundDocTypeField;

        private string creatorIDField;

        private string cREATOR_INTField;

        private string currentDateField;

        private string iNS_CO_NMField;

        private string onBaseKeyword1Field;

        private string archiveIndField;

        private string printIndField;

        private string printerNameField;

        private string distAgencyNameField;

        private string dRNameField;

        private string dRPhoneField;

        private string uWEmailField; 

        private string dREmailField;

        private string uWNameField;

        private string uWPhoneField;

        /// <remarks/>
        public string RecordKey
        {
            get
            {
                return this.recordKeyField;
            }
            set
            {
                this.recordKeyField = value;
            }
        }

        /// <remarks/>
        public string NJMAccountNumber
        {
            get
            {
                return this.nJMAccountNumberField;
            }
            set
            {
                this.nJMAccountNumberField = value;
            }
        }

        /// <remarks/>
        public string AddresseeCompanyName
        {
            get
            {
                return this.addresseeCompanyNameField;
            }
            set
            {
                this.addresseeCompanyNameField = value;
            }
        }

        /// <remarks/>
        public string AddresseeAddressLine1
        {
            get
            {
                return this.addresseeAddressLine1Field;
            }
            set
            {
                this.addresseeAddressLine1Field = value;
            }
        }

        public string AddresseeAddressLine2
        {
            get
            {
                return this.addresseeAddressLine2Field;
            }
            set
            {
                this.addresseeAddressLine2Field = value;
            }
        }
        public string AddresseeAddressLine3
        {
            get
            {
                return this.addresseeAddressLine3Field;
            }
            set
            {
                this.addresseeAddressLine3Field = value;
            }
        }
        /// <remarks/>
        public string AddresseeCity
        {
            get
            {
                return this.addresseeCityField;
            }
            set
            {
                this.addresseeCityField = value;
            }
        }

        /// <remarks/>
        public string AddresseeState
        {
            get
            {
                return this.addresseeStateField;
            }
            set
            {
                this.addresseeStateField = value;
            }
        }

        /// <remarks/>
        public string AddresseeZip
        {
            get
            {
                return this.addresseeZipField;
            }
            set
            {
                this.addresseeZipField = value;
            }
        }

        /// <remarks/>
        public string InsuranceCompanyName
        {
            get
            {
                return this.insuranceCompanyNameField;
            }
            set
            {
                this.insuranceCompanyNameField = value;
            }
        }

        /// <remarks/>
        public string AddresseeName
        {
            get
            {
                return this.addresseeNameField;
            }
            set
            {
                this.addresseeNameField = value;
            }
        }

        /// <remarks/>
        public string LineOfBusiness
        {
            get
            {
                return this.lineOfBusinessField;
            }
            set
            {
                this.lineOfBusinessField = value;
            }
        }

        /// <remarks/>
        public string SourceSystem
        {
            get
            {
                return this.sourceSystemField;
            }
            set
            {
                this.sourceSystemField = value;
            }
        }

        /// <remarks/>
        public string CLDocSource
        {
            get
            {
                return this.cLDocSourceField;
            }
            set
            {
                this.cLDocSourceField = value;
            }
        }

        /// <remarks/>
        public string DocumentRecipient
        {
            get
            {
                return this.documentRecipientField;
            }
            set
            {
                this.documentRecipientField = value;
            }
        }

        /// <remarks/>
        public string PackageName
        {
            get
            {
                return this.packageNameField;
            }
            set
            {
                this.packageNameField = value;
            }
        }

        /// <remarks/>
        public string InboundDocType
        {
            get
            {
                return this.inboundDocTypeField;
            }
            set
            {
                this.inboundDocTypeField = value;
            }
        }

        /// <remarks/>
        public string OutboundDocType
        {
            get
            {
                return this.outboundDocTypeField;
            }
            set
            {
                this.outboundDocTypeField = value;
            }
        }

        /// <remarks/>
        public string CreatorID
        {
            get
            {
                return this.creatorIDField;
            }
            set
            {
                this.creatorIDField = value;
            }
        }

        /// <remarks/>
        public string CREATOR_INT
        {
            get
            {
                return this.cREATOR_INTField;
            }
            set
            {
                this.cREATOR_INTField = value;
            }
        }

        /// <remarks/>
        public string CurrentDate
        {
            get
            {
                return this.currentDateField;
            }
            set
            {
                this.currentDateField = value;
            }
        }

        /// <remarks/>
        public string INS_CO_NM
        {
            get
            {
                return this.iNS_CO_NMField;
            }
            set
            {
                this.iNS_CO_NMField = value;
            }
        }

        /// <remarks/>
        public string OnBaseKeyword1
        {
            get
            {
                return this.onBaseKeyword1Field;
            }
            set
            {
                this.onBaseKeyword1Field = value;
            }
        }

        /// <remarks/>
        public string ArchiveInd
        {
            get
            {
                return this.archiveIndField;
            }
            set
            {
                this.archiveIndField = value;
            }
        }

        /// <remarks/>
        public string PrintInd
        {
            get
            {
                return this.printIndField;
            }
            set
            {
                this.printIndField = value;
            }
        }

        /// <remarks/>
        public string PrinterName
        {
            get
            {
                return this.printerNameField;
            }
            set
            {
                this.printerNameField = value;
            }
        }

        /// <remarks/>
        public string DistAgencyName
        {
            get
            {
                return this.distAgencyNameField;
            }
            set
            {
                this.distAgencyNameField = value;
            }
        }
        public string DistAgencyAddress1 { get; set; }
        public string DistAgencyAddress2 { get; set; }
        public string DistAgencyAddress3 { get; set; }
        public string DistAgencyCity { get; set; }
        public string DistAgencyState { get; set; }
        public string DistAgencyZip { get; set; }


        /// <remarks/>
        public string DRName
        {
            get
            {
                return this.dRNameField;
            }
            set
            {
                this.dRNameField = value;
            }
        }

        /// <remarks/>
        public string DRPhone
        {
            get
            {
                return this.dRPhoneField;
            }
            set
            {
                this.dRPhoneField = value;
            }
        }
        public string DREmail
        {
            get
            {
                return this.dREmailField;
            }
            set
            {
                this.dREmailField = value;
            }
        }
        /// <remarks/>
        public string UWName
        {
            get
            {
                return this.uWNameField;
            }
            set
            {
                this.uWNameField = value;
            }
        }

        /// <remarks/>
        public string UWPhone
        {
            get
            {
                return this.uWPhoneField;
            }
            set
            {
                this.uWPhoneField = value;
            }
        }
        public string UWEmail
        {
            get
            {
                return this.uWEmailField;
            }
            set
            {
                this.uWEmailField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimTableOfContents
    {

        private CustomerDataRecordDelimTableOfContentsDocument documentField = new CustomerDataRecordDelimTableOfContentsDocument();

        /// <remarks/>
        public CustomerDataRecordDelimTableOfContentsDocument Document
        {
            get
            {
                return this.documentField;
            }
            set
            {
                this.documentField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimTableOfContentsDocument
    {

        private string documentNameField;

        /// <remarks/>
        public string DocumentName
        {
            get
            {
                return this.documentNameField;
            }
            set
            {
                this.documentNameField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimMultiLineQuote
    {

        private string totPremiumField;

        private CustomerDataRecordDelimMultiLineQuoteQuoteDetails[] quoteDetailsField;

        /// <remarks/>
        public string TotPremium
        {
            get
            {
                return this.totPremiumField;
            }
            set
            {
                this.totPremiumField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("QuoteDetails")]
        public CustomerDataRecordDelimMultiLineQuoteQuoteDetails[] QuoteDetails
        {
            get
            {
                return this.quoteDetailsField;
            }
            set
            {
                this.quoteDetailsField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimMultiLineQuoteQuoteDetails
    {

        private string recordKeyField;

        private string lOBField;

        private string yearField;

        private string effDateField;

        private string expDateField;

        private string quoteNumberField;

        private decimal premiumField;

        private string quoteTypeField;

        private string uWCompanyField;

        private CustomerDataRecordDelimMultiLineQuoteQuoteDetailsLineDetails[] lineDetailsField;

        /// <remarks/>
        public string RecordKey
        {
            get
            {
                return this.recordKeyField;
            }
            set
            {
                this.recordKeyField = value;
            }
        }

        /// <remarks/>
        public string LOB
        {
            get
            {
                return this.lOBField;
            }
            set
            {
                this.lOBField = value;
            }
        }

        /// <remarks/>
        public string Year
        {
            get
            {
                return this.yearField;
            }
            set
            {
                this.yearField = value;
            }
        }

        /// <remarks/>
        public string EffDate
        {
            get
            {
                return this.effDateField;
            }
            set
            {
                this.effDateField = value;
            }
        }

        /// <remarks/>
        public string ExpDate
        {
            get
            {
                return this.expDateField;
            }
            set
            {
                this.expDateField = value;
            }
        }

        /// <remarks/>
        public string QuoteNumber
        {
            get
            {
                return this.quoteNumberField;
            }
            set
            {
                this.quoteNumberField = value;
            }
        }

        /// <remarks/>
        public decimal Premium
        {
            get
            {
                return this.premiumField;
            }
            set
            {
                this.premiumField = value;
            }
        }

        /// <remarks/>
        public string QuoteType
        {
            get
            {
                return this.quoteTypeField;
            }
            set
            {
                this.quoteTypeField = value;
            }
        }

        /// <remarks/>
        public string UWCompany
        {
            get
            {
                return this.uWCompanyField;
            }
            set
            {
                this.uWCompanyField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("LineDetails")]
        public CustomerDataRecordDelimMultiLineQuoteQuoteDetailsLineDetails[] LineDetails
        {
            get
            {
                return this.lineDetailsField;
            }
            set
            {
                this.lineDetailsField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimMultiLineQuoteQuoteDetailsLineDetails
    {

        private string recordKeyField;

        private string lineField;

        private decimal linePremiumField;

        /// <remarks/>
        public string RecordKey
        {
            get
            {
                return this.recordKeyField;
            }
            set
            {
                this.recordKeyField = value;
            }
        }

        /// <remarks/>
        public string Line
        {
            get
            {
                return this.lineField;
            }
            set
            {
                this.lineField = value;
            }
        }

        /// <remarks/>
        public decimal LinePremium
        {
            get
            {
                return this.linePremiumField;
            }
            set
            {
                this.linePremiumField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimCopyTo
    {

        private string copyToNameField;

        private string copyToCompanyNameField;

        private string copyToAddressLine1Field;

        private string copyToCityField;

        private string copyToStateField;

        private string copyToZIPField;

        /// <remarks/>
        public string CopyToName
        {
            get
            {
                return this.copyToNameField;
            }
            set
            {
                this.copyToNameField = value;
            }
        }

        /// <remarks/>
        public string CopyToCompanyName
        {
            get
            {
                return this.copyToCompanyNameField;
            }
            set
            {
                this.copyToCompanyNameField = value;
            }
        }

        /// <remarks/>
        public string CopyToAddressLine1
        {
            get
            {
                return this.copyToAddressLine1Field;
            }
            set
            {
                this.copyToAddressLine1Field = value;
            }
        }

        /// <remarks/>
        public string CopyToCity
        {
            get
            {
                return this.copyToCityField;
            }
            set
            {
                this.copyToCityField = value;
            }
        }

        /// <remarks/>
        public string CopyToState
        {
            get
            {
                return this.copyToStateField;
            }
            set
            {
                this.copyToStateField = value;
            }
        }

        /// <remarks/>
        public string CopyToZIP
        {
            get
            {
                return this.copyToZIPField;
            }
            set
            {
                this.copyToZIPField = value;
            }
        }
    }
}
