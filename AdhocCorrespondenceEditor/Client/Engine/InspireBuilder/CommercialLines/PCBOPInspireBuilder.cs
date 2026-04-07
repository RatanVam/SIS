using System.Xml;
using System.Xml.Serialization;
using AdhocCorrespondenceEditor.Shared.DTO.InspireEntity;

namespace AdhocCorrespondenceEditor.Client
{
    public class PCBOPInspireBuilder : CLInspireBuilder
    {
        protected override string SeriliazeInspireRequest()
        {
            var overrides = GetXMLOverrides();
            var emptyNamespaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var serializer = new XmlSerializer(typeof(CustomerData), overrides);

            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;

            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, CLInspireEntity.CustomerData, emptyNamespaces);
                return stream.ToString();
            }
        }
        private XmlAttributeOverrides GetXMLOverrides()
        {
            XmlElementAttribute attr = new XmlElementAttribute();
            attr.ElementName = "BOPPolicyRecord";
            attr.Type = typeof(CustomerDataRecordDelimPolicyRecord);

            XmlAttributes attrs = new XmlAttributes();
            attrs.XmlElements.Add(attr);

            var overrides = new XmlAttributeOverrides();
            overrides.Add(typeof(CustomerDataRecordDelim), "PolicyRecord", attrs);

            return overrides;
        }

    }
}
