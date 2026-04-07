using AdhocCorrespondenceEditor.Shared;
using NJM.DotNetLibrary.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;

namespace AdhocCorrespondenceEditor.Utility
{
    public static class Logger
    {
        public static void Details(Shared.Log message)
        {

            if (message == null)
                return;
            
            
            switch (message.Category)
            {

                case LogType.Warning:
                    LogAsync.Warning(message.Context, message.Message);
                    break;
                case LogType.Error:
                    LogAsync.Error(message.Context, message.Message);
                    break;
                case LogType.Notify:
                    LogAsync.Notify(new Exception(message.Message), message.Context, message.Message);
                    break;
                case LogType.Information:
                default:
                    LogAsync.Information(message.Context, message.Message);
                    break;
            }

        }


        public static void LogESBData(string context, object esbResponse)
        {
            if (esbResponse == null)
                return;
           

            
            var emptyNamespaces = new XmlSerializerNamespaces(new[] { XmlQualifiedName.Empty });
            var type = esbResponse.GetType();
            var serializer = new XmlSerializer(type);
            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = true;
            using (var stream = new StringWriter())
            using (var writer = XmlWriter.Create(stream, settings))
            {
                serializer.Serialize(writer, esbResponse, emptyNamespaces);
                var xmlString = stream.ToString();
                LogAsync.Information(context, stream.ToString());
            }
        }
    }
}
