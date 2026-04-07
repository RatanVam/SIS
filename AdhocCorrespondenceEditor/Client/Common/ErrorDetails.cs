using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client
{
    public class ErrorDetails
    {
        public string Error { get; set; } = string.Empty;
        public string InnerException { get; set; } = string.Empty;
        public string ErrorCode { get; set; } = string.Empty;
        
        bool isoutputInValid = false;
        public bool IsOutputInValid
        {
            get
            {
                return isoutputInValid;
            }
            set
            {
                isoutputInValid = value;
                if (isoutputInValid)
                    IsInValid = isoutputInValid;
            }
        }
        public bool IsInValid { get; set; }

        public bool IsError
        {
            get
            {
              return  string.IsNullOrEmpty(Error);
            }
        }

        public bool IsInnerException
        {
            get
            {
                return string.IsNullOrEmpty(InnerException);
            }
        }

        public bool IsErrorCode
        {
            get
            {
                return string.IsNullOrEmpty(ErrorCode);
            }
        }

    }
}
