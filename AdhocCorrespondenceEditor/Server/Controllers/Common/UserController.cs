using AdhocCorrespondenceEditor.Shared;
using Microsoft.AspNetCore.Mvc;
using AdhocCorrespondenceEditor.Utility.Common;
using Newtonsoft.Json.Linq;
using NJM.DotNetLibrary.Logging;

namespace AdhocCorrespondenceEditor.Server.Controllers
{
    [Route("api/[controller]")]
    public class UserController : Controller
    {
        [HttpGet()]
        public UserData GetUserData()
        {

            var serverVariableGroups = HttpContext.Request.Headers[Utility.ConfigurationManager.GetInstance().SM_ACEGroups].FirstOrDefault();
            var _tempUserName = HttpContext.Request.Headers["SM_USERDN"].FirstOrDefault();
            var userID = HttpContext.Request.Headers["SM_USER"].FirstOrDefault();
            if (!string.IsNullOrEmpty(userID))
                userID = userID.Replace("NJMGROUP\\", "");
            string userName = string.Empty;
            var IsAuthenticated = HttpContext.User.Identity?.IsAuthenticated ?? false;
            if (IsAuthenticated && string.IsNullOrEmpty(serverVariableGroups))
            {
                serverVariableGroups = HttpContext.User.Identity?.Name;
                JObject jObject = JObject.Parse(serverVariableGroups);
                JArray sizes = (JArray)jObject["roles"];
                serverVariableGroups = string.Join(",", sizes);

                var userIDString = jObject["userID"];
                userID = userIDString.ToString().ToUpper().Replace("NJMGROUP\\", "");
            }

            string[] userNameArray = null;

            if (!string.IsNullOrEmpty(_tempUserName))
            {
                string strLastChar = "";
                //Get last charachters from user name 
                strLastChar = _tempUserName.Substring(_tempUserName.Length - 1, 1);

                switch (strLastChar.ToUpper())
                {
                    case "C":  //FOR C account users
                        userNameArray = _tempUserName.Split(',');
                        userName = userNameArray[0];
                        userName = userName.Replace("CN=", "");
                        break;
                    case "A": //FOR A account users
                        break;
                    default:  // for regular account users
                        userNameArray = _tempUserName.Split(',');
                        //only get first and second value from array 
                        userName = userNameArray[1] + " " + userNameArray[0].Replace("\\", "");
                        userName = userName.Replace("CN=", "");
                        break;
                }
            }
            else
                userName = userID;

            string firstCharOfFirstName = String.Empty;
            string firstCharOfLastName = String.Empty;
            userNameArray = _tempUserName?.Trim().Split(",");
            //only get first and second value from array 
            if (userNameArray != null)
            {
                if (userNameArray.Length > 1 && !String.IsNullOrEmpty(userNameArray[1]))
                {
                    firstCharOfFirstName = userNameArray[1].Trim().Substring(0, 1);
                }
                if (!String.IsNullOrEmpty(userNameArray[0]))
                {
                    firstCharOfLastName = userNameArray[0].Replace("\\", "").Replace("CN=", "").Trim().Substring(0, 1);
                }
            }

            var userInspireRoles = RegexUtill.GetADGroups(serverVariableGroups);
            return new UserData
            {
                IsAuthericated = HttpContext.User.Identity?.IsAuthenticated ?? false,
                UserName = userName,
                UserRoles = userInspireRoles,
                UserInital = firstCharOfFirstName + firstCharOfLastName,
                UserID = userID,
                UserEmail = HttpContext.Request.Headers["HTTP_MAIL"].FirstOrDefault()

            };
        }
    }
}
