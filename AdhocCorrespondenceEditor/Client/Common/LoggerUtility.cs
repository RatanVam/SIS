using AdhocCorrespondenceEditor.Shared;
using System.Runtime.CompilerServices;

namespace AdhocCorrespondenceEditor.Client
{
    public class LoggerUtility
    {
        public LoggerUtility(string url, string display)
        {
            baseURL = url;
            displayText = display;
        }
        static readonly HttpClient client = new HttpClient();
        Log postBody = new Log();
        string baseURL;
        string displayText;
        public async void LogInfoAsync(LogType category, Exception ex, [CallerFilePath] string className = "",[CallerMemberName] string context = "")
        {
            var split = Path.GetFileNameWithoutExtension(className).Split('\\');
            postBody.Category = category;
            postBody.Context = split?.Length > 0 ? split[split.Count() - 1]  + " " + context: String.Empty;
            postBody.Message = displayText + " " + ex.Message + " " + ex.InnerException ?? ex.InnerException.Message;
            client.PostAsJsonAsync<Log>(baseURL + "api/Log/", postBody);
        }

        public async void LogInfoAsync(LogType category, string msg, [CallerFilePath] string className = "", [CallerMemberName] string context = "")
        {
            var split = Path.GetFileNameWithoutExtension(className).Split('\\');
            postBody.Category = category;
            postBody.Context = split?.Length > 0?split[split.Count()-1]+ " " + context:String.Empty ;
            postBody.Message = displayText + " " + msg;
            client.PostAsJsonAsync<Log>(baseURL + "api/Log/", postBody);

        }

    }
}
