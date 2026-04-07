using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Client.Common
{
    public static class Utility
    {

        public static string SeriliazeInspireRequest(Type type, dynamic source)
        {
            var emptyNamespaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var serializer = new XmlSerializer(type);
            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;

            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, source, emptyNamespaces);
                return stream.ToString();
            }
            return null;
        }

        public static DateTime GetTriggerDate(DateTime dt)
        {
            DateTime middleDate = GetHalf(dt);
            DateTime pCTriggerDate = middleDate;
            pCTriggerDate = pCTriggerDate.AddDays(-15);
            return pCTriggerDate;
        }

        public static DateTime GetHalf(DateTime date)
        {
            DateTime half = new DateTime(date.Year, date.Month, date.Day);
            half = half.AddMonths(6);
            return half;
        }

        public static void UpdateValue(object currentObj, string variableName, object variableValue)
        {
            foreach (var property in currentObj.GetType().GetProperties())
            {
                if (property.Name == variableName)
                {
                    property.SetValue(currentObj, variableValue);
                }
            }
        }

        public static string PhoneFormate(string areaCode, string exchangeCode, string number)
        {
            return $"({areaCode}) {exchangeCode}-{number}";
        }

        public static string NameFormate(string first, string middle, string last)
        {
            return (GetName(first) + GetName(middle) + GetName(last)).Trim();
        }
        static string GetName(string? Value)
        {
            return string.IsNullOrEmpty(Value) ? string.Empty : $"{Value} ";
        }

        public static bool ValidateEmailUsingRegex(string emailAddress)
        {
            if (string.IsNullOrEmpty(emailAddress?.Trim()))
                return true;
            if (emailAddress.Trim().Contains(".@"))
                return false;
            var pattern = @"^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";
            var regex = new Regex(pattern);
            return string.IsNullOrEmpty(emailAddress) ? true : regex.IsMatch(emailAddress?.Trim());
        }
    }
}
