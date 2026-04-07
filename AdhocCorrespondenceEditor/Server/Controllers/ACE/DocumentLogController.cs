using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Shared;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AdhocCorrespondenceEditor.Server.Controllers.ACE
{
    [Route("api/[controller]")]
    [ApiController]
    public class DocumentLogController : ControllerBase
    {
        IACERepository _iACERepository;
        public DocumentLogController(IACERepository dbContext)
        {
            _iACERepository = dbContext;
        }

        [HttpPost("")]
        public async Task<int> PostDocumentLog([FromBody] DocumentLogEntity details)
        {
           return _iACERepository.InsertDocumentLog(details);
        }
    }
}
