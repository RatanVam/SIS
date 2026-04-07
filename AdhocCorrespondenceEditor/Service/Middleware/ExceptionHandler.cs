using System.Net;
using System.Text.Json;
using System.Xml.Serialization;
using Microsoft.AspNetCore.Http;
using NJM.DotNetLibrary.Logging;

namespace AdhocCorrespondenceEditor.Service.Middleware
{
   public class ExceptionHandler
    {
        private readonly RequestDelegate _next;


        public ExceptionHandler(RequestDelegate next )
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(httpContext, ex);
            }
        }

        private async Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.ContentType = "application/json";
            var response = context.Response;
            var error = exception.Message;

            var errorResponse = new ErrorResponse
            {
                Message = string.Format("{0}:", error) 
            };

            //exception.InnerException != null ? exception.InnerException.ToString() : string.Empty
            switch (exception)
            {
                case ApplicationException ex:
                    if (ex.Message.Contains("Invalid Token"))
                    {
                        response.StatusCode = (int)HttpStatusCode.Forbidden;
                        errorResponse.Message += ex.Message;
                        break;
                    }
                    response.StatusCode = (int)HttpStatusCode.BadRequest;
                    errorResponse.Message += ex.Message;
                    break;
                default:
                    response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    errorResponse.Message += "Internal Server Error!";
                    break;
            }
            error += exception.InnerException == null ? string.Empty : " and Inner Exception: " + exception.InnerException.Message;
            LogAsync.Error(context.Request.Path.Value, error);
            var result = ToXML(errorResponse);// JsonSerializer.Serialize(errorResponse);
            await context.Response.WriteAsync(result);
        }
        private string ToXML(ErrorResponse errorResponse)
        {
            using (var stringwriter = new System.IO.StringWriter())
            {
                var serializer = new XmlSerializer(typeof(ErrorResponse));
                serializer.Serialize(stringwriter, errorResponse);
                return stringwriter.ToString();
            }
        }

        public class ErrorResponse
        {
            public string Message { get; set; }
        }
    }
}
