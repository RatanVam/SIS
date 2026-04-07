namespace AdhocCorrespondenceEditor.Shared
{
    public class Log
    {
        public string Message { get; set; }
        public LogType Category { get; set; }

        public string Context { get; set; }

    }

    public enum LogType
    {
        Information,
        Warning,
        Error,
        Notify
    }
}
