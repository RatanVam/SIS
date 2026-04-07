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
    public class PrinterController : ControllerBase
    {
        IACERepository _iAceRepository;
        ICacheHelper _iCacheHelper;

        public PrinterController(IACERepository dbContext, ICacheHelper cacheHelper)
        {
            _iAceRepository = dbContext;
            _iCacheHelper = cacheHelper;
        }

        [HttpGet()]
        public IEnumerable<PrinterEntity> GetPrinter()
        {
            IEnumerable<PrinterEntity> items = null;

            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetPrinter, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetPrinter, _iAceRepository.GetPrinter());

            return _iCacheHelper.Get(ApplicationConstants.SPGetPrinter, items);
        }

        [HttpPost("add")]
        public IActionResult AddPrinter([FromBody] PrinterRequest printerEntity)
        {
            int response = _iAceRepository.AddPrinter(printerEntity);
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
        public IActionResult UpdatePrinter([FromBody] PrinterRequest printerLookupEntity)
        {
            int response = _iAceRepository.UpdatePrinter(printerLookupEntity);
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
        
    }
}
