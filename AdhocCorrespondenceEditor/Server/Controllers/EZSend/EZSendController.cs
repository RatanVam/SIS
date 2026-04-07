using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Shared.Common;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using NJM.DotNetLibrary.Logging;
using System.Net.Http.Headers;
using System.Text;



namespace AdhocCorrespondenceEditor.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EZSendController : Controller
    {
        IACERepository _iACERepository;

        private readonly IHttpClientFactory _clientfactory;
        public EZSendController(IACERepository dbContext, IHttpClientFactory clientfactory)
        {
            _iACERepository = dbContext;
            _clientfactory = clientfactory;           
        }
        [AllowAnonymous]
        [HttpPost, Route("start")]
        public async Task<EasySendResponse> InitiateEasySendRequest([FromBody] EasySendInitiateRequest initiateRequest )
        {
            EasySendResponse result = new EasySendResponse();

            try
            {
                var request = new EasySendRequest(initiateRequest);

                try
                {
                    int saved = _iACERepository.InsertEasySendRequest(request);
                    if (saved != null)
                    {
                        var url = BuildStartUrl(request);
                        result.Url = url;
                        return result;
                    } else
                    {
                        await LogAsync.Error("SaveError", "Something went wrong");
                        result.Error = "Something went wrong";
                        return result;
                    }
                }
                catch (Exception ex)
                {
                    await LogAsync.Exception(ex, "InitiateEasySendRequest", $"InitiateEasySendRequest insert issue ({request.DocumentSessionID})");
                    result.Error = "Something went wrong";
                    return result;
                }
            }
            catch (Exception ex)
            {   
                await LogAsync.Exception(ex, "InitiateEasySendRequest", ex.Message);
                result.Error = ex.Message;
                return result;
            }
        }

        [HttpGet("getrequest")]
        public ActionResult<IEnumerable<EZSendRequestData>> GetEZSendRequest([FromQuery] string Id)
        {
            var items = _iACERepository.GetEZSendRequest(Id);
            if (items.Any())
            {
                return Ok(items);
            }
            else
            {
                return NotFound("No items found for the provided document ID.");
            }
        }

        [HttpGet("updateuser")]
        public ActionResult<String> UpdateUserEZSendRequest([FromQuery] string UserId, int Id)
        {
            if(Id == null)
            {
                return NotFound("No items found for the provided ID.");
            } 
            else if(UserId == null)
            {
                return NotFound("UserId Not provided.");
            }
            else
            {
                int saved = _iACERepository.UpdateUserEZSendRequest(UserId, Id);
                if(saved != null)
                {
                    return Ok("Updated Successfully");
                } else
                {
                    return NotFound("Error happening while updating the record.");
                }
            }
        }
        //[HttpGet("updatestatus")]
        //public ActionResult<String> UpdateStatusEZSendRequest([FromQuery] int Status, int Id)
        //{
        //    if (Id == null)
        //    {
        //        return NotFound("No items found for the provided ID.");
        //    }
        //    else if (Status > 0)
        //    {
        //        return NotFound("Status is Zero.");
        //    }
        //    else
        //    {
        //        int saved = _iACERepository.UpdateStatusEZSendRequest(Status, Id);
        //        if (saved != null)
        //        {
        //            return Ok("Updated Successfully");
        //        }
        //        else
        //        {
        //            return NotFound("Error happening while updating the record.");
        //        }
        //    }
        //}

        [HttpGet("updatestatus")]
        public ActionResult<string> UpdateStatusEZSendRequest([FromQuery] int Status, int Id)
        {
            if (Id == 0)
            {
                return NotFound("No items found for the provided ID.");
            }
            else if (Status == 0)
            {
                return BadRequest("Status cannot be Zero.");
            }
            else
            {
                int saved = _iACERepository.UpdateStatusEZSendRequest(Status, Id);
                if (saved != 0)
                {
                    return Ok("Updated Successfully");
                }
                else
                {
                    return NotFound("Error occurred while updating the record.");
                }
            }
        }


        [HttpPost, Route ("ezsendsubmit")]
        public async Task<IActionResult> EzSendSubmit([FromBody] ExternalEzsendApiSubmit ezSendApiSubmit)
        {
            try
            {
                var httpClient = _clientfactory.CreateClient();
                httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string jsonPayload = System.Text.Json.JsonSerializer.Serialize(ezSendApiSubmit);
                using var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                
                HttpResponseMessage response = await httpClient.PostAsync(EzSendApiUrl(), content);

                if (response.IsSuccessStatusCode)
                {
                    string result = await response.Content.ReadAsStringAsync();
                    return Ok(result);
                }
                else
                {
                    //string errorResponse = await response.Content.ReadAsStringAsync();      
                    //return StatusCode((int)response.StatusCode, errorResponse +" " + response.ReasonPhrase);
                    return StatusCode(500, "Internal server error");
                }
            }
            catch (Exception ex)
            {
               
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost("validatephone")]
        public async Task<IActionResult> ValidatePhone([FromBody] ValidatePhone validatePhone)
        {
            try
            {
                var httpClient = _clientfactory.CreateClient();
                httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string jsonPayload = System.Text.Json.JsonSerializer.Serialize(validatePhone);
                using var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await httpClient.PostAsync(ValidatePhoneUrl(), content);

                if (response.IsSuccessStatusCode)
                {
                    string result = await response.Content.ReadAsStringAsync();
                    
                    return Ok(result);
                }
                else
                {
                    string errorResponse = await response.Content.ReadAsStringAsync();
                    return StatusCode((int)response.StatusCode, errorResponse + " " + response.ReasonPhrase);
                }
            }
            catch (Exception ex)
            {

                return StatusCode(500, "Internal server error");
            }
        }



        private string ValidatePhoneUrl()
        {
            return Utility.ConfigurationManager.GetInstance().ValidatePhoneEndpoint;
        }

        private string EzSendApiUrl()
        {
            return Utility.ConfigurationManager.GetInstance().EzsendApiEndpoint; 
        }

        private string BuildStartUrl(EasySendRequest request)
        {
            string SITEMINDERPROXY = Utility.ConfigurationManager.GetInstance().SM_Proxy;

            return $"{SITEMINDERPROXY}/ezsend?id={request.DocumentSessionID}";
        }
    }
}
