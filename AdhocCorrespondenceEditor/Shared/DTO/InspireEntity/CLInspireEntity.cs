namespace AdhocCorrespondenceEditor.Shared.DTO.InspireEntity
{

    public class CLInspireEntity : InspireBase
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
            get  {   return this.recordDelimField;   } 
            set  {   this.recordDelimField = value;  } 
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelim
    {

        private CustomerDataRecordDelimAccountRecord accountRecordField = new CustomerDataRecordDelimAccountRecord();

        private CustomerDataRecordDelimPolicyRecord policyRecordField = new CustomerDataRecordDelimPolicyRecord();

        private CustomerDataRecordDelimTableOfContents tableOfContentsField = new CustomerDataRecordDelimTableOfContents();

        private CustomerDataRecordDelimVehicleSchedule vehicleScheduleField = new CustomerDataRecordDelimVehicleSchedule();
        
        private CustomerDataRecordDelimLossPayeeSchedule lossPayeeScheduleField = new CustomerDataRecordDelimLossPayeeSchedule();

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
        public CustomerDataRecordDelimPolicyRecord PolicyRecord
        {
            get
            {
                return this.policyRecordField;
            }
            set
            {
                this.policyRecordField = value;
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
        public CustomerDataRecordDelimVehicleSchedule VehicleSchedule
        {
            get
            {
                return this.vehicleScheduleField;
            }
            set
            {
                this.vehicleScheduleField = value;
            }
        }

        public CustomerDataRecordDelimLossPayeeSchedule LossPayeeSchedule
        {
            get
            {
                return this.lossPayeeScheduleField;
            }
            set
            {
                this.lossPayeeScheduleField = value;
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

        private string nJMAccountNumberField;

        private string sourceSystemField;

        private string onBaseKeyword1Field;

        private string lineOfBusinessField;

        private string cLDocSourceField;

        private string tag4Field;

        private string tag4NumField;

        private string value4Field;

        private string tag6Field;

        private string tag6NumField;

        private string value6Field;

        private string tag12Field;

        private string tag12NumField;

        private string value12Field;

        private string currentDateField;

        private string packageNameField;

        private string inboundDocTypeField;

        private string outboundDocTypeField;

        private string creatorIDField;

        private string cREATOR_INTField;

        private string iNS_CO_NMField;

        private string addresseeNameField;

        private string addresseeAddressLine1Field;

        private string addresseeAddressLine2Field;

        private string addresseeAddressLine3Field;
        
        private string addresseeCityField;

        private string addresseeStateField;

        private string addresseeZipField;

        private string archiveIndField;

        private string printIndField;

        private string printerNameField;

        private string documentRecipientField;

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
        public string Tag4
        {
            get
            {
                return this.tag4Field;
            }
            set
            {
                this.tag4Field = value;
            }
        }

        /// <remarks/>
        public string Tag4Num
        {
            get
            {
                return this.tag4NumField;
            }
            set
            {
                this.tag4NumField = value;
            }
        }

        /// <remarks/>
        public string Value4
        {
            get
            {
                return this.value4Field;
            }
            set
            {
                this.value4Field = value;
            }
        }

        /// <remarks/>
        public string Tag6
        {
            get
            {
                return this.tag6Field;
            }
            set
            {
                this.tag6Field = value;
            }
        }

        /// <remarks/>
        public string Tag6Num
        {
            get
            {
                return this.tag6NumField;
            }
            set
            {
                this.tag6NumField = value;
            }
        }

        /// <remarks/>
        public string Value6
        {
            get
            {
                return this.value6Field;
            }
            set
            {
                this.value6Field = value;
            }
        }

        /// <remarks/>
        public string Tag12
        {
            get
            {
                return this.tag12Field;
            }
            set
            {
                this.tag12Field = value;
            }
        }

        /// <remarks/>
        public string Tag12Num
        {
            get
            {
                return this.tag12NumField;
            }
            set
            {
                this.tag12NumField = value;
            }
        }

        /// <remarks/>
        public string Value12
        {
            get
            {
                return this.value12Field;
            }
            set
            {
                this.value12Field = value;
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
        public string EMAIL_TO
        {
            get;
            set;
        }
        public string EMAIL_IND
        {
            get;
            set;
        }
        public string EMAIL_FROM
        {
            get;
            set;
        }

        /// <remarks/>
        public string EMAIL_BODY
        {
            get;
            set;
        }

        /// <remarks/>
        public string EMAIL_SUBJECT
        {
            get;
            set;
        }
        /// <remarks/>
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimPolicyRecord
    {

        private string recordKeyField;

        private string nJMPolicyNumberField;

        private string quoteNumberField;

        private string productCodeField;

        private string industryCodeField;

        private string policyNumPrefixDisplayField;

        private string nJMPolicyHolderName1Field;

        private string baseStateField;

        private string uWCompanyNameField;

        private System.DateTime polEffectiveDateField;

        private string policyEffectiveYearField;

        private System.DateTime polExpirationDateField;

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
        public string NJMPolicyNumber
        {
            get
            {
                return this.nJMPolicyNumberField;
            }
            set
            {
                this.nJMPolicyNumberField = value;
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
        public string ProductCode
        {
            get
            {
                return this.productCodeField;
            }
            set
            {
                this.productCodeField = value;
            }
        }

        /// <remarks/>
        public string IndustryCode
        {
            get
            {
                return this.industryCodeField;
            }
            set
            {
                this.industryCodeField = value;
            }
        }

        /// <remarks/>
        public string PolicyNumPrefixDisplay
        {
            get
            {
                return this.policyNumPrefixDisplayField;
            }
            set
            {
                this.policyNumPrefixDisplayField = value;
            }
        }

        /// <remarks/>
        public string NJMPolicyHolderName1
        {
            get
            {
                return this.nJMPolicyHolderName1Field;
            }
            set
            {
                this.nJMPolicyHolderName1Field = value;
            }
        }

        /// <remarks/>
        public string BaseState
        {
            get
            {
                return this.baseStateField;
            }
            set
            {
                this.baseStateField = value;
            }
        }

        /// <remarks/>
        public string UWCompanyName
        {
            get
            {
                return this.uWCompanyNameField;
            }
            set
            {
                this.uWCompanyNameField = value;
            }
        }

        /// <remarks/>
        public System.DateTime PolEffectiveDate
        {
            get
            {
                return this.polEffectiveDateField;
            }
            set
            {
                this.polEffectiveDateField = value;
            }
        }

        /// <remarks/>
        public string PolicyEffectiveYear
        {
            get
            {
                return this.policyEffectiveYearField;
            }
            set
            {
                this.policyEffectiveYearField = value;
            }
        }

        /// <remarks/>
        public System.DateTime PolExpirationDate
        {
            get
            {
                return this.polExpirationDateField;
            }
            set
            {
                this.polExpirationDateField = value;
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
    public partial class CustomerDataRecordDelimVehicleSchedule
    {

        private CustomerDataRecordDelimVehicleScheduleVehicle vehicleField = new CustomerDataRecordDelimVehicleScheduleVehicle();

        /// <remarks/>
        public CustomerDataRecordDelimVehicleScheduleVehicle Vehicle
        {
            get
            {
                return this.vehicleField;
            }
            set
            {
                this.vehicleField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimVehicleScheduleVehicle
    {

        private string recordKeyField;

        private string yearField;

        private string makeField;

        private string modelField;

        private string serialNumberField;

        private string lossPayeeSeqNoField;

        private string registeredToField;

        private string autoLiabLimitField;

        private string oTCDeductibleField;

        private string cOLLDeductibleField;


        private string addlNamedInsuredNameLessorField;

        private string addlNamednsuredLessorAddressLine1Field;

        private string addlNamednsuredLessorAddressLine2Field;

        private string addlNamednsuredLessorAddressLine3Field;

        private string addlNamedInsuredLessorCityField;

        private string addlNamedInsuredLessorStateField;

        private string addlNamedInsuredLessorZIPCodeField;
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
        public string Make
        {
            get
            {
                return this.makeField;
            }
            set
            {
                this.makeField = value;
            }
        }

        /// <remarks/>
        public string Model
        {
            get
            {
                return this.modelField;
            }
            set
            {
                this.modelField = value;
            }
        }

        /// <remarks/>
        public string SerialNumber
        {
            get
            {
                return this.serialNumberField;
            }
            set
            {
                this.serialNumberField = value;
            }
        }

        /// <remarks/>
        public string LossPayeeSeqNo
        {
            get
            {
                return this.lossPayeeSeqNoField;
            }
            set
            {
                this.lossPayeeSeqNoField = value;
            }
        }

        /// <remarks/>
        public string RegisteredTo
        {
            get
            {
                return this.registeredToField;
            }
            set
            {
                this.registeredToField = value;
            }
        }

        /// <remarks/>
        public string AutoLiabLimit
        {
            get
            {
                return this.autoLiabLimitField;
            }
            set
            {
                this.autoLiabLimitField = value;
            }
        }

        /// <remarks/>
        public string OTCDeductible
        {
            get
            {
                return this.oTCDeductibleField;
            }
            set
            {
                this.oTCDeductibleField = value;
            }
        }

        /// <remarks/>
        public string COLLDeductible
        {
            get
            {
                return this.cOLLDeductibleField;
            }
            set
            {
                this.cOLLDeductibleField = value;
            }
        }
        /// <remarks/>
        public string AddlNamedInsuredNameLessor
        {
            get
            {
                return this.addlNamedInsuredNameLessorField;
            }
            set
            {
                this.addlNamedInsuredNameLessorField = value;
            }
        }

        /// <remarks/>
        public string AddlNamednsuredLessorAddressLine1
        {
            get
            {
                return this.addlNamednsuredLessorAddressLine1Field;
            }
            set
            {
                this.addlNamednsuredLessorAddressLine1Field = value;
            }
        }

        /// <remarks/>
        public string AddlNamednsuredLessorAddressLine2
        {
            get
            {
                return this.addlNamednsuredLessorAddressLine2Field;
            }
            set
            {
                this.addlNamednsuredLessorAddressLine2Field = value;
            }
        }

        /// <remarks/>
        public string AddlNamednsuredLessorAddressLine3
        {
            get
            {
                return this.addlNamednsuredLessorAddressLine3Field;
            }
            set
            {
                this.addlNamednsuredLessorAddressLine3Field = value;
            }
        }

        /// <remarks/>
        public string AddlNamedInsuredLessorCity
        {
            get
            {
                return this.addlNamedInsuredLessorCityField;
            }
            set
            {
                this.addlNamedInsuredLessorCityField = value;
            }
        }

        /// <remarks/>
        public string AddlNamedInsuredLessorState
        {
            get
            {
                return this.addlNamedInsuredLessorStateField;
            }
            set
            {
                this.addlNamedInsuredLessorStateField = value;
            }
        }

        /// <remarks/>
        public string AddlNamedInsuredLessorZIPCode
        {
            get
            {
                return this.addlNamedInsuredLessorZIPCodeField;
            }
            set
            {
                this.addlNamedInsuredLessorZIPCodeField = value;
            }
        }

    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimLossPayeeSchedule
    {

        private CustomerDataRecordDelimLossPayeeScheduleLossPayee lossPayeeField;

        /// <remarks/>
        public CustomerDataRecordDelimLossPayeeScheduleLossPayee LossPayee
        {
            get
            {
                return this.lossPayeeField;
            }
            set
            {
                this.lossPayeeField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class CustomerDataRecordDelimLossPayeeScheduleLossPayee
    {

        private string recordKeyField;

        private string lossPayeeSeqNoField;

        private string lossPayeeNameField;

        private string lossPayeeAddressLine1Field;

        private string lossPayeeAddressLine2Field;

        private string lossPayeeAddressLine3Field;

        private string lossPayeeCityField;

        private string lossPayeeStateField;

        private string lossPayeeZIPCodeField;

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
        public string LossPayeeSeqNo
        {
            get
            {
                return this.lossPayeeSeqNoField;
            }
            set
            {
                this.lossPayeeSeqNoField = value;
            }
        }

        /// <remarks/>
        public string LossPayeeName
        {
            get
            {
                return this.lossPayeeNameField;
            }
            set
            {
                this.lossPayeeNameField = value;
            }
        }

        /// <remarks/>
        public string LossPayeeAddressLine1
        {
            get
            {
                return this.lossPayeeAddressLine1Field;
            }
            set
            {
                this.lossPayeeAddressLine1Field = value;
            }
        }

        /// <remarks/>
        public string LossPayeeAddressLine2
        {
            get
            {
                return this.lossPayeeAddressLine2Field;
            }
            set
            {
                this.lossPayeeAddressLine2Field = value;
            }
        }

        /// <remarks/>
        public string LossPayeeAddressLine3
        {
            get
            {
                return this.lossPayeeAddressLine3Field;
            }
            set
            {
                this.lossPayeeAddressLine3Field = value;
            }
        }

        /// <remarks/>
        public string LossPayeeCity
        {
            get
            {
                return this.lossPayeeCityField;
            }
            set
            {
                this.lossPayeeCityField = value;
            }
        }

        /// <remarks/>
        public string LossPayeeState
        {
            get
            {
                return this.lossPayeeStateField;
            }
            set
            {
                this.lossPayeeStateField = value;
            }
        }

        /// <remarks/>
        public string LossPayeeZIPCode
        {
            get
            {
                return this.lossPayeeZIPCodeField;
            }
            set
            {
                this.lossPayeeZIPCodeField = value;
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

        private string copyToAddressLine2Field;

        private string copyToAddressLine3Field;


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
        public string CopyToAddressLine2
        {
            get
            {
                return this.copyToAddressLine2Field;
            }
            set
            {
                this.copyToAddressLine2Field = value;
            }
        }
        public string CopyToAddressLine3
        {
            get
            {
                return this.copyToAddressLine3Field;
            }
            set
            {
                this.copyToAddressLine3Field = value;
            }
        }

    }
}

