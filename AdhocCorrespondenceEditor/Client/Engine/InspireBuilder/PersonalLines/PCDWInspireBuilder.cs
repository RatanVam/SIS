using AdhocCorrespondenceEditor.Client.Common;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity.PL.DWHO;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCDWInspireBuilder : PLDWHOInspireBase
    {
        protected override XmlAttributeOverrides GetXMLOverrides()
        {
            XmlElementAttribute attr = new XmlElementAttribute();
            attr.ElementName = "DWELLING_REC";
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
           
            //Dewelling specific tags
            var homeOwnerLine = SourcePolicyPeriod?.PolicyLines.Where(p => p.HomeownersLine != null).FirstOrDefault();
            InspireDWHORec.OCCUPIED_BY_WHOM = homeOwnerLine?.HomeownersLine?.ListedDwellings.Where(l => l.Occupancy != null).FirstOrDefault()?.Occupancy;
            InspireDWHORec.NEW_CALC_RCT_VAL = homeOwnerLine?.HomeownersLine?.ListedDwellings.Where(l => l.DwellingTypeCd == "Risk").FirstOrDefault()?.ReplacementCostAm;

            InspireDWHORec.COV_D_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_D_Dwelling);
            InspireDWHORec.COV_E_LMT_LIAB = GetCoverageAmount(ApplicationConstants.Coverage_E_Dwelling);

            var dwellingLine = SourcePolicyPeriod.PolicyLines.Where(p => p.HomeownersLine != null).FirstOrDefault()?.HomeownersLine;
            var lmtOfLiability = dwellingLine.CoveragesElectionParameters.Where(c => c.CoverageParameterTypeCd == "LiabilityLimit").FirstOrDefault();
            var medicalLiability = dwellingLine.CoveragesElectionParameters.Where(c => c.CoverageParameterTypeCd == "MedicalPaymentLimit").FirstOrDefault();
            InspireDWHORec.PERS_LIAB_LMT = lmtOfLiability?.CoverageParameterUnformattedValueTx;
            InspireDWHORec.MED_PYMT_LMT = medicalLiability?.CoverageParameterUnformattedValueTx;

            var windHailed = dwellingLine.CoveragesElectionParameters.Where(s => s.CoverageParameterTypeCd == "Windstorm/HailDeductible").FirstOrDefault();
            InspireDWHORec.WindHailDed_DW = windHailed?.CoverageParameterUnformattedValueTx;
        }
    }
}
