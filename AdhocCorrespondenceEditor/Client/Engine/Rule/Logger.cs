using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    public class Logger
    {
        static readonly HttpClient client = new HttpClient();

        public async static void LogInfoAsync(Exception ex, string BaseUri)
        {
            Log postBody = new Log();
            postBody.Category = LogType.Error;
            postBody.Context = "ACE Rule Excecution Error";
            postBody.Message = ex.Message + " " + ex.InnerException ?? ex.InnerException.Message;
            client.PostAsJsonAsync<Log>(BaseUri + "api/Log/", postBody);
        }
        public async static void LogInfoAsync(string messageInfo, string BaseUri)
        {
            Log postBody = new Log();
            postBody.Category = LogType.Information;
            postBody.Context = "ACE Rule Execution Info";
            postBody.Message = messageInfo;
            client.PostAsJsonAsync<Log>(BaseUri + "api/Log/", postBody);
        }


    }
}
