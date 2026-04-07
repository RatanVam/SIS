using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.CL;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.PCCA;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public class CLInspireBuilder : CLInspireBuilderBase
    {
        protected CLInspireEntity CLInspireEntity { get; set; }
        private CLUserEntity CLUserDataEntity { get; set; }
        private CLSourceSystemEntity CLSourceSystemEntity { get; set; }

        protected override void CreateInspireRequest()
        {
            CLUserDataEntity = (CLUserEntity)UserInputData;
            CLSourceSystemEntity = (CLSourceSystemEntity)SourceSystemData;
            CLInspireEntity = new CLInspireEntity();
        }

        protected override void ProcessPolicyAndAccountRecord()
        {
            CopyAccountRecord();
            CopyPolicyRecord();
        }

        private void CopyAccountRecord()
        {
            var sourceAccRecord = CLSourceSystemEntity.PolicyData.Policy;

            ProcessAccountRecord(  sourceAccRecord.Account.AccountNo,
                                        sourceAccRecord.UnderwritingCompany.OrganizationNameCd,
                                        CLInspireEntity.CustomerData.RecordDelim.AccountRecord,
                                        CLUserDataEntity.AddresseeAddress,
                                        CLUserDataEntity.PrinterDetails);
        }

        private void CopyPolicyRecord()
        {
            var sourceCaPolicy = CLSourceSystemEntity.PolicyData.Policy;
            var destinationCaPolicy = CLInspireEntity.CustomerData.RecordDelim.PolicyRecord;

            destinationCaPolicy.RecordKey = GetConfigValue(nameof(destinationCaPolicy.RecordKey));
            destinationCaPolicy.NJMPolicyNumber = (sourceCaPolicy.PolicyNumber == ApplicationConstants.Unassigned) ? null : sourceCaPolicy.PolicyNumber;
            destinationCaPolicy.QuoteNumber = sourceCaPolicy.PolicyPeriod.QuoteNumber;
            destinationCaPolicy.ProductCode = GetConfigValue(nameof(destinationCaPolicy.ProductCode));
            destinationCaPolicy.IndustryCode = sourceCaPolicy.IndustryOfferingCd;
            destinationCaPolicy.PolicyNumPrefixDisplay = sourceCaPolicy.PolicyProductCd;
            destinationCaPolicy.NJMPolicyHolderName1 = GetNJMPolocyHolderName1();
            destinationCaPolicy.BaseState = sourceCaPolicy.BaseStateCd;
            destinationCaPolicy.UWCompanyName = sourceCaPolicy.UnderwritingCompany.OrganizationNm;
            destinationCaPolicy.PolEffectiveDate = sourceCaPolicy.PolicyPeriod.StartDt;
            destinationCaPolicy.PolicyEffectiveYear = sourceCaPolicy.PolicyPeriod.StartDt.Year.ToString();
            destinationCaPolicy.PolExpirationDate = sourceCaPolicy.PolicyPeriod.EndDt;
        }

        protected override void ProcessUserInputData()
        {
            //copy table of contents
            var tableOfContent = CLInspireEntity.CustomerData.RecordDelim.TableOfContents;
            tableOfContent.Document.DocumentName = DocumentData.documentEntity.DocumentName;

            CopyVehicleSchedule();
            CopyCopiesToSection();
        }

        private void CopyVehicleSchedule()
        {
            var destinationVehicle = CLInspireEntity.CustomerData.RecordDelim.VehicleSchedule.Vehicle;
            var sourceVehicle = CLUserDataEntity.PCCAVehicle;

            //check if vehicle info present
            if (sourceVehicle != null)
            {
                destinationVehicle.RecordKey = GetConfigValue(nameof(destinationVehicle.RecordKey)); 
                destinationVehicle.Year = sourceVehicle.Year;
                destinationVehicle.Make = sourceVehicle.Make;
                destinationVehicle.Model = sourceVehicle.Model;
                destinationVehicle.SerialNumber = sourceVehicle.SerialNumber;
                destinationVehicle.LossPayeeSeqNo = string.IsNullOrEmpty(sourceVehicle.LossPayeeSeqNo) ? "1" : sourceVehicle.LossPayeeSeqNo;
                destinationVehicle.RegisteredTo = string.IsNullOrEmpty(sourceVehicle.RegisteredTo) ? String.Empty : sourceVehicle.RegisteredTo;


                foreach (var coverageDetail in CLUserDataEntity.PCCAVehicle.CoverageTypes)
                {
                    if (coverageDetail.CoverageTypeCd == "Liability")
                        destinationVehicle.AutoLiabLimit = coverageDetail.CoverageParameterUnformattedValueTx;
                    else if (coverageDetail.CoverageTypeCd == "Comprehensive" && coverageDetail.CoverageParameterTypeCd == "Comprehensive Deductible")
                        destinationVehicle.OTCDeductible = coverageDetail.CoverageParameterUnformattedValueTx;
                    else if (coverageDetail.CoverageTypeCd == "Collision")
                        destinationVehicle.COLLDeductible = coverageDetail.CoverageParameterUnformattedValueTx;
                }

                foreach (var party in CLUserDataEntity.PCCAVehicleParties)
                {
                    if (party.PartyRole.Contains("Lessor"))
                    {
                        destinationVehicle.AddlNamednsuredLessorAddressLine1 = party.Address.Line1Tx;
                        destinationVehicle.AddlNamednsuredLessorAddressLine2 = string.IsNullOrEmpty(party.Address.Line2Tx) ? String.Empty: party.Address.Line2Tx;
                        destinationVehicle.AddlNamednsuredLessorAddressLine3 = string.IsNullOrEmpty(party.Address.Line3Tx) ? String.Empty : party.Address.Line3Tx;  
                        destinationVehicle.AddlNamedInsuredLessorCity = party.Address.MunicipalityNm;
                        destinationVehicle.AddlNamedInsuredLessorState = party.Address.CountrySubdivisionNm;
                        destinationVehicle.AddlNamedInsuredLessorZIPCode = party.Address.PostalCd;
                        destinationVehicle.AddlNamedInsuredNameLessor = party.Address.DisplayName;
                    }
                    else if (party.PartyRole.Contains("Lien Holder"))
                    {
                        var lossPayeeSchedule = CLInspireEntity.CustomerData.RecordDelim.LossPayeeSchedule;

                        lossPayeeSchedule.LossPayee = new CustomerDataRecordDelimLossPayeeScheduleLossPayee();
                        lossPayeeSchedule.LossPayee.RecordKey = GetConfigValue(nameof(lossPayeeSchedule.LossPayee.RecordKey));
                        lossPayeeSchedule.LossPayee.LossPayeeSeqNo = GetConfigValue(nameof(lossPayeeSchedule.LossPayee.LossPayeeSeqNo));
                        lossPayeeSchedule.LossPayee.LossPayeeAddressLine1 = string.IsNullOrEmpty(party.Address.Line1Tx) ? String.Empty : party.Address.Line1Tx; 
                        lossPayeeSchedule.LossPayee.LossPayeeAddressLine2 = string.IsNullOrEmpty(party.Address.Line2Tx) ? String.Empty: party.Address.Line2Tx;
                        lossPayeeSchedule.LossPayee.LossPayeeAddressLine3 = string.IsNullOrEmpty(party.Address.Line3Tx) ? String.Empty: party.Address.Line3Tx;
                        lossPayeeSchedule.LossPayee.LossPayeeCity = string.IsNullOrEmpty(party.Address.MunicipalityNm) ? String.Empty : party.Address.MunicipalityNm;
                        lossPayeeSchedule.LossPayee.LossPayeeState = string.IsNullOrEmpty(party.Address.CountrySubdivisionNm) ? String.Empty : party.Address.CountrySubdivisionNm;
                        lossPayeeSchedule.LossPayee.LossPayeeZIPCode = string.IsNullOrEmpty(party.Address.PostalCd) ? String.Empty : party.Address.PostalCd;
                        lossPayeeSchedule.LossPayee.LossPayeeName = string.IsNullOrEmpty(party.Address.DisplayName) ? String.Empty : party.Address.DisplayName;
                    }
                }
            }
            else // remove the object if vehicle is not used, so that it gets removed from XML
            {
                CLInspireEntity.CustomerData.RecordDelim.VehicleSchedule = null;
                CLInspireEntity.CustomerData.RecordDelim.LossPayeeSchedule = null;
            }

            if (CLInspireEntity.CustomerData.RecordDelim.LossPayeeSchedule != null)
            {
                if (CLInspireEntity.CustomerData.RecordDelim.LossPayeeSchedule.LossPayee == null)
                    CLInspireEntity.CustomerData.RecordDelim.LossPayeeSchedule = null;
            }
        }

        private void CopyCopiesToSection()
        {
            int index = 0;
            var sourceCopiesTo = CLUserDataEntity.CopiesTo;
            CLInspireEntity.CustomerData.RecordDelim.CopiesTo = new CustomerDataRecordDelimCopyTo[sourceCopiesTo.Count];

            foreach (var copyTo in sourceCopiesTo)
            {
                CustomerDataRecordDelimCopyTo copyRecord = new CustomerDataRecordDelimCopyTo();
                copyRecord.CopyToName = string.IsNullOrEmpty(copyTo.CopyToName.Trim()) ? null: copyTo.CopyToName.Trim();
                copyRecord.CopyToCompanyName = copyTo.CopyToCompanyName;
                copyRecord.CopyToAddressLine1 = copyTo.CopyToAddressLine1;
                copyRecord.CopyToAddressLine2 = copyTo.CopyToAddressLine2;
                copyRecord.CopyToAddressLine3 = copyTo.CopyToAddressLine3;
                copyRecord.CopyToCity = copyTo.CopyToCity;
                copyRecord.CopyToState = copyTo.CopyToState;
                copyRecord.CopyToZIP = copyTo.CopyToZIP;
                CLInspireEntity.CustomerData.RecordDelim.CopiesTo[index++] = copyRecord;
            }
        }
        protected override void CreateCustomTags()
        {
            var sourceAccRecord = CLSourceSystemEntity.PolicyData.Policy; 
            var destinationAccRecord = CLInspireEntity.CustomerData.RecordDelim.AccountRecord;

            destinationAccRecord.Tag4 = GetConfigValue(nameof(destinationAccRecord.Tag4));
            destinationAccRecord.Tag4Num = GetConfigValue(nameof(destinationAccRecord.Tag4Num)); 
            destinationAccRecord.Value4 = (sourceAccRecord.PolicyNumber == ApplicationConstants.Unassigned) ? null : sourceAccRecord.PolicyNumber;

            destinationAccRecord.Tag6 = GetConfigValue(nameof(destinationAccRecord.Tag6));
            destinationAccRecord.Tag6Num = GetConfigValue(nameof(destinationAccRecord.Tag6Num));
            destinationAccRecord.Value6 = sourceAccRecord.Account.AccountNo;

            destinationAccRecord.Tag12 = GetConfigValue(nameof(destinationAccRecord.Tag12));
            destinationAccRecord.Tag12Num = GetConfigValue(nameof(destinationAccRecord.Tag12Num));
            destinationAccRecord.Value12 = GetConfigValue(nameof(destinationAccRecord.Value12));
        }
        protected override string SeriliazeInspireRequest()
        {
            throw new NotImplementedException();
        }
        private string GetNJMPolocyHolderName1()
        {
            var partyListData = CLSourceSystemEntity.PolicyData.Policy.PolicyPeriod.ListedParties.Select(x => x.Party).ToList();
            string name = string.Empty;
            foreach (var party in partyListData)
            {
                if (party.Organization == null)
                {
                    if (party.PartyRoles.Contains("Primary Named Insured"))
                    {
                        name = party.Person.PersonName.UnparsedNameTx;
                        break;
                    }
                }
                else
                {
                    if (party.PartyRoles.Contains("Primary Named Insured"))
                    {
                        name = party.Organization.OrganizationNm;
                        break;
                    }
                }
            }
            return name;
        }
        protected override void ProcessRules()
        {
        }
        private void AddEmail()
        {
            var destinationAccRecord = CLInspireEntity.CustomerData.RecordDelim.AccountRecord;
            destinationAccRecord.EMAIL_IND = CLUserDataEntity?.EmailAddress is null ? null : ApplicationConstants.NO;
            if (!string.IsNullOrEmpty(CLUserDataEntity.EmailAddress))
            {
                destinationAccRecord.EMAIL_TO = CLUserDataEntity.EmailAddress;
                destinationAccRecord.EMAIL_IND = ApplicationConstants.YES;
                destinationAccRecord.EMAIL_SUBJECT = String.Format(GetConfigValue(nameof(destinationAccRecord.EMAIL_SUBJECT)));
                destinationAccRecord.EMAIL_FROM = GetConfigValue(nameof(destinationAccRecord.EMAIL_FROM));
                destinationAccRecord.EMAIL_BODY = GetConfigValue(nameof(destinationAccRecord.EMAIL_BODY));
            }
        }
    }
}
