using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Utility;
using Microsoft.AspNetCore.Mvc;

namespace AdhocCorrespondenceEditor.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogController : ControllerBase
    {
        // PUT api/<VendorController>/5
        [HttpPost()]
        public ActionResult<bool> Post([FromBody] Log value)
        {
            Logger.Details(value);
            return  Ok(true);
        }
    }
}
