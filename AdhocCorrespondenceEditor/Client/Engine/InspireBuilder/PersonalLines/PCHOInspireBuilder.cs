using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL.DWHO;
using AdhocCorrespondenceEditor.Shared.PL;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCHOInspireBuilder : PLDWHOInspireBase
    {
        protected override XmlAttributeOverrides GetXMLOverrides()
        {
            XmlElementAttribute attr = new XmlElementAttribute();
            attr.ElementName = "HOMEOWNERS_REC";
            attr.Type = typeof(CUSTOMER_DATARECORD_DELIMDWELLING_REC);

            XmlAttributes attrs = new XmlAttributes();
            attrs.XmlElements.Add(attr);

            var overrides = new XmlAttributeOverrides();
            overrides.Add(typeof(CUSTOMER_DATARECORD_DELIM), "DWHO_REC", attrs);

            return overrides;
        }
        protected override void ProcessPolicyAndAccountRecord()
        {
            base.ProcessPolicyAndAccountRecord();
            //PL Home specific tags
            ProcessHomeSpecificTags();
        }
        private void ProcessHomeSpecificTags()
        {
            var dwellingLine = SourcePolicyPeriod.PolicyLines.Where(p => p.HomeownersLine != null).FirstOrDefault()?.HomeownersLine;
            var windHailed = dwellingLine.CoveragesElectionParameters.Where(s => s.CoverageParameterTypeCd == "Windstorm/HailDeductible").FirstOrDefault();
            InspireDWHORec.WindHailDed_HO = windHailed?.CoverageParameterUnformattedValueTx;
            var relatedPolicy = SourcePolicyPeriod.RelatedPolicies.Where(p => p.RelationshipReasonCd == "Primary").FirstOrDefault()?.Policy;
            InspireDWHORec.PRIMARY_POL_NUM = relatedPolicy?.PolicyNumber;

            InspireDWHORec.COV_D_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_D_Home);
            InspireDWHORec.COV_E_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_E_Home);

            PLUserDataEntity?.PolicyNumberSelected?.ForEach(policy =>
            {
                var polNum = new CUSTOMER_DATARECORD_DELIMADDL_POL_NUM();
                polNum.ADDL_POLNUM = policy;
                polNum.POL_FK = GetConfigValue(nameof(InspireDWHORec.POL_PK));
                InspireCustomerRec.ADDL_POL_NUM.Add(polNum);
            });
            PLUserDataEntity?.HO61DetailsList?.ForEach(home =>
                {
                    CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO ho61 = new CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO();
                    ho61.HO_61_DESC = home.Description;
                    ho61.SCHED_PRSNL_PROP_APP = home.IsFloaterForm ? ApplicationConstants.YES : null;
                    ho61.DESC_APPR = home.IsDescAppraisal ? ApplicationConstants.YES : null;
                    ho61.NUM_OF = home.NumberOf;
                    ho61.CLRTY = home.ColorClarity;
                    ho61.CLRTY_MAN_ENTRY = home.ColorClarityText;
                    ho61.CARAT_WGHT = home.IsCaratWeight ? ApplicationConstants.YES : null;
                    ho61.WATCH = home.IsWatch ? ApplicationConstants.YES : null;
                    ho61.WGHT_OF = home.WeightOf;
                    ho61.SEP_VALUE = home.SeparateValue;
                    ho61.FURS = home.IsFurs ? ApplicationConstants.YES : null;
                    ho61.LNGTH_SWEEP = home.IsLengthSweep ? ApplicationConstants.YES : null;
                    ho61.RECEIPT = home.IsReceipt ? ApplicationConstants.YES : null;
                    ho61.CERT = home.Certificates;
                    ho61.CERT_NUM = home.CertificateNumber;
                    ho61.HO_61_FREE_FORM1 = home.FreeForm1;
                    ho61.HO_61_FREE_FORM2 = home.FreeForm2;
                    ho61.POL_FK = GetConfigValue(nameof(InspireDWHORec.POL_PK));
                    ho61.HO_61_ADDL_TYPE = home.ControlType;
                    InspireCustomerRec.HO61_ADTL_INFO.Add(ho61);
                }
            );
            PLUserDataEntity?.UpdateAppraisalNames?.ForEach(home =>
                {
                    CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO ho61 = new CUSTOMER_DATARECORD_DELIMHO61_ADTL_INFO();
                    ho61.HO_61_DESC = home;
                    ho61.POL_FK = GetConfigValue(nameof(InspireDWHORec.POL_FK));
                    ho61.HO_61_ADDL_TYPE = GetConfigValue(nameof(InspireCustomerRec.HO61_ADTL_INFO)); ;
                    InspireCustomerRec.HO61_ADTL_INFO.Add(ho61);
                }
            );

             InspireDWHORec.HO_61_ADD_ADDL_INFO = PLUserDataEntity?.HO61DetailsList?.Where(h=> h.ControlType == ApplicationConstants.Added)?.Count() > 0 ? ApplicationConstants.YES: ApplicationConstants.NO;
             InspireDWHORec.HO_61_NADD_ADDL_INFO = PLUserDataEntity?.HO61DetailsList?.Where(h => h.ControlType == ApplicationConstants.NotAdded)?.Count() > 0 ? ApplicationConstants.YES : ApplicationConstants.NO;
             InspireDWHORec.HO_61_DCLN_ADDL_INFO = PLUserDataEntity?.HO61DetailsList?.Where(h => h.ControlType == ApplicationConstants.Declined)?.Count() > 0 ? ApplicationConstants.YES : ApplicationConstants.NO;
             InspireDWHORec.HO_61_UPD_APPR = PLUserDataEntity?.UpdateAppraisalNames?.Count() > 0 ? ApplicationConstants.YES : ApplicationConstants.NO;

            var address = GetHomeAddress(ApplicationConstants.Address_Home);
            if (address?.Address != null)
            {
                InspireDWHORec.HOME_ADDR_1 = address.Address.Line1Tx;
                InspireDWHORec.HOME_ADDR_2 = address.Address.Line2Tx;
                InspireDWHORec.HOME_ADDR_3 = address.Address.Line3Tx;
                InspireDWHORec.HOME_CTY = ApplicationClassUtility.GetMunicipalityByType(ApplicationConstants.CITY, address.Address);
                InspireDWHORec.HOME_ST = address.Address.CountrySubdivision.CountrySubdivisionNm;
                InspireDWHORec.HOME_ZIP = address.Address.PostalCd;
            }

        }
        private PartyAddress GetHomeAddress(string addressCd)
        {
            var namedInsured = SourcePolicyPeriod?.ListedParties?.Where(l => l.Party.PartyRoles.Contains(ApplicationConstants.PrimaryNamedInsured));
            namedInsured = namedInsured.Where(l => l.Party.Person.Addresses != null);
           // var aa = namedInsured.FirstOrDefault()?.Party?.Person?.Addresses;
            return namedInsured.FirstOrDefault()?.Party?.Person?.Addresses.Where(a => a.AddressUseCd == addressCd && a.PrimaryAddressIn =="True").FirstOrDefault();
        }
    }
}
