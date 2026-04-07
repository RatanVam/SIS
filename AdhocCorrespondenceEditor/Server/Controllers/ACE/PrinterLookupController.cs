using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.DTO.ACEEntity;
using AdhocCorrespondenceEditor.Utility.Cache;
using Microsoft.AspNetCore.Mvc;
using NJM.DotNetLibrary.Logging;

namespace AdhocCorrespondenceEditor.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrinterLookupController : ControllerBase
    {
        IACERepository _iAceRepository;
        ICacheHelper _iCacheHelper;

        public PrinterLookupController(IACERepository dbContext, ICacheHelper cacheHelper)
        {
            _iAceRepository = dbContext;
            _iCacheHelper = cacheHelper;
        }

        [HttpPost("add")]
        public IActionResult AddPrinter([FromBody] PrinterLookupRequest printerLookupEntity)
        {
            int response = _iAceRepository.AddPrinterMap(printerLookupEntity);
            if (response != 0)
            {
                _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPrinterLookup);
                _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPrinter);
                return Ok("Added Successfully");
            }
            else
            {
                return NotFound("Error occurred while added the record.");
            }
        }
        [HttpPost("update")]
        public IActionResult UpdatePrinter([FromBody] PrinterLookupRequest printerLookupEntity)
        {
            int response = _iAceRepository.UpdatePrinterMap(printerLookupEntity);
            if (response != 0)
            {
                _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPrinterLookup);
                _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPrinter);
                return Ok("Updated Successfully");
            }
            else
            {
                return NotFound("Error occurred while updating the record.");
            }
        }
        [HttpDelete]
        public IActionResult DeletePrinter(int LOBPrinterId, string userId)
        {
            int response = _iAceRepository.DeletePrinter(LOBPrinterId, userId);
            if (response != 0)
            {
                _iCacheHelper.DeleteItem(ApplicationConstants.SPGetPrinterLookup);
                return Ok("Deleted Successfully");
            }
            else
            {
                return NotFound("Error occurred while deleting the record.");
            }
        }
    }
}
