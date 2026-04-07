using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.Multi;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.PCMulti;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCMultiInspireBuilder : CLInspireBuilderBase
    {
        protected CLMultiInspireEntity CLMultiInspireEntity { get; set; }
        private MultiUserEntity CLUserDataEntity { get; set; }
        private PCMultiSourceSystemEntity PCMultiSourceSystemEntity { get; set; }

        protected override void CreateInspireRequest()
        {
            CLUserDataEntity = (MultiUserEntity)UserInputData;
            PCMultiSourceSystemEntity = (PCMultiSourceSystemEntity)SourceSystemData;
            CLMultiInspireEntity = new CLMultiInspireEntity();
        }

        protected override void ProcessPolicyAndAccountRecord()
        {
            CopyAccountRecord();
            CopyMultilineQuote();
        }
        private void CopyAccountRecord()
        {
            var sourceAccRecord = PCMultiSourceSystemEntity.RetrieveAccountInformationResponseMessage.AccountInformation;
            var destinationAcountRecord = CLMultiInspireEntity.CustomerData.RecordDelim.AccountRecord;

            ProcessAccountRecord(sourceAccRecord.AccountNumber,
                                 sourceAccRecord.PolicyTransactions.FirstOrDefault()?.UnderwritingCompany,
                                 CLMultiInspireEntity.CustomerData.RecordDelim.AccountRecord,
                                 CLUserDataEntity.AddresseeAddress,
                                 CLUserDataEntity.PrinterDetails);
            
            //override the following for multi
            destinationAcountRecord.RecordKey = GetConfigValue(nameof(destinationAcountRecord.RecordKey));
            destinationAcountRecord.InsuranceCompanyName = sourceAccRecord.PolicyTransactions.FirstOrDefault()?.UnderwritingCompany;
            destinationAcountRecord.AddresseeCompanyName = sourceAccRecord.AccountHolderContactInfo.Name;

            destinationAcountRecord.DistAgencyName = CLUserDataEntity.DistributionPartnerInfo.DisplayName;
            destinationAcountRecord.DistAgencyAddress1 = CLUserDataEntity.DistributionPartnerInfo.Line1Tx;
            destinationAcountRecord.DistAgencyAddress2 = CLUserDataEntity.DistributionPartnerInfo.Line2Tx;
            destinationAcountRecord.DistAgencyAddress3 = CLUserDataEntity.DistributionPartnerInfo.Line3Tx;
            destinationAcountRecord.DistAgencyCity = CLUserDataEntity.DistributionPartnerInfo.MunicipalityNm;
            destinationAcountRecord.DistAgencyState = CLUserDataEntity.DistributionPartnerInfo.CountrySubdivisionNm;
            destinationAcountRecord.DistAgencyZip = CLUserDataEntity.DistributionPartnerInfo.PostalCd;

            destinationAcountRecord.DRName =  CLUserDataEntity.DistributionRepInfo.DisplayName;
            destinationAcountRecord.DRPhone = CLUserDataEntity.DistributionRepInfo.Phone;
            destinationAcountRecord.DREmail = CLUserDataEntity.DistributionRepInfo.Email;

            destinationAcountRecord.UWName =  CLUserDataEntity.UnderWriterInfoID.DisplayName;
            destinationAcountRecord.UWPhone = CLUserDataEntity.UnderWriterInfoID.Phone;
            destinationAcountRecord.UWEmail = CLUserDataEntity.UnderWriterInfoID.Email;
        }

        private void CopyMultilineQuote()
        {
            int index = 0;
            string onBaseKeyword = string.Empty;
            var multiLineQuote = CLMultiInspireEntity.CustomerData.RecordDelim.MultiLineQuote;
            multiLineQuote.QuoteDetails = new CustomerDataRecordDelimMultiLineQuoteQuoteDetails[CLUserDataEntity.Quotations.Count];
            var policyTransactions = PCMultiSourceSystemEntity.RetrieveAccountInformationResponseMessage.AccountInformation.PolicyTransactions.ToList();
            multiLineQuote.TotPremium =  CLUserDataEntity.TotalPremium.ToString();
            CLUserDataEntity.Quotations?.ForEach(quote =>
            {
                var policyTransaction = policyTransactions.Where(c => c.QuoteID == quote).FirstOrDefault();
                if (policyTransaction != null)
                {
                    multiLineQuote.QuoteDetails[index] = new CustomerDataRecordDelimMultiLineQuoteQuoteDetails();
                    multiLineQuote.QuoteDetails[index].RecordKey = GetConfigValue(nameof(CLMultiInspireEntity.CustomerData.RecordDelim.AccountRecord.RecordKey));
                    multiLineQuote.QuoteDetails[index].LOB = policyTransaction.LineOfBusiness;
                    multiLineQuote.QuoteDetails[index].Year = ConvertToDate(policyTransaction.EffectiveDate, "yyyy");
                    multiLineQuote.QuoteDetails[index].EffDate = ConvertToDate(policyTransaction.EffectiveDate);
                    multiLineQuote.QuoteDetails[index].ExpDate = ConvertToDate(policyTransaction.ExpirationDate);
                    multiLineQuote.QuoteDetails[index].QuoteNumber = policyTransaction.QuoteID;
                    multiLineQuote.QuoteDetails[index].Premium = policyTransaction.TotalPremium.HasValue ? policyTransaction.TotalPremium.Value : decimal.Zero;
                    multiLineQuote.QuoteDetails[index].QuoteType = GetTransactionType(policyTransaction.TransactionType);
                    multiLineQuote.QuoteDetails[index].UWCompany = policyTransaction.UnderwritingCompany;

                    if (policyTransaction.SubLineInfo.Length > 0)
                    {
                        multiLineQuote.QuoteDetails[index].LineDetails = new CustomerDataRecordDelimMultiLineQuoteQuoteDetailsLineDetails[policyTransaction.SubLineInfo.Length];
                        int lineDetail = 0;
                        foreach (var subLine in policyTransaction.SubLineInfo)
                        {
                            multiLineQuote.QuoteDetails[index].LineDetails[lineDetail] = new CustomerDataRecordDelimMultiLineQuoteQuoteDetailsLineDetails();
                            multiLineQuote.QuoteDetails[index].LineDetails[lineDetail].RecordKey = GetConfigValue(nameof(CLMultiInspireEntity.CustomerData.RecordDelim.AccountRecord.RecordKey));
                            multiLineQuote.QuoteDetails[index].LineDetails[lineDetail].Line = GetPolicyLine(subLine.PolicyLine);
                            multiLineQuote.QuoteDetails[index].LineDetails[lineDetail].LinePremium = subLine.Premium.HasValue ? subLine.Premium.Value : decimal.Zero;
                            lineDetail++;
                        }
                    }
                }
                onBaseKeyword += GetOnbaseIdPerQuote(multiLineQuote.QuoteDetails[index].LOB);
                index++;
            });
            CLMultiInspireEntity.CustomerData.RecordDelim.AccountRecord.OnBaseKeyword1 = 
                           onBaseKeyword.Length > 0 ? onBaseKeyword.Substring(0, onBaseKeyword.LastIndexOf(','))
                           :string.Empty;
        }
        private string GetTransactionType(string transactionType)
        {
            ILookup<string, string> lookup = ApplicationConstants.TransactionType.
                                                ToLookup(x => x.Key, x => x.Value);

            return lookup[transactionType].SingleOrDefault();
        }
        private string GetOnbaseIdPerQuote(string lob)
        {
            string comma = ",";
            ILookup<string, string> lookup = ApplicationConstants.Quote.
                                                ToLookup(x => x.Key, x => x.Value);

            var onbaseId = lookup[lob].SingleOrDefault();
            return onbaseId == null ? ("C" + comma) : (onbaseId + comma);
        }
        private string GetPolicyLine(string policyLine)
        {
            ILookup<string, string> lookup = ApplicationConstants.PolicyLine.
                                                ToLookup(x => x.Key, x => x.Value);

            return lookup[policyLine].SingleOrDefault();
        }
        protected override void ProcessUserInputData()
        {
            //copy table of contents
            var tableOfContent = CLMultiInspireEntity.CustomerData.RecordDelim.TableOfContents;
            tableOfContent.Document.DocumentName = DocumentData.documentEntity.DocumentName;
            
            //copy CopiesTo section data if present
            // None for this lob - multi
        }
        protected override void CreateCustomTags()
        {
           return;  //none for this lob - multi
        }
        protected override string SeriliazeInspireRequest()
        {
            var emptyNamespaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var serializer = new XmlSerializer(typeof(CustomerData));

            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;

            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, CLMultiInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
        }
        protected override void ProcessRules()
        {
        }
    }
}
